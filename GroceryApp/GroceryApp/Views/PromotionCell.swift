//
//  PromotionCell.swift
//  GroceryApp
//
//  Created by Drake Herring on 12/3/22.
//

import UIKit

class PromotionCell: UICollectionViewCell {

    static var reuseIdentifier = String(describing: PromotionCell.self)
    static var kind = String(describing: PromotionCell.self)
    static var nib = UINib(nibName:  String(describing: PromotionCell.self), bundle: nil)
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
