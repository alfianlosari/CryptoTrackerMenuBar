//
//  CryptoTrackerApp.swift
//  CryptoTracker
//
//  Created by Alfian Losari on 03/02/22.
//

import SwiftUI

@main
struct CryptoTrackerApp: App {
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    var body: some Scene {
        WindowGroup {
            EmptyView().frame(width: 0, height: 0)
        }
    }
}
