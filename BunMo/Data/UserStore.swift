//
//  UserStore.swift
//  BunMo
//
//  Created by Joon on 3/30/26.
//

import Foundation
import Combine

class UserStore: ObservableObject {
    @Published var currentUser : UserModel?
    @Published var posts: [Post] = SampleDataSet.posts
    
    init(){
        load()
    }
    
    func save(){
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(currentUser){
            UserDefaults.standard.set(data, forKey: "currentUser")
        }
    }
    
    func load(){
        let decoder = JSONDecoder()
        if let data = UserDefaults.standard.data(forKey: "currentUser"), let user = try? decoder.decode(UserModel.self, from: data){
            self.currentUser = user
        }
    }
    
    func joinPost(postId: UUID) {
        guard var user = currentUser else { return }
        
        user.joinedPostIDs.append(postId)
        currentUser?.joinedPostIDs.append(postId)
        
        if let index = posts.firstIndex(where: { $0.id == postId }) {
            posts[index].currentParticipants.append(user.id)
        }
        save()
    }
}
