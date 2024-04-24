//
//  Post.swift
//  InstaClone
//
//  Created by Cody Morley on 4/23/24.
//

import Foundation

struct Post: Codable, Hashable, Identifiable {
    let caption: String
    let id: String
    let imageURL: String
    let likes: Int
    let ownerUUID: String
    let timestamp: Date
    var user: User?
}


extension Post {
    static var mockPosts: [Post] = [
        .init(caption: "Saturdays are for the boys.",
              id: UUID().uuidString,
              imageURL: "bbq",
              likes: 91,
              ownerUUID: User.mockUsers[0].id,
              timestamp: Date.now,
              user: User.mockUsers[0]),
        .init(caption: "Dancing with my friend",
              id: UUID().uuidString,
              imageURL: "carmela-furio",
              likes: 44,
              ownerUUID: User.mockUsers[4].id,
              timestamp: Date.now - 1000,
              user: User.mockUsers[4]),
        .init(caption: "The crew",
              id: UUID().uuidString,
              imageURL: "soprano-crew",
              likes: 102,
              ownerUUID: User.mockUsers[1].id,
              timestamp: Date.now - 2000,
              user: User.mockUsers[1]),
        .init(caption: "This goombah life is a pain in the neck",
              id: UUID().uuidString,
              imageURL: "chris",
              likes: 1950,
              ownerUUID: User.mockUsers[2].id,
              timestamp: Date.now - 3000,
              user: User.mockUsers[2]),
        .init(caption: "Photo courtesy of F-Note Records",
              id: UUID().uuidString,
              imageURL: "hesh",
              likes: 9,
              ownerUUID: User.mockUsers[3].id,
              timestamp: Date.now - 5000,
              user: User.mockUsers[3]),
        .init(caption: "RIP Kemosabe",
              id: UUID().uuidString,
              imageURL: "jackie-funeral",
              likes: 13,
              ownerUUID: User.mockUsers[0].id,
              timestamp: Date.now - 6000,
              user: User.mockUsers[0]),
        .init(caption: "In here it's 1959",
              id: UUID().uuidString,
              imageURL: "tony",
              likes: 315,
              ownerUUID: User.mockUsers[1].id,
              timestamp: Date.now - 10000,
              user: User.mockUsers[1]),
        .init(caption: "Heyyyy",
              id: UUID().uuidString,
              imageURL: "silvio",
              likes: 103,
              ownerUUID: User.mockUsers[0].id,
              timestamp: Date.now - 11000,
              user: User.mockUsers[0]),
        .init(caption: "Hoooo",
              id: UUID().uuidString,
              imageURL: "silvio3",
              likes: 613,
              ownerUUID: User.mockUsers[0].id,
              timestamp: Date.now - 20000,
              user: User.mockUsers[0]),
        .init(caption: "Bada Bing!",
              id: UUID().uuidString,
              imageURL: "silvio4",
              likes: 99,
              ownerUUID: User.mockUsers[0].id,
              timestamp: Date.now - 20500,
              user: User.mockUsers[0]),
    ]
}
