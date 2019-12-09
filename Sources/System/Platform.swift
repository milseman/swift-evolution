
#if os(macOS) || os(iOS) || os(watchOS) || os(tvOS)
import Darwin
#else
#error("FIXME: Linux support, other platform support")
#endif

// Types
public typealias CChar = Int8
public typealias CInt = Int32
public typealias CUInt32T = UInt32
public typealias CUInt = u_int

public typealias CModeT = mode_t
public typealias COffsetT = off_t

public typealias CFILE = FILE

public typealias CACLT = acl_t
public typealias CACLTagT = acl_tag_t
public typealias CACLFlagT = acl_flag_t
public typealias CACLEntryT = acl_entry_t
public typealias CACLPermT = acl_perm_t

public typealias CDevT = dev_t
public typealias CNLinkT = nlink_t
public typealias CStat = stat
public typealias CInoT = ino_t
public typealias CUIDT = uid_t
public typealias CGIDT = gid_t
public typealias CTimespec = timespec
public typealias CTimeT = time_t

// Internal types
internal typealias CFStoreT = fstore_t
internal typealias CFPunchholdT = fpunchhole_t
internal typealias CRAdvisory = radvisory
internal typealias CLog2Phys = log2phys

// MARK: - Values

internal var _eof: CInt { EOF }

#if os(macOS) || os(iOS) || os(watchOS) || os(tvOS)
internal var _errno: CInt {
  get { Darwin.errno }
  set { Darwin.errno = newValue }
}
#else
#error("FIXME: Linux support, other platform support")
#endif

internal var _O_RDONLY: CInt { O_RDONLY }
internal var _O_WRONLY: CInt { O_WRONLY }
internal var _O_RDWR: CInt { O_RDWR }

internal var _O_NONBLOCK: CInt { O_NONBLOCK }
internal var _O_APPEND: CInt { O_APPEND }
internal var _O_CREAT: CInt { O_CREAT }
internal var _O_TRUNC: CInt { O_TRUNC }
internal var _O_EXCL: CInt { O_EXCL }
internal var _O_SHLOCK: CInt { O_SHLOCK }
internal var _O_EXLOCK: CInt { O_EXLOCK }
internal var _O_NOFOLLOW: CInt { O_NOFOLLOW }
internal var _O_SYMLINK: CInt { O_SYMLINK }
internal var _O_EVTONLY: CInt { O_EVTONLY }
internal var _O_CLOEXEC: CInt { O_CLOEXEC }

internal var _SEEK_SET: CInt { SEEK_SET }
internal var _SEEK_CUR: CInt { SEEK_CUR }
internal var _SEEK_END: CInt { SEEK_END }
internal var _SEEK_HOLE: CInt { SEEK_HOLE }
internal var _SEEK_DATA: CInt { SEEK_DATA }

internal var _UF_NODUMP: CUInt { CUInt(bitPattern: UF_NODUMP) }
internal var _UF_IMMUTABLE: CUInt { CUInt(bitPattern: UF_IMMUTABLE) }
internal var _UF_APPEND: CUInt { CUInt(bitPattern: UF_APPEND) }
internal var _UF_OPAQUE: CUInt { CUInt(bitPattern: UF_OPAQUE) }
internal var _UF_HIDDEN: CUInt { CUInt(bitPattern: UF_HIDDEN) }
internal var _SF_ARCHIVED: CUInt { CUInt(bitPattern: SF_ARCHIVED) }
internal var _SF_IMMUTABLE: CUInt { CUInt(bitPattern: SF_IMMUTABLE) }
internal var _SF_APPEND: CUInt { CUInt(bitPattern: SF_APPEND) }

internal var _S_IFMT: CModeT { S_IFMT }
internal var _S_IFIFO: CModeT { S_IFIFO }
internal var _S_IFCHR: CModeT { S_IFCHR }
internal var _S_IFDIR: CModeT { S_IFDIR }
internal var _S_IFBLK: CModeT { S_IFBLK }
internal var _S_IFREG: CModeT { S_IFREG }
internal var _S_IFLNK: CModeT { S_IFLNK }
internal var _S_IFSOCK: CModeT { S_IFSOCK }
internal var _S_IFWHT: CModeT { S_IFWHT }

internal var _MAXPATHLEN: CInt { MAXPATHLEN }

// fcntl
internal var _F_DUPFD_CLOEXEC: CInt { F_DUPFD_CLOEXEC }
internal var _F_DUPFD: CInt { F_DUPFD }
internal var _F_GETFD: CInt { F_GETFD }
internal var _F_SETFD: CInt { F_SETFD }
internal var _F_GETFL: CInt { F_GETFL }
internal var _F_SETFL: CInt { F_SETFL }
internal var _F_GETOWN: CInt { F_GETOWN }
internal var _F_SETOWN: CInt { F_SETOWN }
internal var _F_GETPATH_NOFIRMLINK: CInt { F_GETPATH_NOFIRMLINK }
internal var _F_GETPATH: CInt { F_GETPATH }
internal var _F_PEOFPOSMODE: CInt { F_PEOFPOSMODE }
internal var _F_PREALLOCATE: CInt { F_PREALLOCATE }
internal var _F_PUNCHHOLE: CInt { F_PUNCHHOLE }
internal var _F_SETSIZE: CInt { F_SETSIZE }
internal var _F_RDADVISE: CInt { F_RDADVISE }
internal var _F_RDAHEAD: CInt { F_RDAHEAD }
internal var _F_NOCACHE: CInt { F_NOCACHE }
internal var _F_LOG2PHYS: CInt { F_LOG2PHYS }
internal var _F_LOG2PHYS_EXT: CInt { F_LOG2PHYS_EXT }
internal var _F_BARRIERFSYNC: CInt { F_BARRIERFSYNC }
internal var _F_FULLFSYNC: CInt { F_FULLFSYNC }
internal var _F_SETNOSIGPIPE: CInt { F_SETNOSIGPIPE }
internal var _F_GETNOSIGPIPE: CInt { F_GETNOSIGPIPE }

