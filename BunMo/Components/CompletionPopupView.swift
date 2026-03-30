//
//  CompletionPopupView.swift
//  BunMo
//
//  Created by Joon on 3/29/26.
//

import SwiftUI

struct CompletionPopupView: View {
    let post: Post
    let onDismiss: () -> Void

    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                // 체크 아이콘
                ZStack {
                    Circle()
                        .fill(post.contentType.color.opacity(0.15))
                        .frame(width: 80, height: 80)
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 50))
                        .foregroundStyle(post.contentType.color)
                }

                Text("참여 완료! 🎉")
                    .font(.title2.bold())

                Text("\(post.title)에\n참여가 완료되었어요!")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)

                // 홈으로 버튼
                Button(action: onDismiss) {
                    Text("홈으로 돌아가기")
                        .font(.subheadline.bold())
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(post.contentType.color)
                        .clipShape(Capsule())
                }
            }
            .padding(28)
            .background(.background)
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .padding(.horizontal, 32)
            .transition(.scale.combined(with: .opacity))
        }
    }
}
