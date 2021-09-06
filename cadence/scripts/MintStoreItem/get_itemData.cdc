import MintStoreItem from "0xMintStoreItem"

// This script borrows the MintStoreItems associated to an account

// Returns: 
// The nft data

pub fun main(addr: Address, tokenID: UInt64): MintStoreItem.ItemData {

    let recipient = getAccount(addr)


    // get the Collection reference for the receiver
    let accountRef = recipient.getCapability(MintStoreItem.CollectionPublicPath).borrow<&{MintStoreItem.MintStoreItemCollectionPublic}>()
        ?? panic("Cannot borrow a reference to the recipient's MintStoreItem collection")

    let itemRef = accountRef.borrowMintStoreItem(id: tokenID) 
          ?? panic("Cannot borrow a reference to the Collection's MintStoreItem")

    return itemRef.data       
}