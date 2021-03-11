//
//  DashboardViewModel.swift
//  Eria
//
//  Created by Magicmind on 16/02/21.
//

import UIKit

enum DashboardTableCellType: Int {
    case category = 0
    case favourite = 1
    case filter = 2
    case foods = 3
}

class DashboardViewModel: NSObject {

}



class DashboardCategoryTableViewCellModel {
    let cellType    = DashboardTableCellType.category.rawValue
    let images     : [String]!
    
    init(images : [String]) {
        self.images = images
    }
}

class DashboardFavouriteTableViewCellModel {
    let cellType = DashboardTableCellType.favourite.rawValue

    let foodImage   : String!
    let foodTitle   : String!
    let timeLeft    : String!
    
    init(foodImage : String, foodTitle : String, timeLeft : String) {
        self.foodImage = foodImage
        self.foodTitle = foodTitle
        self.timeLeft = timeLeft
    }
}

class DashboardFilterTableViewCellModel {
    let cellType = DashboardTableCellType.filter.rawValue
    let brandImage   : String!
    
    init(brandImage : String) {
        self.brandImage = brandImage
    }
}
