import SwiftUI
import Foundation

struct AnimalQuizView: View {
    @StateObject private var speechManager = SpeechRecognizerManager()

    @State private var animals = animalList.shuffled()
    @State private var currentIndex = 0
    @State private var score = 0

    var body: some View {
        VStack(spacing: 20) {
            Text("Score: \(score)")
                .font(.title)
            
            if currentIndex < animals.count {
                Image(animals[currentIndex].imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                Text(speechManager.transcribedText)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                
                Button(speechManager.isRecording ? "Stop" : "Name the Animal") {
                    if speechManager.isRecording {
                        // Detener reconocimiento
                        speechManager.stopRecording()
                        
                        // Evaluar la respuesta
                        let spoken = speechManager.transcribedText.lowercased()
                        let expected = animals[currentIndex].name.lowercased()
                        
                        if spoken.contains(expected) {
                            score += 1
                        }
                        
                        // Avanzar a la siguiente imagen
                        currentIndex += 1
                    } else {
                        // Empezar a grabar
                        speechManager.requestAuthorizationAndStart()
                    }
                }
                .padding()
                .background(speechManager.isRecording ? Color.red : Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
            } else {
                VStack(spacing: 20) {
                    Text("Game finished 🎉")
                        .font(.title)
                    
                    Text("Final score: \(score)/\(animals.count)")
                    
                    Button("Restart") {
                        animals = animalList.shuffled()
                        currentIndex = 0
                        score = 0
                        speechManager.transcribedText = "Say something..."
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
        }
        .padding()
    }
}

