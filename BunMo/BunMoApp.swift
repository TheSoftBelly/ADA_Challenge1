//
//  BunMoApp.swift
//  BunMo
//
//  Created by Joon on 3/25/26.
//

import SwiftUI

@main
struct BunMoApp: App {
    @StateObject var userStore = UserStore()
    
    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(userStore)
        }
    }
}
