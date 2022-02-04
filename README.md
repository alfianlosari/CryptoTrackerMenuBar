# Realtime Crypto Tracker macOS Menu Bar App - SwiftUI & WebSocket

![Alt text](./promo.jpg?raw=true "SwiftUI Crypto Tracker macOS App")

A Realtime Crypto Tracker macOS Menu Bar App built with SwiftUI & WebSocket

## Features
The app has several main features:
1. Act as agent on Menu Bar without main app window & dock icon.
2. Realtime tracking of crypto currency from coincap.io websocket server
3. Automatic Reconnect mechanism in case of internentconnection lost.
4. Popover view to select different predefined Coin Types (Bitcoin, Ethereum, Monero, Litecoin, Dogecoin).
5. Shortcut Link to open the associated coin details in web browser
6. Use Combine Publisher to subscribe to the CoinCapService from the View Model layer, react to new data, and update UI through single pipeline.

## Getting Started
- Download Xcode 13 from App Store.
- Install macOS 12 Monterrey

## Installation
- Build and run the project using Xcode 13 and macOS 12.

## Tutorial
This project is based on the YouTube tutorial series that you can watch at Build a macOS Menu Bar Realtime Crypto Tracker App with SwiftUI & WebSocket[YouTube](https://youtu.be/jRTOzhyq3iQ).
