import Clibzbar


public class ImageScanner {
  let wrapper: OpaquePointer

  public init() {
    wrapper = zbar_image_scanner_create()
  }

  deinit {
    zbar_image_scanner_destroy(wrapper)
  }

  public func scan(image: Image) -> SymbolGenerator {
    let _ = zbar_scan_image(wrapper, image.wrapper)
    return SymbolGenerator(image: image)
  }

  public func enable(symbolType: SymbolType) {
    zbar_image_scanner_set_config(wrapper, zbar_symbol_type_t(symbolType.rawValue), ZBAR_CFG_ENABLE, 1)
  }
}

public struct SymbolGenerator: Sequence, IteratorProtocol {
  let image: Image
  var cursor: OpaquePointer?

  init(image: Image) {
    self.image = image
    self.cursor = zbar_image_first_symbol(image.wrapper)
  }

  public mutating func next() -> Symbol? {
    guard cursor != nil else {
      return nil
    }
    defer {
      cursor = zbar_symbol_next(cursor)
    }
    return Symbol(cursor!)
  }
}
