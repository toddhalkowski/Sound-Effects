//  Created by todd d Halkowski on 7/1/15.
//  Copyright (c) 2015 Geneva. All rights reserved.

//  uses AVFoundation framework to detect UI Event motion shake and
//  responds by playing random mp3 sound utilizing the AVAudioPlayer class and arc4random functio=======
//  This code uses the AVFoundation framework to detect user motion of shake device
//  and then plays a sound effect in response


import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player:  AVAudioPlayer = AVAudioPlayer()
    
    var sounds = [ "camels", "Applause", "horses", "NightStorm", "CoinDrop"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
    }
    
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        
        if event.subtype == UIEventSubtype.MotionShake {
            
            
            var randomNumber = Int(arc4random_uniform(UInt32(sounds.count)))
            
            
            var fileLocation = NSBundle.mainBundle().pathForResource(sounds[randomNumber], ofType: "mp3")
            
            var error: NSError? = nil
            
            player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: fileLocation!), error: &error)
            
            player.play()
            
            
        }
    }
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

