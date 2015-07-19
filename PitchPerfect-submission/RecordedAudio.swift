//
//  RecordedAudio.swift
//  PitchPerfect-submission
//
//  Created by Rohan Sarith Pethiyagoda on 19/07/2015.
//  Copyright (c) 2015 RP3. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject{
    var filePathUrl: NSURL!
    var title: String!
    
    init(fromRecording url:NSURL, fileTitle:String){
        filePathUrl = url
        title = fileTitle
    }
}