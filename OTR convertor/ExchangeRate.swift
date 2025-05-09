//
//  ExtractedView.swift
//  OTR convertor
//
//  Created by Sushobhit Jain on 07/05/25.
//

import SwiftUI

struct ExchangeRate: View {
    let leftImage : ImageResource
    let rightImage : ImageResource
    let text : String
    var body: some View {
        HStack {
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            Text(text)
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview {
    ExchangeRate(leftImage: .goldpenny, rightImage: .goldpiece, text: "1 Gold Piece = 4 Gold Pennies")
}
