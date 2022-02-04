//
//  PopoverCoinViewModel.swift
//  CryptoTracker
//
//  Created by Alfian Losari on 03/02/22.
//

import Combine
import Foundation
import SwiftUI

class PopoverCoinViewModel: ObservableObject {
    
    @Published private(set) var title: String
    @Published private(set) var subtitle: String
    @Published private(set) var coinTypes: [CoinType]
    @AppStorage("SelectedCoinType") var selectedCoinType = CoinType.bitcoin
    
    private let service: CoinCapPriceService
    private var subscriptions = Set<AnyCancellable>()
    
    private let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        formatter.currencyCode = "USD"
        return formatter
    }()
    
    init(title: String = "", subtitle: String = "", coinTypes: [CoinType] = CoinType.allCases, service: CoinCapPriceService = .init()) {
        self.title = title
        self.subtitle = subtitle
        self.coinTypes = coinTypes
        self.service = service
    }
    
    func subscribeToService() {
        service.coinDictionarySubject
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in self?.updateView() }
            .store(in: &subscriptions)
    }
    
    
    func updateView() {
        let coin = self.service.coinDictionary[selectedCoinType.rawValue]
        self.title = coin?.name ?? selectedCoinType.description
        
        if let coin = coin, let value = self.currencyFormatter.string(from: NSNumber(value: coin.value)) {
            self.subtitle = value
        } else {
            self.subtitle = "Updating..."
        }
    }
    
    func valueText(for coinType: CoinType) -> String {
        if let coin = service.coinDictionary[coinType.rawValue],
           let value = self.currencyFormatter.string(from: NSNumber(value: coin.value)) {
            return value
        } else {
            return "Updating..."
        }
     }
    
}
