//
//  User.swift
//  InstaClone
//
//  Created by Cody Morley on 4/21/24.
//

import Foundation

struct User: Hashable, Identifiable, Codable {
    let email: String
    let id: String
    var bio: String?
    var fullName: String?
    var profileImageURL: String?
    var username: String
}

extension User {
    static var mockUsers: [User] = [
        .init(email: "sillyD@email.com",
              id: UUID().uuidString,
              bio: "Our true enemy has yet to reveal himself. \nBada Bing off Rt. 17",
              fullName: "Silvio M. Dante",
              profileImageURL: "silvio",
              username: "SillyD"),
        .init(email: "downneck59@email.com",
              id: UUID().uuidString,
              bio: "Remember the good times",
              fullName: "Tony Soprano",
              profileImageURL: "tony",
              username: "ThaBoss"),
        .init(email: "CMFilms@email.com",
              id: UUID().uuidString,
              bio: "Finding my arc.",
              fullName: "Christopher Moltisanti",
              profileImageURL: "chris",
              username: "ChrissyFlicks"),
        .init(email: "nothatshy@email.com",
              id: UUID().uuidString,
              bio: "Shy old man",
              fullName: "Herman Rabkin",
              profileImageURL: "hesh",
              username: "Hesh88"),
        .init(email: "queenofnorthjerz@email.com",
              id: UUID().uuidString,
              bio: "Mother of 2 great kids. Real Estate Developer. \nJust a regular garbageman's wife.",
              fullName: "Carmela Soprano",
              profileImageURL: "carmela",
              username: "JERZQUEEN")
    ]
}
