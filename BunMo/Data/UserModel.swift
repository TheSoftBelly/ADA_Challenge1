//
//  UserModel.swift
//  BunMo
//
//  Created by Joon on 3/29/26.
//

import Foundation

struct UserModel: Identifiable, Codable {
    let id: UUID
    let name: String
    var joinedPostIDs: [UUID]
}
