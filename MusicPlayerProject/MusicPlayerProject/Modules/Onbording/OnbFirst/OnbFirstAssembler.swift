//
//  OnbFirstAssembler.swift
//  MusicPlayerProject
//
//  Created by George Popkich on 9.12.25.
//

import SwiftUI

final class OnbFirstAssembler {
    
    private init() {}
    
    static func make(paywallService: PaywallService) -> some View {
        let paywallServiceUseCase = OnbFirstPaywallServiceUseCase(service: paywallService)
        let vm = OnbFirstVM(paywallService: paywallServiceUseCase)
        let vc = OnbFirstVC(viewModel: vm)
        return vc
    }
    
}
