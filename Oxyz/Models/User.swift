//
//  User.swift
//  Oxyz-Triva-App
//
//  Created by Berkcan Alankoy on 2025-03-11.
//

import Foundation

struct User: Identifiable {
    let id = UUID()
    var name: String
    var score: Int
}
