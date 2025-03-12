//
//  AnswerService.swift
//  Oxyz-Triva-App
//
//  Created by Berkcan Alankoy on 2025-03-11.
//

import Foundation


class AnswerService {
    func fetchAnswers(for question: Question, completion: @escaping ([Answer]) -> Void) {
        // Fetch answers from API or database
        let answers: [Answer] = question.answers
        completion(answers)
    }
}
