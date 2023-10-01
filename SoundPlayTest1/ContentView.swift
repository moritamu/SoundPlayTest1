//
//  ContentView.swift
//  SoundPlayTest1
//
//  Created by MsMacM on 2023/10/01.
//  https://tech.amefure.com/swift-avaudioplayer　が使える

import SwiftUI
import AudioToolbox
import AVFoundation

let musicData = NSDataAsset(name: "成功音")!.data

var musicPlayer:AVAudioPlayer!

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {
//                AudioToolboxとこの２行だけでシステム音は鳴らせる
                let soundIdBell:SystemSoundID = 1315
                AudioServicesPlaySystemSound(soundIdBell)
            }, label: {
                Text("Button")
            })
            Button {
//                こっちが音源を使って鳴らす方法
                do {
                    musicPlayer = try AVAudioPlayer(data: musicData)
                    musicPlayer.play()
                }catch{
                    print("音の再生に失敗しました")
                }
            } label: {
                Text("Play")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
