//
//  UIApplication.swift
//  Podcasts
//
//  Created by Денис Попов on 10.03.2018.
//  Copyright © 2018 Денис Попов. All rights reserved.
//

import UIKit

extension UIApplication {
    static func mainTabBarController() -> MainTabBarController? {
//        UIApplication.shared.keyWindow?.rootViewController as? MainTabBarController
        
        
        return shared.keyWindow?.rootViewController as? MainTabBarController
    }
}
