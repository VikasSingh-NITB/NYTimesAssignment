//
//  CustomCell.swift
//  NYTimesAssignment
//
//  Created by VF Mac User on 09/08/18.
//  Copyright © 2018 XYZ. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var articleTypeLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
   
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.titleLabel.text = nil;
        self.detailLabel.text = nil;
        self.articleTypeLabel.text = nil;
        self.dateLabel.text = nil;
        self.thumbnailImageView.image = UIImage(named:"PlaceHolderImage_Table")
    }
    
    func configureWithViewModel(viewModel: MostPopularArticle) {
        self.articleTypeLabel.text = viewModel.articleType.uppercased()
        self.dateLabel.text = viewModel.publishDate
        self.titleLabel.text = viewModel.title
        self.titleLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.titleLabel.numberOfLines = 0
        self.titleLabel.sizeToFit()
        self.detailLabel.text = viewModel.detailDescription
        self.thumbnailImageView.imageFromURL(url: viewModel.media.thumbnailImageUrl!)
    }
    
}

extension UIImageView {
    
    public func imageFromURL(url: URL) {
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
            
        }).resume()
    }
    
}
