//
//  Experiment5ViewController.swift
//  PrototypingNewMessage
//
//  Created by Plamen Andreev on 30/4/15.
//  Copyright (c) 2015 Plamen Andreev. All rights reserved.
//

import UIKit

class Experiment5ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var floatingImageView: UIView!
    @IBOutlet weak var imageTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var textView: UITextView!
    
    var originalConstant:CGFloat = 0
    var imageHeight:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide", name: UIKeyboardWillHideNotification, object: nil)
        
        originalConstant = imageTopConstraint.constant
        imageHeight = floatingImageView.bounds.height
    }
    
    func keyboardWillShow(n:NSNotification)
    {
        view.layoutIfNeeded()
        
        var additionalHeight:CGFloat = 0
        if let navbar = navigationController
        {
            additionalHeight = navbar.navigationBar.frame.size.height
        }
        
        self.imageTopConstraint.constant = -(self.imageHeight + additionalHeight + originalConstant)
        UIView.animateWithDuration(1, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    func keyboardWillHide()
    {
        view.layoutIfNeeded()
        
        self.imageTopConstraint.constant = self.originalConstant
        UIView.animateWithDuration(1, animations: {
            self.view.layoutIfNeeded()
        })
    }

}
