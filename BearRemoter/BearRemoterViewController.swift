//
//  FirstViewController.swift
//  BearRemoter
//
//  Created by Mac on 8/15/15.
//  Copyright (c) 2015 vifix.cn. All rights reserved.
//

import UIKit

class BearRemoterViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource  {

    let tableData: [String] = ["我饿了😂", "我渴了😂", "我要睡觉了😂", "我要看电视了😂", "我要穿衣服了😂", "我要起床了😂", "我热了😂", "我冷了😂", "我要召唤神龙😂！"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cellRemoter")
//        userInfo = BearUserInfo(cellPhone: "123456789")
        let data = BearCache.sharedInstance.loadData()
        NSLog(data.cellPhone!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var row = indexPath.row as Int
        var content = tableData[row] as String
        NSLog("pressed %@", content)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellRemoter", forIndexPath: indexPath) as! UITableViewCell
        var row = indexPath.row as Int
        cell.textLabel?.text = tableData[row]
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell;
        
    }

}

