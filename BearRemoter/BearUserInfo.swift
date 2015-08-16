//
//  BearUserInfo.swift
//  BearRemoter
//
//  Created by Mac on 8/16/15.
//  Copyright (c) 2015 vifix.cn. All rights reserved.
//

class BearUserInfo: NSObject {
    var cellPhone:String?
    var nickname:String?
    var targetCellPhone:String?
    
    init (cellPhone:String?, nickname:String?, targetCellPhone:String?) {
        self.cellPhone = cellPhone!
        self.nickname = nickname!
        self.targetCellPhone = targetCellPhone!
    }
    
    init (coder aDecoder:NSCoder) {
        self.cellPhone = aDecoder.decodeObjectForKey("cellPhone") as? String
        self.nickname = aDecoder.decodeObjectForKey("nickname") as? String
        self.targetCellPhone = aDecoder.decodeObjectForKey("targetCellPhone") as? String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.cellPhone, forKey: "cellPhone")
        aCoder.encodeObject(self.nickname, forKey: "nickname")
        aCoder.encodeObject(self.targetCellPhone, forKey: "targetCellPhone")
    }
}
