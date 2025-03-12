//
//  LeaderboardView.swift
//  Oxyz-Triva-App
//
//  Created by Berkcan Alankoy on 2025-03-11.
//

import SwiftUI

struct LeaderboardView: View {
    @StateObject var leaderboardViewModel = LeaderboardViewModel()
    
    var body: some View {
        List {
            ForEach(leaderboardViewModel.users) { user in
                VStack(alignment: .leading) {
                    Text(user.name)
                        .font(.title)
                    Text("Score: \(user.score)")
                        .font(.subheadline)
                }
            }
        }
        .onAppear {
            leaderboardViewModel.fetchUsers()
        }
    }
}
