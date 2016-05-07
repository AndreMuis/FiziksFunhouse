//
//  FFHFloat+Random.swift
//  FiziksFunhouse
//
//  Created by Andre Muis on 5/5/16.
//  Copyright © 2016 Andre Muis. All rights reserved.
//

import Foundation

extension Float
{
    static func randomFrom0to1() -> Float
    {
        return Float(arc4random()) / Float(UINT32_MAX)
    }
}
