//
//  BearCache.swift
//  BearRemoter
//
//  Created by Mac on 8/16/15.
//  Copyright (c) 2015 vifix.cn. All rights reserved.
//


class BearCache: NSObject {

    static let sharedInstance = BearCache()
    
    var userInfo: BearUserInfo?
    
    //获取沙盒文件夹路径
    func documentsDirectory()->String {
        let paths = NSSearchPathForDirectoriesInDomains(
            NSSearchPathDirectory.DocumentationDirectory,NSSearchPathDomainMask.UserDomainMask,true)
        let documentsDirectory:String = paths.first as! String!
        return documentsDirectory
    }
    
    //获取数据文件地址
    func dataFilePath ()->String{
        return self.documentsDirectory().stringByAppendingString("storeCache.plist")
    }
    
    func saveData() {
        let data = NSMutableData()
        let archive = NSKeyedArchiver(forWritingWithMutableData: data)
        archive.encodeObject(userInfo, forKey: "userInfo")
        archive.finishEncoding()
        data.writeToFile(dataFilePath(), atomically: true)
    }
    
    func loadData() -> BearUserInfo {
        let path = self.dataFilePath()
        let defaultManager = NSFileManager()
        if (defaultManager.fileExistsAtPath(path)) {
            let data = NSData(contentsOfFile: path)
            let archive = NSKeyedUnarchiver(forReadingWithData: data!)
            userInfo = archive.decodeObjectForKey("userInfo") as? BearUserInfo
            archive.finishDecoding()
        } else {
            userInfo = BearUserInfo(cellPhone: "", nickname: "", targetCellPhone: "")
        }
        return userInfo!
    }

    
}
