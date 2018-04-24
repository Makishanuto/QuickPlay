//
//  userModel.swift
//  QuickPlay
//
//  Created by Matthew on 4/22/18.
//  Copyright © 2018 Matthew. All rights reserved.
//

import Foundation
import UIKit
import CoreData

public class UserModel:NSManagedObject { }
extension UserModel {
    @NSManaged public var userName:String?
    @NSManaged public var userDescription:String?
    @NSManaged public var userPicture:Data?
    @NSManaged public var userSummoner:String?
}
