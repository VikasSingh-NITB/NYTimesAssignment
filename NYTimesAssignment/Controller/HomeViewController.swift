//
//  HomeViewController.swift
//  NYTimesAssignment
//
//  Created by Vikas Singh on 08/08/18.
//  Copyright © 2018 XYZ. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var articleTableView : UITableView!
    @IBOutlet weak var indicator : UIActivityIndicatorView!
    
    let cellReuseIdentifier = "CustomCell"
    
    var viewModels = [MostPopularArticle]()
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(fetchMostPopularArticles),
                                 for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor.green
        
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.articleTableView.addSubview(self.refreshControl)
        articleTableView.isHidden = true
        indicator.startAnimating()
        fetchMostPopularArticles()
        
    }
    
    @objc func fetchMostPopularArticles()  {
        
        NYTimesAPI.sharedInstance.fetchFeaturedArticles(completion: {(articles) -> Void in
    
            self.viewModels = articles
            self.viewModels.sort(by: { $0.publishDate.compare($1.publishDate) == .orderedDescending})
            DispatchQueue.main.async {
                self.indicator.stopAnimating()
                self.refreshControl.endRefreshing()
                self.articleTableView.isHidden = false
                self.articleTableView.reloadData()
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:CustomCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! CustomCell
        let viewModel = self.viewModels[indexPath.row]
        cell.configureWithViewModel(viewModel: viewModel)
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
}

