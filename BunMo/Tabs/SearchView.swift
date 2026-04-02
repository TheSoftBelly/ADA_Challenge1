//
//  SearchView.swift
//  BunMo
//
//  Created by Joon on 3/31/26.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @EnvironmentObject var userStore: UserStore
    
    var allPosts: [Post] { userStore.posts }
    
    var filteredPosts: [Post] {
        if searchText.isEmpty {
            return allPosts
        } else {
            return allPosts.filter {
                $0.title.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
            List(filteredPosts) { post in
                NavigationLink(destination: PostDetailView(post: post)) {
                    PostRowView(post: post)
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
            }
            .listStyle(.plain)
            .navigationTitle("목록")
            .searchable(text: $searchText, prompt: "검색어를 입력해주세요.")
            

    }
}


#Preview {
    SearchView()
}
