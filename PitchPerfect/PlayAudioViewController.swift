//
//  PlayAudioViewController.swift
//  PitchPerfect
//
//  Created by Zulwiyoza Putra on 11/10/16.
//  Copyright © 2016 Zulwiyoza Putra. All rights reserved.
//

import UIKit

class PlayAudioViewController: UIViewController {
    
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL: NSURL!
    
    @IBAction func playAudioForButton(_ sender: UIButton) {
        print("Play Sound Button Tapped")
    }
    
    @IBAction func stopButton(_ sender: AnyObject) {
        print("Stop Audio Button Tapped")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
