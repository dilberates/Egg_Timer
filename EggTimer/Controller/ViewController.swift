//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

var player:AVAudioPlayer?

class ViewController: UIViewController {
    

    var hardSelect=["AZ":4,"ORTA":5,"ÇOK":8]
    
    var totalTime=0
    var secondPassed=0
    
    var timer = Timer()
    @IBOutlet weak var labelEgg: UILabel!
    @IBOutlet weak var progressBarV: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        progressBarV.progress=0
        timer.invalidate()
        
        
        secondPassed=0
        labelEgg.text=sender.currentTitle!
        totalTime=hardSelect[sender.currentTitle!]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }

    @objc func updateTime() {

          if totalTime >= secondPassed {
              
              let processBar=Float(secondPassed)/Float(totalTime)
              progressBarV.progress=Float(processBar)
              secondPassed += 1
          }else{

              timer.invalidate()
              labelEgg.text="Yumurtanız pişti !"
              let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")

             player = try! AVAudioPlayer(contentsOf: url!)
             player?.play()
          }
      }
}
