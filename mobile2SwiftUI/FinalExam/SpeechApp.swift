import SwiftUI
import Speech
import AVFoundation

class SpeechRecognizerManager: ObservableObject {
    @Published var transcribedText = "Di algo..."
    @Published var isRecording = false

    private let speechRecognizer = SFSpeechRecognizer()
    private let audioEngine = AVAudioEngine()
    private var request: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?

    func requestAuthorizationAndStart() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            DispatchQueue.main.async {
                if authStatus == .authorized {
                    self.startRecording()
                } else {
                    self.transcribedText = "Permiso denegado."
                }
            }
        }
    }

    func startRecording() {
        guard let recognizer = SFSpeechRecognizer(), recognizer.isAvailable else {
            transcribedText = "El reconocimiento no está disponible."
            return
        }

        request = SFSpeechAudioBufferRecognitionRequest()
        let node = audioEngine.inputNode
        let recordingFormat = node.outputFormat(forBus: 0)
        node.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
            self.request?.append(buffer)
        }

        audioEngine.prepare()
        try? audioEngine.start()

        isRecording = true
        transcribedText = "Escuchando..."

        recognitionTask = recognizer.recognitionTask(with: request!) { result, error in
            if let result = result {
                DispatchQueue.main.async {
                    self.transcribedText = result.bestTranscription.formattedString
                }
            } else if let error = error {
                DispatchQueue.main.async {
                    self.transcribedText = "Error: \(error.localizedDescription)"
                }
            }
        }
    }

    func stopRecording() {
        audioEngine.stop()
        audioEngine.inputNode.removeTap(onBus: 0)
        recognitionTask?.cancel()
        isRecording = false
        transcribedText = "Grabación detenida."
    }
}

struct SpeechApp: View {
    @StateObject private var speechManager = SpeechRecognizerManager()

    var body: some View {
        VStack(spacing: 20) {
            Text(speechManager.transcribedText)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding()

            Button(speechManager.isRecording ? "Detener" : "Empezar a escuchar") {
                if speechManager.isRecording {
                    speechManager.stopRecording()
                } else {
                    speechManager.requestAuthorizationAndStart()
                }
            }
            .padding()
            .background(speechManager.isRecording ? Color.red : Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}

