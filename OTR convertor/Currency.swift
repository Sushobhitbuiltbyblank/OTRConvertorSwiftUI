//
//  Currency.swift
//  OTR convertor
//
//  Created by Sushobhit Jain on 08/05/25.
//

import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
    case copperPenny = 6400
    case silverPenny = 64
    case silverPeice = 16
    case goldPenny = 4
    case goldPeice = 1
    case metalPeice = 2
    
    var id: Currency { self }

    
    var image: ImageResource {
        switch self {
        case .copperPenny:
            return .copperpenny
        case .silverPenny:
            return .silverpenny
        case .silverPeice:
            return .silverpiece
        case .goldPenny:
            return .goldpenny
        case .goldPeice:
            return .goldpiece
        case .metalPeice:
            return .prancingpony
        }
    }
    
    var name: String {
        switch self {
        case .copperPenny:
            return "Copper Penny"
        case .silverPenny:
            return "Silver Penny"
        case .silverPeice:
            return "Silver Peice"
        case .goldPenny:
            return "Gold Penny"
        case .goldPeice:
            return "Gold Peice"
        case .metalPeice:
            return "Metal Peice"
        }
    }
    
    func convert(_ amountString: String, to currency: Currency) -> String {
        guard let amount = Double(amountString) else {
            return ""
        }
        let converted = (amount / self.rawValue) * currency.rawValue
        if floor(converted) == converted {
            return String(format: "%.0f", converted)
        }
        return String(format: "%.2f", converted)
    }
}
