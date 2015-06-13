/*

Copyright (c) 2015 - Alex Leite (al7dev)

Based on IFTTT's Jazz Hands - https://github.com/IFTTT/JazzHands
Copied from Robert Böhnke's RBBAnimation, original available here:
<https://github.com/robb/RBBAnimation/blob/a29cafe2fa91e62573cc9967990b0ad2a6b17a76/RBBAnimation/RBBEasingFunction.m>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/

import Foundation
import UIKit

typealias EasingFunction = (t: Double) -> Double

enum EasingFunctionType {
    case Linear, EaseInQuad, EaseOutQuad, EaseInOutQuad
    case EaseInCubic, EaseOutCubic, EaseInOutCubic
    case EaseInQuart, EaseOutQuart, EaseInOutQuart
    case EaseInBounce, EaseOutBounce
}
    
func easingFunctionWithType(type: EasingFunctionType) -> EasingFunction? {
    var result: EasingFunction?
        
    switch type {

    case .Linear:
        result = { t in t }
        
    case .EaseInQuad:
        result = { t in t * t }
        
    case .EaseOutQuad:
        result = { t in t * (2.0 - t) }
        
    case .EaseInOutQuad:
        result = { t in
            if t < 0.5 {
                return 2.0 * t * t
            }
            else {
                return -1.0 + (4.0 - 2.0 * t) * t
            }
        }
        
    case .EaseInCubic:
        result = { t in t * t * t }
        
    case .EaseOutCubic:
        result = { t in pow(t - 1.0, 3.0) + 1.0 }
        
    case .EaseInOutCubic:
        result = { t in
            
            if t < 0.5 {
                return 4.0 * pow(t, 3.0)
            }
            else {
                return (t - 1.0) * pow(2.0 * t - 2.0, 2.0) + 1.0
            }
        }
            
    case .EaseInQuart:
        result = { t in t * t * t * t }
        
    case .EaseOutQuart:
        result = { t in pow(t - 1.0, 4.0) + 1.0 }
        
    case .EaseInOutQuart:
        result = { t in
            if t < 0.5 {
                return 8.0 * pow(t, 4.0)
            }
            else {
                return -1.0 / 2.0 * pow(2.0 * t - 2.0, 4.0) + 1.0
            }
        }
        
    case .EaseInBounce:
        if let easeOutBounceFunc = easingFunctionWithType(.EaseOutBounce) {
            result = { t in
                return 1.0 - easeOutBounceFunc(t: 1.0 - t)
            }
        }
        result = nil
        
    case .EaseOutBounce:
        result = { t in
            if t < 4.0 / 11.0 {
                return pow(11.0 / 4.0, 2) * pow(t, 2)
            }
            else if t < 8.0 / 11.0 {
                return 3.0 / 4.0 + pow(11.0 / 4.0, 2) * pow(t - 6.0 / 11.0, 2.0)
            }
            if t < 10.0 / 11.0 {
                return 15.0 / 16.0 + pow(11.0 / 4.0, 2.0) * pow(t - 9.0 / 11.0, 2.0)
            }
            else {
                return 63.0 / 64.0 + pow(11.0 / 4.0, 2.0) * pow(t - 21.0 / 22.0, 2.0)
            }
        }
        
    default:
        result = nil
    }

    return result
}