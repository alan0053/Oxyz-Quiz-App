//
//  IntroView.swift
//  Oxyz-Trivia-App
//
//  Created by Berkcan Alankoy on 2025-03-11.
//

import SwiftUI

import SwiftUI

struct IntroView: View {
    @State private var showQuestions = false
    @State private var currentIndex = 0
    @State private var questions: [Question] = []
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var isLoading = false // Yüklenme durumu

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                ZStack {
                    
                    // Gradient overlay
                    LinearGradient(
                        gradient: Gradient(colors: [.black.opacity(0.8), .clear]),
                        startPoint: .bottom,
                        endPoint: .top
                    )
                    .frame(width: 400, height: 400)
                    .cornerRadius(12)
                    
                    .clipped()
                    
                    // GifView with zoom effect
                    GifView(gifName: "rotate")
                        .frame(width: 200, height: 200)
                        .scaleEffect(2.5)
                }
                Spacer()
                Text("O.XYZ Quiz")
                    .font(OxyzTypography.displayMedium)  // Orijinal font
                      // Yeni font boyutu
                    .foregroundColor(.white)  // Yazı rengi beyaz
                    .padding(.top, 20)
               
                if isLoading {
                    ProgressView("Loading questions...")
                        .foregroundColor(.white)
                        .padding()
                } else {
                    Button(action: {
                        Task {
                            isLoading = true
                            await fetchQuestions()
                            isLoading = false
                        }
                    }) {
                        Text("Start")
                            .font(OxyzTypography.buttonText)
                        
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(Color.clear)  // Şeffaf arka plan
                            .foregroundColor(.white)  // Metin rengi beyaz
                            .overlay(
                                Rectangle()
                                    .stroke(Color.white, lineWidth: 1)  // Kenarlık çizgisi
                            )
                            .padding()
                            .shadow(radius: 5)  // Gölgeleme
                    }
                    
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    .disabled(isLoading)
                }
                Spacer() // Space between the button and the footer
                
                // Adding the "Coded by" footer
                HStack {
                    Text("Coded by ")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                    Text("Ocean")
                        .font(.system(size: 16, weight: .bold))  // Make "Ocean and Alderion" bold
                        .foregroundColor(.white)
                    Text( "and")
                        .font(.system(size: 14))  // Make "Ocean and Alderion" bold
                        .foregroundColor(.white)
                    Text("Alderion")
                        .font(.system(size: 16, weight: .bold))  // Make "Ocean and Alderion" bold
                        .foregroundColor(.white)
                }
                .padding(.bottom, 20)
                
                    .edgesIgnoringSafeArea(.all)
            }
        }
        .fullScreenCover(isPresented: $showQuestions) {
            QuestionView(questions: questions, currentIndex: $currentIndex, showQuestionView: $showQuestions)
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
        
    }

    func fetchQuestions() async {
        isLoading = true
        defer { isLoading = false }

        let fetchedQuestions = await QuestionService().fetchQuestionsAsync()

        await MainActor.run {
            if fetchedQuestions.isEmpty {
                alertMessage = "No questions available. Please try again later."
                showAlert = true
            } else {
                questions = fetchedQuestions
                showQuestions = !questions.isEmpty
            }
        }
    }
}
#Preview {
    IntroView()
}
