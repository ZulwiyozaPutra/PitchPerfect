//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Zulwiyoza Putra on 11/10/16.
//  Copyright © 2016 Zulwiyoza Putra. All rights reserved.
//

import UIKit
import AVFoundation

class RecordAudioViewController: UIViewController, AVAudioRecorderDelegate, UIAlertViewDelegate {

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
        setUIState(isRecording: true, recordingStatus: "Recording", recordingStatusColor: UIColor.red)
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURL(withPathComponents: pathArray)
        print(filePath!)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    @IBAction func stopRecordingButton(_ sender: Any) {
        print("stopRecordingButton is tapped")
        setUIState(isRecording: false, recordingStatus: "Tap to Record", recordingStatusColor: UIColor.black)
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    
    func setUIState(isRecording: Bool, recordingStatus: String, recordingStatusColor: UIColor) -> Void {
            recordingLabel.text = recordingStatus
            recordingLabel.textColor = recordingStatusColor
            recordButtonOutlet.isEnabled = !isRecording
            stopRecordingButtonOutlet.isEnabled = isRecording
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        print("AVAudioRecorder finished saving recording")
        if (flag) {
            self.performSegue(withIdentifier: "stopRecordingSegue", sender: audioRecorder.url)
        } else {
            let alertController = UIAlertController(title: "Recording Failed", message: "You have not recoreded anything, try again", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.destructive, handler: { action in
                print("Ok button tapped")
            } )
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecordingSegue" {
            let playAudioViewController = segue.destination as! PlayAudioViewController
            let recordedAudioURL = sender as! NSURL
            playAudioViewController.recordedAudioURL = recordedAudioURL as URL!
        }
    }
    
}

