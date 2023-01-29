//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
     //Using dictionaries
     var eggTimer =  ["Soft" : 180 ,"Medium" : 240 ,"Hard" : 300]
     var totalTime = 0
     var secondPassed = 0
     var player : AVAudioPlayer?
     
     
     var timer = Timer()

     @IBOutlet weak var myText: UILabel!
     
     @IBOutlet weak var progressBar: UIProgressView!
     
     @IBAction func hardnessSelected(_ sender: UIButton) {
          
          
          timer.invalidate()
          let hardness = sender.currentTitle!
          totalTime = eggTimer[hardness]!
          
          progressBar.progress = 0.0
          secondPassed = 0
          myText.text = hardness
          
          timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer),userInfo: nil, repeats: true)
     }
          @objc func updateTimer(){
               if secondPassed < totalTime {
                    
                    secondPassed += 1
                    progressBar.progress = Float(secondPassed) / Float(totalTime)
                    
               
               }
               else{
                    timer.invalidate()
                    myText.text = "Done!"
                    
                    let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")!
                    player = try! AVAudioPlayer(contentsOf: url)
                    player?.play()
                    }
          }
    
}


