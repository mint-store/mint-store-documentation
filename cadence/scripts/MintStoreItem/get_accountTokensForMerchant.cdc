
import MintStoreItem from "0xMintStoreItem"

// This script reads the MintStoreItems associated to an account

// Returns: [UInt64]
// The array of NFT IDs in the account collection for a given merchant ID

pub fun main(addr: Address, merchantID: UInt32): [UInt64] {

    let recipient = getAccount(addr)


    // get the Collection reference for the receiver
    let accountRef = recipient.getCapability(MintStoreItem.CollectionPublicPath).borrow<&{MintStoreItem.MintStoreItemCollectionPublic}>()
        ?? panic("Cannot borrow a reference to the recipient's MintStoreItem collection")


    let ids: [UInt64] = []

    let mintStoreIDs = accountRef.getIDs();
    for tokenID in mintStoreIDs {

        let nft = accountRef!.borrowMintStoreItem(id: tokenID)
        let merchantName = MintStoreItem.getMerchant(merchantID:nft!.data.merchantID)!
        if nft!.data.merchantID == merchantID {
            ids.append(tokenID)
        }
    }

    return ids;
}