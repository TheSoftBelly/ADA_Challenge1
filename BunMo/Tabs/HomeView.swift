//
//  HomeView.swift
//  BunMo
//
//  Created by Joon on 3/25/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(.vertical) {
                    VStack(alignment: .leading) {
                        HighlightsImages()
                        Divider()
                            .padding(.horizontal, 8)
                        HotList()
                        Divider()
                            .padding(.horizontal, 8)
                        ContentTypeGridView()
                        Divider()
                            .padding(.horizontal, 8)
                        RecommandList()
                    }
                }
                Spacer()
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

#Preview {
    HomeView()
}
