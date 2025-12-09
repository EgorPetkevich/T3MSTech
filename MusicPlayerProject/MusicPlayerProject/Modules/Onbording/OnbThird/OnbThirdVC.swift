//
//  OnbThirdVC.swift
//  MusicPlayerProject
//
//  Created by George Popkich on 9.12.25.
//

import SwiftUI

private extension OnbThirdVC {
    enum Constants {
        static let onbButtonText: String = "Get Started"
        static let titleText: String = "Discover Your \nPerfect Sound"
        static let subtitleText: String = "Explore curated playlists and elevate your music journey"
    }
    
}

struct OnbThirdVC: View {
    
    @Environment(OnbRouter.self) private var router
    
    @StateObject private var viewModel: OnbThirdVM
    
    init(viewModel: OnbThirdVM) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            Image(.onboardingThird)
                .resizable()
                .clipped()
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 16.0) {
                Spacer()

                Text(Constants.titleText)
                    .font(.system(size: 34, weight: .bold))
                    .foregroundStyle(.white)

                Text(Constants.subtitleText)
                    .font(.system(size: 18, weight: .regular))
                    .foregroundStyle(.white.opacity(0.85))

                BounceButtonView(
                    title: viewModel.paywallConfig?.onbButtonText ?? Constants.onbButtonText,
                    action: { viewModel.nextButtonDidTap.send(()) }
                )
            
                .padding(.bottom, 40)
            }
            .padding(.horizontal, 24.0)
        }
        .navigationBarBackButtonHidden(true)
        .onChange(of: viewModel.showPaywall) { _, newValue in
            if newValue { router.openPaywall() }
        }
    }
    
}


