//
//  Utility.swift
//  NYTimesAssignment
//
//  Created by Vikas Singh on 08/08/18.
//  Copyright © 2018 XYZ. All rights reserved.
//

import UIKit

class Utility: NSObject {

    class func date_monthDayYear(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    
    class func dateString_monthDayYear(date: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.date(from: date)!
    }
}
