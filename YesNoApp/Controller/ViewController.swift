//
//  ViewController.swift
//  YesNoApp
//
//  Created by Jumpei Takeshita on 2020/03/30.
//  Copyright © 2020 Jumpei Takeshita. All rights reserved.
//

import UIKit


class ViewController: UIViewController, CurrentScoreDelegate {
   
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var bestRecordLabel: UILabel!
    
    var correctCount = 0
    var wrongCount = 0
    var bestRecord = 0
    var questionNumber = 0
    var imageList = ImageList()
    
    //variable to check if answer is true
    var pickedAnswer = Bool()
    
    //variable succeeds SoundFile class
    var soundFile = SoundFile()
    
    var changeColor = ChangeColor()
    var gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientLayer = changeColor.changeColor(topR: 0.07, topG: 0.54, topB: 0.23, topAlpha: 1.0, bottomR: 0.66, bottomG: 0.75, bottomB: 0.54, bottomAlpha: 1.0)
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
        imageView.layer.cornerRadius = 20.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        correctCount = 0
        wrongCount = 0
        questionNumber = 0
        imageView.image = UIImage(named: imageList.list[0].imageText)
        
        if UserDefaults.standard.object(forKey: "previousCount") != nil {
            bestRecord = UserDefaults.standard.object(forKey: "previousCount") as! Int
            bestRecordLabel.text = String(bestRecord)
        }
        bestRecordLabel.text = String(bestRecord)
    }

    @IBAction func answer(_ sender: Any) {
        
        if (sender as AnyObject).tag == 1 {
            
            soundFile.playSound(fileName: "maruSound", extensionName: "mp3")
            pickedAnswer = true
            
            //when OK button is pressed
            
            //declare the button pushed was OK one
            
            //play OK sound
    
        }else if (sender as AnyObject).tag == 2{
            
            
            soundFile.playSound(fileName: "batsuSound", extensionName: "mp3")
            pickedAnswer = false
            
            //when NO button is pressed
            //declare the button pushed was NO one
            //play NO sound
        }
        check()
        upcomingQuestion()
    }
    
    //to check if the value in both pickedAnswer and correctOrNot are same
    func check(){
        let correctAnswer = imageList.list[questionNumber].answer
        if correctAnswer == pickedAnswer{
            print("Correct!")
            correctCount += 1
        }else{
            print("Fuckin Wrong!")
            wrongCount += 1
        }
    }
    
    func upcomingQuestion(){
        if questionNumber <= 9{
            questionNumber += 1
            imageView.image = UIImage(named: imageList.list[questionNumber].imageText)
            
        }else{
            print("No question anymore.")
            performSegue(withIdentifier: "next", sender: nil)
        }
    }
    
    func currentScore(score: Int) {
        soundFile.playSound(fileName: "sound", extensionName: "mp3")
        bestRecordLabel.text = String(score)
       }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "next"{
            let secondVC = segue.destination as! SecondViewController
            secondVC.correctCount = correctCount
            secondVC.wrongCount = wrongCount
            secondVC.delegate = self
        }
    }

}

