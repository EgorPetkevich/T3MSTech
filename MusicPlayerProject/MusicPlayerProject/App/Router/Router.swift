//
//  Router.swift
//  MusicPlayerProject
//
//  Created by George Popkich on 9.12.25.
//

import Foundation
import SwiftUI
import Observation

@Observable
class Router {
    
    var path = NavigationPath()
    
    func pop() { path.removeLast() }
    
    func popToRoot() { path.removeLast(path.count) }
    
}
