//
//  Answer.swift
//  Oxyz-Triva-App
//
//  Created by Berkcan Alankoy on 2025-03-11.
//
import Foundation

struct Answer: Identifiable {
    let id = UUID()
    var text: String
    var isCorrect: Bool
}
