import MintStoreItem from "0xMintStoreItem"

// This script reads the next merchant names

// Returns: String
// the array of merchant names

pub fun main(): [String] {

    return MintStoreItem.getMerchantNames()
}