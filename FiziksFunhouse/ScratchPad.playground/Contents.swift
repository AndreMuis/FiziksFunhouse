//: Playground - noun: a place where people can play

import GLKit


// point to an arbitrary direction in 3d space

let Pi : Float = Float(M_PI)

let anglePairs : [(Float, Float)] =
    [
        (+1.0 * Pi / 4.0, 1.0 * Pi / 4.0),
        (-1.0 * Pi / 4.0, 1.0 * Pi / 4.0),
        (+3.0 * Pi / 4.0, 1.0 * Pi / 4.0),
        (-3.0 * Pi / 4.0, 1.0 * Pi / 4.0),
        (+1.0 * Pi / 4.0, 3.0 * Pi / 4.0),
        (-1.0 * Pi / 4.0, 3.0 * Pi / 4.0),
        (+3.0 * Pi / 4.0, 3.0 * Pi / 4.0),
        (-3.0 * Pi / 4.0, 3.0 * Pi / 4.0)
    ]

for anglePair in anglePairs
{
    var someVector : GLKVector3 = GLKVector3Make(1.0, 0.0, 0.0)

    let zAxisRotation : GLKMatrix3 = GLKMatrix3MakeZRotation(anglePair.0)
    let yAxisRotation : GLKMatrix3 = GLKMatrix3MakeYRotation(anglePair.1)
    
    someVector = GLKMatrix3MultiplyVector3(zAxisRotation, someVector)
    someVector = GLKMatrix3MultiplyVector3(yAxisRotation, someVector)

    print("\(someVector.x) \(someVector.y) \(someVector.z)")
}

// all quadrants covered!



// arc4random()

Float(arc4random()) / Float(UINT32_MAX)










