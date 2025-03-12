//
//  GifView.swift
//  Oxyz-Triva-App
//
//  Created by Berkcan Alankoy on 2025-03-11.
//

import SwiftUI
import SDWebImageSwiftUI

struct GifView: View {
    let gifName: String

    var body: some View {
        if let gifPath = Bundle.main.path(forResource: gifName, ofType: "gif") {
            WebImage(url: URL(fileURLWithPath: gifPath))
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .zIndex(-1) // Arka plana alır
        } else {
            Text("GIF not found")
                .foregroundColor(.red)
        }
    }
}
