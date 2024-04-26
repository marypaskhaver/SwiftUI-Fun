//
//  FlickerPreventionView.swift
//  SwiftUI Fun
//
//  Created by Mary Paskhaver on 4/26/24.
//

import SpriteKit
import SwiftUI

struct FlickerPreventionView: View {
    @State private var showBlueScene: Bool = true
    
    private var blueScene: SKScene {
        let scene = SKScene()
        scene.backgroundColor = .blue
        return scene
    }
    
    private var orangeScene: SKScene {
        let scene = SKScene()
        scene.backgroundColor = .orange
        return scene
    }
    
    private let fadeIn = AnyTransition.opacity.animation(.easeInOut(duration: 0.2))
    
    var body: some View {
        if showBlueScene {
            SpriteView(
                scene: blueScene
            )
            .transition(fadeIn)
            .onTapGesture {
                showBlueScene = false
            }
        } else {
            SpriteView(
                scene: orangeScene
            )
            .transition(fadeIn)
            .onTapGesture {
                showBlueScene = true
            }
        }
    }
}

#Preview {
    FlickerPreventionView()
}
