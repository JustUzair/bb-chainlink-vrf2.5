## Scripts

After deploying to a testnet or local net, you can run the scripts.

Using cast deployed locally example:

```
cast send <RAFFLE_CONTRACT_ADDRESS> "enterRaffle()" --value 0.1ether --private-key <PRIVATE_KEY> --rpc-url $SEPOLIA_RPC_URL
```

or, to create a ChainlinkVRF Subscription:

```
make createSubscription ARGS="--network sepolia"
```

## Estimate gas

You can estimate how much gas things cost by running:

```
forge snapshot
```

And you'll see an output file called `.gas-snapshot`

# Formatting

To run code formatting:

```
forge fmt
```

## Handling Sandbox Wallets

- `NOTE`: Remember to install VRF Plugin in Buildbear

1. Copy Mnemonic from BuildBear Sandbox, after creating one.
2. Import it using `cast`
   - `cast wallet import BB_TEST --mnemonic "YOUR_MNEMONIC_HERE"`\
3. Acquire it's private key using the following command
   - `cast wallet decrypt-keystore BB_TEST`
4. Get Native & LINK Token funds from sandbox's unlocked faucet

## Deploying to BuildBear's Sandbox

```bash
source .env
forge script script/DeployRaffle.s.sol --rpc-url buildbear --broadcast --private-key $PRIVATE_KEY
```
