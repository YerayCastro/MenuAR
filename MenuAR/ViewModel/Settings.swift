//
//  Settings.swift
//  MenuAR
//
//  Created by Yery Castro on 1/3/23.
//

import SwiftUI
import Combine

class Settings : ObservableObject {
    
    
    @Published var selectedModel : Model? {
        willSet(newValue){
            print("Seleccionamos el modelo")
        }
    }
    
    @Published var confirmedModel : Model? {
        willSet(newValue){
            guard let model = newValue else { return }
            print("Confirmamos el modelo", model.name)
        }
    }
    
    var sceneObserver : Cancellable?
    
    
}
