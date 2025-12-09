//
//  PaywallService+Paywall.swift
//  MusicPlayerProject
//
//  Created by George Popkich on 9.12.25.
//

import Foundation

struct PaywallServiceUseCase: PaywallServiceUseCaseProtocol {
    
    private let service: PaywallService
    
    init(service: PaywallService) {
        self.service = service
    }
    
    func makePurchase(with plan: Plan) -> Bool {
        self.service.makePurchase(with: plan)
    }
    
    func getMonthPlan() -> MonthPlan {
        self.service.getMonthPlan()
    }
    
    func getYearPlan() -> YearPlan {
        self.service.getYearPlan()
    }
    
}
