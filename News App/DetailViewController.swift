//
//  DetailViewController.swift
//  News App
//
//  Created by Zhora Babakhanyan on 8/17/22.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsDescritionTextField: UITextView!
    var newsLink: String?
    var article: Articles?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = article?.title
        self.newsImageView.setImage(imageURL: article!.urlToImage)
        self.newsDescritionTextField.text = article?.description
        self.newsLink = article?.url
    }
    
    
    @IBAction func readOriginallButtonAction(_ sender: Any) {
        guard let url = URL(string: self.newsLink!) else { return }
        UIApplication.shared.open(url)
    }
}
