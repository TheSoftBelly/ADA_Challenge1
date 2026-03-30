//
//  ContentView.swift
//  BunMo
//
//  Created by Joon on 3/25/26.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("userName") var userName: String = ""
    
    var body: some View {
        if userName.isEmpty {
                OnboardingView()
            } else {
                TabView() {
                    Tab("Home", systemImage: "house.fill") {
                        HomeView()
                    }
                    Tab("More", systemImage: "line.3.horizontal"){
                        MoreView()
                    }
                    
                }
                .navigationBarTitle("BunMo")
                .tint(.purple)
                // 홈
            }
    }
}

#Preview {
    ContentView()
}
