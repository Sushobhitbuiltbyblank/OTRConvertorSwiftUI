//
//  ExchangeInfo.swift
//  OTR convertor
//
//  Created by Sushobhit Jain on 07/05/25.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss
    
    let des = "Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:"
    var body: some View {
        ZStack {
            // backgroud
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack {
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(3)
                //des
                Text(des)
                    .font(.title3)
                    .padding()
                //exchange rate
                ExchangeRate(leftImage: .goldpiece,
                             rightImage: .goldpenny,
                             text: "1 Gold Piece = 4 Gold Pennies")
                ExchangeRate(leftImage: .goldpenny,
                             rightImage: .silverpiece,
                             text: "1 Gold Penny = 4 Silver Piece")
                ExchangeRate(leftImage: .goldpiece,
                             rightImage: .goldpenny,
                             text: "1 Gold Piece = 4 Gold Pennies")
                ExchangeRate(leftImage: .goldpiece,
                             rightImage: .goldpenny,
                             text: "1 Gold Piece = 4 Gold Pennies")
                
                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    ExchangeInfo()
}
