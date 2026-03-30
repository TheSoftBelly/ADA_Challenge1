//
//  Post.swift
//  BunMo
//
//  Created by Joon on 3/28/26.
//

import Foundation

struct Post: Identifiable {
    let id: UUID
    let title: String
    let image: String?
    let content: String
    let writedDate: Date
    let contentType: ContentType
    let meetingTime: Date
    let author: String
    let maxParticipants: Int
    let currentParticipants: [UUID]
    let tags: [String]
    let isRead: Bool
    let isFavorite: Bool
    let isHighlighted: Bool
    let isPinned: Bool
    let isArchived: Bool
}
