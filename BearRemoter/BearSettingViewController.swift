//
//  BearSettingViewController.swift
//  BearRemoter
//
//  Created by Mac on 8/16/15.
//  Copyright (c) 2015 vifix.cn. All rights reserved.
//

import UIKit

class BearSettingViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {

    let tableData: [String] = ["手机号", "昵称", "对方手机号"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BearCache.sharedInstance.loadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count as Int
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cellSettings", forIndexPath: indexPath) as? UITableViewCell
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "cellSettings")
        }
        var row = indexPath.row as Int
        let labelText = tableData[row] as String
        cell!.textLabel?.text = labelText
        let userInfo = BearCache.sharedInstance.userInfo
        
        switch (labelText) {
            case "手机号":
                cell!.detailTextLabel?.text = userInfo?.cellPhone
                break;
            case "昵称":
                cell!.detailTextLabel?.text = userInfo?.nickname!
                break;
            case "对方手机号":
                cell!.detailTextLabel?.text = userInfo?.targetCellPhone!
                break;
            default:
                break;
        }
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var row = indexPath.row as Int
        let labelText = tableData[row] as String
        var result:String?
        let target:String?
        let userInfo = BearCache.sharedInstance.userInfo
        
        switch (labelText) {
            case "手机号":
                result = userInfo?.cellPhone
                target = "cellPhone"
                break;
            case "昵称":
                result = userInfo?.nickname
                target = "nickname"
                break;
            case "对方手机号":
                result = userInfo?.targetCellPhone
                target = "targetCellPhone"
                break;
            default:
                target = ""
                break;
        }
        
        var inputTextField: UITextField?
        var alert = UIAlertController(title: "请输入", message: "修改" + labelText, preferredStyle: UIAlertControllerStyle.Alert)

        alert.addTextFieldWithConfigurationHandler({(textField: UITextField!) in
            textField.text = result
            inputTextField = textField
        })
        alert.addAction(UIAlertAction(title: "确认并保存", style: UIAlertActionStyle.Default, handler: {(alert: UIAlertAction!) in
            let x:String = (inputTextField?.text)!
            userInfo?.setValue(x, forKey: target!)
            BearCache.sharedInstance.saveData()
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.detailTextLabel?.text = x
            
            if (target == "cellPhone") {
                APService.setAlias("dev_" + x, callbackSelector: nil, object: nil)
            }
        }))
        alert.addAction(UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        

    }
    
    
}
