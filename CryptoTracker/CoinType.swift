//
//  CoinType.swift
//  CryptoTracker
//
//  Created by Alfian Losari on 03/02/22.
//

import Foundation

enum CoinType: String, Identifiable, CaseIterable {
    
    case bitcoin
    case ethereum
    case monero
    case litecoin
    case dogecoin
    
    var id: Self { self }
    var url: URL { URL(string: "https://coincap.io/assets/\(rawValue)")! }
    var description: String { rawValue.capitalized }
    
}
