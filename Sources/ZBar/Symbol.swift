import Foundation
import Clibzbar


public class Symbol {
  let wrapper: OpaquePointer

  init(_ wrapper: OpaquePointer) {
    self.wrapper = wrapper
  }

  public var type: SymbolType {
    return SymbolType(rawValue: zbar_symbol_get_type(wrapper).rawValue)!
  }

  public var data: String? {
    let length = zbar_symbol_get_data_length(wrapper)
    if length > 0 {
      return String(utf8String: zbar_symbol_get_data(wrapper))
    } else {
      return nil
    }
  }
}
