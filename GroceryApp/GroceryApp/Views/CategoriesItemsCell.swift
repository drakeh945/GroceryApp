//
//  CategoriesItemsCell.swift
//  GroceryApp
//
//  Created by Drake Herring on 12/3/22.
//

import UIKit

class CategoriesItemsCell: UICollectionViewCell {

    
    static var reuseIdentifier = String(describing: CategoriesItemsCell.self)
    static var kind = String(describing: CategoriesItemsCell.self)
    static var nib = UINib(nibName:  String(describing: CategoriesItemsCell.self), bundle: nil)
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
