//
//  MenuBarCoinViewModel.swift
//  CryptoTracker
//
//  Created by Alfian Losari on 03/02/22.
//

import Combine
import Foundation
import SwiftUI

class MenuBarCoinViewModel: ObservableObject {
    
    @Published private(set) var name: String
    @Published private(set) var value: String
    @Published private(set) var color: Color
    @AppStorage("SelectedCoinType") private(set) var selectedCoinType = CoinType.bitcoin
    
    private let service: CoinCapPriceService
    private var subscriptions = Set<AnyCancellable>()
    
    private let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        formatter.currencyCode = "USD"
        formatter.currencySymbol = "$"
        return formatter
    }()
    
    init(name: String = "", value: String = "", color: Color = .green, service: CoinCapPriceService = .init()) {
        self.name = name
        self.value = value
        self.color = color
        self.service = service
    }
    
    func subscribeToService() {
        service.coinDictionarySubject
            .combineLatest(service.connectionStateSubject)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in self?.updateView() }
            .store(in: &subscriptions)
    }
    
    func updateView() {
        let coin = self.service.coinDictionary[selectedCoinType.rawValue]
        self.name = coin?.name ?? selectedCoinType.description
        
        if self.service.isConnected {
            if let coin = coin, let value = self.currencyFormatter.string(from: NSNumber(value: coin.value)) {
                self.value = value
            } else {
                self.value = "Updating..."
            }
        } else {
            self.value = "Offline"
        }
        
        self.color = self.service.isConnected ? .green : .red
    }
    
}
