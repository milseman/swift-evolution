public struct ACLPermissions: OptionSet {
  public let rawValue: CACLPermT
  public init(rawValue: CACLPermT) { self.rawValue = rawValue }
  fileprivate init(_ raw: CACLPermT) { self.init(rawValue: raw) }

  // ACL_READ_DATA
  public static var readData: ACLPermissions {
    ACLPermissions(_ACL_READ_DATA)
  }

  // ACL_LIST_DIRECTORY
  public static var listDirectory: ACLPermissions {
    ACLPermissions(_ACL_LIST_DIRECTORY)
  }

  // ACL_WRITE_DATA
  public static var writeData: ACLPermissions {
    ACLPermissions(_ACL_WRITE_DATA)
  }

  // ACL_ADD_FILE
  public static var addFile: ACLPermissions {
    ACLPermissions(_ACL_ADD_FILE)
  }

  // ACL_EXECUTE
  public static var execute: ACLPermissions {
    ACLPermissions(_ACL_EXECUTE)
  }

  // ACL_SEARCH
  public static var search: ACLPermissions {
    ACLPermissions(_ACL_SEARCH)
  }

  // ACL_DELETE
  public static var delete: ACLPermissions {
    ACLPermissions(_ACL_DELETE)
  }

  // ACL_APPEND_DATA
  public static var appendData: ACLPermissions {
    ACLPermissions(_ACL_APPEND_DATA)
  }

  // ACL_ADD_SUBDIRECTORY
  public static var addSubdirectory: ACLPermissions {
    ACLPermissions(_ACL_ADD_SUBDIRECTORY)
  }

  // ACL_DELETE_CHILD
  public static var deleteChild: ACLPermissions {
    ACLPermissions(_ACL_DELETE_CHILD)
  }

  // ACL_READ_ATTRIBUTES
  public static var readAttributes: ACLPermissions {
    ACLPermissions(_ACL_READ_ATTRIBUTES)
  }

  // ACL_WRITE_ATTRIBUTES
  public static var writeAttributes: ACLPermissions {
    ACLPermissions(_ACL_WRITE_ATTRIBUTES)
  }

  // ACL_READ_EXTATTRIBUTES
  public static var readExtAttributes: ACLPermissions {
    ACLPermissions(_ACL_READ_EXTATTRIBUTES)
  }

  // ACL_WRITE_EXTATTRIBUTES
  public static var writeExtAttributes: ACLPermissions {
    ACLPermissions(_ACL_WRITE_EXTATTRIBUTES)
  }

  // ACL_READ_SECURITY
  public static var readSecurity: ACLPermissions {
    ACLPermissions(_ACL_READ_SECURITY)
  }

  // ACL_WRITE_SECURITY
  public static var writeSecurity: ACLPermissions {
    ACLPermissions(_ACL_WRITE_SECURITY)
  }

  // ACL_CHANGE_OWNER
  public static var changeWwner: ACLPermissions {
    ACLPermissions(_ACL_CHANGE_OWNER)
  }

  // ACL_SYNCHRONIZE
  public static var synchronize: ACLPermissions {
    ACLPermissions(_ACL_SYNCHRONIZE)
  }

  // Below needed for SetAlgebra conformance since acl_perm_t is a struct in Darwin overlay
  public init() { self.init(RawValue(rawValue: 0)) }

  public mutating func formUnion(_ other: __owned Self) {
    self = Self(rawValue: RawValue(self.rawValue.rawValue | other.rawValue.rawValue))
  }

  public mutating func formIntersection(_ other: Self) {
    self = Self(rawValue: RawValue(self.rawValue.rawValue & other.rawValue.rawValue))
  }

  public mutating func formSymmetricDifference(_ other: __owned Self) {
    self = Self(rawValue: RawValue(self.rawValue.rawValue ^ other.rawValue.rawValue))
  }
}

// TODO: Darwin module imports acl_tag_t as a struct, but isn't this exclusive?
public struct ACLTag: RawRepresentable {
  public var rawValue: CACLTagT
  public init(rawValue: CACLTagT) { self.rawValue = rawValue }

