//
//  playSoundsViewController.swift
//  PitchPerfect-submission
//
//  Created by Rohan Sarith Pethiyagoda on 19/07/2015.
//  Copyright (c) 2015 RP3. All rights reserved.
//

import UIKit
import AVFoundation


class playSoundsViewController: UIViewController {
    
    var audioPlayer:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let path = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3") {
            let url = NSURL.fileURLWithPath(path)
            audioPlayer = AVAudioPlayer(contentsOfURL: url, error: nil)
        }else{
            println("Broken file path.")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func playSlow(sender: AnyObject) {
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
