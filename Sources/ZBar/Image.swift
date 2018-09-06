import Clibzbar


public class Image {
  let wrapper: OpaquePointer

  public init(format: Format, width: Int, height: Int, buffer: UnsafeRawPointer) {
    wrapper = zbar_image_create()
    zbar_image_set_size(wrapper, UInt32(width), UInt32(height))
    switch format {
      case .Y800:
        zbar_image_set_format(wrapper, format.rawValue)
        zbar_image_set_data(wrapper, buffer, UInt(width * height), nil)
    }
  }

  deinit {
    zbar_image_destroy(wrapper)
  }

  public var symbols: SymbolGenerator {
    return SymbolGenerator(image:self)
  }

  public enum Format : UInt {
    case Y800 = 0x30303859
  }
}
