//
//  Question.swift
//  Oxyz-Triva-App
//
//  Created by Berkcan Alankoy on 2025-03-11.
//
import Foundation
struct Question: Identifiable {
    let id = UUID()
    var text: String
    var category: String
    var answers: [Answer]
}
