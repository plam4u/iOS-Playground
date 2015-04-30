//
//  KeyboardToolbar.swift
//  PrototypingNewMessage
//
//  Created by Plamen Andreev on 30/4/15.
//  Copyright (c) 2015 Plamen Andreev. All rights reserved.
//

import UIKit

class KeyboardToolbar: UIView
{

    var loadedView:UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    func commonInit()
    {
        loadedView = loadViewFromNib();
        bounds = loadedView.bounds
        addSubview(loadedView)
    }
    
    func loadViewFromNib() -> UIView {
        let nib = UINib(nibName: "KeyboardToolbar", bundle: NSBundle(forClass: self.dynamicType))
        let view = nib.instantiateWithOwner(self, options: nil).last as! UIView
        return view
    }
}
