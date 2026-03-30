//
//  ContentTypeGridView.swift
//  BunMo
//
//  Created by Joon on 3/28/26.
//

import SwiftUI

struct ContentTypeGridView: View {

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(ContentType.allCases, id: \.self) { type in
                NavigationLink(destination: PostListView(contentType: type)){
                    ZStack{
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundStyle(type.color)
                            .containerRelativeFrame(.horizontal) { width, _ in width / 2 - 20}
                            .frame(height: 80)
                            .padding(8)
                            .shadow(radius: 4)
                            .overlay(
                                Label(type.displayName, systemImage: type.icon)
                                    .font(.title3.bold())
                                    .foregroundColor(.white)
                                    .padding()
                            )
                    }
                }
                // 여기에 각 카테고리 버튼 디자인해봐
                // type.icon, type.color, type.displayName 활용!
            }
        }
    }
}
#Preview {
    ContentTypeGridView()
}
