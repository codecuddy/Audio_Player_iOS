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

    @IBAction func play(_ sender: Any) {
    }
    
    @IBAction func pause(_ sender: Any) {
    }
    
    @IBAction func sliderMoved(_ sender: Any) {
    }
    
    @IBOutlet weak var slider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let audioPath = Bundle.main.path(forResource: "beethoven", ofType: "mp3")
        
        do {
            
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
            player.play()
            
        } catch {
            
            //Process any errors
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

