//
//  Home.swift
//  MenuAR
//
//  Created by Yery Castro on 28/2/23.
//

import SwiftUI
import RealityKit

struct Home: View {
    
    @State private var showMenu = false
    @EnvironmentObject var settings : Settings
    var body: some View {
        ZStack(alignment: .bottom){
            ARViewContainer()
            if settings.selectedModel == nil {
                ControlView(showMenu: $showMenu)
            }else {
                CameraView()
            }
        }
    }
}


struct ARViewContainer: UIViewRepresentable {
    
    @EnvironmentObject var settings : Settings
    
    func makeUIView(context: Context) -> CustomARView {
        let arView = CustomARView(frame: .zero)
        
        settings.sceneObserver = arView.scene.subscribe(to: SceneEvents.Update.self, { event in
            sceneUpdate(arView: arView)
        })
        return arView
    }
    
    func updateUIView(_ uiView: CustomARView, context: Context) {
    
    }
    
    func sceneUpdate(arView: CustomARView){
        arView.focusEntity?.isEnabled = settings.selectedModel != nil
        if let confirmModel = settings.confirmedModel, let modelEntity = confirmModel.modelEntity {
            plane(modelEntity: modelEntity, arView: arView)
            settings.confirmedModel = nil
        }
    }
    
    func plane(modelEntity: ModelEntity, arView : ARView){
        let clonedEntity = modelEntity.clone(recursive: true)
        
        clonedEntity.generateCollisionShapes(recursive: true)
        arView.installGestures([.rotation, .translation], for: clonedEntity)
        
        let anchorEntity = AnchorEntity(plane: .any)
        anchorEntity.addChild(clonedEntity)
        arView.scene.addAnchor(anchorEntity)
    }
    
}

