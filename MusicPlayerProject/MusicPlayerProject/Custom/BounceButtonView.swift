//
//  BounceButtonView.swift
//  MusicPlayerProject
//
//  Created by George Popkich on 9.12.25.
//

import SwiftUI

private extension BounceButtonView {
    enum Constants {
        static let height: CGFloat = 56
        static let cornerRadius = 16.0
    }
}

struct BounceButtonView: View {
    
    var title: String
    var action: (() -> Void)?
    
    @State private var pulse = false
    
    var body: some View {
        Button(action: { action?() }) {
            Text(title)
                .font(.system(size: 17.0, weight: .semibold))
                .lineLimit(2)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, minHeight: Constants.height)
                .background(
                    RoundedRectangle(cornerRadius: Constants.cornerRadius)
                        .fill(.cyan)
                )
        }
        .buttonStyle(BounceOnPressStyle())
        .scaleEffect(pulse ? 1.05 : 1.0)
        .onAppear {
            withAnimation(
                .easeInOut(duration: 0.5)
                .repeatForever(autoreverses: true)
            ) {
                pulse = true
            }
        }
    }
        
    struct BounceOnPressStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .scaleEffect(configuration.isPressed ? 0.97 : 1)
                .animation(.interpolatingSpring(stiffness: 320, damping: 18),
                           value: configuration.isPressed)
        }
    }
    
}
