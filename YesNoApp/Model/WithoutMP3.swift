//
//  WithoutMP3.swift
//  YesNoApp
//
//  Created by Jumpei Takeshita on 2020/04/06.
//  Copyright © 2020 Jumpei Takeshita. All rights reserved.
//

import Foundation

class WithoutMP3:SoundFile{
    override func playSound(fileName: String, extensionName: String) {
        if extensionName == "mp3"{
            print("This is unplayable!")
        }
        player?.stop()
    
    }
}
