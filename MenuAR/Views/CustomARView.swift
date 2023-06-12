//
//  CustomARView.swift
//  MenuAR
//
//  Created by Yery Castro on 1/3/23.
//

import Foundation
import RealityKit
import ARKit
import FocusEntity

class CustomARView : ARView {
    
    var focusEntity : FocusEntity?
    
    required init(frame: CGRect){
        super.init(frame: frame)
        focusEntity = FocusEntity(on: self, focus: .classic)
    }
    
    @MainActor required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
