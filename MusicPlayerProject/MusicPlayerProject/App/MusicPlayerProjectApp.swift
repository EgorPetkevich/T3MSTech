//
//  MusicPlayerProjectApp.swift
//  MusicPlayerProject
//
//  Created by George Popkich on 9.12.25.
//

import SwiftUI

@main
struct MusicPlayerProjectApp: App {
    
    @AppStorage(.onboardingShown) private var onboardingShown: Bool = false
    @AppStorage(.isPremium) private var isPremium: Bool = false
    
    private let paywallService: PaywallService = .shared
    
    var body: some Scene {
        WindowGroup {
            contentView
        }
    }
    
    @ViewBuilder
    private var contentView: some View {
        if onboardingShown {
            /// show Paywall or Main
            MainVC()
        } else {
            /// show Onboarding
            OnbFirstAssembler.make(paywallService: paywallService)
                .withRouter(OnbRouter(paywallService: paywallService))
        }
    }
}
