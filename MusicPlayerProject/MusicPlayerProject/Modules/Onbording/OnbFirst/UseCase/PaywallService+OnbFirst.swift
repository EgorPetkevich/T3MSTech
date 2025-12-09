//
//  PaywallService+OnbFirst.swift
//  MusicPlayerProject
//
//  Created by George Popkich on 9.12.25.
//

import Foundation

struct OnbFirstPaywallServiceUseCase: OnbFirstPaywallServiceUseCaseProtocol {
    
    var config: PaywallConfig?
    
    private let service: PaywallService
    
    init(service: PaywallService) {
        self.service = service
        self.config = service.config
    }
    
}
