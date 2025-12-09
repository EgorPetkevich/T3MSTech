//
//  OnbRouter.swift
//  MusicPlayerProject
//
//  Created by George Popkich on 9.12.25.
//

import Foundation

final class OnbRouter: Router {
    
    var paywallService: PaywallService
    
    init(paywallService: PaywallService) {
        self.paywallService = paywallService
    }
    
    func openOnbFirst() {
        path.append(OnbPath.first)
    }
    
    func openOnbSecond() {
        path.append(OnbPath.second)
    }
    
    func openOnbThird() {
        path.append(OnbPath.third)
    }
    
    func openPaywall() {
        path.append(OnbPath.paywall)
    }
    
}
