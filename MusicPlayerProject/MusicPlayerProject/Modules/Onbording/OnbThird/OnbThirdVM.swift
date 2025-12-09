//
//  OnbThirdVM.swift
//  MusicPlayerProject
//
//  Created by George Popkich on 9.12.25.
//

import Foundation
import Combine

protocol OnbThirdPaywallServiceUseCaseProtocol {
    var config: PaywallConfig? { get }
}

final class OnbThirdVM: ObservableObject {
    
    @Published var showPaywall: Bool = false
    
    var paywallConfig: PaywallConfig?
    private var paywallService: OnbThirdPaywallServiceUseCaseProtocol
    
    //Buttons
    var nextButtonDidTap: PassthroughSubject<Void, Never> = .init()
    
    private var bag: Set<AnyCancellable> = []
    
    init(paywallService: OnbThirdPaywallServiceUseCaseProtocol) {
        self.paywallService = paywallService
        self.paywallConfig = paywallService.config
        bind()
    }
    
    private func bind() {
        nextButtonDidTap
            .sink { [weak self] in
                self?.onNextButtonTap()
            }
            .store(in: &bag)
    }
    
    private func onNextButtonTap() {
        if UDManager.get(.isPremium) {
            UDManager.set(.onboardingShown, value: true)
        } else {
            showPaywall = true
        }
    }
    
}
