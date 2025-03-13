import SwiftUI

struct OxyzTypography {
    static let displayLarge = Font.custom("NeueMachina-Black", size: 40)
    static let displayMedium = Font.custom("NeueMachina-Bold", size: 32)
    static let bodyText = Font.custom("ABCDiatype-Regular", size: 18)
    static let bodyMono = Font.custom("ABCDiatypeMono-Regular", size:18)
    static let buttonText = Font.custom("NeueMachina-Medium", size: 20)
    static let caption = Font.custom("NeueMachina-Light", size: 14)
}


struct QuestionView: View {
    let questions: [Question]
    @Binding var currentIndex: Int
    @State private var showFinalView = false
    @State private var score = 0  // Başlangıçta puan sıfır
    @Binding var showQuestionView: Bool
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all) // Set background to black
                
                VStack {
                    Spacer()
                    ZStack {
                        // Gradient overlay
                        LinearGradient(
                            gradient: Gradient(colors: [.black.opacity(0.1), .clear]),
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

                    // Show question text
                    Text(questions[currentIndex].text)
                        .font(OxyzTypography.displayMedium)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)  // Ensure the text takes full width
                        .lineLimit(nil)              // Allow text to wrap
                        .fixedSize(horizontal: false, vertical: true)
                    
                    // Answer buttons
                    ForEach(questions[currentIndex].answers.indices, id: \.self) { index in
                        Button(action: {
                            // Check if the selected answer is correct
                            if questions[currentIndex].answers[index].isCorrect {
                                score += 1
                            }
                            
                            // Move to the next question or show final view if it's the last one
                            if currentIndex < questions.count - 1 {
                                currentIndex += 1
                            } else {
                               
                                // When all questions are answered, show the final view
                                DispatchQueue.main.async {
                                    showFinalView = true
                                }
                            }
                        }) {
                            Text(questions[currentIndex].answers[index].text)
                                .font(OxyzTypography.buttonText)
                                .frame(height: 50)
                                .frame(maxWidth: .infinity)
                                .background(Color.clear)  // Transparent background
                                .foregroundColor(.white)  // White text color
                                .overlay(
                                    Rectangle()
                                        .stroke(Color.white, lineWidth: 1)  // Border
                                )
                                .padding(4)
                                .shadow(radius: 5)  // Shadow
                        }
                        .padding(.horizontal, 20) // Improve button spacing
                    }
                }
                .padding()
            }
        }
        .onAppear {
            // Sıfırlama işlemleri burada yapılacak
            score = 0
            currentIndex = 0
        }
        .fullScreenCover(isPresented: $showFinalView) {
            FinalView(score: $score, onRestart: {
                // Reset quiz and score
                currentIndex = 0
                score = 0  // Reset score
                showFinalView = false
            }, onHome: {
                // Reset to home screen and score
                currentIndex = 0
                score = 0  // Reset score
                showQuestionView = false
            })
        }
    }
}
struct QuestionView_Previews: PreviewProvider {
    @State static var currentIndex = 0
    @State static var showQuestionView = true

    static var previews: some View {
        QuestionView(
            questions: [Question(
                text: "What is the name of the Founder and CEO of O.XYZ?What is the name of the Founder and CEO of O.XYZ?",
                category: "O.XYZ",
                answers: [
                    Answer(text: "Ahmad Shadid", isCorrect: true),
                    Answer(text: "Marina Romero", isCorrect: false),
                    Answer(text: "Tamer Saudi", isCorrect: false),
                    Answer(text: "John Doe", isCorrect: false)
                ]
            )],
            currentIndex: $currentIndex,
            showQuestionView: $showQuestionView
        )
    }
}
