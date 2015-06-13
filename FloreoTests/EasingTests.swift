import UIKit
import XCTest

class EasingTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testLinear() {
        if let function = easingFunctionWithType(.Linear) {
            XCTAssert(function(t: 10.0) == 10.0, "Linear function logic passed")
        }
        else {
            XCTFail("Couldn't unwrap function")
        }
    }
    
    func testEaseInQuadratic() {
        if let function = easingFunctionWithType(.EaseInQuad) {
            XCTAssert(function(t: 10.0) == 100.0, "Quad Ease In logic passed")
        }
        else {
            XCTFail("Couldn't unwrap function")
        }
    }
    
    //-- SET REMAINING TESTS LATER
}
