# Dains Nfts on top of erc721-gwei-slim usage contracts

`
  #yarn hardhat deploy --network rinkeby --gasprice 100000000000 --tags [CONTRACT NAME]
  #yarn hardhat etherscan-verify --network rinkeby / mainnet
`

MrDainNFT = 628284 gas

// first deploy with burn
deploying "BleulandFollies" (tx: 0x56ff1ff227e1d67934fde94a937f758520f286204b0065e2b7933c7044dfa9e5)...: deployed at 0x8328Ac7E9cb02D85f1643C6Afe552a301adb2c9D with 622853 gas

// Second deploy with contractInfo string and no burn
deploying "BleulandFollies" (tx: 0x8dbb293b20df26dd4ae4c83d48f452c9cbb93628c7103324e9e805414a038826)...: deployed at 0xa7D6fCF3AB11f34a4E0a6f0Be911cb09fFBfD1Cc with 629385 gas

// Third deploy with a massive chunk of onchain data:
deploying "BleulandFollies" (tx: 0xf69163bb98c33aa5cb924700b2ea0c326894f031349772d7b21943a23c4045c8)...: deployed at 0x643143faf41173F720746714601648a90C2F22B4 with 13630107 gas