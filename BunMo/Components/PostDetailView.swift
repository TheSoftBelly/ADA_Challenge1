//
//  PostDetailView.swift
//  BunMo
//
//  Created by Joon on 3/28/26.
//

import SwiftUI

struct PostDetailView: View {
    let post: Post

    @Environment(\.dismiss) var dismiss
    @State private var showCompletionPopup: Bool = false

    var body: some View {
        ZStack(alignment: .bottom) {

            // MARK: - 스크롤 콘텐츠
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {

                    // 상단 헤더 (이미지 + 오버레이 + 배지)
                    PostDetailHeaderView(post: post)

                    // 정보 + 태그
                    VStack(alignment: .leading, spacing: 20) {
                        PostDetailInfoView(post: post)
                        PostDetailTagsView(post: post)
                    }
                    .padding(20)
                    .padding(.bottom, 120)
                }
            }
            .ignoresSafeArea(edges: .top)

            // MARK: - 하단 슬라이더 패널
            VStack(spacing: 0) {
                UnevenRoundedRectangle(topLeadingRadius: 30, topTrailingRadius: 30)
                    .fill(.background)
                    .frame(height: 110)
                    .shadow(color: .black.opacity(0.1), radius: 20, y: -5)
                    .overlay(alignment: .top) {
                        JoinSliderView(post: post) {
                            showCompletionPopup = true
                        }
                        .padding(.top, 24)
                        .padding(.horizontal, 32)
                    }
            }
            .ignoresSafeArea(edges: .bottom)

            // MARK: - 완료 팝업
            if showCompletionPopup {
                CompletionPopupView(post: post) {
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
