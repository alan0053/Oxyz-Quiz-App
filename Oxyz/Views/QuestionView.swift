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
    @State private var score = 0
    @Binding var showQuestionView: Bool // Added binding to control navigation
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                
                Color.black.edgesIgnoringSafeArea(.all) // Set background to black
                
                VStack {
                    Spacer()
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
                   
                    Text(questions[currentIndex].text)
                        .font(OxyzTypography.displayMedium)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)  // Ensure the text takes full width
                        .lineLimit(nil)              // Allow text to wrap
                        .fixedSize(horizontal: false, vertical: true) // Allow the text to expand vertically if needed
                    
                    ForEach(questions[currentIndex].answers.indices, id: \.self) { index in
                        Button(action: {
                            if index == questions[currentIndex].answers.firstIndex(where: { $0.isCorrect }) {
                                score += 1
                            }
                            
                            if currentIndex < questions.count - 1 {
                                currentIndex += 1
                            } else {
                                DispatchQueue.main.async {
                                    showFinalView = true
                                }
                            }
                        }) {
                            Text(questions[currentIndex].answers[index].text)
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
                        .padding(.horizontal, 20) // Improve button spacing
                    }
                }
                
                .padding()
            }
        }
        .fullScreenCover(isPresented: $showFinalView) {
            FinalView(score: score, onRestart: {
                currentIndex = 0
                score = 0
                showFinalView = false
            }, onHome: {
                showQuestionView = false // Correctly dismisses the QuestionView
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
