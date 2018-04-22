//
//  Games.swift
//  QuickPlay
//
//  Created by Matthew on 4/22/18.
//  Copyright © 2018 Matthew. All rights reserved.
//

import Foundation
import CoreData
import UIKit

public class Games:NSManagedObject { }
extension Games {
    @NSManaged public var gameName:String?
    @NSManaged public var gameInformation:String?
}
