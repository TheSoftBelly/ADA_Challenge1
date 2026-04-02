//
//  SliderView.swift
//  BunMo
//
//  Created by Joon on 3/29/26.
//

import SwiftUI

struct JoinSliderView: View {
    @Binding var isCompleted: Bool
    var tint: Color = .blue
    var label: String = "밀어서 확인하기 →"
    var completedLabel: String = "완료!"

    @State private var dragOffset: CGFloat = 0

    private let sliderHeight: CGFloat = 60
    private let handleSize: CGFloat = 52

    var body: some View {
        GeometryReader { geo in
            let maxDrag = geo.size.width - handleSize - 8

            ZStack(alignment: .leading) {
                Capsule()
                    .fill(tint.opacity(0.15))
                    .frame(height: sliderHeight)

                Capsule()
                    .fill(
                        LinearGradient(
                            colors: [tint.opacity(0.4), tint],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: handleSize + dragOffset + 4, height: sliderHeight)
                    .animation(.interactiveSpring(), value: dragOffset)

                HStack {
                    Spacer()
                    Text(isCompleted ? completedLabel : label)
                        .font(.subheadline.bold())
                        .foregroundStyle(tint.opacity(0.7))
                    Spacer()
                }

                Circle()
                    .fill(.white)
                    .frame(width: handleSize, height: handleSize)
                    .shadow(color: tint.opacity(0.4), radius: 8)
                    .overlay {
                        Image(systemName: isCompleted ? "checkmark" : "chevron.right.2")
                            .foregroundStyle(tint)
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
