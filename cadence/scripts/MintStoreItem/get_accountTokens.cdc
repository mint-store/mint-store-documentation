
import MintStoreItem from "0xMintStoreItem"

// This script reads the MintStoreItems associated to an account

// Returns: [UInt64]
// The array of NFT IDs in the account collection 

pub fun main(addr: Address): [UInt64] {

    let recipient = getAccount(addr)


    // get the Collection reference for the receiver
    let accountRef = recipient.getCapability(MintStoreItem.CollectionPublicPath).borrow<&{MintStoreItem.MintStoreItemCollectionPublic}>()
        ?? panic("Cannot borrow a reference to the recipient's MintStoreItem collection")


    return accountRef.getIDs()
}