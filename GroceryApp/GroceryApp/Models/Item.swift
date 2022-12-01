//
//  Item.swift
//  GroceryApp
//
//  Created by Drake Herring on 12/1/22.
//

import Foundation


struct Item : Hashable {
    let id = UUID()
    let title : String
    let date : String
    let image : String
    
    init (title:String = "", date:String = "", image:String = ""){
        self.title = title
        self.image = image
        self.date = date 
    }
}
    

