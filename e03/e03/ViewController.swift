//
//  ViewController.swift
//  e03
//
//  Created by Florian Weingartshofer on 15.12.22.
//
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var pin: UILabel!

    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.clear(notification:)),
            name: UIApplication.didEnterBackgroundNotification,
            object: nil
        )
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func buttonClick(_ sender: UIButton) {
        if let buttonTitle =  sender.configuration?.title {
            if let pinText = pin.text{
                pin.text = "\(pinText)\(buttonTitle)"
            }
        }
    }
    
    @objc func clear(notification: Notification) {
        pin.text = ""
    }

}
