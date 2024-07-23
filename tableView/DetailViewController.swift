//
//  DetailViewController.swift
//  tableView
//
//  Created by admin on 23/07/24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detTitle: UILabel!
    @IBOutlet weak var detImg: UIImageView!
    @IBOutlet weak var detDesc: UILabel!
    
    var academy: AcademyModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detDesc.numberOfLines = 0
        detDesc.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        detTitle.numberOfLines = 0
        detTitle.lineBreakMode = NSLineBreakMode.byWordWrapping

        if let result = academy {
          detTitle.text = result.name
          detDesc.text = result.description
          detImg.image = result.image
        }
    }

}
