//
//  YGJokeInfo.swift
//  Joke
//
//  Created by 杨业高(外包) on 2018/5/30.
//  Copyright © 2018年 杨业高(外包). All rights reserved.
//

import UIKit
import HandyJSON

class YGJokeInfo: HandyJSON {
    var format : String!
    var low_url: String?
    var content: String?
    var user : YGUserInfo?
    
    required init() {}
    
}

class YGUserInfo: HandyJSON {
    var login : String!
    var thumb : String!
    
    required init() {}
}

class YGResponse: HandyJSON {
    var count : Int = 0
    var err   : Int = 0
    var items : [YGJokeInfo]?
    
    required init() {}
}
