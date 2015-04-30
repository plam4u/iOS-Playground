//
//  Experiment6ViewController.swift
//  PrototypingNewMessage
//
//  Created by Plamen Andreev on 30/4/15.
//  Copyright (c) 2015 Plamen Andreev. All rights reserved.
//

import UIKit

class Experiment6ViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var textView: UITextView!
    
    var originalConstant:CGFloat = 0
    var imageHeight:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide", name: UIKeyboardWillHideNotification, object: nil)
        
        originalConstant = topConstraint.constant
        imageHeight = topView.bounds.height
        
        let nib = UINib(nibName: "KeyboardToolbar", bundle: NSBundle(forClass: self.dynamicType))
        let view = nib.instantiateWithOwner(self, options: nil).last as! UIView

        textView.inputAccessoryView = KeyboardToolbar()
    }
    
    func keyboardWillShow(n:NSNotification)
    {
        view.layoutIfNeeded()
        
        var additionalHeight:CGFloat = 0
        if let navController = navigationController
        {
            additionalHeight = navController.navigationBar.frame.size.height
        }
        
        self.topConstraint.constant = -(self.imageHeight)
        UIView.animateWithDuration(1, animations: {
            self.view.layoutIfNeeded()
        })
        
        if let userInfo = n.userInfo
        {
            if let keyboardHeight = userInfo[UIKeyboardFrameEndUserInfoKey]?.CGRectValue().size.height
            {
                scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
            }
        }
    }
    
    func keyboardWillHide()
    {
        view.layoutIfNeeded()
        
        self.topConstraint.constant = self.originalConstant
        UIView.animateWithDuration(1, animations: {
            self.view.layoutIfNeeded()
        })
        
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
