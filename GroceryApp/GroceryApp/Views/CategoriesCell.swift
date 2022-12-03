//
//  CategoriesCell.swift
//  GroceryApp
//
//  Created by Drake Herring on 12/3/22.
//

import UIKit

class CategoriesCell: UICollectionViewCell {

    
    static var reuseIdentifier = String(describing: CategoriesCell.self)
    static var kind = String(describing: CategoriesCell.self)
    static var nib = UINib(nibName:  String(describing: CategoriesCell.self), bundle: nil)
    
    
    @IBOutlet weak var Header: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func header(_ header: String){
        Header.text =  header
    }
    
    
    
}
