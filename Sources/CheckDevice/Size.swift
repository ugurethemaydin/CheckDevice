//
//  Size.swift
//  CheckDevice
//
//  Created by Uğur Ethem AYDIN @ugurethemaydin on 8.11.2020.
//  Copyright © 2020
//

public enum Size: Int, Comparable {
    case unknownSize = 0
    #if os(iOS)
        /// iPhone Original, 3G, 3GS, 4, 4s, iPod Touch 4th gen.
        case screen3_5Inch

        /// iPhone 5, 5s, 5c, SE, iPod Touch 5-6th gen.
        case screen4Inch

        /// iPhone 6, 6s, 7, 8, SE2, SE3
        case screen4_7Inch

        /// iPhone 12 Mini, 13 Mini
        case screen5_4Inch

        /// iPhone 6+, 6s+, 7+, 8+
        case screen5_5Inch

        /// iPhone X, XS, 11 Pro
        case screen5_8Inch

        /// iPhone XR, 11, 12, 12 Pro, 13, 13 Pro, 14, 14 Pro, 15, 15 Pro, 16
        case screen6_1Inch

        /// iPhone 16 Pro, 17, 17 Pro (6.3-inch, 874 points)
        case screen6_3Inch

        /// iPhone XS Max, 11 Pro Max
        case screen6_5Inch

        /// iPhone 12 Pro Max, 13 Pro Max, 14 Plus, 14 Pro Max, 15 Plus, 15 Pro Max, 16 Plus
        case screen6_7Inch

        /// iPhone 16 Pro Max, 17 Pro Max (6.9-inch, 956 points)
        case screen6_9Inch

        /// iPad Mini
        case screen7_9Inch

        /// iPad
        case screen9_7Inch

        /// iPad (10.2-inch)
        case screen10_2Inch

        /// iPad Pro (10.5-inch)
        case screen10_5Inch

        /// iPad Air 4 Gen (10.9-inch)
        case screen10_9Inch

        /// iPad Pro (11-inch)
        case screen11Inch

        /// iPad Pro (12.9-inch)
        case screen12_9Inch

        /// iPad Pro, iPad Air (13-inch)
        case screen13Inch
    #elseif os(OSX)
        case screen11Inch
        case screen12Inch
        case screen13Inch
        case screen15Inch
        case screen17Inch
        case screen20Inch
        case screen21_5Inch
        case screen24Inch
        case screen27Inch
    #endif
}

public func <(lhs: Size, rhs: Size) -> Bool {
    return lhs.rawValue < rhs.rawValue
}

public func ==(lhs: Size, rhs: Size) -> Bool {
    return lhs.rawValue == rhs.rawValue
}
