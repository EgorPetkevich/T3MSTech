//
//  OnbSecondVM.swift
//  MusicPlayerProject
//
//  Created by George Popkich on 9.12.25.
//

import Foundation

protocol OnbSecondPaywallServiceUseCaseProtocol {
    var config: PaywallConfig? { get }
}

final class OnbSecondVM: ObservableObject {
    
    var paywallConfig: PaywallConfig?
    private var paywallService: OnbSecondPaywallServiceUseCaseProtocol
    
    init(paywallService: OnbSecondPaywallServiceUseCaseProtocol) {
        self.paywallService = paywallService
        self.paywallConfig = paywallService.config
    }
    
}
