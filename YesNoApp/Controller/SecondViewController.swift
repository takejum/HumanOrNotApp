//
//  SecondViewController.swift
//  YesNoApp
//
//  Created by Jumpei Takeshita on 2020/03/30.
//  Copyright © 2020 Jumpei Takeshita. All rights reserved.
//

import UIKit

protocol CurrentScoreDelegate {
    func currentScore(score:Int)
}

class SecondViewController: UIViewController {

    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var wrongLabel: UILabel!
    
    var delegate:CurrentScoreDelegate?
    var correctCount = Int()
    var wrongCount = Int()
    var previousCount = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        correctLabel.text = String(correctCount)
        wrongLabel.text = String(wrongCount)
        
        if UserDefaults.standard.object(forKey: "previousCount") != nil {
            previousCount = UserDefaults.standard.object(forKey: "previousCount") as! Int
        }
    }
    
    
    @IBAction func homeButton(_ sender: Any) {
        if previousCount < correctCount {
            UserDefaults.standard.set(correctCount, forKey: "previousCount")
            delegate?.currentScore(score: correctCount)
            
        }else if previousCount > correctCount {
            UserDefaults.standard.set(previousCount, forKey: "correctCount")
            delegate?.currentScore(score: previousCount)
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    
    

  

}
