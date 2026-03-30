//
//  PostDetailInfoView.swift
//  BunMo
//
//  Created by Joon on 3/29/26.
//

import SwiftUI

struct PostDetailInfoView: View {
    let post: Post

    var formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "M월 d일 HH:mm"
        return f
    }()

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {

            // 제목
            Text(post.title)
                .font(.title2.bold())

            Divider()

            // 작성자 + 작성일
            HStack {
                Label(post.author, systemImage: "person.circle.fill")
                    .foregroundStyle(post.contentType.color)
                Spacer()
                Label(formatter.string(from: post.writedDate), systemImage: "calendar")
                    .foregroundStyle(.secondary)
            }
            .font(.subheadline)

            // 모임 시간
            HStack {
                Image(systemName: "clock.fill")
                    .foregroundStyle(post.contentType.color)
                Text("모임 시간")
                    .foregroundStyle(.secondary)
                Spacer()
                Text(formatter.string(from: post.meetingTime))
                    .bold()
            }
            .font(.subheadline)

            // 참여 인원
            HStack {
                Image(systemName: "person.2.fill")
                    .foregroundStyle(post.contentType.color)
                Text("참여 인원")
                    .foregroundStyle(.secondary)
                Spacer()
                Text("\(post.currentParticipants.count) / \(post.maxParticipants)명")
                    .bold()
            }
            .font(.subheadline)

            Divider()

            // 모임 소개
            Text("모임 소개")
                .font(.subheadline.bold())
                .foregroundStyle(.secondary)
            Text(post.content)
                .font(.body)
                .lineSpacing(4)
        }
    }
}
