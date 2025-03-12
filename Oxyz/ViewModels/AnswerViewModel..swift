//
//  AnswerViewModel..swift
//  Oxyz-Triva-App
//
//  Created by Berkcan Alankoy on 2025-03-11.
//

import Foundation
import Combine

class AnswerViewModel: ObservableObject {
    @Published var answers: [Answer] = []
    
    private let answerService: AnswerService
    
    init(answerService: AnswerService = AnswerService()) {
        self.answerService = answerService
    }
    
    func fetchAnswers(for question: Question) {
        answerService.fetchAnswers(for: question) { [weak self] answers in
            self?.answers = answers
        }
    }
}
