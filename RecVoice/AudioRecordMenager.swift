//
//  AudioRecordMenager.swift
//  RecVoice
//
//  Created by Andrea Di Francia on 24/01/18.
//  Copyright © 2018 Andrea Di Francia. All rights reserved.
//

import Foundation
import AVFoundation

class AudioRecordMenager: NSObject, AVAudioRecorderDelegate {
    
    static let share = AudioRecordMenager()
    
    var recordingSession: AVAudioSession!
    var recorder: AVAudioRecorder!
    
    func setup(){
        recordingSession = AVAudioSession.sharedInstance()
        do{
            try recordingSession.setCategory(AVAudioSessionCategoryPlayAndRecord, with: .defaultToSpeaker)
            try recordingSession.setActive(true)
            
            
            recordingSession.requestRecordPermission({ (allowed:Bool) in
                if allowed {
                    print("authorized")
                }
                else{
                    print("Not authorized")
                }
            })
            
        }
        catch{
            print("failure to set category")
        }
    }
    
    func recored(fileName: String) -> Bool {
        let url = getUserPath().appendingPathComponent(fileName+"m4a")
        let audioURL = URL.init(fileURLWithPath: url.path)
        
        let recoredSettings: [String:Any] = [AVFormatIDKey:NSNumber(value: kAudioFormatAppleLossless), AVEncoderAudioQualityKey:AVAudioQuality.high.rawValue,
            AVEncoderBitRateKey:12000.0,
            AVNumberOfChannelsKey:1,
            AVSampleRateKey:44100.0
        ]
        
        do{
            recorder = try AVAudioRecorder(url: audioURL, settings: recoredSettings)
            recorder?.delegate = self
            recorder?.isMeteringEnabled = true
            recorder?.prepareToRecord()
            
            recorder.record()
            print("Recording")
            return true
        }
        catch{
            print("Not Recording")
            return false
        }
    }
    
    func getUserPath()->URL{
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    

    
}
