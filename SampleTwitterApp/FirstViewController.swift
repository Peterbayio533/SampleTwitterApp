//
//  FirstViewController.swift
//  SampleTwitterApp
//
//  Created by Peter Bayiokos on 3/21/16.
//  Copyright © 2016 Pace University. All rights reserved.
//


import UIKit
import TwitterKit

class FirstViewController:TWTRTimelineViewController {
   
    
    @IBAction func compose(sender: AnyObject) {
        
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let client = TWTRAPIClient()
        self.dataSource = TWTRUserTimelineDataSource(screenName: "ibm", APIClient: client)
        
        //The code below can change the appearance of the twitter feed. I'll comment it out for now so it looks normal.
        //TWTRTweetView.appearance().theme = .Dark
        //TWTRTweetView.appearance().primaryTextColor = UIColor.redColor()
        //TWTRTweetView.appearance().backgroundColor  = UIColor.whiteColor()
        
        self.showTweetActions = true
        
        let compose = UIBarButtonItem(barButtonSystemItem: .Compose, target: self, action: Selector("compose"))
        self.navigationItem.rightBarButtonItem = compose
        
        
           }
    
    
    func compose() {
        let composer = TWTRComposer()
        
        composer.setText("")
        composer.setImage(UIImage(named: "fabric"))
        
        // Called from a UIViewController
        composer.showFromViewController(self) { result in
            if (result == TWTRComposerResult.Cancelled) {
                print("Tweet composition cancelled")
            }
            else {
                print("Sending tweet!")
            }
        }

        
        navigationItem.rightBarButtonItem?.action = "compose"
    }
}
