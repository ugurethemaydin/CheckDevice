# CheckDevice

![CheckDevice](https://github.com/ugurethemaydin/CheckDevice/blob/main/header.jpg)

![language](https://img.shields.io/badge/Language-%20Swift%20-orange.svg)
[![Version](https://img.shields.io/cocoapods/v/CheckDevice.svg?style=flat)](https://cocoapods.org/pods/CheckDevice)
[![License](https://img.shields.io/cocoapods/l/CheckDevice.svg?style=flat)](https://cocoapods.org/pods/CheckDevice)
[![Platform](https://img.shields.io/cocoapods/p/CheckDevice.svg?style=flat)](https://cocoapods.org/pods/CheckDevice)

#### **How to detect iOS device models and screen size?**
###### **CheckDevice detects the current Apple device model and screen sizes.**

Supports all Apple devices from iPhone Original (2007) to iPhone 17 series (2025).

## Swift Package Manager (Recommended)

The Swift Package Manager is the preferred way to add CheckDevice:

```swift
dependencies: [
    .package(url: "https://github.com/ugurethemaydin/CheckDevice.git", from: "2.0.0")
]
```

Or add it via Xcode: File → Add Package Dependencies → Enter the repository URL.

## CocoaPods

> **Note:** CocoaPods will become read-only on December 2, 2026. We recommend migrating to Swift Package Manager for future updates.

```ruby
pod 'CheckDevice', '~> 2.0'
```

Then run: `$ pod install`

## Usage

### Device Screen Size
```swift
CheckDevice.size()
```

### Device Version
```swift
CheckDevice.version()
```

### Device Type
```swift
CheckDevice.isPhone()
CheckDevice.isPad()
CheckDevice.isPod()
CheckDevice.isWatch()
CheckDevice.isSimulator()
```

### Device Capabilities
```swift
CheckDevice.hasFaceID           // Face ID support
CheckDevice.hasTouchID          // Touch ID support
CheckDevice.hasModernDesign     // Notch/Dynamic Island design
CheckDevice.isRetina()          // Retina display
CheckDevice.screenCornerRadius  // Screen corner radius in points (CGFloat)
```

### Comprehensive Device Info
```swift
let info = CheckDevice.deviceInfo()
print(info.model)           // "iPhone17,1"
print(info.screenSize)      // screen6_3Inch
print(info.hasFaceID)       // true
print(info.totalMemory)     // Memory in bytes
```

## Supported Devices

### iPhones (2007-2026)
- iPhone Original through iPhone 17 series
- iPhone SE (all generations)

### iPads
- iPad 1 through iPad 11
- iPad Air (all generations including M3)
- iPad Mini (all generations)
- iPad Pro (all generations including 2025 models)

### Apple Watch
- Apple Watch Original through Series 11
- Apple Watch SE (all generations)
- Apple Watch Ultra (all generations)

### Screen Sizes

| Size | Points | Devices |
|------|--------|---------|
| screen3_5Inch | 480 | iPhone 4/4S |
| screen4Inch | 568 | iPhone 5/5S/SE |
| screen4_7Inch | 667 | iPhone 6/7/8, SE2/SE3 |
| screen5_4Inch | 780 | iPhone 12/13 Mini |
| screen5_5Inch | 736 | iPhone 6+/7+/8+ |
| screen5_8Inch | 812 | iPhone X, XS, 11 Pro |
| screen6_1Inch | 844/852 | iPhone 12/13/14/15/16 |
| screen6_3Inch | 874 | iPhone 16 Pro, 17 Pro |
| screen6_5Inch | 896 | iPhone XS Max, 11 Pro Max |
| screen6_7Inch | 926/932 | iPhone 12-15 Pro Max, 14-16 Plus |
| screen6_9Inch | 956 | iPhone 16/17 Pro Max |

### Screen Corner Radius

Each device has a different physical screen corner radius. This property returns the screen's outer corner radius in points, so you can align UI elements (sheets, modals, bottom bars) with the device's actual screen edges. Since Apple does not provide a public API for this, values are based on known device specifications.

```swift
let radius = CheckDevice.screenCornerRadius // e.g. 55.0 on iPhone 15
```

| Radius (pts) | Devices |
|-------------|---------|
| 0 | iPhone 4/4S, 5/5S/SE, 6/7/8 series, SE2/SE3 |
| 39.0 | iPhone X, XS, XS Max, 11 Pro, 11 Pro Max |
| 41.5 | iPhone XR, 11 |
| 44.0 | iPhone 12 mini, 13 mini |
| 47.33 | iPhone 12, 12 Pro, 13, 13 Pro, 14, 16e |
| 53.33 | iPhone 12 Pro Max, 13 Pro Max, 14 Plus |
| 55.0 | iPhone 14 Pro, 14 Pro Max, 15 series, 16, 16 Plus |
| 62.0 | iPhone 16 Pro, 16 Pro Max, 17 series, Air |
| 18.0 | iPad Air, iPad Pro |

## iOS

### Device Version Example
```swift
func myFunc() {
    switch CheckDevice.version() {
        /*** iPhone ***/
        case .iPhoneOriginal:   print("It's an iPhone Original")
        case .iPhone4:          print("It's an iPhone 4")
        case .iPhoneX:          print("It's an iPhone X")
        case .iPhone14Pro:      print("It's an iPhone 14 Pro")
        case .iPhone15:         print("It's an iPhone 15")
        case .iPhone16Pro:      print("It's an iPhone 16 Pro")
        case .iPhone16ProMax:   print("It's an iPhone 16 Pro Max")
        case .iPhone17:         print("It's an iPhone 17")

        /*** iPad ***/
        case .iPad1:            print("It's an iPad 1")
        case .iPadPro11_0Inch:  print("It's an iPad Pro 11")
        case .iPadAir5:         print("It's an iPad Air 5")

        /*** iPod ***/
        case .iPodTouch7Gen:    print("It's an iPod Touch 7")

        /*** Watch ***/
        case .Watch10Gen46mm:   print("It's an Apple Watch Series 10")
        case .WatchUltra3Gen49mm: print("It's an Apple Watch Ultra 3")

        /*** Simulator ***/
        case .simulator:        print("It's a Simulator")

        /*** Unknown ***/
        default:                print("It's an unknown device")
    }
}
```

### Device Screen Size Example
```swift
func myFunc() {
    switch CheckDevice.size() {
        case .screen3_5Inch:  print("It's a 3.5 inch screen")
        case .screen4Inch:    print("It's a 4 inch screen")
        case .screen4_7Inch:  print("It's a 4.7 inch screen")
        case .screen5_4Inch:  print("It's a 5.4 inch screen")
        case .screen5_5Inch:  print("It's a 5.5 inch screen")
        case .screen5_8Inch:  print("It's a 5.8 inch screen")
        case .screen6_1Inch:  print("It's a 6.1 inch screen")
        case .screen6_3Inch:  print("It's a 6.3 inch screen")
        case .screen6_5Inch:  print("It's a 6.5 inch screen")
        case .screen6_7Inch:  print("It's a 6.7 inch screen")
        case .screen6_9Inch:  print("It's a 6.9 inch screen")
        case .screen7_9Inch:  print("It's a 7.9 inch screen")
        case .screen9_7Inch:  print("It's a 9.7 inch screen")
        case .screen10_5Inch: print("It's a 10.5 inch screen")
        case .screen11Inch:   print("It's an 11 inch screen")
        case .screen12_9Inch: print("It's a 12.9 inch screen")
        case .screen13Inch:   print("It's a 13 inch screen")
        default:              print("Unknown size")
    }
}
```

### Device Type Example
```swift
func myFunc() {
    switch CheckDevice.type() {
        case .iPod:      print("It's an iPod")
        case .iPhone:    print("It's an iPhone")
        case .iPad:      print("It's an iPad")
        case .Watch:     print("It's an Apple Watch")
        case .simulator: print("It's a Simulated device")
        default:         print("Unknown device type")
    }
}
```

### Helpers
```swift
func myFunc() {
    if CheckDevice.size() == Size.screen4Inch {
        print("It's a 4 inch screen")
    }

    if CheckDevice.size() > Size.screen4_7Inch {
        print("Your device screen is larger than 4.7 inch")
    }

    if CheckDevice.size() < Size.screen4_7Inch {
        print("Your device screen is smaller than 4.7 inch")
    }

    if CheckDevice.isRetina() {
        print("It's a retina display")
    }
}
```

## Mac

### Mac Version
```swift
func myFunc() {
    switch CheckDevice.type() {
        case .iMac:         print("It's an iMac")
        case .macBook:      print("It's a MacBook")
        case .macBookAir:   print("It's a MacBook Air")
        case .macBookPro:   print("It's a MacBook Pro")
        default:            print("Unknown device type")
    }
}
```

### Mac Screen Size
```swift
func myFunc() {
    switch CheckDevice.size() {
        case .screen11Inch:     print("It's a 11 inch screen")
        case .screen12Inch:     print("It's a 12 inch screen")
        case .screen13Inch:     print("It's a 13 inch screen")
        case .screen15Inch:     print("It's a 15 inch screen")
        case .screen17Inch:     print("It's a 17 inch screen")
        case .screen21_5Inch:   print("It's a 21.5 inch screen")
        case .screen27Inch:     print("It's a 27 inch screen")
        default:                print("Unknown size")
    }
}
```

## Author

Uğur Ethem AYDIN, ugur@metromedya.com
[@ugurethemaydin](http://twitter.com/ugurethemaydin)

## License

CheckDevice is available under the [MIT](https://choosealicense.com/licenses/mit/) license. See the LICENSE file for more info.
