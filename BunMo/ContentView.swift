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
                    Tab(role: .search) {
                        NavigationStack {
                            SearchView()
                        }
                    }

                }
                .navigationBarTitle("BunMo")
                .tint(.purple)
            }
    }
}

#Preview {
    ContentView()
        .environmentObject(UserStore())
}
