//
//  View+RouterModifier.swift
//  MusicPlayerProject
//
//  Created by George Popkich on 9.12.25.
//

import SwiftUI

extension View {
    
    func withRouter(_ router: OnbRouter) -> some View {
        modifier(OnbRouterModifier(router: router))
    }
    
}
