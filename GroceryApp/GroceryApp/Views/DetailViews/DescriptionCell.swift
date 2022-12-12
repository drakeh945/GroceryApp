//
//  DescriptionCell.swift
//  GroceryApp
//
//  Created by Drake Herring on 12/11/22.
//

import UIKit

class DescriptionCell: UICollectionViewCell {

    static var reuseIdentifier = String(describing: DescriptionCell.self)
    static var kind = String(describing: DescriptionCell.self)
    static var nib = UINib(nibName:  String(describing: DescriptionCell.self), bundle: nil)
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
