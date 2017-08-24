//
//  Category.swift
//  ToDoApp
//
//  Created by El Capitan on 8/23/17.
//  Copyright © 2017 DamyanTod. All rights reserved.
//

import Foundation

class CategoryRequest {
    
    var name : String
    
    init(name : String, id : Int) {
        self.name = name
    }

}

extension Category {
    static func getCategoriesLikeStringIfNeeded () -> [String] {
        return [LocalizedStrings.kCall, LocalizedStrings.kCheck, LocalizedStrings.kGet, LocalizedStrings.kBuy, LocalizedStrings.kClean, LocalizedStrings.kEmailWithSmallFirstLetter, LocalizedStrings.kTake, LocalizedStrings.kSend, LocalizedStrings.kMake,  LocalizedStrings.kPick, LocalizedStrings.kFinish, LocalizedStrings.kDo, LocalizedStrings.kRead, LocalizedStrings.kStudy, LocalizedStrings.kWork, LocalizedStrings.kSchool]

    }
}
