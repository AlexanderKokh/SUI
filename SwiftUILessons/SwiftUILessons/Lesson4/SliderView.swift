//
//  SliderView.swift
//  SwiftUILessons
//
//  Created by Александр Кох on 08.07.2022.
//

import SwiftUI
import AVFoundation

class PlayerViewModel: ObservableObject {
    @Published public var maxDuration = 0.0
    private var player: AVAudioPlayer?
    
    public func play() {
        playSong(name: "The Business")
        player?.play()
    }
    
    public func stop() {
        player?.stop()
    }
    
    public func setTime(value: Float) {
        guard let time = TimeInterval(exactly: value) else { return }
        player?.currentTime = time
        player?.play()
    }
    
    private func playSong(name: String) {
        guard let audioPath = Bundle.main.path(forResource: name, ofType: "mp3") else { return }
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            maxDuration = player?.duration ?? 0.0
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct SliderView: View {
    @State private var progress: Float = 0
    @ObservedObject var viewModel = PlayerViewModel()
    
    var body: some View {
        VStack {
            Slider(value: Binding(get: {
                Double(progress)
            }, set: {
                newValue in
                progress = Float(newValue)
                viewModel.setTime(value: Float(newValue))
            }), in: 0...viewModel.maxDuration)
                .padding()
                .accentColor(Color.purple)
            
            HStack {
                configureButton(title: "Start", isStart: true)
                configureButton(title: "Stop", isStart: false)
            }
        }
    }
    
    private func configureButton(title: String, isStart: Bool) -> some View {
        Button {
            isStart ? viewModel.play() : viewModel.stop()
        } label: {
            Text(title)
                .foregroundColor(Color.blue)
        }
        .frame(width: 100, height: 50)
        .background(Color.orange)
        .cornerRadius(10)
    }
    
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}
