//
//  SoundPlayer.swift
//  ePet
//
//  Created by Daniel on 30/7/2025.
//

import Foundation
import AVFoundation

class SoundPlayer {
    var audioPlayer: AVAudioPlayer?
    
    func playSound(soundName: String, type: String) {
        // 查找音频文件路径
        if let path = Bundle.main.path(forResource: soundName, ofType: type) {
            let url = URL(fileURLWithPath: path)
            
            do {
                // 初始化音频播放器
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                
                // 准备播放
                audioPlayer?.prepareToPlay()
                
                // 播放音频
                audioPlayer?.play()
            } catch {
                print("播放音频时出错: \(error.localizedDescription)")
            }
        } else {
            print("找不到音频文件: \(soundName).\(type)")
        }
    }
}
