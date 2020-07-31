//
//  FFHEnumerations.swift
//  FiziksFunhouse
//
//  Created by Andre Muis on 5/4/16.
//  Copyright © 2016 Andre Muis. All rights reserved.
//

import UIKit

enum FFHBallType: String, CaseIterable
{
    case Small = "Small"
    case Medium = "Medium"
    case Large = "Large"
    case Destroyer = "Destroyer"
    
    static var valueCount: Int
    {
        get
        {
            return FFHBallType.allCases.count
        }
    }
    
    var categoryBitMask: Int
    {
        get
        {
            switch self
            {
            case .Small:
                return Constants.ballNormalCategoryBitMask
                
            case .Medium:
                return Constants.ballNormalCategoryBitMask
                
            case .Large:
                return Constants.ballNormalCategoryBitMask
                
            case .Destroyer:
                return Constants.ballDestroyerCategoryBitMask
            }
        }
    }

    var radius: CGFloat
    {
        get
        {
            switch self
            {
            case .Small:
                return 0.8 * Constants.ballBaseRadius
                
            case .Medium:
                return Constants.ballBaseRadius
                
            case .Large:
                return 1.2 * Constants.ballBaseRadius
                
            case .Destroyer:
                return Constants.ballBaseRadius
            }
        }
    }
    
    var color: UIColor
    {
        get
        {
            switch self
            {
            case .Small:
                return UIColor.green
                
            case .Medium:
                return UIColor.blue
                
            case .Large:
                return UIColor.red
                
            case .Destroyer:
                return UIColor.yellow
            }
        }
    }

    static func contains(value: FFHBallType) -> Bool
    {
        return FFHBallType.allCases.contains(value)
    }

    static func valueAtIndex(index: Int) -> FFHBallType?
    {
        let value: FFHBallType?
        
        if (FFHBallType.allCases.indices.contains(index) == true)
        {
            value = FFHBallType.allCases[index]
        }
        else
        {
            value = nil
        }
        
        return value
    }
}


