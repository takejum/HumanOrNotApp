//
//  ImageModel.swift
//  YesNoApp
//
//  Created by Jumpei Takeshita on 2020/04/01.
//  Copyright © 2020 Jumpei Takeshita. All rights reserved.
//

import Foundation

class ImageModel{
    
    //get the name of images and decide if it's human or not by checking up the flag
    
    let imageText:String
    let answer:Bool
    
    init(imageName:String, correctOrNot:Bool){
        imageText = imageName
        answer = correctOrNot
    }
}
