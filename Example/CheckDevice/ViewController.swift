//
//  ViewController.swift
//  CheckDevice
//
//  Created by ugurethemaydin on 11/09/2020.
//  Copyright (c) 2020 ugurethemaydin. All rights reserved.
//

import UIKit
import CheckDevice
class ViewController: UIViewController {

    @IBOutlet weak var battery: UILabel!
    @IBOutlet weak var device: UILabel!
    @IBOutlet weak var screenSize: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        screenSize.text = String(CheckDevice.type().rawValue)
        device.text = CheckDevice.version().rawValue
        battery.text = String(CheckDevice.battery.level)
        dump(CheckDevice.version().rawValue)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

