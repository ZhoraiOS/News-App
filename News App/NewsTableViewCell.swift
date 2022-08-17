//
//  NewsTableViewCell.swift
//  News App
//
//  Created by Zhora Babakhanyan on 8/17/22.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var publishedDateTimeLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    
    func cellConfiguration(articles: Articles) {
        self.titleLabel.text = articles.title
        self.descriptionTextField.text = articles.description
        self.publishedDateTimeLabel.text = articles.publishedAt
        self.newsImageView.setImage(imageURL: articles.urlToImage)
    }
}
