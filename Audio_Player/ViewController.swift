//
//  ViewController.swift
//  Audio_Player
//
//  Created by Charlie Cuddy on 1/9/18.
//  Copyright © 2018 Charlie Cuddy. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    let audioPath = Bundle.main.path(forResource: "beethoven", ofType: "mp3")
    var timer = Timer()
    
    @objc func updateScrubber() {
        scrubber.value = Float(player.currentTime)
    }
    
    @IBAction func play(_ sender: Any) {
        player.play()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateScrubber), userInfo: nil, repeats: true)
    }

    @IBAction func pause(_ sender: Any) {
        player.pause()
        timer.invalidate()
    }
    
    @IBAction func stop(_ sender: Any) {
        player.stop()
        timer.invalidate()
        scrubber.value = 0
        player.currentTime = 0
    }
    
    @IBOutlet weak var volumeSlider: UISlider!
    
    @IBAction func volumeChanged(_ sender: Any) {
        player.volume = volumeSlider.value
    }
    
    @IBOutlet weak var scrubber: UISlider!
    
    @IBAction func scrubberChanged(_ sender: Any) {
        player.currentTime = TimeInterval(scrubber.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do {
            
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
            scrubber.maximumValue = Float(player.duration)
            
        } catch {
            
            //Process any errors
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

