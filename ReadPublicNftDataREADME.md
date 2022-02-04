<h1>Read NFT Public Data</h1>

A MintStoreItem is a non-fungible token with specific properties. As a rule, each minted item belongs to a larger group, called <i>Editions</i>. Each Edition contains metadata that is shared for all NFTs in the set, a printing limit to ensure a maximal supply, and a Merchant ID to link the NFT to an entity responsible for the minting process. Therefore, every NFT within the edition will contain identical data except for the unique ID and edition number within the set.

A flow account must be initialized with a `MintStoreItemCollection` that can hold `MintStoreItems`. To read the tokenIDs in their collection, the <a href="./cadence/scripts/MintStoreItem/get_accountTokens.cdc" target="_blank">get_accountTokens.cdc</a> script can be executed. The <a href="./cadence/scripts/MintStoreItem/get_accountTokensForMerchant.cdc" target="_blank">get_accountTokensForMerchant.cdc</a> script can be used to only view the token IDs for a given merchant. This is the recommended approach for third party integrations, thus allowing every NFT project to be distinguished in the user facing interfaces.

Testnet address: `0x985d410b577fd4a1`
Mainnet address `0x20187093790b9aef`

With the list of tokenIDs, there are two options to retrieve the NFT metadata. Option A) directly through the blockchain, and Option B) through our API.

<h2>Option A) Retrieving NFT Data from the blockchain</h2>

With the list of tokenIDs, we can read the NFT specific data with the <a href="./cadence/scripts/MintStoreItem/get_itemData.cdc" target="_blank">get_itemData.cdc</a> script.

| INPUT   | Type    | Description                  |
| ------- | ------- | ---------------------------- |
| addr    | Address | The address of the NFT owner |
| tokenID | UInt64  | The unique ID of the NFT     |

| OUTPUT        | Type   | Description                         |
| ------------- | ------ | ----------------------------------- |
| merchantID    | UInt32 | The ID of the merchant              |
| editionID     | UInt32 | The ID of the edition               |
| editionNumber | UInt32 | The edition number of the given NFT |

Using the editionID, the associated data can be retrieved by executing the <a href="./cadence/scripts/MintStoreItem/get_editionData.cdc" target="_blank">get_editionData.cdc</a> script.

| INPUT     | Type   | Description                  |
| --------- | ------ | ---------------------------- |
| editionID | UInt32 | The unique ID of the edition |

| OUTPUT              | Type             | Description                                                                                        |
| ------------------- | ---------------- | -------------------------------------------------------------------------------------------------- |
| merchantID          | UInt32           | The ID of the merchant                                                                             |
| editionID           | UInt32           | The ID of the edition                                                                              |
| name                | String           | The name of the NFT                                                                                |
| items               | [UInt64]         | The list of tokenIDs associated to this edition.                                                   |
| metadata            | {String: String} | Custom metadata associated to the NFT.                                                             |
| numberOfItemsMinted | UInt32           | The number of items currently minted for the edition.                                              |
| printingLimit       | UInt32?          | The maximum number of items that can be minted for the edition. If undefined, the edition is open. |

<h2>Option B) Retrieving NFT Data from our API</h2>

For access to the API, contact us at <a href="mailto:support@mint.store">support@mint.store</a>.

`GET https://api-wallet.mint.store/public-nft-data`

Our testnet NFTs can also be accessed at
`GET https://staging-api-testnet.mint.store/public-nft-data`

This endpoint returns the public data associated to a single `minted_nft` item. Queries can only yield results for a single item.

| BODY  | Type   | Description                                                       |
| ----- | ------ | ----------------------------------------------------------------- |
| nftID | STRING | The id of the NFT as recored in the MintStoreItem smart contract. |

```javascript
RESPONSE
{
  "total": the total number of nfts found with the query,
  "limit": the page size,
  "skip": the number of items to skip,
  "data": [PublicNFTData]
}
```

| PublicNFTData     | Type   | Description                                    |
| ----------------- | ------ | ---------------------------------------------- |
| name              | STRING | The name of the NFT                            |
| description       | STRING | The description of the NFT                     |
| artistDescription | STRING | The description of the artist                  |
| nftType           | STRING | The type of NFT                                |
| editionFID        | STRING | The edition ID on the blockchain               |
| editionNumber     | STRING | The edition number of the NFT.                 |
| merchantFID       | STRING | The merchant ID on the blockchain              |
| metadata          | OBJECT | The metadata associated to the NFT (not used). |
| videoURL          | STRING | The url of the NFT video                       |
| thumbnail         | STRING | The url of the NFT thumbnail                   |
| printingLimit     | STRING | The printing limit of the edition.             |
| scarcity          | STRING | The scarcity tag (optional)                    |
| createdAt         | DATE   | The date minted                                |
