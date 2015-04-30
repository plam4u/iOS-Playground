//
//  ViewController.swift
//  TableViewDynamicHeight
//
//  Created by Plamen Andreev on 3/27/15.
//  Copyright (c) 2015 Plamen Andreev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	@IBOutlet weak var tableView: UITableView!

	override func viewDidLoad()
	{
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		tableView.delegate = self
		tableView.dataSource = self
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	// MARK: - TableView
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
	{
		return 24
	}
	
	// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
	// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
	{
		let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier") as UITableViewCell
		
//		let label = cell.viewWithTag(123) as UILabel
//		label.numberOfLines = 0
//		var text:String
//		let random = arc4random() % 3
//		switch random {
//		case 0:
//			text = "this is one line text"
//		case 1:
//			text = "this is 2 lines of text\nsecond line is here"
//		case 2:
//			text = "this is 3 lines of text\nthis is second line\nand this is third one"
//		default:
//			text = "this is default text which is one line"
//		}
//		label.text = text
		
		let textView = cell.viewWithTag(1234) as UITextView
//		textView.sizeToFit()
//		textView.scrollEnabled = false
//		println(textView.sizeThatFits(CGSize(width: cell.bounds.width, height: 200)))
//		textView.sizeThatFits(CGSize(width: cell.bounds.width, height: 12345))
//		textView.sizeThatFits(CGSize(width: 100, height: 200))
		
		return cell
	}
	
//	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//		let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier") as UITableViewCell
//		let textView = cell.viewWithTag(1234) as UITextView
//		return textView.sizeThatFits(CGSize(width: cell.bounds.width, height: 10)).height
//	}
}

