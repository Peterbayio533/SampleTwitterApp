//
//  ViewController.swift
//  SampleTwitterApp
//
//  Created by Peter Bayiokos on 3/21/16.
//  Copyright © 2016 Pace University. All rights reserved.
//

import UIKit
import TwitterKit

class ViewController: UIViewController {
    
    @IBOutlet weak var login: UIButton!
    @IBAction func login(sender: AnyObject) {
        Twitter.sharedInstance().logInWithCompletion { session, error in
            if (session != nil) {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let firstViewController = storyboard.instantiateViewControllerWithIdentifier("TabBarController") as UIViewController
                self.presentViewController(firstViewController, animated: true, completion: nil);
                print("signed in as \(session!.userName)");
            } else {
                print("error: \(error!.localizedDescription)");
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        /*let logInButton = TWTRLogInButton(logInCompletion: { session, error in
            if (session != nil) {
                
                print("signed in as \(session!.userName)");
                let viewControllerObj = self.storyboard?.instantiateViewControllerWithIdentifier("FirstViewController") as? ViewController
                
                self.navigationController?.pushViewController(viewControllerObj!, animated: true)
            }
            else
            {
                print("error: \(error!.localizedDescription)");
            }
        })
        logInButton.center = self.view.center
        self.view.addSubview(logInButton)*/
    }
}