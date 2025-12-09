//
//  PaywallService+OnbSecond.swift
//  MusicPlayerProject
//
//  Created by George Popkich on 9.12.25.
//

import Foundation

struct OnbSecondPaywallServiceUseCase: OnbSecondPaywallServiceUseCaseProtocol {

    var config: PaywallConfig?
    
    private let service: PaywallService

    init(service: PaywallService) {
        self.service = service
        self.service.config = config
    }
    
}
