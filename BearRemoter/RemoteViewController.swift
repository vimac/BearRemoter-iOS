//
//  FirstViewController.swift
//  BearRemoter
//
//  Created by Mac on 8/15/15.
//  Copyright (c) 2015 vifix.cn. All rights reserved.
//

import UIKit

class RemoteViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource  {

    let tableData: [String] = ["我饿了", "我渴了", "我要睡觉了", "我要看电视", "我要穿衣服", "我要起床", "我热了", "我冷了", "召唤神龙"]

    
    //获取沙盒文件夹路径
    func documentsDirectory()->String {
        var paths = NSSearchPathForDirectoriesInDomains(
            NSSearchPathDirectory.DocumentationDirectory,NSSearchPathDomainMask.UserDomainMask,true)
        var documentsDirectory:String = paths.first as! String
        return documentsDirectory
    }
    
    //获取数据文件地址
    func dataFilePath ()->String{
        return self.documentsDirectory().stringByAppendingString("storeCache.plist")
    }
    
    func saveData() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        let path = self.dataFilePath()
        let defaultManager = NSFileManager()
        if (defaultManager.fileExistsAtPath(path)) {
            let data = NSData(contentsOfFile: path)
        }
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
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        var row = indexPath.row as Int
        cell.textLabel?.text = tableData[row]
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.selectionStyle = UITableViewCellSelectionStyle.Blue
        return cell;
        
    }

}

