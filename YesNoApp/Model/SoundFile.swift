//
//  SoundFile.swift
//  YesNoApp
//
//  Created by Jumpei Takeshita on 2020/04/05.
//  Copyright © 2020 Jumpei Takeshita. All rights reserved.
//

import Foundation
import AVFoundation

class SoundFile {
    var player:AVAudioPlayer?
    func playSound(fileName:String, extensionName:String){
        
        let soundURL = Bundle.main.url(forResource: fileName, withExtension: extensionName)
        
        do{
            player = try AVAudioPlayer(contentsOf: soundURL!)
            player?.play()
            
        }catch{
            print("Something's wrong!")
        }
    }
}

