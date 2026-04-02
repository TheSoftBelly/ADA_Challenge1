//
//  PostDetailView.swift
//  BunMo
//
//  Created by Joon on 3/28/26.
//

import SwiftUI

struct PostDetailView: View {
    let post: Post
    
    @EnvironmentObject var userStore : UserStore
    @Environment(\.dismiss) var dismiss
    @State private var showCompletionPopup: Bool = false
    @State private var isJoined: Bool = false
    


    var body: some View {
        ZStack(alignment: .bottom) {

            ScrollView {
                VStack(alignment: .leading, spacing: 0) {

                    PostDetailHeaderView(post: post)

                    VStack(alignment: .leading, spacing: 20) {
                        PostDetailInfoView(post: post)
                        PostDetailTagsView(post: post)
                    }
                    .padding(20)
                    .padding(.bottom, 120)
                }
            }
            .ignoresSafeArea(edges: .top)

            VStack(spacing: 0) {
                UnevenRoundedRectangle(topLeadingRadius: 30, topTrailingRadius: 30)
                    .fill(.background)
                    .frame(height: 110)
                    .shadow(color: .black.opacity(0.1), radius: 20, y: -5)
                    .overlay(alignment: .top) {
                        JoinSliderView(
                            isCompleted: $isJoined,
                            tint: post.contentType.color,
                            label: "밀어서 참여하기 →",
                            completedLabel: "참여 완료!"
                        )
                        .onChange(of: isJoined) { _, joined in
                            if joined { showCompletionPopup = true }
                        }
                        .padding(.top, 24)
                        .padding(.horizontal, 32)
                    }
            }
            .ignoresSafeArea(edges: .bottom)

            if showCompletionPopup {
                CompletionPopupView(post: post) {
                    userStore.joinPost(postId: post.id)
                    dismiss()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        dismiss()
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
