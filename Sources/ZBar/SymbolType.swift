import libzbar


public enum SymbolType : UInt32 {
  case None = 0      /**< no symbol decoded */
  case Partial = 1   /**< intermediate status */
  case EAN8 = 8      /**< EAN-8 */
  case UPCE = 9      /**< UPC-E */
  case ISBN10 = 10   /**< ISBN-10 (from EAN-13). @since 0.4 */
  case UPCA = 12     /**< UPC-A */
  case EAN13 = 13    /**< EAN-13 */
  case ISBN13 = 14   /**< ISBN-13 (from EAN-13). @since 0.4 */
  case I25 = 25      /**< Interleaved 2 of 5. @since 0.4 */
  case CODE39 = 39   /**< Code 39. @since 0.4 */
  case PDF417 = 57   /**< PDF417. @since 0.6 */
  case QRCODE = 64   /**< QR Code. @since 0.10 */
  case CODE128 = 128 /**< Code 128 */
}
