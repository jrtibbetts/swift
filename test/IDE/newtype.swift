// RUN: %target-swift-ide-test(mock-sdk: %clang-importer-sdk) -I %t -I %S/Inputs/custom-modules -print-module -source-filename %s -module-to-print=Newtype > %t.printed.A.txt
// RUN: FileCheck %s -check-prefix=PRINT -strict-whitespace < %t.printed.A.txt
// REQUIRES: objc_interop

// PRINT-LABEL: struct ErrorDomain : RawRepresentable {
// PRINT-NEXT:    init(rawValue: NSString)
// PRINT-NEXT:    let rawValue: NSString
// PRINT-NEXT:  }
// PRINT-NEXT:  extension ErrorDomain {
// PRINT-NEXT:    func process()
// PRINT-NEXT:    static let one: ErrorDomain
// PRINT-NEXT:    static let errTwo: ErrorDomain
// PRINT-NEXT:    static let three: ErrorDomain
// PRINT-NEXT:    static let fourErrorDomain: ErrorDomain
// PRINT-NEXT:    static let stillAMember: ErrorDomain
// PRINT-NEXT:  }
// PRINT-NEXT:  struct Foo {
// PRINT-NEXT:    init()
// PRINT-NEXT:  }
// PRINT-NEXT:  extension Foo {
// PRINT-NEXT:    static let err: ErrorDomain
// PRINT-NEXT:  }
//
// TODO: update test when we can import it as actual new enum
// PRINT-LABEL: struct ClosedEnum : RawRepresentable {
// PRINT-NEXT:    init(rawValue: NSString)
// PRINT-NEXT:    let rawValue: NSString
// PRINT-NEXT:  }
// PRINT-NEXT:  extension ClosedEnum {
// PRINT-NEXT:    static let firstClosedEntryEnum: ClosedEnum
// PRINT-NEXT:    static let secondEntry: ClosedEnum
// PRINT-NEXT:    static let thirdEntry: ClosedEnum
// PRINT-NEXT:  }
