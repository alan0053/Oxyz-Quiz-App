//
//  ScoreService.swift
//  Oxyz-Triva-App
//
//  Created by Berkcan Alankoy on 2025-03-11.
//

import Foundation

class ScoreService {
    func updateScore(completion: @escaping (Int) -> Void) {
        // Update score in API or database
        let score: Int = 100
        completion(score)
    }
}
