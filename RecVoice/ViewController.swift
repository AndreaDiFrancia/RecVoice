//
//  ViewController.swift
//  RecVoice
//
//  Created by Andrea Di Francia on 23/01/18.
//  Copyright © 2018 Andrea Di Francia. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioRecorderDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
     
      
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ShareBtn(_ sender: Any) {
        
        // metti qui l audio al posto della string CarloGAY
        let activityVC = UIActivityViewController(activityItems: ["www.google.com"], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
    
    
    
}