// ACL permissions
internal var _ACL_READ_DATA: CACLPermT { ACL_READ_DATA }
internal var _ACL_LIST_DIRECTORY: CACLPermT { ACL_LIST_DIRECTORY }
internal var _ACL_WRITE_DATA: CACLPermT { ACL_WRITE_DATA }
internal var _ACL_ADD_FILE: CACLPermT { ACL_ADD_FILE }
internal var _ACL_EXECUTE: CACLPermT { ACL_EXECUTE }
internal var _ACL_SEARCH: CACLPermT { ACL_SEARCH }
internal var _ACL_DELETE: CACLPermT { ACL_DELETE }
internal var _ACL_APPEND_DATA: CACLPermT { ACL_APPEND_DATA }
internal var _ACL_ADD_SUBDIRECTORY: CACLPermT { ACL_ADD_SUBDIRECTORY }
internal var _ACL_DELETE_CHILD: CACLPermT { ACL_DELETE_CHILD }
internal var _ACL_READ_ATTRIBUTES: CACLPermT { ACL_READ_ATTRIBUTES }
internal var _ACL_WRITE_ATTRIBUTES: CACLPermT { ACL_WRITE_ATTRIBUTES }
internal var _ACL_READ_EXTATTRIBUTES: CACLPermT { ACL_READ_EXTATTRIBUTES }
internal var _ACL_WRITE_EXTATTRIBUTES: CACLPermT { ACL_WRITE_EXTATTRIBUTES }
internal var _ACL_READ_SECURITY: CACLPermT { ACL_READ_SECURITY }
internal var _ACL_WRITE_SECURITY: CACLPermT { ACL_WRITE_SECURITY }
internal var _ACL_CHANGE_OWNER: CACLPermT { ACL_CHANGE_OWNER }
internal var _ACL_SYNCHRONIZE: CACLPermT { ACL_SYNCHRONIZE }

// ACL tags
internal var _ACL_UNDEFINED_TAG: CACLTagT { ACL_UNDEFINED_TAG }
internal var _ACL_EXTENDED_ALLOW: CACLTagT { ACL_EXTENDED_ALLOW }
internal var _ACL_EXTENDED_DENY: CACLTagT { ACL_EXTENDED_DENY }

// ACL flags
internal var _ACL_FLAG_DEFER_INHERIT: CACLFlagT { ACL_FLAG_DEFER_INHERIT }
internal var _ACL_FLAG_NO_INHERIT: CACLFlagT { ACL_FLAG_NO_INHERIT }
internal var _ACL_ENTRY_INHERITED: CACLFlagT { ACL_ENTRY_INHERITED }
internal var _ACL_ENTRY_FILE_INHERIT: CACLFlagT { ACL_ENTRY_FILE_INHERIT }
internal var _ACL_ENTRY_DIRECTORY_INHERIT: CACLFlagT { ACL_ENTRY_DIRECTORY_INHERIT }
internal var _ACL_ENTRY_LIMIT_INHERIT: CACLFlagT { ACL_ENTRY_LIMIT_INHERIT }
internal var _ACL_ENTRY_ONLY_INHERIT: CACLFlagT { ACL_ENTRY_ONLY_INHERIT }

// MARK: - System Calls

internal func _fcntl(_ fd: Int32, _ cmd: Int32) -> Int32 {
  fcntl(fd, cmd)
}
internal func _fcntl(_ fd: Int32, _ cmd: Int32, _ value: Int32) -> Int32 {
  fcntl(fd, cmd, value)
}
internal func _fcntl(_ fd: Int32, _ cmd: Int32, _ ptr: UnsafeMutableRawPointer) -> Int32 {
  fcntl(fd, cmd, ptr)
}

internal func _open(_ path: UnsafePointer<CChar>, _ oflag: Int32) -> Int32 {
  open(path, oflag)
}
internal func _open(
  _ path: UnsafePointer<CChar>, _ oflag: Int32, _ mode: mode_t
) -> Int32 {
  open(path, oflag, mode)
}

internal let _close = close
internal let _read = read
internal let _pread = pread
internal let _lseek = lseek

internal let _fopen = fopen
internal let _fclose = fclose
internal let _fwrite = fwrite
internal let _fread = fread
internal let _setbuffer = setbuffer
internal let _fflush = fflush

internal let _fchflags = fchflags
internal let _chflags = chflags

// C stdlib
internal let _strlen = strlen

// ACL
internal let _acl_init = acl_init
internal let _acl_dup = acl_dup
internal let _acl_free = acl_free

