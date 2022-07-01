//
//  Simple_NewsApp.swift
//  Simple News
//
//  Created by Colin Grenfell on 01/07/2022.
//

import SwiftUI

@main
struct Simple_NewsApp: App {
    init() {
        UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
    }
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                SelectSomethingView()
            }
        }
    }
}
