import MintStoreItem from "0xMintStoreItem"

// This script reads the merchant IDs initialized in the MintStoreItem contract

// Returns: [UInt32]
// Array of MerchantIDs

pub fun main(): [UInt32] {

    return MintStoreItem.getMerchantIDs()
}