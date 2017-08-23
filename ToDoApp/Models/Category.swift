//
//  Category.swift
//  ToDoApp
//
//  Created by El Capitan on 8/23/17.
//  Copyright © 2017 DamyanTod. All rights reserved.
//

import Foundation

let areTagsNeeded = "areTagsNeeded"

class Category {
    
    var id : Int
    var name : String
    
    init(name : String, id : Int) {
        self.name = name
        self.id = id
    }
    
    static func getCategoriesLikeStringIfNeeded () -> [String]? {
        if UserDefaults.standard.value(forKey: areTagsNeeded) == nil {
            UserDefaults.standard.setValue(false, forKey: areTagsNeeded)
            return [LocalizedStrings.kCall, LocalizedStrings.kCheck, LocalizedStrings.kGet, LocalizedStrings.kBuy, LocalizedStrings.kClean, LocalizedStrings.kEmailWithSmallFirstLetter, LocalizedStrings.kTake, LocalizedStrings.kSend, LocalizedStrings.kMake,  LocalizedStrings.kPick, LocalizedStrings.kFinish, LocalizedStrings.kDo, LocalizedStrings.kRead, LocalizedStrings.kStudy, LocalizedStrings.kWork, LocalizedStrings.kSchool]
        }
       return nil
    }
    
    static func getCategories() -> [Category] {
        
        let category1 = Category(name: LocalizedStrings.kCall, id: 0)
        let category2 = Category(name: LocalizedStrings.kCheck, id: 1)
        let category3 = Category(name: LocalizedStrings.kGet, id: 2)
        let category4 = Category(name: LocalizedStrings.kBuy, id: 3)
        let category5 = Category(name: LocalizedStrings.kEmailWithSmallFirstLetter, id: 4)
        let category6 = Category(name: LocalizedStrings.kTake, id: 5)
        let category7 = Category(name: LocalizedStrings.kSend, id: 6)
        let category8 = Category(name: LocalizedStrings.kMake, id: 7)
        let category9 = Category(name: LocalizedStrings.kWork, id: 8)
        
        return [category1,category2,category3,category4,category5,category6,category7,category8,category9]
    }
    
}
