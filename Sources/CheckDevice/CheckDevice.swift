//
//  CheckDevice.swift
//  CheckDevice
//
//  Created by Uğur Ethem AYDIN @ugurethemaydin on 8.11.2020.
//  Copyright © 2020
//

import UIKit

/// Device information structure that contains all available device details
public struct DeviceInfo {
    // Basic device information
    public let name: String
    public let model: String
    public let systemVersion: String
    public let deviceVersion: Version
    public let deviceType: Type
    public let screenSize: Size

    // Screen properties
    public let screenWidth: Double
    public let screenHeight: Double
    public let screenScale: Double
    public let screenNativeWidth: Double
    public let screenNativeHeight: Double
    public let screenPPI: Int

    // Device capabilities
    public let hasFaceID: Bool
    public let hasTouchID: Bool
    public let hasModernDesign: Bool
    public let hasClassicDesign: Bool

    // System information
    public let systemName: String
    public let systemArchitecture: String
    public let processorCount: Int
    public let totalMemory: UInt64
    public let thermalState: String

    // Battery information
    public let batteryLevel: Float
    public let batteryState: String
    public let isLowPowerModeEnabled: Bool

    // Storage information
    public let totalDiskSpace: Int64
    public let freeDiskSpace: Int64
    public let usedDiskSpace: Int64
}

open class CheckDevice {
	static fileprivate func getVersionCode() -> String {
		var systemInfo = utsname()
		uname(&systemInfo)
		let versionCode: String = String(validatingUTF8: NSString(bytes: &systemInfo.machine, length: Int(_SYS_NAMELEN), encoding: String.Encoding.ascii.rawValue)!.utf8String!)!
		return versionCode
	}

