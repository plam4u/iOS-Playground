//
//  Experiment2ViewController.swift
//  PrototypingNewMessage
//
//  Created by Plamen Andreev on 30/4/15.
//  Copyright (c) 2015 Plamen Andreev. All rights reserved.
//

import UIKit

class Experiment2ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        heightConstraint.constant = view.bounds.size.height / 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func refreshTapped(sender: AnyObject)
    {
        let randomHeight = CGFloat(arc4random() % 500 + 200)
//        imageView.frame = CGRectMake(0, 0, 200, 300)
        let half = view.bounds.height / 2
        let double = view.bounds.height * 2
        heightConstraint.constant = heightConstraint.constant == half ? double : half
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
