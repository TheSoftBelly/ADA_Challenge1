//
//  PostRowView.swift
//  BunMo
//
//  Created by Joon on 3/28/26.
//

import SwiftUI

struct PostRowView: View {
    let post: Post
    var formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "M월 d일 HH:mm"
        return f
    }()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            // 1. 제목
            Text(post.title)
                .font(.headline)
            
            // 2. 작성자 + 모임 시간
            HStack {
                Label(post.author, systemImage: "person.fill")
                Spacer()
                Label( formatter.string(from: post.meetingTime), systemImage: "clock.fill") // Date를 String으로 어떻게?
            }
            .font(.caption)
            .foregroundStyle(.secondary)
            
            // 3. 참여 인원
            Label("\(post.currentParticipants.count) / \(post.maxParticipants)명",
                  systemImage: "person.2.fill")
                .font(.caption)
            
            // 4. 태그
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(post.tags, id: \.self) { tag in
                        Text("#\(tag)")
                            .font(.caption2)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(post.contentType.color)
                            .clipShape(Capsule())
                    }
                }
            }
        }        .padding()
    }
}
