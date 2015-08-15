//
//  BearRemoterUserInfo.swift
//  BearRemoter
//
//  Created by Mac on 8/16/15.
//  Copyright (c) 2015 vifix.cn. All rights reserved.
//

class BearRemoterUserInfo: NSObject {
    var cellPhone:String
    
    init (cellPhone:String) {
        self.cellPhone = cellPhone
    }
    
    init (coder aDecoder:NSCoder) {
        self.cellPhone = aDecoder.decodeObjectForKey("cellPhone") as! String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.cellPhone, forKey: "cellPhone")
    }
}
