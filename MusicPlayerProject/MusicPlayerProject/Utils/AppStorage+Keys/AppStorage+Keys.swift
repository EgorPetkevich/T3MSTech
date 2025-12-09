//
//  AppStorage+Keys.swift
//  MusicPlayerProject
//
//  Created by George Popkich on 9.12.25.
//

import SwiftUI

extension AppStorage where Value == Bool { 
    
    init(
        wrappedValue: Bool,
        _ key: AppStorageKeys,
        store: UserDefaults? = nil
    ) {
        self.init(wrappedValue: wrappedValue, key.rawValue, store: store)
    }
    
}
