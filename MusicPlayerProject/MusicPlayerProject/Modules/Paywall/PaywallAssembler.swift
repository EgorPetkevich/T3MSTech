//
//  PaywallAssembler.swift
//  MusicPlayerProject
//
//  Created by George Popkich on 9.12.25.
//

import SwiftUI

final class PaywallAssembler {
    
    private init() {}
    
    static func make(paywallService: PaywallService) -> some View {
        let paywallService = PaywallServiceUseCase(service: paywallService)
        let vm = PaywallVM(paywallService: paywallService)
        let vc = PaywallVC(viewModel: vm)
        return vc
    }
    
}
