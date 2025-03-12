//
//  ScoreView.swift
//  Oxyz-Triva-App
//
//  Created by Berkcan Alankoy on 2025-03-11.
//

import SwiftUI

struct ScoreView: View {
    @State private var score: Int = 0
    
    var body: some View {
        Text("Score: \(score)")
            .font(.largeTitle)
    }
}
