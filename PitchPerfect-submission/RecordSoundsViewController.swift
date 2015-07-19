//
//  ViewController.swift
//  PitchPerfect-submission
//
//  Created by Rohan Sarith Pethiyagoda on 19/07/2015.
//  Copyright (c) 2015 RP3. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    
    var audioRecorder:AVAudioRecorder!
    var recordedAudio:RecordedAudio!
    @IBOutlet weak var recordingInProgress: UILabel!
    @IBOutlet weak var stopButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        recordingInProgress.text = "Tap to Record"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func record(sender: AnyObject) {

        //reflect state in UI
        stopButton.hidden = false
        recordingInProgress.text = "Recording..."
        
        //create a unique filename using a dateString
        let recordingName = "current_recording.wav"
        
        //make a filepath URL out of the uniqie name
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,  .UserDomainMask, true)[0] as! String
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        
        //instantiate a recording session: some communication with the IOS Audio daemon
        var session = AVAudioSession.sharedInstance()
        session.setCategory(AVAudioSessionCategoryRecord, error: nil)
        audioRecorder = AVAudioRecorder(URL: filePath, settings: nil, error: nil)
        audioRecorder.delegate = self
        audioRecorder.record()
    }


    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder!, successfully flag: Bool) {
        //save the audio by initializing the instance of the recordedAudio class
        recordedAudio = RecordedAudio(fromRecording: recorder.url, fileTitle:recorder.url.lastPathComponent!)
        performSegueWithIdentifier("stopRecordingSegue", sender: recordedAudio)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "stopRecordingSegue"){
            let playSoundsVC:PlaySoundsViewController = segue.destinationViewController as! PlaySoundsViewController
            let data = sender as! RecordedAudio
            playSoundsVC.recievedAudio = data
        }
    }
    
    @IBAction func stopRecording(sender: AnyObject) {
        
        //reflect state in UI
        stopButton.hidden = true
        
        //stop recording
        audioRecorder.stop()
        
        //tell daemon we're deactivating recording session
        var session = AVAudioSession.sharedInstance()
        session.setActive(false, error: nil)
        
    }
}

