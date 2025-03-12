//
//  QuestionViewModel.swift
//  Oxyz-Triva-App
//
//  Created by Berkcan Alankoy on 2025-03-11.
//

import Foundation
import Combine

class QuestionViewModel: ObservableObject {
    @Published var questions: [Question] = []
    
    private let questionService: QuestionService
    
    init(questionService: QuestionService = QuestionService()) {
        self.questionService = questionService
    }
    
    func fetchQuestions() async {
        let questions = await questionService.fetchQuestionsAsync()
        self.questions = questions
    }
    }

