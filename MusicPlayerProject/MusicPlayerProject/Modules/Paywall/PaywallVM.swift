//
//  PaywallVM.swift
//  MusicPlayerProject
//
//  Created by George Popkich on 9.12.25.
//

import Foundation
import Combine

protocol PaywallServiceUseCaseProtocol {
    func getMonthPlan() -> MonthPlan
    func getYearPlan() -> YearPlan
    func makePurchase(with plan: Plan) -> Bool
}

final class PaywallVM: ObservableObject {
    
    @Published var selectedPlan: Plan = .month
    @Published var planTitle: String = ""
    @Published var planSubtitle: String = ""
    @Published var planPrice: String = ""
    @Published var buttonTitleText: String = ""
    
    private var monthPlan: MonthPlan
    private var yearPlan: YearPlan
    
    //Buttons
    var purchaseButtonDidTap: PassthroughSubject<Void, Never> = .init()
    
    var bag: Set<AnyCancellable> = []
    
    private var paywallService: PaywallServiceUseCaseProtocol
    
    init(paywallService: PaywallServiceUseCaseProtocol ) {
        self.paywallService = paywallService
        self.monthPlan = paywallService.getMonthPlan()
        self.yearPlan = paywallService.getYearPlan()
        bind()
    }
    
    
    private func bind() {
        purchaseButtonDidTap
            .sink { [weak self] in
                self?.makePurchase()
            }
            .store(in: &bag)
        $selectedPlan.sink { [weak self] plan in
            self?.setTitles(with: plan)
        }
        .store(in: &bag)
    }
   
    
    private func makePurchase() {
        if paywallService.makePurchase(with: selectedPlan) {
            UDManager.set(.isPremium, value: true)
            UDManager.set(.onboardingShown, value: true)
        } else {
            //show Error
        }
    }
    
    private func setTitles(with plan: Plan) {
        switch plan {
        case .month:
            planTitle = monthPlan.title
            planSubtitle = monthPlan.subtitle
            planPrice = monthPlan.priceText
        case .year:
            planTitle = yearPlan.title
            planSubtitle = yearPlan.subtitle
            planPrice = yearPlan.priceText
        }
    }
    
    
}
