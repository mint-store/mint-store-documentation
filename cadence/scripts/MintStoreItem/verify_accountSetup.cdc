
import MintStoreItem from "0xMintStoreItem"

// This script verifies if the account is setup for MintStoreItems 

// Returns: 
// true if the address has the collection capability

pub fun main(addr: Address): Bool {

    let recipient = getAccount(addr)


    // get the Collection reference for the receiver
    let accountRef = recipient.getCapability(MintStoreItem.CollectionPublicPath).borrow<&{MintStoreItem.MintStoreItemCollectionPublic}>()
        ?? panic("Cannot borrow a reference to the recipient's MintStoreItem collection")


    return true
}