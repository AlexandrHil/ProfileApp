//
//  ViewController.swift
//  ProfileApp
//
//  Created by Alex on 3.03.21.
//

import UIKit

class MainViewController: UIViewController {

    var userCardInfo = PAUserCardInfo()

    // MARK: - IBOutlets

    @IBOutlet weak var backgroundImageView: UIView! {
        didSet {
            self.backgroundImageView.layer.cornerRadius = self.backgroundImageView.bounds.height / 2
        }
    }

    @IBOutlet weak var avatarImageView: UIImageView! {
        didSet {
            self.avatarImageView.layer.cornerRadius = self.avatarImageView.bounds.height / 2
        }
    }

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var positionLabel: TitleDescriptionView!
    @IBOutlet weak var experienceLabel: TitleDescriptionView!
    @IBOutlet weak var aboutTextView: UITextView!

    // MARK: - view life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setViewData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.setViewData()
    }

    // MARK: - setting view data

    private func setViewData() {
        self.nameLabel.text = self.userCardInfo.firstName + " " + self.userCardInfo.alias + " " + self.userCardInfo.lastName
        self.ageLabel.text = self.userCardInfo.age
        self.positionLabel.descriptionText = self.userCardInfo.position.rawValue
        self.experienceLabel.descriptionText = self.userCardInfo.experience
        self.aboutTextView.text = self.userCardInfo.about
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "editInfo":
            if let controller = segue.destination as? EditInfoController {
                controller.userCardInfo = self.userCardInfo
            }
        default:
            break
        }
    }

    // MARK: - actions

    @IBAction func shareButtonTapped(_ sender: UIBarButtonItem) {
        let text = "Hello"
                guard let url = URL(string: "google.com") else { return }
                let activityController = UIActivityViewController(activityItems: [text, url], applicationActivities: nil)
                self.present(activityController,
                             animated: true)
    }
}
