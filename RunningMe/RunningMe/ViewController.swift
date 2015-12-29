//
//  ViewController.swift
//  RunningMe
//
//  Created by Takamura Tatsuya on 2015/12/06.
//  Copyright © 2015年 Takamura Tatsuya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let player = Player()
    var isPlaying: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        AKOrchestra.addInstrument(player)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func play(sender: UIButton) {
        if !isPlaying {
            player.play()
            isPlaying = true
            sender.setTitle("Stop", forState: .Normal)
        } else if isPlaying {
            player.stop()
            isPlaying = false
            sender.setTitle("Play", forState: .Normal)
        }
    }
    
    @IBAction func rotate(sender: UISlider){
        player.rotate(sender.value)
    }
}

