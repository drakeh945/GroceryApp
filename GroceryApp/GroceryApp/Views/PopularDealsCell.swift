//
//  PopularDealsCell.swift
//  GroceryApp
//
//  Created by Drake Herring on 12/3/22.
//

import UIKit

class PopularDealsCell: UICollectionViewCell {

    static var reuseIdentifier = String(describing: PopularDealsCell.self)
    static var kind = String(describing: PopularDealsCell.self)
    static var nib = UINib(nibName:  String(describing: PopularDealsCell.self), bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
