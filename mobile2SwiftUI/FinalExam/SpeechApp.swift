import Foundation
import Speech
import AVFoundation

class SpeechRecognizerManager: ObservableObject {
    @Published var transcribedText = "Say something"
    @Published var isRecording = false

    private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-US"))
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
        guard let recognizer = speechRecognizer, recognizer.isAvailable else {
            transcribedText = "El reconocimiento no está disponible."
            return
        }

        request = SFSpeechAudioBufferRecognitionRequest()
        guard let request = request else {
            transcribedText = "No se pudo crear la solicitud de audio."
            return
        }

        let node = audioEngine.inputNode
        let recordingFormat = node.outputFormat(forBus: 0)
        node.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
            request.append(buffer)
        }

        audioEngine.prepare()
        do {
            try audioEngine.start()
        } catch {
            transcribedText = "Error al iniciar el audio: \(error.localizedDescription)"
            return
        }

        isRecording = true
        transcribedText = "Listening..."

        recognitionTask = recognizer.recognitionTask(with: request) { result, error in
            if let result = result {
                DispatchQueue.main.async {
                    self.transcribedText = result.bestTranscription.formattedString
                }
            } else if let error = error {
                if (error as NSError).code != 216 {
                    DispatchQueue.main.async {
                        self.transcribedText = "Error: \(error.localizedDescription)"
                    }
                }
            }
        }
    }

    func stopRecording() {
        audioEngine.stop()
        audioEngine.inputNode.removeTap(onBus: 0)
        recognitionTask?.cancel()
        recognitionTask = nil
        request = nil
        isRecording = false
    }
}

