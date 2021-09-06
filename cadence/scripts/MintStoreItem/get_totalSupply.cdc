// import MintStoreItem from "../../contracts/MintStoreItem.cdc"
//emulator
import MintStoreItem from "0xMintStoreItem"

// This script reads the current number of NFTs that have been minted
// from the MintStoreItem contract and returns that number to the caller

// Returns: UInt64
// Number of MintStoreItems minted

pub fun main(): UInt64 {

    return MintStoreItem.totalSupply
}