	static fileprivate func getVersion(code: String) -> Version {

		switch code {
			/*** iPhone ***/
			 //old version
			case "iPhone1,1":                                       return .iPhoneOriginal
			case "iPhone1,2":                                       return .iPhone3G
            case "iPhone2,1":                                       return .iPhone3GS
			case "iPhone3,1", "iPhone3,2", "iPhone3,3":             return .iPhone4
			case "iPhone4,1", "iPhone4,2", "iPhone4,3":             return .iPhone4S
			case "iPhone5,1", "iPhone5,2":                          return .iPhone5
			case "iPhone5,3", "iPhone5,4":                          return .iPhone5C
			case "iPhone6,1", "iPhone6,2":                          return .iPhone5S
			case "iPhone7,2":                                       return .iPhone6
			case "iPhone7,1":                                       return .iPhone6Plus

			 //new version
			case "iPhone8,1":                                       return .iPhone6S
			case "iPhone8,2":                                       return .iPhone6SPlus
			case "iPhone8,3", "iPhone8,4":                          return .iPhoneSE
			case "iPhone9,1", "iPhone9,3":                          return .iPhone7
			case "iPhone9,2", "iPhone9,4":                          return .iPhone7Plus
			case "iPhone10,1", "iPhone10,4":                        return .iPhone8
			case "iPhone10,2", "iPhone10,5":                        return .iPhone8Plus
			case "iPhone10,3", "iPhone10,6":                        return .iPhoneX
			case "iPhone11,2":                                      return .iPhoneXS
			case "iPhone11,4", "iPhone11,6":                        return .iPhoneXS_Max
			case "iPhone11,8":                                      return .iPhoneXR
			case "iPhone12,1":                                      return .iPhone11
			case "iPhone12,3":                                      return .iPhone11Pro
			case "iPhone12,5":                                      return .iPhone11Pro_Max
			case "iPhone12,8":                                      return .iPhoneSE2
			case "iPhone13,1":                                      return .iPhone12Mini
			case "iPhone13,2":                                      return .iPhone12
			case "iPhone13,3":                                      return .iPhone12Pro
			case "iPhone13,4":                                      return .iPhone12ProMax
			case "iPhone14,4":                                      return .iPhone13Mini
			case "iPhone14,5":                                      return .iPhone13
			case "iPhone14,2":                                      return .iPhone13Pro
			case "iPhone14,3":                                      return .iPhone13ProMax
			case "iPhone14,6":                                      return .iPhoneSE3
			case "iPhone14,7":                                      return .iPhone14
            case "iPhone14,8":                                      return .iPhone14Plus
            case "iPhone15,2":                                      return .iPhone14Pro
            case "iPhone15,3":                                      return .iPhone14ProMax
            case "iPhone15,4":                                      return .iPhone15
            case "iPhone15,5":                                      return .iPhone15Plus
            case "iPhone16,1":                                      return .iPhone15Pro
            case "iPhone16,2":                                      return .iPhone15ProMax
            case "iPhone17,1":                                      return .iPhone16Pro
            case "iPhone17,2":                                      return .iPhone16ProMax
            case "iPhone17,3":                                      return .iPhone16
            case "iPhone17,4":                                      return .iPhone16Plus
            case "iPhone17,5":                                      return .iPhone16e
            // iPhone 17 Series (2025)
            case "iPhone18,1":                                      return .iPhone17Pro
            case "iPhone18,2":                                      return .iPhone17ProMax
            case "iPhone18,3":                                      return .iPhone17
            case "iPhone18,4":                                      return .iPhoneAir

            /*** iPad ***/
			case "iPad1,1", "iPad1,2":                              return .iPad1
			case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":        return .iPad2
			case "iPad3,1", "iPad3,2", "iPad3,3":                   return .iPad3
			case "iPad3,4", "iPad3,5", "iPad3,6":                   return .iPad4
			case "iPad6,11", "iPad6,12":                            return .iPad5
			case "iPad7,5", "iPad7,6":                              return .iPad6
			case "iPad7,11", "iPad7,12":                            return .iPad7
			case "iPad11,6", "iPad11,7":                            return .iPad8
			case "iPad12,1", "iPad12,2":                            return .iPad9
			case "iPad13,18", "iPad13,19":                          return .iPad10
            case "iPad15,7", "iPad15,8":                            return .iPad11

            /*** iPadAir ***/
			case "iPad4,1", "iPad4,2", "iPad4,3":                   return .iPadAir
			case "iPad5,3", "iPad5,4":                              return .iPadAir2
			case "iPad11,3", "iPad11,4":                            return .iPadAir3
			case "iPad13,1", "iPad13,2":                            return .iPadAir4
			case "iPad13,16", "iPad13,17":                          return .iPadAir5
            case "iPad14,3":                                        return .iPadAir6_11Inch
            case "iPad14,4":                                        return .iPadAir6_13Inch
            case "iPad15,3":                                        return .iPadAirM3_11Inch_WiFi
            case "iPad15,4":                                        return .iPadAirM3_11Inch_Cellular
            case "iPad15,5":                                        return .iPadAirM3_13Inch_WiFi
            case "iPad15,6":                                        return .iPadAirM3_13Inch_Cellular

            /*** iPadMini ***/
			case "iPad2,5", "iPad2,6", "iPad2,7":                   return .iPadMini
			case "iPad4,4", "iPad4,5", "iPad4,6":                   return .iPadMini2
			case "iPad4,7", "iPad4,8", "iPad4,9":                   return .iPadMini3
			case "iPad5,1", "iPad5,2":                              return .iPadMini4
			case "iPad11,1", "iPad11,2":                            return .iPadMini5
			case "iPad14,1", "iPad14,2":                            return .iPadMini6
            case "iPad16,1", "iPad16,2":                            return .iPadMini7

			/*** iPadPro ***/
			case "iPad6,3", "iPad6,4":                              return .iPadPro9_7Inch
			case "iPad6,7", "iPad6,8":                              return .iPadPro12_9Inch
			case "iPad7,1", "iPad7,2":                              return .iPadPro12_9Inch2
			case "iPad7,3", "iPad7,4":                              return .iPadPro10_5Inch
			case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4":        return .iPadPro11_0Inch
			case "iPad8,9", "iPad8,10":                             return .iPadPro11_0Inch2
			case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8":        return .iPadPro12_9Inch3
			case "iPad8,11", "iPad8,12":                            return .iPadPro12_9Inch4
			case "iPad13,4", "iPad13,5", "iPad13,6", "iPad13,7":    return .iPadPro11_0Inch3
			case "iPad13,8", "iPad13,9", "iPad13,10", "iPad13,11":  return .iPadPro12_9Inch5
			case "iPad14,5", "iPad14,6":                            return .iPadPro12_9Inch6
            case "iPad15,1":                                        return .iPadPro11_0Inch5
            case "iPad15,2":                                        return .iPadPro13_0Inch
            case "iPad16,3", "iPad16,4":                            return .iPadPro11_0Inch5thGen
            case "iPad16,5", "iPad16,6":                            return .iPadPro12_9Inch7thGen
            // iPad Pro 8th Gen (2025)
            case "iPad17,1", "iPad17,2":                            return .iPadPro11_0Inch8thGen
            case "iPad17,3", "iPad17,4":                            return .iPadPro13_0Inch8thGen

            /*** iPod ***/
			case "iPod1,1":                                         return .iPodTouch1Gen
			case "iPod2,1":                                         return .iPodTouch2Gen
			case "iPod3,1":                                         return .iPodTouch3Gen
			case "iPod4,1":                                         return .iPodTouch4Gen
			case "iPod5,1":                                         return .iPodTouch5Gen
			case "iPod7,1":                                         return .iPodTouch6Gen
			case "iPod9,1":                                         return .iPodTouch7Gen


			/*** Watch ***/
			case "Watch1,1":                                        return .WatchOriginal38mm
			case "Watch1,2":                                        return .WatchOriginal42mm
			case "Watch2,6":                                        return .Watch1Gen38mm
			case "Watch2,7":                                        return .Watch1Gen42mm
			case "Watch2,3":                                        return .Watch2Gen38mm
			case "Watch2,4":                                        return .Watch2Gen42mm
			case "Watch3,1", "Watch3,3":                            return .Watch3Gen38mm
			case "Watch3,2", "Watch3,4":                            return .Watch3Gen42mm
			case "Watch4,1", "Watch4,3":                            return .Watch4Gen40mm
			case "Watch4,2", "Watch4,4":                            return .Watch4Gen44mm
			case "Watch5,1", "Watch5,3":                            return .Watch5Gen40mm
			case "Watch5,2", "Watch5,4":                            return .Watch5Gen44mm
			case "Watch6,1", "Watch6,3":                            return .Watch6Gen40mm
			case "Watch6,2", "Watch6,4":                            return .Watch6Gen44mm
			case "Watch5,9", "Watch5,11":                           return .WatchSE40mm
			case "Watch5,10", "Watch5,12":                          return .WatchSE44mm
			case "Watch6,6":                                        return .Watch7Gen41mm
			case "Watch6,9":                                        return .Watch7Gen45mm
			case "Watch6,14", "Watch6,16":                          return .Watch8Gen41mm
			case "Watch6,15", "Watch6,17":                          return .Watch8Gen45mm
			case "Watch6,10", "Watch6,12":                          return .WatchSE2Gen40mm
			case "Watch6,11", "Watch6,13":                          return .WatchSE2Gen44mm
			case "Watch6,18":                                       return .WatchUltra1Gen49mm
            case "Watch7,1":                                        return .Watch9Gen41mm
            case "Watch7,2":                                        return .Watch9Gen45mm
            case "Watch7,3":                                        return .Watch9Gen41mmCellular
            case "Watch7,4":                                        return .Watch9Gen45mmCellular
            case "Watch7,5":                                        return .WatchUltra2Gen49mm
            case "Watch7,8":                                        return .Watch10Gen42mm
            case "Watch7,9":                                        return .Watch10Gen46mm
            case "Watch7,10":                                       return .Watch10Gen42mmCellular
            case "Watch7,11":                                       return .Watch10Gen46mmCellular
            // Watch Ultra 3
            case "Watch7,12":                                       return .WatchUltra3Gen49mm
            // Watch SE 3
            case "Watch7,13", "Watch7,15":                          return .WatchSE3Gen40mm
            case "Watch7,14", "Watch7,16":                          return .WatchSE3Gen44mm
            // Watch Series 11
            case "Watch7,17", "Watch7,19":                          return .Watch11Gen42mm
            case "Watch7,18", "Watch7,20":                          return .Watch11Gen46mm

			/*** Simulator ***/
			case "i386", "x86_64", "arm64":                         return .simulator

			default:                                                return .unknown
		}
	}

