//
//  QuestionService.swift
//  Oxyz-Triva-App
//
//  Created by Berkcan Alankoy on 2025-03-11.
//

import Foundation

class QuestionService {
    func fetchQuestionsAsync() async -> [Question] {
        // Fetch questions from API or database
        let questions: [Question] = [
            Question(
                text: "What is the name of the Founder and CEO of O.XYZ?",
                category: "O.XYZ",
                answers: [
                    Answer(text: "Ahmad Shadid", isCorrect: true),
                    Answer(text: "Marina Romero", isCorrect: false),
                    Answer(text: "Tamer Saudi", isCorrect: false),
                    Answer(text: "John Doe", isCorrect: false)
                ]
            ),
            Question(
                text: "What is the role of Marina 'Diguele' Romero in O.XYZ?",
                category: "O.XYZ",
                answers: [
                    Answer(text: "Founder and CEO", isCorrect: false),
                    Answer(text: "Co-Founder and Chief of Staff", isCorrect: true),
                    Answer(text: "Co-Founder and CTO", isCorrect: false),
                    Answer(text: "Marketing Manager", isCorrect: false)
                ]
            ),
            Question(
                text: "Who is the Co-Founder of O.XYZ, along with Ahmad Shadid and Marina Romero?",
                category: "O.XYZ",
                answers: [
                    Answer(text: "Tamer Saudi", isCorrect: true),
                    Answer(text: "John Smith", isCorrect: false),
                    Answer(text: "Jane Doe", isCorrect: false),
                    Answer(text: "Bob Johnson", isCorrect: false)
                ]
            ),
            Question(
                text: "What is the name of the official YouTube channel of O.XYZ?",
                category: "O.XYZ",
                answers: [
                    Answer(text: "O Official Channel", isCorrect: true),
                    Answer(text: "O.XYZ Official", isCorrect: false),
                    Answer(text: "OXYX Channel", isCorrect: false),
                    Answer(text: "O.XYZ TV", isCorrect: false)
                ]
            ),
            Question(
                text: "What is the URL of the official LinkedIn page of O.XYZ?",
                category: "O.XYZ",
                answers: [
                    Answer(text: "linkedin.com/company/oxyz-official", isCorrect: true),
                    Answer(text: "linkedin.com/company/oxzy", isCorrect: false),
                    Answer(text: "linkedin.com/company/oxyx", isCorrect: false),
                    Answer(text: "linkedin.com/company/xyz", isCorrect: false)
                ]
            ),
            Question(
                text: "What is the name of the official Twitter handle of O.XYZ?",
                category: "O.XYZ",
                answers: [
                    Answer(text: "@o_fndn", isCorrect: true),
                    Answer(text: "@oxyx", isCorrect: false),
                    Answer(text: "@oxzy", isCorrect: false),
                    Answer(text: "@xyz", isCorrect: false)
                ]
            ),
            Question(
                text: "What is the role of O.XYZ in the tech industry?",
                category: "O.XYZ",
                answers: [
                    Answer(text: "AI Development", isCorrect: false),
                    Answer(text: "Cybersecurity", isCorrect: false),
                    Answer(text: "Innovation and Research", isCorrect: false),
                    Answer(text: "All of the above", isCorrect: true)
                ]
            ),
            Question(
                text: "What is the name of the AI developed by O.XYZ?",
                category: "O.XYZ",
                answers: [
                    Answer(text: "O", isCorrect: true),
                    Answer(text: "O.XYZ AI", isCorrect: false),
                    Answer(text: "OXYX AI", isCorrect: false),
                    Answer(text: "XYZ AI", isCorrect: false)
                ]
            ),
            Question(
                text: "What is the main goal of O.XYZ?",
                category: "O.XYZ",
                answers: [
                    Answer(text: "To develop innovative AI solutions", isCorrect: true),
                    Answer(text: "To provide cybersecurity services", isCorrect: false),
                    Answer(text: "To conduct research in the tech industry", isCorrect: false),
                    Answer(text: "To create a community for tech enthusiasts", isCorrect: false)
                ]
            ),
            Question(
                text: "What is the name of the cryptocurrency related to O.XYZ?",
                category: "O.XYZ",
                answers: [
                    Answer(text: "O Intelligence COIN", isCorrect: true),
                    Answer(text: "OXYX COIN", isCorrect: false),
                    Answer(text: "XYZ COIN", isCorrect: false),
                    Answer(text: "O COIN", isCorrect: false)
                ]
            )
        ]
        return questions
    }
}
