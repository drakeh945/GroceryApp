//
//  Section.swift
//  GroceryApp
//
//  Created by Drake Herring on 12/1/22.
//

import Foundation


struct Section: Hashable {
    let id = UUID()
    let type: SectionType
    let title: String
    let subtitle: String
    let items: [Item]

    init(type:SectionType, title:String = "", subtitle:String = "", items:[Item] = []){
        self.type = type
        self.title = title
        self.subtitle = subtitle
        self.items = items
    }
     // pair with static 
    enum itemSectionType:String {
        case header
        
    }
    struct SectionType: RawRepresentable, Hashable {
        typealias RawValue = String
        var rawValue: String
        init(rawValue: String) {
            self.rawValue = rawValue
        }
      // can copy this line for
        static let header = SectionType (rawValue: Section.itemSectionType.header.rawValue)
    }
}
