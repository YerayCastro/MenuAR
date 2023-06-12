//
//  CameraView.swift
//  MenuAR
//
//  Created by Yery Castro on 1/3/23.
//

import SwiftUI

struct CameraView: View {
    
    @EnvironmentObject var settings : Settings
    
    var body: some View {
        HStack(alignment: .center){
            Spacer()
            CameraButton(icon: "xmark.circle.fill") {
                settings.selectedModel = nil
            }
            Spacer()
            CameraButton(icon: "checkmark.circle.fill") {
                settings.confirmedModel = settings.selectedModel
                settings.selectedModel = nil
            }
            Spacer()
        }
    }
}

struct CameraButton: View {
    let icon : String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: icon)
                .font(.system(size: 50))
                .foregroundColor(.white)
                .buttonStyle(PlainButtonStyle())
        }
        .frame(width: 75, height: 75)

    }
}
