//
//  ContentView.swift
//  MenuAR
//
//  Created by Yery Castro on 28/2/23.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        NavigationView{
            NavigationLink(destination: Home()){
                Text("Abrir menú aumentado")
            }
            .buttonStyle(.bordered)
            .tint(.blue)
            .navigationTitle("Restaurant")
        }
    }
}
