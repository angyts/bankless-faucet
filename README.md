# This project creates a ~~Ropsten~~ Kovan testnet Faucet

Code all shamelessly copied from tutorials

Dev requirements: 
- node
- truffle
- `MNENOMIC` and `INFURA_API_KEY` to be defined in a `.env` file
- Some ~~rETH~~ kETH to deploy contracts

## Useful Commands

Kovan contract has been deployed on `0x89E0f09Da214BBF261E2B10AcC5d33e9de087B25`

Ropsten contract has been deployed on `0x43DaCD200E36AEB61a5912bCd7A9565F6240bBC9`

- To interact:`truffle console --network ropsten`
- To reset and redeploy everything:`truffle migrate --network ropsten --reset`

Some contract interactions
- `Faucet.address`
- `Faucet.deployed().then(i => {i.withdraw('10000000000000000')})`
- `Faucet.deployed().then(i => {i.destroy()})`

## Front end
https://github.com/punggolzenith/bankless-onboard

Deployed a template site on netlify with netlify-CMS. Will have to change to stack that the project is using.

## Problem
Slight problem: need gas to do contract interactions like withdraw

Need to look into opengsn.org to relay transactions.

## Notes on opengsn.org

https://docs.opengsn.org/javascript-client/tutorial.html#converting-a-contract-to-support-gsn





