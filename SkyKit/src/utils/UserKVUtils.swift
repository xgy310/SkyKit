//
//  NSUserDefaultsUtils.swift
//  RJSmartDoor
//
//  Created by Ruijia on 16/6/29.
//  Copyright © 2016年 Ruijia. All rights reserved.
//

import Foundation
open class UserKVUtils{
    
    
    public static func setValue(_ key:String,value:String){
        UserDefaults.standard.setValue(value, forKey: key)
    }
    public static func getString(_ key:String)-> String{
        let value = UserDefaults.standard.string(forKey: key)
        return (value != nil) ? value! : ""
    }
    
    
    public static func setInt(_ key:String,value:Int){
        UserDefaults.standard.set(value, forKey: key)
    }
    public static func getInt(_ key:String)-> Int{
        return UserDefaults.standard.integer(forKey: key)
    }
    
    
    public static func getObj(_ key:String)->AnyObject?{
        return UserDefaults.standard.object(forKey: key) as AnyObject?
    }
    public static func setObj(_ key:String,value:AnyObject){
        UserDefaults.standard.set(value, forKey: key)
    }
    
    
    public static func setBool(_ key:String,value:Bool){
        UserDefaults.standard.set(value, forKey: key)
    }
    public static func getBool(_ key:String)->Bool{
        return UserDefaults.standard.bool(forKey: key)
    }
    
    public static func remove(_ key:String){
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    public static func  saveCusObj(_ obj:AnyObject) {
        let docPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] as NSString
        let filePath = docPath.appendingPathComponent("cusobj.data");
        
        /**
         *  数据归档处理
         */
        NSKeyedArchiver.archiveRootObject(obj, toFile: filePath);
    }
    
    /**
     反归档数据
     */
    public static func readCusObj()->AnyObject? {
        let docPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] as NSString
        let filePath = docPath.appendingPathComponent("cusobj.data");
        let obj = NSKeyedUnarchiver.unarchiveObject(withFile: filePath)
        return obj as AnyObject?
    }
}
