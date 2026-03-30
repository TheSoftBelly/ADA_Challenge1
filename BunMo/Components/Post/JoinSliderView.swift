//
//  SliderView.swift
//  BunMo
//
//  Created by Joon on 3/29/26.
//

import SwiftUI

struct JoinSliderView: View {
    let post: Post
    let onCompleted: () -> Void

    @State private var dragOffset: CGFloat = 0
    @State private var isCompleted: Bool = false

    private let sliderHeight: CGFloat = 60
    private let handleSize: CGFloat = 52

    var body: some View {
        GeometryReader { geo in
            let maxDrag = geo.size.width - handleSize - 8

            ZStack(alignment: .leading) {
                // 트랙 배경
                Capsule()
                    .fill(post.contentType.color.opacity(0.15))
                    .frame(height: sliderHeight)

                // 채워지는 트랙
                Capsule()
                    .fill(
                        LinearGradient(
                            colors: [post.contentType.color.opacity(0.4), post.contentType.color],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: handleSize + dragOffset + 4, height: sliderHeight)
                    .animation(.interactiveSpring(), value: dragOffset)

                // 안내 텍스트
                HStack {
                    Spacer()
                    Text(isCompleted ? "참여 완료!" : "밀어서 참여하기 →")
                        .font(.subheadline.bold())
                        .foregroundStyle(post.contentType.color.opacity(0.7))
                    Spacer()
                }

                // 드래그 핸들
                Circle()
                    .fill(.white)
                    .frame(width: handleSize, height: handleSize)
                    .shadow(color: post.contentType.color.opacity(0.4), radius: 8)
                    .overlay {
                        Image(systemName: isCompleted ? "checkmark" : "chevron.right.2")
                            .foregroundStyle(post.contentType.color)
                            .font(.system(size: 16, weight: .bold))
                    }
                    .offset(x: min(max(dragOffset, 0), maxDrag) + 4)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                guard !isCompleted else { return }
                                dragOffset = min(max(value.translation.width, 0), maxDrag)
                            }
                            .onEnded { value in
                                guard !isCompleted else { return }
                                if dragOffset >= maxDrag * 0.85 {
                                    withAnimation(.spring()) {
                                        dragOffset = maxDrag
                                        isCompleted = true
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                        onCompleted()
                                    }
                                } else {
                                    withAnimation(.spring()) {
                                        dragOffset = 0
                                    }
                                }
                            }
                    )
            }
            .frame(height: sliderHeight)
        }
        .frame(height: sliderHeight)
    }
}