	static fileprivate func getType(code: String) -> Type {
		let versionCode = getVersionCode()
		if versionCode.contains("iPhone") {
			return .iPhone
		}
		else if versionCode.contains("iPad") {
			return .iPad
		}
		else if versionCode.contains("iPod") {
			return .iPod
		}
		else if versionCode.contains("Watch") {
			return .Watch
		}
		else if versionCode == "i386" || versionCode == "x86_64" || versionCode == "arm64" {
			return .simulator
		}
		else {
			return .unknown
		}
	}

	//v1.1
	static public var battery: Battery {
		return Battery()
	}

	static public func version() -> Version {
		return getVersion(code: getVersionCode())
	}

	@available(iOSApplicationExtension, unavailable)
	static public var hasFaceID: Bool {
        if #available(iOS 11.0, *) {
            let version = getVersion(code: getVersionCode())
            switch version {
            case .iPhoneX, .iPhoneXS, .iPhoneXS_Max, .iPhoneXR,
                 .iPhone11, .iPhone11Pro, .iPhone11Pro_Max,
                 .iPhone12Mini, .iPhone12, .iPhone12Pro, .iPhone12ProMax,
                 .iPhone13Mini, .iPhone13, .iPhone13Pro, .iPhone13ProMax,
                 .iPhone14, .iPhone14Plus, .iPhone14Pro, .iPhone14ProMax,
                 .iPhone15, .iPhone15Plus, .iPhone15Pro, .iPhone15ProMax,
                 .iPhone16, .iPhone16Plus, .iPhone16Pro, .iPhone16ProMax, .iPhone16e,
                 .iPhone17, .iPhone17Pro, .iPhone17ProMax, .iPhoneAir:
                return true
            default:
                return false
            }
        }
        return false
    }

    static public var hasTouchID: Bool {
        if #available(iOS 11.0, *) {
            let version = getVersion(code: getVersionCode())

            #if targetEnvironment(simulator)
            let deviceName = UIDevice.current.name.lowercased()
            if deviceName.contains("se") && !deviceName.contains("series") {
                return true
            }
            #endif

            switch version {
            case .iPhone5S,
                 .iPhone6, .iPhone6Plus,
                 .iPhone6S, .iPhone6SPlus,
                 .iPhoneSE, .iPhone7, .iPhone7Plus,
                 .iPhone8, .iPhone8Plus,
                 .iPhoneSE2, .iPhoneSE3:
                return true
            case .simulator:
                let deviceName = UIDevice.current.name.lowercased()
                return deviceName.contains("se") && !deviceName.contains("series")
            default:
                return false
            }
        }
        return false
    }

    static public var hasModernDesign: Bool {
        return hasFaceID
    }

    static public var hasClassicDesign: Bool {
        return !hasFaceID
    }

    // MARK: - Display Corner Radius

    /// Cihazın ekran köşe radius'unu döndürür (pts)
    /// Apple resmi API sağlamıyor, cihaz modeline göre bilinen değerler kullanılıyor
    ///
    /// Değerler:
    /// - Home button'lu cihazlar: 0 (köşeli ekran)
    /// - iPhone X, Xs, Xs Max, 11 Pro, 11 Pro Max: 39.0
    /// - iPhone Xr, 11: 41.5
    /// - iPhone 12 mini, 13 mini: 44.0
    /// - iPhone 12, 12 Pro, 13, 13 Pro, 14, 16e: 47.33
    /// - iPhone 12 Pro Max, 13 Pro Max, 14 Plus: 53.33
    /// - iPhone 14 Pro, 14 Pro Max, 15, 15 Plus, 15 Pro, 15 Pro Max, 16, 16 Plus: 55.0
    /// - iPhone 16 Pro, 16 Pro Max, 17, 17 Pro, 17 Pro Max, Air: 62.0
    /// - iPad Air / iPad Pro 11" / 12.9": 18.0
    static public var screenCornerRadius: CGFloat {
        var deviceVersion = version()

        // Simulator'da gerçek simüle edilen cihaz modelini kullan
        if deviceVersion == .simulator,
           let simID = ProcessInfo.processInfo.environment["SIMULATOR_MODEL_IDENTIFIER"] {
            let simVersion = getVersion(code: simID)
            if simVersion != .simulator && simVersion != .unknown {
                deviceVersion = simVersion
            }
        }

        return screenCornerRadius(for: deviceVersion)
    }

    static private func screenCornerRadius(for version: Version) -> CGFloat {
        switch version {

        // Eski köşeli ekranlar (Home button'lu)
        case .iPhoneOriginal, .iPhone3G, .iPhone3GS, .iPhone4, .iPhone4S,
             .iPhone5, .iPhone5C, .iPhone5S, .iPhoneSE,
             .iPhone6, .iPhone6Plus, .iPhone6S, .iPhone6SPlus,
             .iPhone7, .iPhone7Plus, .iPhone8, .iPhone8Plus,
             .iPhoneSE2, .iPhoneSE3:
            return 0

        // iPhone X, Xs, Xs Max, 11 Pro, 11 Pro Max → 39.0
        case .iPhoneX, .iPhoneXS, .iPhoneXS_Max,
             .iPhone11Pro, .iPhone11Pro_Max:
            return 39.0

        // iPhone Xr, 11 → 41.5
        case .iPhoneXR, .iPhone11:
            return 41.5

        // iPhone 12 mini, 13 mini → 44.0
        case .iPhone12Mini, .iPhone13Mini:
            return 44.0

        // iPhone 12, 12 Pro, 13, 13 Pro, 14, 16e → 47.33
        case .iPhone12, .iPhone12Pro,
             .iPhone13, .iPhone13Pro,
             .iPhone14, .iPhone16e:
            return 47.33

        // iPhone 12 Pro Max, 13 Pro Max, 14 Plus → 53.33
        case .iPhone12ProMax, .iPhone13ProMax, .iPhone14Plus:
            return 53.33

        // iPhone 14 Pro, 14 Pro Max, 15, 15 Plus, 15 Pro, 15 Pro Max, 16, 16 Plus → 55.0
        case .iPhone14Pro, .iPhone14ProMax,
             .iPhone15, .iPhone15Plus, .iPhone15Pro, .iPhone15ProMax,
             .iPhone16, .iPhone16Plus:
            return 55.0

        // iPhone 16 Pro, 16 Pro Max, 17, 17 Pro, 17 Pro Max, Air → 62.0
        case .iPhone16Pro, .iPhone16ProMax,
             .iPhone17, .iPhone17Pro, .iPhone17ProMax,
             .iPhoneAir:
            return 62.0

        // iPod'lar → 0 (köşeli ekran)
        case .iPodTouch1Gen, .iPodTouch2Gen, .iPodTouch3Gen,
             .iPodTouch4Gen, .iPodTouch5Gen, .iPodTouch6Gen, .iPodTouch7Gen:
            return 0

        // iPad'ler → 18.0
        case .iPad1, .iPad2, .iPad3, .iPad4, .iPad5, .iPad6, .iPad7, .iPad8, .iPad9, .iPad10, .iPad11,
             .iPadAir, .iPadAir2, .iPadAir3, .iPadAir4, .iPadAir5,
             .iPadAir6_11Inch, .iPadAir6_13Inch,
             .iPadAirM3_11Inch_WiFi, .iPadAirM3_11Inch_Cellular,
             .iPadAirM3_13Inch_WiFi, .iPadAirM3_13Inch_Cellular,
             .iPadMini, .iPadMini2, .iPadMini3, .iPadMini4, .iPadMini5, .iPadMini6, .iPadMini7,
             .iPadPro9_7Inch, .iPadPro10_5Inch,
             .iPadPro11_0Inch, .iPadPro11_0Inch2, .iPadPro11_0Inch3, .iPadPro11_0Inch4, .iPadPro11_0Inch5,
             .iPadPro11_0Inch5thGen, .iPadPro11_0Inch8thGen,
             .iPadPro12_9Inch, .iPadPro12_9Inch2, .iPadPro12_9Inch3, .iPadPro12_9Inch4,
             .iPadPro12_9Inch5, .iPadPro12_9Inch6, .iPadPro12_9Inch7thGen,
             .iPadPro13_0Inch, .iPadPro13_0Inch8thGen:
            return 18.0

        // Simulator fallback (SIMULATOR_MODEL_IDENTIFIER bulunamadıysa)
        case .simulator:
            return 55.0

        default:
            return 55.0  // Bilinmeyen yeni cihazlar
        }
    }

    static public func size() -> Size {
        // iOS 26+ fix: Use nativeBounds for physical screen size
        // UIScreen.main.bounds returns window size on iOS 26 (resizable windows)
        // UIScreen.main.nativeBounds always returns physical display size
        let native = UIScreen.main.nativeBounds
        let scale = UIScreen.main.scale
        let w: Double = Double(native.width / scale)
        let h: Double = Double(native.height / scale)
        let screenHeight: Double = max(w, h)

        switch screenHeight {
			case 480:
				return .screen3_5Inch
			case 568:
				return .screen4Inch
			case 667:
				return UIScreen.main.scale == 3.0 ? .screen5_5Inch : .screen4_7Inch
			case 736:
				return .screen5_5Inch
			case 780:
				return .screen5_4Inch
			case 812:
                return .screen5_8Inch
            case 844:
                return .screen6_1Inch
            case 852:
                return .screen6_1Inch
            case 874:
                return .screen6_3Inch
            case 896:
				return UIScreen.main.scale == 3.0 ? .screen6_5Inch : .screen6_1Inch
            case 912:
                return .screen6_5Inch  // iPhone Air
			case 926:
				return .screen6_7Inch
            case 932:
                return .screen6_7Inch
            case 956:
                return .screen6_9Inch
			case 1024:
				switch version() {
					case .iPadMini, .iPadMini2, .iPadMini3, .iPadMini4:
						return .screen7_9Inch
					case .iPadPro10_5Inch:
						return .screen10_5Inch
					default:
						return .screen9_7Inch
				}
			case 1080:
				return .screen10_2Inch
			case 1112:
				switch version() {
					case .iPad7:
						return .screen10_2Inch
					default:
						return .screen10_5Inch
				}
			case 1180:
				return .screen10_9Inch
			case 1194, 1210:
                return .screen11Inch
            case 1366:
                return .screen12_9Inch  // 12.9" iPad Pro
            case 1376:
                return .screen13Inch    // 13" iPad Pro (M4/M5)
			default:
				return .unknownSize
		}
	}

	static public func type() -> Type {
		return getType(code: getVersionCode())
	}

	@available(*, deprecated, message: "use == operator instead")
	static public func isEqualToScreenSize(_ size: Size) -> Bool {
		return size == self.size() ? true : false;
	}

	@available(*, deprecated, message: "use > operator instead")
	static public func isLargerThanScreenSize(_ size: Size) -> Bool {
		return size.rawValue < self.size().rawValue ? true : false;
	}

	@available(*, deprecated, message: "use < operator instead")
	static public func isSmallerThanScreenSize(_ size: Size) -> Bool {
		return size.rawValue > self.size().rawValue ? true : false;
	}

	static public func isRetina() -> Bool {
		return UIScreen.main.scale > 1.0
	}

	static public func isWatch() -> Bool {
		return type() == .Watch
	}

    /// Returns comprehensive information about the device
    @available(iOSApplicationExtension, unavailable)
    static public func deviceInfo() -> DeviceInfo {
        let screen = UIScreen.main
        let device = UIDevice.current
        let nativeSize = screen.nativeBounds.size

        // Get processor information
        let processInfo = ProcessInfo.processInfo
        let thermalState: String = {
            if #available(iOS 11.0, *) {
                switch processInfo.thermalState {
                case .nominal: return "Nominal"
                case .fair: return "Fair"
                case .serious: return "Serious"
                case .critical: return "Critical"
                @unknown default: return "Unknown"
                }
            }
            return "Unavailable"
        }()

        // Get memory information
        let totalMemory: UInt64 = {
            let processInfo = ProcessInfo.processInfo
            return UInt64(processInfo.physicalMemory)
        }()

        // Get storage information
        let fileManager = FileManager.default
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        guard let systemAttributes = try? fileManager.attributesOfFileSystem(forPath: documentDirectory),
              let totalSpace = (systemAttributes[.systemSize] as? NSNumber)?.int64Value,
              let freeSpace = (systemAttributes[.systemFreeSize] as? NSNumber)?.int64Value else {
            return DeviceInfo(
                name: device.name,
                model: getVersionCode(),
                systemVersion: device.systemVersion,
                deviceVersion: version(),
                deviceType: type(),
                screenSize: size(),
                screenWidth: screen.bounds.width,
                screenHeight: screen.bounds.height,
                screenScale: screen.scale,
                screenNativeWidth: nativeSize.width,
                screenNativeHeight: nativeSize.height,
                screenPPI: 0,
                hasFaceID: hasFaceID,
                hasTouchID: hasTouchID,
                hasModernDesign: hasModernDesign,
                hasClassicDesign: hasClassicDesign,
                systemName: device.systemName,
                systemArchitecture: getVersionCode(),
                processorCount: processInfo.processorCount,
                totalMemory: totalMemory,
                thermalState: thermalState,
                batteryLevel: battery.level,
                batteryState: battery.stateString,
                isLowPowerModeEnabled: battery.isLowPowerModeEnabled,
                totalDiskSpace: 0,
                freeDiskSpace: 0,
                usedDiskSpace: 0
            )
        }

        return DeviceInfo(
            name: device.name,
            model: getVersionCode(),
            systemVersion: device.systemVersion,
            deviceVersion: version(),
            deviceType: type(),
            screenSize: size(),
            screenWidth: screen.bounds.width,
            screenHeight: screen.bounds.height,
            screenScale: screen.scale,
            screenNativeWidth: nativeSize.width,
            screenNativeHeight: nativeSize.height,
            screenPPI: Int(screen.scale * (type() == .iPad ? 132 : 163)),
            hasFaceID: hasFaceID,
            hasTouchID: hasTouchID,
            hasModernDesign: hasModernDesign,
            hasClassicDesign: hasClassicDesign,
            systemName: device.systemName,
            systemArchitecture: getVersionCode(),
            processorCount: processInfo.processorCount,
            totalMemory: totalMemory,
            thermalState: thermalState,
            batteryLevel: battery.level,
            batteryState: battery.stateString,
            isLowPowerModeEnabled: battery.isLowPowerModeEnabled,
            totalDiskSpace: totalSpace,
            freeDiskSpace: freeSpace,
            usedDiskSpace: totalSpace - freeSpace
        )
    }

    /// Returns a formatted string containing all device information
    @available(iOSApplicationExtension, unavailable)
    static public func deviceInfoString() -> String {
        let info = deviceInfo()
        return """
        Device Information
        ==================
        Basic Info:
        - Name: \(info.name)
        - Model: \(info.model)
        - System Version: \(info.systemVersion)
        - Device Version: \(info.deviceVersion)
        - Device Type: \(info.deviceType)

        Screen:
        - Size: \(info.screenSize)
        - Dimensions: \(info.screenWidth) x \(info.screenHeight) points
        - Scale: \(info.screenScale)x
        - Native Resolution: \(Int(info.screenNativeWidth)) x \(Int(info.screenNativeHeight)) pixels
        - PPI: \(info.screenPPI)

        Security:
        - Face ID: \(info.hasFaceID ? "Yes" : "No")
        - Touch ID: \(info.hasTouchID ? "Yes" : "No")
        - Modern Design: \(info.hasModernDesign ? "Yes" : "No")

        System:
        - Name: \(info.systemName)
        - Architecture: \(info.systemArchitecture)
        - Processor Count: \(info.processorCount)
        - Memory: \(ByteCountFormatter.string(fromByteCount: Int64(info.totalMemory), countStyle: .binary))
        - Thermal State: \(info.thermalState)

        Battery:
        - Level: \(info.batteryLevel >= 0 ? "\(Int(info.batteryLevel * 100))%" : "Unknown")
        - State: \(info.batteryState)
        - Low Power Mode: \(info.isLowPowerModeEnabled ? "Enabled" : "Disabled")

        Storage:
        - Total: \(ByteCountFormatter.string(fromByteCount: info.totalDiskSpace, countStyle: .binary))
        - Free: \(ByteCountFormatter.string(fromByteCount: info.freeDiskSpace, countStyle: .binary))
        - Used: \(ByteCountFormatter.string(fromByteCount: info.usedDiskSpace, countStyle: .binary))
        """
    }

	static public func isPad() -> Bool {
		return type() == .iPad
	}

	static public func isPhone() -> Bool {
		return type() == .iPhone
	}

	static public func isPod() -> Bool {
		return type() == .iPod
	}

	static public func isSimulator() -> Bool {
		return type() == .simulator
	}

	//v1.1
	static public var isLandscape: Bool {
        if #available(iOS 13.0, *) {
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return false }
            return windowScene.interfaceOrientation.isLandscape
        } else {
            return UIApplication.shared.statusBarOrientation.isLandscape
        }
    }

	static public var isPortrait: Bool {
        if #available(iOS 13.0, *) {
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return false }
            return windowScene.interfaceOrientation.isPortrait
        } else {
            return UIApplication.shared.statusBarOrientation.isPortrait
        }
    }
}
