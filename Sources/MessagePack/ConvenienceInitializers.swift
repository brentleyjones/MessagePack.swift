import Foundation

extension MessagePackValue {
    public init() {
        self = .nil
    }

    public init(_ value: Bool) {
        self = .bool(value)
    }

    public init(_ value: Int8) {
        self = .int8(value)
    }

    public init(_ value: Int16) {
        self = .int16(value)
    }

    public init(_ value: Int32) {
        self = .int32(value)
    }

    public init(_ value: Int64) {
        self = .int64(value)
    }

    public init(_ value: UInt8) {
        self = .uint8(value)
    }

    public init(_ value: UInt16) {
        self = .uint16(value)
    }

    public init(_ value: UInt32) {
        self = .uint32(value)
    }

    public init(_ value: UInt64) {
        self = .uint64(value)
    }

    public init(_ value: Float) {
        self = .float(value)
    }

    public init(_ value: Double) {
        self = .double(value)
    }

    public init(_ value: String) {
        self = .string(value)
    }

    public init(_ value: [MessagePackValue]) {
        self = .array(value)
    }

    public init(_ value: [MessagePackValue: MessagePackValue]) {
        self = .map(value)
    }

    public init(_ value: Data) {
        self = .binary(value)
    }

    public init(type: Int8, data: Data) {
        self = .extended(type, data)
    }
}
