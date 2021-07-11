//
//  Device.swift
//  AdaptiveLayoutUIKit
//
//  Created by Родион on 11.07.2020.
//  Copyright © 2020 Rodion Artyukhin. All rights reserved.
//

import UIKit

enum Device {
    case iPhone12
    case iPhone12mini
    case iPhone12ProMax
    case iPhone12Pro
    case iPhoneSE2ndGen
    case iPhone11ProMax
    case iPhone11Pro
    case iPhone11
    case iPhoneXR
    case iPhoneXSMax
    case iPhoneXS
    case iPhoneX
    case iPhone8Plus
    case iPhone8
    case iPhone7
    case iPhone7Plus
    case iPhoneSE1stGen
    case iPhone6sPlus
    case iPhone6s
    case iPhone6
    case iPhone5c
    case iPhone5s
    case iPhone5
    
    case iPadAir4
    static let baseScreenSize: Device = .iPhone12mini
}

extension Device: RawRepresentable {
    typealias RawValue = CGSize
    
    init?(rawValue: CGSize) {
        switch rawValue {
        case CGSize(width: 390, height: 844):
            self = .iPhone12
        case CGSize(width: 375, height: 812):
            self = .iPhone12mini
        case CGSize(width: 428, height: 926):
            self = .iPhone12ProMax
        case CGSize(width: 390, height: 844):
            self = .iPhone12Pro
        case CGSize(width: 375, height: 667):
            self = .iPhoneSE2ndGen
        case CGSize(width: 414, height: 896):
            self = .iPhone11ProMax
        case CGSize(width: 375, height: 812):
            self = .iPhone11Pro
        case CGSize(width: 414, height: 896):
            self = .iPhone11
        case CGSize(width: 414, height: 896):
            self = .iPhoneXR
        case CGSize(width: 414, height: 896):
            self = .iPhoneXSMax
        case CGSize(width: 375, height: 812):
            self = .iPhoneXS
        case CGSize(width: 375, height: 812):
            self = .iPhoneX
        case CGSize(width: 414, height: 736):
            self = .iPhone8Plus
        case CGSize(width: 375, height: 667):
            self = .iPhone8
        case CGSize(width: 414, height: 736):
            self = .iPhone7Plus
        case CGSize(width: 375, height: 667):
            self = .iPhone7
        case CGSize(width: 320, height: 568):
            self = .iPhoneSE1stGen
        case CGSize(width: 414, height: 736):
            self = .iPhone6sPlus
        case CGSize(width: 375, height: 667):
            self = .iPhone6s
        case CGSize(width: 375, height: 667):
            self = .iPhone6
        case CGSize(width: 320, height: 568):
            self = .iPhone5s
        case CGSize(width: 320, height: 568):
            self = .iPhone5c
        case CGSize(width: 320, height: 568):
            self = .iPhone5
        case CGSize(width: 820, height: 1180):
            self = .iPadAir4
        default:
            return nil
        }
    }

    var rawValue: CGSize {
        switch self {
        case .iPhone12:
            return CGSize(width: 390, height: 844)
        case .iPhone12mini:
            return CGSize(width: 360, height: 812)
        case .iPhone12ProMax:
            return CGSize(width: 428, height: 926)
        case .iPhone12Pro:
            return CGSize(width: 390, height: 844)
        case .iPhoneSE2ndGen:
            return CGSize(width: 375, height: 667)
        case .iPhone11ProMax:
            return CGSize(width: 414, height: 896)
        case .iPhone11Pro:
            return CGSize(width: 375, height: 812)
        case .iPhone11:
            return CGSize(width: 414, height: 896)
        case .iPhoneXR:
            return CGSize(width: 414, height: 896)
        case .iPhoneXSMax:
            return CGSize(width: 414, height: 896)
        case .iPhoneXS:
            return CGSize(width: 375, height: 812)
        case .iPhoneX:
            return CGSize(width: 375, height: 812)
        case .iPhone8Plus:
            return CGSize(width: 414, height: 736)
        case .iPhone8:
            return CGSize(width: 375, height: 667)
        case .iPhone7:
            return CGSize(width: 375, height: 667)
        case .iPhone7Plus:
            return CGSize(width: 414, height: 736)
        case .iPhoneSE1stGen:
            return CGSize(width: 320, height: 568)
        case .iPhone6sPlus:
            return CGSize(width: 414, height: 736)
        case .iPhone6s:
            return CGSize(width: 375, height: 667)
        case .iPhone6:
            return CGSize(width: 375, height: 667)
        case .iPhone5c:
            return CGSize(width: 320, height: 568)
        case .iPhone5s:
            return CGSize(width: 320, height: 568)
        case .iPhone5:
            return CGSize(width: 320, height: 568)
        case .iPadAir4:
            return CGSize(width: 820, height: 1180)
        }
    }
}
