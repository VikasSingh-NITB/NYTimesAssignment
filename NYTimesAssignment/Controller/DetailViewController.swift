//
//  DetailViewController.swift
//  NYTimesAssignment
//
//  Created by VVikas Singh on 09/08/18.
//  Copyright © 2018 XYZ. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var articleTypeLabel: UILabel!
    @IBOutlet weak var detailThumbnailImageView: UIImageView!
    
    var viewModel: MostPopularArticle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Showing detail info for Article
    func setupView(){
        titleLabel.text = viewModel?.title
        dateLabel.text = viewModel?.publishDate
        detailLabel.text = viewModel?.detailDescription
        articleTypeLabel.text = viewModel?.articleType.uppercased()
        detailThumbnailImageView.imageFromURL(url: (viewModel?.media.detailImageUrl)!)
    }

}
