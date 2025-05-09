//
//  CurrencyInput.swift
//  OTR convertor
//
//  Created by Sushobhit Jain on 07/05/25.
//

import SwiftUI
import TipKit

struct CurrencyInput: View {
    @Binding var showSelectCurrency: Bool
    @Binding var amount: String
    @Binding var currency: Currency
    @FocusState var typing
    let currencyTips = CurrencyTips()
    var body: some View {
        VStack {
            HStack {
                Image(currency.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 33)
                Text(currency.name)
                    .font(.subheadline)
                    .foregroundStyle(.white)
                
            }
            .padding(.bottom, -5)
            .onTapGesture {
                showSelectCurrency.toggle()
                currencyTips.invalidate(reason: .actionPerformed)
            }
            .popoverTip(currencyTips, arrowEdge: .bottom)
            
            TextField("Amount", text: $amount)
                .textFieldStyle(.roundedBorder)
                .focused($typing)
                
        }
    }
}

#Preview {
    @Previewable @State var showSelectCurrency: Bool = false
    @Previewable @State var leftAmount: String = ""
    @Previewable @State var leftCurrency: Currency = .copperPenny
    CurrencyInput(showSelectCurrency: $showSelectCurrency, amount: $leftAmount, currency: $leftCurrency)
}
