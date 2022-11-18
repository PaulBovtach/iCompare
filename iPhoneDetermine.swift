//
//  iPhoneDetermine.swift
//  iCompare
//
//  Created by Павло on 19.11.2022.
//

import Foundation
import SwiftUI

public enum Model : String {

//Simulator
case simulator     = "simulator/sandbox",

//iPhone
iPhone4            = "iPhone 4",
iPhone4S           = "iPhone 4S",
iPhone5            = "iPhone 5",
iPhone5S           = "iPhone 5S",
iPhone5C           = "iPhone 5C",
iPhone6            = "iPhone 6",
iPhone6Plus        = "iPhone 6 Plus",
iPhone6S           = "iPhone 6S",
iPhone6SPlus       = "iPhone 6S Plus",
iPhoneSE           = "iPhone SE",
iPhone7            = "iPhone 7",
iPhone7Plus        = "iPhone 7 Plus",
iPhone8            = "iPhone 8",
iPhone8Plus        = "iPhone 8 Plus",
iPhoneX            = "iPhone X",
iPhoneXS           = "iPhone XS",
iPhoneXSMax        = "iPhone XS Max",
iPhoneXR           = "iPhone XR",
iPhone11           = "iPhone 11",
iPhone11Pro        = "iPhone 11 Pro",
iPhone11ProMax     = "iPhone 11 Pro Max",
iPhoneSE2          = "iPhone SE 2nd gen",
iPhone12Mini       = "iPhone 12 Mini",
iPhone12           = "iPhone 12",
iPhone12Pro        = "iPhone 12 Pro",
iPhone12ProMax     = "iPhone 12 Pro Max",
iPhone13Mini       = "iPhone 13 Mini",
iPhone13           = "iPhone 13",
iPhone13Pro        = "iPhone 13 Pro",
iPhone13ProMax     = "iPhone 13 Pro Max",
iPhoneSE3          = "iPhone SE 3nd gen",
iPhone14           = "iPhone 14",
iPhone14Plus       = "iPhone 14 Plus",
iPhone14Pro        = "iPhone 14 Pro",
iPhone14ProMax     = "iPhone 14 Pro Max",

unrecognized       = "?unrecognized?"
}

// #-#-#-#-#-#-#-#-#-#-#-#-#
// MARK: UIDevice extensions
// #-#-#-#-#-#-#-#-#-#-#-#-#

    public extension UIDevice {
    
    var type: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let modelCode = withUnsafePointer(to: &systemInfo.machine) {
            $0.withMemoryRebound(to: CChar.self, capacity: 1) {
                ptr in String.init(validatingUTF8: ptr)
            }
        }
    
        let modelMap : [String: String] = [
    
            //Simulator
            "i386"      : "simulator",
            "x86_64"    : "simulator",
    
    
            //iPhone
            "iPhone3,1" : "iPhone 4",
            "iPhone3,2" : "iPhone 4",
            "iPhone3,3" : "iPhone 4",
            "iPhone4,1" : "iPhone 4s",
            "iPhone5,1" : "iPhone 5",
            "iPhone5,2" : "iPhone 5",
            "iPhone5,3" : "iPhone 5c",
            "iPhone5,4" : "iPhone 5c",
            "iPhone6,1" : "iPhone 5s",
            "iPhone6,2" : "iPhone 5s",
            "iPhone7,1" : "iPhone 6 Plus",
            "iPhone7,2" : "iPhone 6",
            "iPhone8,1" : "iPhone 6s",
            "iPhone8,2" : "iPhone 6s Plus",
            "iPhone8,4" : "iPhone SE (1st generation)",
            "iPhone9,1" : "iPhone 7",
            "iPhone9,3" : "iPhone 7",
            "iPhone9,2" : "iPhone 7 Plus",
            "iPhone9,4" : "iPhone 7 Plus",
            "iPhone10,1" : "iPhone 8",
            "iPhone10,4" : "iPhone 8",
            "iPhone10,2" : "iPhone 8 Plus",
            "iPhone10,5" : "iPhone 8 Plus",
            "iPhone10,3" : "iPhone X",
            "iPhone10,6" : "iPhone X",
            "iPhone11,2" : "iPhone XS",
            "iPhone11,4" : "iPhone XS Max",
            "iPhone11,6" : "iPhone XS Max",
            "iPhone11,8" : "iPhone XR",
            "iPhone12,1" : "iPhone 11",
            "iPhone12,3" : "iPhone 11 Pro",
            "iPhone12,5" : "iPhone 11 Pro Max",
            "iPhone12,8" : "iPhone SE (2nd generation)",
            "iPhone13,1" : "iPhone 12 mini",
            "iPhone13,2" : "iPhone 12",
            "iPhone13,3" : "iPhone 12 Pro",
            "iPhone13,4" : "iPhone 12 Pro Max",
            "iPhone14,4" : "iPhone 12 mini",
            "iPhone14,5" : "iPhone 13",
            "iPhone14,2" : "iPhone 13 Pro",
            "iPhone14,3" : "iPhone 13 Pro Max",
            "iPhone14,6" : "iPhone SE (3rd generation)",
            "iPhone14,7" : "iPhone 14",
            "iPhone14,8" : "iPhone 14 Plus",
            "iPhone15,2" : "iPhone 14 Pro",
            "iPhone15,3" : "iPhone 14 Pro Max",
            
        ]
    
        guard let mcode = modelCode, let map = String(validatingUTF8: mcode), let model = modelMap[map] else { return String("unrecognized") }
        if model == "simulator" {
            if let simModelCode = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] {
                if let simMap = String(validatingUTF8: simModelCode), let simModel = modelMap[simMap] {
                    return simModel
                }
            }
        }
        return model
    }
}
