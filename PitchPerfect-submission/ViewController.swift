//
//  ViewController.swift
//  PitchPerfect-submission
//
//  Created by Rohan Sarith Pethiyagoda on 19/07/2015.
//  Copyright (c) 2015 RP3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func record(sender: AnyObject) {
        println("button pressed!")
        recordingInProgress.hidden = false
        stopButton.hidden = false
        
    }

    @IBOutlet weak var recordingInProgress: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    
    @IBAction func stopRecording(sender: AnyObject) {
        println("stopping")
    }
}

