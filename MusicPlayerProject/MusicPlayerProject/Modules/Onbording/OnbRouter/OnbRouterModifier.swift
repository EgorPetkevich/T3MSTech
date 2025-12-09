//
//  OnbRouterModifier.swift
//  MusicPlayerProject
//
//  Created by George Popkich on 9.12.25.
//

import SwiftUI

struct OnbRouterModifier: ViewModifier {

    @State private var router: OnbRouter
    
    init(router: OnbRouter) {
        self.router = router
    }
    
    func body(content: Content) -> some View {
        NavigationStack(
            path: $router.path) {
                content
                    .environment(router)
                    .navigationDestination(for: OnbPath.self) { route in
                        self.routeView(for: route)
                    }
            }
    }
    
    private func routeView(for route: OnbPath) -> some View {
        Group {
            switch route {
            case .first:
                OnbFirstAssembler.make(paywallService: router.paywallService)
            case .second:
                OnbSecondAssembler.make(paywallService: router.paywallService)
            case .third:
                OnbThirdAssembler.make(paywallService: router.paywallService)
            case .paywall:
                PaywallAssembler.make(paywallService: router.paywallService)
            }
        }
        .environment(router)
        
    }
    
}
