//
//  ContentView.swift
//  OTR convertor
//
//  Created by Sushobhit Jain on 07/05/25.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    @State var leftAmount = ""
    @State var rightAmount = ""
    @State var leftCurrency: Currency = .silverPeice
    @State var rightCurrency: Currency = .goldPeice
    @FocusState var leftTyping
    @FocusState var rightTyping
    @FocusState var keyboardFocus
    let currencyTips = CurrencyTips()
    let userDefault = UserDefaults.standard

    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            VStack {
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                //conversion section
                HStack {
                    CurrencyInput(showSelectCurrency: $showSelectCurrency, amount: $leftAmount, currency: $leftCurrency, typing: _leftTyping)
                    
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    CurrencyInput(showSelectCurrency: $showSelectCurrency, amount: $rightAmount, currency: $rightCurrency, typing: _rightTyping)
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                .keyboardType(.numberPad)
                Spacer()
                
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                    

                }
                
            }
            .focused($keyboardFocus)
            .task {
                try? Tips.configure()
            }
            .onChange(of: leftAmount) {
                if leftTyping {
                    rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
                }
            }
            .onChange(of: rightAmount) {
                if rightTyping {
                    leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
                }
            }
            .onChange(of: leftCurrency) {
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            }
            .onChange(of: rightCurrency) {
                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            }
            .sheet(isPresented: $showExchangeInfo) {
                ExchangeInfo()
            }
            .sheet(isPresented: $showSelectCurrency) {
                SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
            }
            .onDisappear {
                self.userDefault.set(leftCurrency.rawValue, forKey: "LeftCurrency")
                self.userDefault.set(rightCurrency.rawValue, forKey: "RightCurrency")
                self.userDefault.set(leftAmount, forKey: "Leftvalue")
                self.userDefault.set(rightAmount, forKey: "Rightvalue")
            }
            .onAppear {
                guard let leftCurrency = userDefault.value(forKey: "LeftCurrency"), let rightCurrency = userDefault.value(forKey: "RightCurrency"), let leftAmount = userDefault.value(forKey: "Leftvalue"), let rightAmount = userDefault.value(forKey: "Rightvalue")
                else {
                    return
                }
                
                print(leftCurrency,rightCurrency,leftAmount,rightAmount)
                
                self.leftCurrency = Currency(rawValue: leftCurrency as! Double) ?? .silverPeice
                self.leftAmount = leftAmount as! String
                self.rightCurrency = Currency(rawValue: rightCurrency as! Double) ?? .silverPeice
                self.rightAmount = rightAmount as! String
            }
//            .border(.blue)
        }
        .onTapGesture {
            if keyboardFocus {
                keyboardFocus = false
            }
        }
    }
}

#Preview {
    ContentView()
}
