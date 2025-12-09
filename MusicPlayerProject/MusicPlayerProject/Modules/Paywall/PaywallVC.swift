//
//  PaywallVC.swift
//  MusicPlayerProject
//
//  Created by George Popkich on 9.12.25.
//

import SwiftUI

private extension PaywallVC {
    enum Constants {
        static let titleText: String = "Unlock Full Music Player"
        static let subtitleText: String = "Unlimited playback, no limits, all your tracks in one place."
        
        static let termsText: String = "Subscription will auto-renew unless canceled at least 24 hours before the end of the current period. You can manage or cancel your subscription in your account settings."
        
        static func buttonTitle(_ plan: Plan) -> String {
            switch plan {
            case .month:
                return "Continue with Monthly Plan"
            case .year:
                return "Continue with Yearly Plan"
            }
        }
    }
}

struct PaywallVC: View {
    
    @Environment(OnbRouter.self) private var router
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: PaywallVM
    
    init(viewModel: PaywallVM) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            Image(.onboardingPaywall)
                .resizable()
                .clipped()
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 24) {
                Spacer()
                headerView
                planSwitcher
                purchaseButton
                termsText
            }
            .padding(.horizontal, 24)
            .padding(.top, 40)
            .padding(.bottom, 24)
        }
        .navigationBarBackButtonHidden(true)
        
    }
    
    // MARK: - Subviews
    
    private var headerView: some View {
        VStack(alignment: .leading, spacing: 12 ) {
            Text(Constants.titleText)
                .font(.system(size: 28, weight: .bold))
                
            Text(Constants.subtitleText)
                .font(.system(size: 16, weight: .regular))
        }
        .foregroundStyle(.white)
    }
    
    private var planSwitcher: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20.0)
                .fill(.white)
            VStack(alignment: .leading, spacing: 12) {
                Text("Choose your plan")
                    .font(.system(size: 15, weight: .semibold))
                
                HStack(spacing: 8) {
                    ForEach(Plan.allCases, id: \.self) { plan in
                        planButton(for: plan)
                    }
                }
            }
            .padding()
        }
        .frame(height: 200)
        
    }
    
    private func planButton(for plan: Plan) -> some View {
        let isSelected = plan == viewModel.selectedPlan
        
        return Button(action: {
            viewModel.selectedPlan = plan
        }) {
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(viewModel.planTitle)
                        .font(.system(size: 15, weight: .semibold))
                    
                    if plan == .year {
                        Text("SAVE")
                            .font(.system(size: 11, weight: .bold))
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(Capsule().fill(Color.green.opacity(0.15)))
                            .overlay(
                                Capsule()
                                    .stroke(Color.green.opacity(0.6), lineWidth: 1)
                            )
                    }
                    Spacer()
                }
                
                Text(viewModel.planSubtitle)
                    .font(.system(size: 13, weight: .regular))
                    .foregroundStyle(.secondary)
                
                Text(viewModel.planPrice)
                    .font(.system(size: 14, weight: .semibold))
            }
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(isSelected ? Color.primary.opacity(0.06) : Color(.systemBackground))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .stroke(isSelected ? Color.primary : Color.secondary.opacity(0.2), lineWidth: 1)
            )
        }
        .buttonStyle(.plain)
    }
    
    private var purchaseButton: some View {
        Button(action: {
            viewModel.purchaseButtonDidTap.send(())
            // TODO: Trigger purchase for selectedPlan
        }) {
            Text(Constants.buttonTitle(viewModel.selectedPlan))
                .font(.system(size: 17, weight: .semibold))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .background(RoundedRectangle(cornerRadius: 16).fill(Color.accentColor))
                .foregroundColor(.white)
        }
    }
    
    
    private var termsText: some View {
        Text(Constants.termsText)
            .font(.system(size: 11))
            .foregroundStyle(.white)
            .multilineTextAlignment(.center)
    }
}

#Preview {
//    PaywallVC(viewModel: PaywallVM())
}
