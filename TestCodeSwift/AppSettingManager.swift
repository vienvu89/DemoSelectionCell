//
//  AppSettingManager.swift
//  TestCodeSwift
//
//  Created by Vien Vu  on 1/5/16.
//  Copyright © 2016 VienVu. All rights reserved.
//

import UIKit

let  SharedAppSettingManager = AppSettingManager.sharedSettingManager()

class AppSettingManager: NSObject {
    
    var indexSelected: Int!
    
    private class func sharedSettingManager() -> AppSettingManager {
        struct Static { static let _sharedAppSettingManger = AppSettingManager() }
        Static._sharedAppSettingManger.indexSelected = 0
        
        return Static._sharedAppSettingManger
    }
}
