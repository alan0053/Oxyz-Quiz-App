//
//  LeaderboardService.swift
//  Oxyz-Triva-App
//
//  Created by Berkcan Alankoy on 2025-03-11.
//

import Foundation

class LeaderboardService {
    func fetchUsers(completion: @escaping ([User]) -> Void) {
        // Fetch users from API or database
        let users: [User] = [
            User(name: "John Doe", score: 100),
            User(name: "Jane Doe", score: 80),
            User(name: "Bob Smith", score: 90)
        ]
        completion(users)
    }
}
