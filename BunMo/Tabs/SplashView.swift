//
//  SplashView.swift
//  BunMo
//
//  Created by Joon on 3/29/26.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                Image("BunMoLogo")
                    .resizable()
                    .frame(width: 320, height: 320)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
