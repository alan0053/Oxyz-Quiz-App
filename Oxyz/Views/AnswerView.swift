//
//  AnswerView.swift
//  Oxyz-Triva-App
//
//  Created by Berkcan Alankoy on 2025-03-11.
//

import SwiftUI

struct AnswerView: View {
    var answer: Answer
    
    var body: some View {
        Text(answer.text)
            .font(.title)
    }
}
