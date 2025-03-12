//
//  ScoreViewModel..swift
//  Oxyz-Triva-App
//
//  Created by Berkcan Alankoy on 2025-03-11.
//

import Foundation
import Combine

class ScoreViewModel: ObservableObject {
    @Published var score: Int = 0
    
    private let scoreService: ScoreService
    
    init(scoreService: ScoreService = ScoreService()) {
        self.scoreService = scoreService
    }
    
    func updateScore() {
        scoreService.updateScore { [weak self] score in
            self?.score = score
        }
    }
}
