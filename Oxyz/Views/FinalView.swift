//
//  FinalView.swift
//  Oxyz-Triva-App
//
//  Created by Berkcan Alankoy on 2025-03-11.
//
import SwiftUI

struct FinalView: View {
    var score: Int
    var onRestart: () -> Void // Restart the quiz
    var onHome: () -> Void // Go to the initial screen

    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)

            VStack {
                ZStack {
                    // Gradient overlay
                    LinearGradient(
                        gradient: Gradient(colors: [.black.opacity(10), .clear]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(width: 200, height: 200)
                    .cornerRadius(12)
                    .clipped()

                    // GifView with zoom effect
                    GifView(gifName: "oxyz")
                        .frame(width: 200, height: 200)
                        .scaleEffect(5)
                }

                Text("Quiz Completed!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 20)

                Text("Final Score: \(score)")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.top, 10)

                Button(action: {
                    onRestart() // Restart the quiz
                }) {
                    Text("Restart")
                        .font(OxyzTypography.buttonText)
                    
                                .frame(height: 50)
                                .frame(maxWidth: .infinity)
                               .background(Color.clear)  // Şeffaf arka plan
                               .foregroundColor(.white)  // Metin rengi beyaz
                               .overlay(
                                  Rectangle()
                                       .stroke(Color.white, lineWidth: 1)  // Kenarlık çizgisi
                               )
                               .padding(4)
                               .shadow(radius: 5)  // Gölgeleme
                }
                .padding(.top, 20)

                Button(action: {
                    onHome() // Navigate to the initial screen instead of restarting
                }) {
                    Text("Home")
                        .font(OxyzTypography.buttonText)
                    
                                .frame(height: 50)
                                .frame(maxWidth: .infinity)
                               .background(Color.clear)  // Şeffaf arka plan
                               .foregroundColor(.white)  // Metin rengi beyaz
                               .overlay(
                                  Rectangle()
                                       .stroke(Color.white, lineWidth: 1)  // Kenarlık çizgisi
                               )
                               .padding(4)
                               .shadow(radius: 5)  // Gölgeleme
                }
                .padding(.top, 10)

               
            }
        }
    }
}
