//
//  Router.swift
//  Album
//
//  Created by Andrew Choi on 11/15/23.
//

import SwiftUI

final class Router: ObservableObject {
    
    public enum Destination: Hashable {
        case albumDetail(album: Album)
        case albumViewer(url: String)
    }
    
    @Published var navPath = NavigationPath()
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
