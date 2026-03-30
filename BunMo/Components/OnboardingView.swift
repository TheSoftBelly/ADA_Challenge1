//
//  OnboardingView.swift
//  BunMo
//
//  Created by Joon on 3/29/26.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("userName") var userName: String = ""
    @State private var inputName: String = ""
    @State private var showNameField: Bool = false
    @FocusState private var isNameFieldFocused: Bool
    
    private let features: [(icon: String, color: Color, title: String, description: String)] = [
        ("bolt.fill",        .yellow,  "번개 모임",    "지금 바로 시작하는 즉흥 모임"),
        ("fork.knife",       .orange,  "관심사 기반",  "밥, 운동, 공부, 놀기 중 골라요"),
        ("hand.raised.fill", .purple,  "부담 없이",    "관심 있어요 한 번으로 참여 완료")
    ]
    
    var isButtonDisabled: Bool {
        inputName.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Spacer()
            
                VStack(spacing: 16) {
                    Image("BunMoLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 240, height: 240)
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                        .shadow(color: .black.opacity(0.12), radius: 16, y: 8)
                }
                
                VStack(spacing: 12) {
                    Text("닉네임을 입력해주세요")
                        .font(.footnote.bold())
                        .foregroundStyle(.secondary)
                    
                    TextField("예) 번개왕 효준", text: $inputName)
                        .font(.body)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 14)
                        .background(.background)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(
                                    inputName.isEmpty ? Color(.systemGray4) : Color.purple,
                                    lineWidth: 1.5
                                )
                        )
                        .focused($isNameFieldFocused)
                        .submitLabel(.done)
                        .onSubmit {
                            saveAndStart()
                        }
                        .padding(.horizontal, 24)
                    
                    Button(action: saveAndStart) {
                        HStack(spacing: 8) {
                            Text("시작하기")
                                .font(.body.bold())
                            Image(systemName: "arrow.right")
                                .font(.body.bold())
                        }
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(
                            isButtonDisabled
                            ? Color(.systemGray3)
                            : Color.purple
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                        .padding(.horizontal, 24)
                    }
                    .disabled(isButtonDisabled)
                    .animation(.spring(), value: isButtonDisabled)
                }
                
                Spacer()
            }
        }
        .onTapGesture {
            isNameFieldFocused = false
        }
    }
    private func saveAndStart() {
        let trimmed = inputName.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return }
        userName = trimmed
    }
}

#Preview {
    OnboardingView()
}
