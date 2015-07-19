//
//  playSoundsViewController.swift
//  PitchPerfect-submission
//
//  Created by Rohan Sarith Pethiyagoda on 19/07/2015.
//  Copyright (c) 2015 RP3. All rights reserved.
//

import UIKit
import AVFoundation


class PlaySoundsViewController: UIViewController {
    
    //used when not playing with pitch effects
    var audioPlayer:AVAudioPlayer!
    var recievedAudio:RecordedAudio!
    
    //used only when playing with pitch effects
    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: recievedAudio.filePathUrl, error: nil)

        //reference the globally-available recievedAudio, passed in the segue to this view
        audioPlayer = AVAudioPlayer(contentsOfURL: recievedAudio.filePathUrl, error: nil)
        audioPlayer.prepareToPlay()
        audioPlayer.enableRate = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //refered to the following link for general structure of this method
    //http://stackoverflow.com/questions/25333140/swift-using-sound-effects-with-audioengine
    func playWithPitch(speed:Float) {
        
        resetAudio()
        
        var audioPlayerNode = AVAudioPlayerNode()
        var pitchEffect = AVAudioUnitTimePitch()
        pitchEffect.pitch = speed
        
        audioEngine.attachNode(audioPlayerNode)
        audioEngine.attachNode(pitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: pitchEffect, format: nil)
        audioEngine.connect(pitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        audioPlayerNode.play()
    }
    
    func playAtSpeed(speed:Float){
        resetAudio()
        audioPlayer.rate = speed
        audioPlayer.play()
    }
    
    //reset both audioEngine and audioPlayer
    func resetAudio(){
        audioEngine.stop()
        audioEngine.reset()
        audioPlayer.stop()
        audioPlayer.currentTime = 0
    }
    

    @IBAction func playVader(sender: AnyObject) {
        playWithPitch(-500)
    }
    
    @IBAction func playChipmunk(sender: AnyObject) {
        playWithPitch(1000)
    }
    
    @IBAction func playFast(sender: AnyObject) {
        playAtSpeed(2.0)
    }
    
    @IBAction func playSlow(sender: AnyObject) {
        playAtSpeed(0.5)
    }

}
