//
//  ViewController.swift
//  RunningMe
//
//  Created by Takamura Tatsuya on 2015/12/06.
//  Copyright © 2015年 Takamura Tatsuya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let instrument = AKInstrument()

        instrument.setAudioOutput(AKOscillator())
        AKOrchestra.addInstrument(instrument)

        instrument.play()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

