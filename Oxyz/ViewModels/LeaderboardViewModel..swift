//
//  LeaderboardViewModel..swift
//  Oxyz-Triva-App
//
//  Created by Berkcan Alankoy on 2025-03-11.
//

import Foundation
import Combine

class LeaderboardViewModel: ObservableObject {
    @Published var users: [User] = []
    
    private let leaderboardService: LeaderboardService
    
    init(leaderboardService: LeaderboardService = LeaderboardService()) {
        self.leaderboardService = leaderboardService
    }
    
    func fetchUsers() {
        leaderboardService.fetchUsers { [weak self] users in
            self?.users = users
        }
    }
}
