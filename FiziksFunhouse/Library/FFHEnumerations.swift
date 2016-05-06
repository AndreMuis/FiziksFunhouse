//
//  FFHEnumerations.swift
//  FiziksFunhouse
//
//  Created by Andre Muis on 5/4/16.
//  Copyright © 2016 Andre Muis. All rights reserved.
//

enum FFHBallType : String
{
    case Small = "Small"
    case Medium = "Medium"
    case Large = "Large"
    case Destroyer = "Destroyer"
    
    private static let allValues = [Small, Medium, Large, Destroyer]

    static var valueCount : Int
    {
        get
        {
            return FFHBallType.allValues.count
        }
    }
    
    static func contains(value value : FFHBallType) -> Bool
    {
        return FFHBallType.allValues.contains(value)
    }

    static func valueAtIndex(index : Int) -> FFHBallType?
    {
        let value : FFHBallType?
        
        if (FFHBallType.allValues.indices.contains(index) == true)
        {
            value = FFHBallType.allValues[index]
        }
        else
        {
            value = nil
        }
        
        return value
    }
}


