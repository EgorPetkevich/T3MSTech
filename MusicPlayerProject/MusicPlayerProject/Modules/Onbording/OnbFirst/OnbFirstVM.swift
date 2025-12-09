//
//  OnbFirstVM.swift
//  MusicPlayerProject
//
//  Created by George Popkich on 9.12.25.
//

import Combine

protocol OnbFirstPaywallServiceUseCaseProtocol {
    var config: PaywallConfig? { get }
}

final class OnbFirstVM: ObservableObject {
    
    var paywallConfig: PaywallConfig?
    private var paywallService: OnbFirstPaywallServiceUseCaseProtocol
    
    init(paywallService: OnbFirstPaywallServiceUseCaseProtocol) {
        self.paywallService = paywallService
        self.paywallConfig = paywallService.config
    }
    
}
