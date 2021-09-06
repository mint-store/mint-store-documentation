import MintStoreItem from "0xMintStoreItem"

// This script reads the edition data for a given ID

// Returns: MintStoreItem.EditionData
// The edition data

pub fun main(editionID: UInt32): MintStoreItem.EditionData {

    let item = MintStoreItem.EditionData(editionID: editionID)

    return item

}