


<h1>Read NFT Public Data</h1>

A MintStoreItem is a non-fungible token with specific properties. As a rule, each minted item belongs to a larger group, called <i>Editions</i>. Each Edition contains metadata that is shared for all NFTs in the set, a printing limit to ensure a maximal supply, and a Merchant ID to link the NFT to an entity responsible for the minting process. Therefore, every NFT within the edition will contain identical data except for the unique ID and edition number within the set.

A flow account must be initialized with a `MintStoreItemCollection` that can hold `MintStoreItems`. To read the tokenIDs in their collection, the <a href="./cadence/scripts/MintStoreItem/get_accountTokens.cdc" target="blank">get_accountTokens.cdc</a> script can be executed.


