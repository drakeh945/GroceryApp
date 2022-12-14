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
        case searchBar
        case promotion
        case categories
        case categoriesItems
        case popularheader
        case populardeals
        case fruitCell
        case descriptionCell
        case priceCell
        case cartCell
    }
    
    
    struct SectionType: RawRepresentable, Hashable {
        typealias RawValue = String
        var rawValue: String
        init(rawValue: String) {
            self.rawValue = rawValue
        }
        // can copy this line for
        static let header = SectionType (rawValue: Section.itemSectionType.header.rawValue)
        static let searchBar = SectionType (rawValue: Section.itemSectionType.searchBar.rawValue)
        static let promotion = SectionType (rawValue: Section.itemSectionType.promotion.rawValue)
        static let categories = SectionType (rawValue: Section.itemSectionType.categories.rawValue)
        static let categoriesItems = SectionType (rawValue: Section.itemSectionType.categoriesItems.rawValue)
        static let popularheader  = SectionType (rawValue: Section.itemSectionType.popularheader.rawValue)
        static let populardeals  = SectionType (rawValue: Section.itemSectionType.populardeals.rawValue)
        static let fruitCell  = SectionType (rawValue: Section.itemSectionType.fruitCell.rawValue)
        static let desriptionCell  = SectionType (rawValue: Section.itemSectionType.descriptionCell.rawValue)
        static let priceCell = SectionType (rawValue: Section.itemSectionType.priceCell.rawValue)
        static let cartCell = SectionType (rawValue:
                    Section.itemSectionType.cartCell.rawValue)
    }
}
