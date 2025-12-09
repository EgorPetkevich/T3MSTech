//
//  OnbThirdAssembler.swift
//  MusicPlayerProject
//
//  Created by George Popkich on 9.12.25.
//

import SwiftUI

final class OnbThirdAssembler {
    
    private init() {}
    
    static func make(paywallService: PaywallService) -> some View {
        let paywallServiceUseCase = OnbThirdPaywallServiceUseCase(service: paywallService)
        let vm = OnbThirdVM(paywallService: paywallServiceUseCase)
        let vc = OnbThirdVC(viewModel: vm)
        return vc
    }
    
}
