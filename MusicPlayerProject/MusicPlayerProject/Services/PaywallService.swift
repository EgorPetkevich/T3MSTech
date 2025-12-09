//
//  PaywallService.swift
//  MusicPlayerProject
//
//  Created by George Popkich on 9.12.25.
//

import Foundation

struct PaywallConfig {
    var onbButtonText: String
    var paywallButtonText: String
}

struct MonthPlan {
    var title: String
    var subtitle: String
    var priceText: String
}

struct YearPlan {
    var title: String
    var subtitle: String
    var priceText: String
}

enum Plan: CaseIterable {
    case month
    case year
}

final class PaywallService {
    
    static let shared: PaywallService = .init()
    
    var config: PaywallConfig?
    
    init() {
        getConfig()
    }
    
    func isPremium() -> Bool {
        UDManager.get(.isPremium)
    }
    
    func getMonthPlan() -> MonthPlan {
        MonthPlan(
            title: "1 Month",
            subtitle: "Flexible monthly access",
            priceText: "$4.99 / month"
        )
    }
    
    func getYearPlan() -> YearPlan {
        YearPlan(
            title: "12 Months",
            subtitle: "Best value – save up to 40%",
            priceText: "$29.99 / year"
        )
    }
    
    func makePurchase(with plan: Plan) -> Bool {
        switch plan {
        case .month:
            return makeMonthPurchase()
        case .year:
            return makeYearPurchase()
        }
    }
    
}

//MARK: - Private
private extension PaywallService {
    
    func getConfig() {
        config = PaywallConfig(
            onbButtonText: "Next",
            paywallButtonText: "Make Purchase"
        )
    }
    
    private func makeMonthPurchase() -> Bool {
        return true
    }
    
    private func makeYearPurchase() -> Bool {
        return true
    }
    
}
