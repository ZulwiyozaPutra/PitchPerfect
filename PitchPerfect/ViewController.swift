//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Zulwiyoza Putra on 11/10/16.
//  Copyright © 2016 Zulwiyoza Putra. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var recordButtonOutlet: UIButton!
    
    @IBOutlet weak var recordingLabel: UILabel!
    
    @IBOutlet weak var stopRecordingButtonOutlet: UIButton!
    
    var audioRecorder: AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecordingButtonOutlet.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func recordButton(_ sender: Any) {
        print("recordButton is tapped")
        recordingLabel.text = "Recording"
        stopRecordingButtonOutlet.isEnabled = true
        recordButtonOutlet.isEnabled = false
    }
    
    @IBAction func stopRecordingButton(_ sender: Any) {
        print("stopRecordingButton is tapped")
        recordingLabel.text = "Tap to Record"
        recordButtonOutlet.isEnabled = true
        stopRecordingButtonOutlet.isEnabled = false
    }
    
}

