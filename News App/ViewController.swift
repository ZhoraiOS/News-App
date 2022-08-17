//
//  ViewController.swift
//  News App
//
//  Created by Zhora Babakhanyan on 8/17/22.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let url = "https://newsapi.org/v2/everything?q=tesla&from=2022-07-17&sortBy=publishedAt&apiKey=57776757575742fda9b0adb67fba7dba"
    
    var news : News?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil),
                                             forCellReuseIdentifier: "NewsTableViewCell")
        
        self.fetchData()
    }
    
    func fetchData(){
        AF.request(self.url, method: .get).responseDecodable(of: News.self) { [weak self] response in
            self?.news = response.value
            self?.tableView.reloadData()
        }
    }
    
}

// MARK: - Table View Delegate and DataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news?.articles.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell {

            cell.cellConfiguration(articles: (self.news?.articles[indexPath.row])!)

            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.article = self.news?.articles[indexPath.row]
        self.present(vc, animated: true, completion: nil)
    }
}
