//
//  ViewController.swift
//  ProfileApp
//
//  Created by Alex on 3.03.21.
//

import UIKit

class MainViewController: UIViewController {

    var userCardInfo: PAUserCardInfo?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "Edit":
            if let controller = segue.destination as? EditInfoController {
                controller.userCardInfo = self.userCardInfo ?? controller.userCardInfo
            }
        default:
            break
        }
    }
}
