import MintStoreItem from "0xMintStoreItem"

// This script reads the Merchant Name for a given ID

// Returns: String
// The merchant name

pub fun main(merchantID: UInt32): String? {

    return MintStoreItem.getMerchant(merchantID:merchantID)
}