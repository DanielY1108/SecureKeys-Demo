//
//  ViewController.swift
//  SecureKeys-Demo
//
//  Created by JINSEOK on 2023/02/09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var apiKeyLabel: UILabel!
    @IBOutlet weak var serviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 호출
        apiKeyLabel.text = ENV.SERVICE_API_KEY
        serviceLabel.text = ENV.SERVICE_CLIENT_ID
    }


}

