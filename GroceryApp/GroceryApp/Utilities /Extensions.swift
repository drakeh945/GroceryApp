//
//  Extensions.swift
//  GroceryApp
//
//  Created by Drake Herring on 12/3/22.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
}
