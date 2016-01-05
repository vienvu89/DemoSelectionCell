//
//  ViewController.swift
//  TestCodeSwift
//
//  Created by Vien Vu  on 12/21/15.
//  Copyright © 2015 VienVu. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
  
    var indexSelected = SharedAppSettingManager.indexSelected
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    //For solotion 1
    
//
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        
//        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
//        cell?.textLabel?.text = "abc \(indexPath.row)"
//        
//        cell?.textLabel?.highlightedTextColor = UIColor.redColor()
//        if indexSelected == indexPath.row {
//            tableView.selectRowAtIndexPath(indexPath, animated: false, scrollPosition: .None)
//        }
//        
//        
//        return cell!
//    }
//    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        print("\(indexPath.row)")
//    }
    
    //For solution 2
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")//init cell it depend on your way create cell
        cell?.textLabel?.text = "Your text"
        
        if indexSelected == indexPath.row {
            cell?.textLabel?.textColor = UIColor.redColor()
        } else {
            cell?.textLabel?.textColor = UIColor.lightGrayColor()
        }



        return cell!
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(NSIndexPath.init(forRow: indexSelected, inSection: 0))
        cell?.textLabel?.textColor = UIColor.lightGrayColor()
        let cell2 = tableView.cellForRowAtIndexPath(indexPath)
        cell2?.textLabel?.textColor = UIColor.redColor()
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        indexSelected = indexPath.row //update selected row
        
        SharedAppSettingManager.indexSelected = indexPath.row
    }
    
   
    
    
}

