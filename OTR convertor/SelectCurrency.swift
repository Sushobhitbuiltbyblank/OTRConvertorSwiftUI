//
//  ExtractedView.swift
//  OTR convertor
//
//  Created by Sushobhit Jain on 07/05/25.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var topCurrency: Currency
    @Binding var bottomCurrency: Currency
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack {
                //text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                IconGrid(selectedCurrency: $topCurrency)
                //Text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    .padding(.top)
                
                //currency icons
                IconGrid(selectedCurrency: $bottomCurrency)
                
                // Done button
                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
                    
            }
            .padding()
            .multilineTextAlignment(.center)
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    @Previewable @State var topCurrency: Currency = .copperPenny
    @Previewable @State var bottomCurrency: Currency = .silverPeice
    SelectCurrency(topCurrency: $topCurrency, bottomCurrency: $bottomCurrency)
}

