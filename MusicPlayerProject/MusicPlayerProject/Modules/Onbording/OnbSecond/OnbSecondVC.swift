//
//  OnbSecondVC.swift
//  MusicPlayerProject
//
//  Created by George Popkich on 9.12.25.
//

import SwiftUI

private extension OnbSecondVC {
    enum Constants {
        static let onbButtonText: String = "Get Started"
        static let titleText: String = "Welcome to \nMusic Player"
        static let subtitleText: String = "Listen to your favorite tracks anytime"
    }
}

struct OnbSecondVC: View {
    
    @Environment(OnbRouter.self) private var router
    
    @StateObject private var viewModel: OnbSecondVM
    
    init(viewModel: OnbSecondVM) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            Image(.onboardingSecond)
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
                    action: { router.openOnbThird() }
                )
            
                .padding(.bottom, 40)
            }
            .padding(.horizontal, 24.0)
        }
        .navigationBarBackButtonHidden(true)
    }
    
}