  // ACL_UNDEFINED_TAG
  public static var undefined: ACLTag { ACLTag(rawValue: _ACL_UNDEFINED_TAG) }

  // ACL_EXTENDED_ALLOW
  public static var allow: ACLTag { ACLTag(rawValue: _ACL_EXTENDED_ALLOW) }

  // ACL_EXTENDED_DENY
  public static var deny: ACLTag { ACLTag(rawValue: _ACL_EXTENDED_DENY) }
}

public struct ACLEntryFlags: OptionSet {
  public let rawValue: CACLFlagT
  public init(rawValue: CACLFlagT) { self.rawValue = rawValue }
  fileprivate init(_ raw: CACLFlagT) { self.init(rawValue: raw) }

  // ACL_FLAG_DEFER_INHERIT
  public static var flagDeferInherit: ACLEntryFlags {
    ACLEntryFlags(_ACL_FLAG_DEFER_INHERIT)
  }

  // ACL_FLAG_NO_INHERIT
  public static var flagNoInherit: ACLEntryFlags {
    ACLEntryFlags(_ACL_FLAG_NO_INHERIT)
  }

  // ACL_ENTRY_INHERITED
  public static var entryInherited: ACLEntryFlags {
    ACLEntryFlags(_ACL_ENTRY_INHERITED)
  }

  // ACL_ENTRY_FILE_INHERIT
  public static var entryFileInherit: ACLEntryFlags {
    ACLEntryFlags(_ACL_ENTRY_FILE_INHERIT)
  }

  // ACL_ENTRY_DIRECTORY_INHERIT
  public static var entryDirectoryInherit: ACLEntryFlags {
    ACLEntryFlags(_ACL_ENTRY_DIRECTORY_INHERIT)
  }

  // ACL_ENTRY_LIMIT_INHERIT
  public static var entryLimitInherit: ACLEntryFlags {
    ACLEntryFlags(_ACL_ENTRY_LIMIT_INHERIT)
  }

  // ACL_ENTRY_ONLY_INHERIT
  public static var entryOnlyInherit: ACLEntryFlags {
    ACLEntryFlags(_ACL_ENTRY_ONLY_INHERIT)
  }

  // Below needed for SetAlgebra conformance since acl_tag_t is a struct in Darwin overlay
  public init() { self.init(RawValue(rawValue: 0)) }

  public mutating func formUnion(_ other: __owned Self) {
    self = Self(rawValue: RawValue(self.rawValue.rawValue | other.rawValue.rawValue))
  }

  public mutating func formIntersection(_ other: Self) {
    self = Self(rawValue: RawValue(self.rawValue.rawValue & other.rawValue.rawValue))
  }

  public mutating func formSymmetricDifference(_ other: __owned Self) {
    self = Self(rawValue: RawValue(self.rawValue.rawValue ^ other.rawValue.rawValue))
  }
}

public struct ACLHandle: RawRepresentable {
  public let rawValue: CACLT
  public init(rawValue: CACLT) { self.rawValue = rawValue }
  fileprivate init(_ raw: CACLT) { self.init(rawValue: raw) }
}

extension ACLHandle {
  public static func create(count: Int) throws -> ACLHandle {
    guard let ptr = _acl_init(CInt(count)) else { throw errno }
    return ACLHandle(ptr)
  }

  public func duplicate() throws -> ACLHandle {
    guard let ptr = _acl_dup(self.rawValue) else { throw errno }
    return ACLHandle(ptr)
  }

  public func free() throws {
    guard _acl_free(UnsafeMutableRawPointer(self.rawValue)) == 0 else { throw errno }
  }

  // ...
}

public struct ACLEntryHandle: RawRepresentable {
  public let rawValue: CACLEntryT
  public init(rawValue: CACLEntryT) { self.rawValue = rawValue }
  fileprivate init(_ raw: CACLEntryT) { self.init(rawValue: raw) }
}

extension ACLEntryHandle {
  // ...
}

