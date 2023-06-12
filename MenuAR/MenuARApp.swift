//
//  MenuARApp.swift
//  MenuAR
//
//  Created by Yery Castro on 28/2/23.
//

import SwiftUI

@main
struct MenuARApp: App {
    
    @StateObject var settings = Settings()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(settings)
        }
    }
}
