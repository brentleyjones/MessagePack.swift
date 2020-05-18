import Foundation
import XCTest
@testable import MessagePack

class ConvenienceInitializersTests: XCTestCase {
    static var allTests = {
        return [
            ("testNil", testNil),
            ("testBool", testBool),
            ("testUInt", testUInt),
            ("testInt", testInt),
            ("testFloat", testFloat),
            ("testDouble", testDouble),
            ("testString", testString),
            ("testArray", testArray),
            ("testMap", testMap),
            ("testBinary", testBinary),
            ("testExtended", testExtended),
        ]
    }()

    func testNil() {
        XCTAssertEqual(MessagePackValue(), MessagePackValue.nil)
    }

    func testBool() {
        XCTAssertEqual(MessagePackValue(true), MessagePackValue.bool(true))
        XCTAssertEqual(MessagePackValue(false), MessagePackValue.bool(false))
    }

    func testUInt() {
        XCTAssertEqual(MessagePackValue(0 as UInt8), MessagePackValue.uint8(0))
        XCTAssertEqual(MessagePackValue(0xff as UInt8), MessagePackValue.uint8(0xff))
        XCTAssertEqual(MessagePackValue(0xffff as UInt16), MessagePackValue.uint16(0xffff))
        XCTAssertEqual(MessagePackValue(0xffff_ffff as UInt32), MessagePackValue.uint32(0xffff_ffff))
        XCTAssertEqual(MessagePackValue(0xffff_ffff_ffff_ffff as UInt64), MessagePackValue.uint64(0xffff_ffff_ffff_ffff))
    }

    func testInt() {
        XCTAssertEqual(MessagePackValue(-1 as Int8), MessagePackValue.int8(-1))
        XCTAssertEqual(MessagePackValue(-0x7f as Int8), MessagePackValue.int8(-0x7f))
        XCTAssertEqual(MessagePackValue(-0x7fff as Int16), MessagePackValue.int16(-0x7fff))
        XCTAssertEqual(MessagePackValue(-0x7fff_ffff as Int32), MessagePackValue.int32(-0x7fff_ffff))
        XCTAssertEqual(MessagePackValue(-0x7fff_ffff_ffff_ffff as Int64), MessagePackValue.int64(-0x7fff_ffff_ffff_ffff))
    }

    func testFloat() {
        XCTAssertEqual(MessagePackValue(0 as Float), MessagePackValue.float(0))
        XCTAssertEqual(MessagePackValue(1.618 as Float), MessagePackValue.float(1.618))
        XCTAssertEqual(MessagePackValue(3.14 as Float), MessagePackValue.float(3.14))
    }

    func testDouble() {
        XCTAssertEqual(MessagePackValue(0 as Double), MessagePackValue.double(0))
        XCTAssertEqual(MessagePackValue(1.618 as Double), MessagePackValue.double(1.618))
        XCTAssertEqual(MessagePackValue(3.14 as Double), MessagePackValue.double(3.14))
    }

    func testString() {
        XCTAssertEqual(MessagePackValue("Hello, world!"), MessagePackValue.string("Hello, world!"))
    }


    func testArray() {
        XCTAssertEqual(MessagePackValue([.uint8(0), .uint8(1), .uint8(2), .uint8(3), .uint8(4)]), MessagePackValue.array([.uint8(0), .uint8(1), .uint8(2), .uint8(3), .uint8(4)]))
    }

    func testMap() {
        XCTAssertEqual(MessagePackValue([.string("c"): .string("cookie")]), MessagePackValue.map([.string("c"): .string("cookie")]))
    }

    func testBinary() {
        let data = Data([0x00, 0x01, 0x02, 0x03, 0x04])
        XCTAssertEqual(MessagePackValue(data), MessagePackValue.binary(data))
    }

    func testExtended() {
        let type: Int8 = 9
        let data = Data([0x00, 0x01, 0x02, 0x03, 0x04])
        XCTAssertEqual(MessagePackValue(type: type, data: data), MessagePackValue.extended(type, data))
    }
}
