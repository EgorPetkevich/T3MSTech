//
//  OnbSecondAssembler.swift
//  MusicPlayerProject
//
//  Created by George Popkich on 9.12.25.
//

import SwiftUI

final class OnbSecondAssembler {
    
    private init() {}
    
    static func make(paywallService: PaywallService) -> some View {
        let paywallServiceUseCase = OnbSecondPaywallServiceUseCase(service: paywallService)
        let vm = OnbSecondVM(paywallService: paywallServiceUseCase)
        let vc = OnbSecondVC(viewModel: vm)
        return vc
    }
    
}
