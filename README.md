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

## Simulating running on BuilbBear's Sandbox

```bash
forge script script/DeployRaffle.s.sol --rpc-url buildbear
```

Locally running the script with the command above, should yield the following output

```bash
$ forge script script/DeployRaffle.s.sol --rpc-url buildbear -vvvv
[⠊] Compiling...
No files changed, compilation skipped
Traces:
  [19736560] DeployRaffle::run()
    ├─ [4955523] → new HelperConfig@0xC7f2Cf4845C6db0e1a1e91ED41Bcd0FcC1b0E141
    │   └─ ← [Return] 22954 bytes of code
    ├─ [6066179] → new AddConsumer@0xdaE97900D4B184c5D2012dcdB658c008966466DD
    │   └─ ← [Return] 30183 bytes of code
    ├─ [2327] HelperConfig::getConfig()
    │   └─ ← [Return] NetworkConfig({ subscriptionId: 0, gasLane: 0x9fe0eebf5e446e3c998ec9bb19951541aee00bb90ea201ae456421a2ded86805, automationUpdateInterval: 30, raffleEntranceFee: 1000000000000000 [1e15], callbackGasLimit: 500000 [5e5], vrfCoordinatorV2_5: 0x271682DEB8C4E0901D1a1550aD2e64D568E69909, link: 0x514910771AF9Ca656af840dff83E8264EcF986CA, account: 0x2882cAA7e14bdf432A295cFbAD5CA22e69b42E39 })
    ├─ [6208993] → new CreateSubscriptionManager@0x238213078DbD09f2D15F4c14c02300FA1b2A81BB
    │   └─ ← [Return] 30896 bytes of code
    ├─ [1159405] CreateSubscriptionManager::createSubscriptionManager(0x271682DEB8C4E0901D1a1550aD2e64D568E69909, 0x2882cAA7e14bdf432A295cFbAD5CA22e69b42E39, 0x514910771AF9Ca656af840dff83E8264EcF986CA)
    │   ├─ [0] VM::startBroadcast(0x2882cAA7e14bdf432A295cFbAD5CA22e69b42E39)
    │   │   └─ ← [Return]
    │   ├─ [962243] → new VRFv2PlusSubscriptionManager@0xb02E20C920e123A277eA060C187162090dE352Fb
    │   │   ├─ [91165] 0xD7f86b4b8Cae7D942340FF628F82735b7a20893a::createSubscription()
    │   │   │   ├─ emit SubscriptionCreated(subId: 80313898388987824823670616157380900304990752060512189001106977364756476193512 [8.031e76], owner: VRFv2PlusSubscriptionManager: [0xb02E20C920e123A277eA060C187162090dE352Fb])
    │   │   │   └─ ← [Return] 80313898388987824823670616157380900304990752060512189001106977364756476193512 [8.031e76]
    │   │   ├─ [68037] 0xD7f86b4b8Cae7D942340FF628F82735b7a20893a::addConsumer(80313898388987824823670616157380900304990752060512189001106977364756476193512 [8.031e76], VRFv2PlusSubscriptionManager: [0xb02E20C920e123A277eA060C187162090dE352Fb])
    │   │   │   ├─ emit SubscriptionConsumerAdded(subId: 80313898388987824823670616157380900304990752060512189001106977364756476193512 [8.031e76], consumer: VRFv2PlusSubscriptionManager: [0xb02E20C920e123A277eA060C187162090dE352Fb])
    │   │   │   └─ ← [Stop]
    │   │   └─ ← [Return] 3106 bytes of code
    │   ├─ [0] console::log("VRFv2PlusSubscriptionManager: ", VRFv2PlusSubscriptionManager: [0xb02E20C920e123A277eA060C187162090dE352Fb]) [staticcall]
    │   │   └─ ← [Stop]
    │   ├─ [329] VRFv2PlusSubscriptionManager::s_subscriptionId() [staticcall]
    │   │   └─ ← [Return] 80313898388987824823670616157380900304990752060512189001106977364756476193512 [8.031e76]
    │   ├─ [0] console::log("Your subscription Id is: ", 80313898388987824823670616157380900304990752060512189001106977364756476193512 [8.031e76]) [staticcall]
    │   │   └─ ← [Stop]
    │   ├─ [24795] 0x514910771AF9Ca656af840dff83E8264EcF986CA::approve(VRFv2PlusSubscriptionManager: [0xb02E20C920e123A277eA060C187162090dE352Fb], 20000000000000000000 [2e19])
    │   │   ├─ emit Approval(owner: 0x2882cAA7e14bdf432A295cFbAD5CA22e69b42E39, spender: VRFv2PlusSubscriptionManager: [0xb02E20C920e123A277eA060C187162090dE352Fb], amount: 20000000000000000000 [2e19])
    │   │   └─ ← [Return] true
    │   ├─ [30445] 0x514910771AF9Ca656af840dff83E8264EcF986CA::transfer(VRFv2PlusSubscriptionManager: [0xb02E20C920e123A277eA060C187162090dE352Fb], 10000000000000000000 [1e19])
    │   │   ├─ emit Transfer(from: 0x2882cAA7e14bdf432A295cFbAD5CA22e69b42E39, to: VRFv2PlusSubscriptionManager: [0xb02E20C920e123A277eA060C187162090dE352Fb], amount: 10000000000000000000 [1e19])
    │   │   └─ ← [Return] true
    │   ├─ [46605] VRFv2PlusSubscriptionManager::topUpSubscription(10000000000000000000 [1e19])
    │   │   ├─ [45035] 0x514910771AF9Ca656af840dff83E8264EcF986CA::transferAndCall(0xD7f86b4b8Cae7D942340FF628F82735b7a20893a, 10000000000000000000 [1e19], 0xb1900e3ae6b3e10046b686de2f39164a813823c1e67d51bb09467da160c7eae8)
    │   │   │   ├─ emit Transfer(from: VRFv2PlusSubscriptionManager: [0xb02E20C920e123A277eA060C187162090dE352Fb], to: 0xD7f86b4b8Cae7D942340FF628F82735b7a20893a, amount: 10000000000000000000 [1e19])
    │   │   │   ├─ emit Transfer(from: VRFv2PlusSubscriptionManager: [0xb02E20C920e123A277eA060C187162090dE352Fb], to: 0xD7f86b4b8Cae7D942340FF628F82735b7a20893a, value: 10000000000000000000 [1e19], data: 0xb1900e3ae6b3e10046b686de2f39164a813823c1e67d51bb09467da160c7eae8)
    │   │   │   ├─ [32298] 0xD7f86b4b8Cae7D942340FF628F82735b7a20893a::onTokenTransfer(VRFv2PlusSubscriptionManager: [0xb02E20C920e123A277eA060C187162090dE352Fb], 10000000000000000000 [1e19], 0xb1900e3ae6b3e10046b686de2f39164a813823c1e67d51bb09467da160c7eae8)
    │   │   │   │   ├─ emit SubscriptionFunded(subId: 80313898388987824823670616157380900304990752060512189001106977364756476193512 [8.031e76], oldBalance: 0, newBalance: 10000000000000000000 [1e19])
    │   │   │   │   └─ ← [Stop]
    │   │   │   └─ ← [Return] true
    │   │   └─ ← [Stop]
    │   ├─ [49293] VRFv2PlusSubscriptionManager::addConsumer(0x271682DEB8C4E0901D1a1550aD2e64D568E69909)
    │   │   ├─ [48137] 0xD7f86b4b8Cae7D942340FF628F82735b7a20893a::addConsumer(80313898388987824823670616157380900304990752060512189001106977364756476193512 [8.031e76], 0x271682DEB8C4E0901D1a1550aD2e64D568E69909)
    │   │   │   ├─ emit SubscriptionConsumerAdded(subId: 80313898388987824823670616157380900304990752060512189001106977364756476193512 [8.031e76], consumer: 0x271682DEB8C4E0901D1a1550aD2e64D568E69909)
    │   │   │   └─ ← [Stop]
    │   │   └─ ← [Stop]
    │   ├─ [0] VM::stopBroadcast()
    │   │   └─ ← [Return]
    │   ├─ [329] VRFv2PlusSubscriptionManager::s_subscriptionId() [staticcall]
    │   │   └─ ← [Return] 80313898388987824823670616157380900304990752060512189001106977364756476193512 [8.031e76]
    │   └─ ← [Return] 80313898388987824823670616157380900304990752060512189001106977364756476193512 [8.031e76], VRFv2PlusSubscriptionManager: [0xb02E20C920e123A277eA060C187162090dE352Fb]
    ├─ [22182] HelperConfig::setConfig(11380 [1.138e4], NetworkConfig({ subscriptionId: 80313898388987824823670616157380900304990752060512189001106977364756476193512 [8.031e76], gasLane: 0x9fe0eebf5e446e3c998ec9bb19951541aee00bb90ea201ae456421a2ded86805, automationUpdateInterval: 30, raffleEntranceFee: 1000000000000000 [1e15], callbackGasLimit: 500000 [5e5], vrfCoordinatorV2_5: 0x271682DEB8C4E0901D1a1550aD2e64D568E69909, link: 0x514910771AF9Ca656af840dff83E8264EcF986CA, account: 0x2882cAA7e14bdf432A295cFbAD5CA22e69b42E39 }))
    │   └─ ← [Stop]
    ├─ [0] VM::startBroadcast(0x2882cAA7e14bdf432A295cFbAD5CA22e69b42E39)
    │   └─ ← [Return]
    ├─ [883745] → new Raffle@0x6809327344D63088C19f67c32390D41eFEDc0131
    │   └─ ← [Return] 4068 bytes of code
    ├─ [154096] VRFv2PlusSubscriptionManager::requestRandomWords()
    │   ├─ [129819] 0xD7f86b4b8Cae7D942340FF628F82735b7a20893a::requestRandomWords(RandomWordsRequest({ keyHash: 0xc6bf2e7b88e5cfbb4946ff23af846494ae1f3c65270b79ee7876c9aa99d3d45f, subId: 80313898388987824823670616157380900304990752060512189001106977364756476193512 [8.031e76], requestConfirmations: 3, callbackGasLimit: 100000 [1e5], numWords: 1, extraArgs: 0x92fd13380000000000000000000000000000000000000000000000000000000000000000 }))
    │   │   ├─ emit RandomWordsRequested(keyHash: 0xc6bf2e7b88e5cfbb4946ff23af846494ae1f3c65270b79ee7876c9aa99d3d45f, requestId: 3, preSeed: 0, subId: 80313898388987824823670616157380900304990752060512189001106977364756476193512 [8.031e76], minimumRequestConfirmations: 3, callbackGasLimit: 100000 [1e5], numWords: 1, extraArgs: 0x92fd13380000000000000000000000000000000000000000000000000000000000000000, sender: VRFv2PlusSubscriptionManager: [0xb02E20C920e123A277eA060C187162090dE352Fb])
    │   │   └─ ← [Return] 3
    │   └─ ← [Stop]
    ├─ [0] console::log("Random Word requested...") [staticcall]
    │   └─ ← [Stop]
    ├─ [394] VRFv2PlusSubscriptionManager::s_requestId() [staticcall]
    │   └─ ← [Return] 3
    ├─ [22909] VRFv2PlusSubscriptionManager::rawFulfillRandomWords(3, [1, 231, 2, 14, 5, 6, 6, 12])
    │   └─ ← [Stop]
    ├─ [374] VRFv2PlusSubscriptionManager::s_randomWords() [staticcall]
    │   └─ ← [Return] 1
    ├─ [0] console::log("Word :", 1) [staticcall]
    │   └─ ← [Stop]
    ├─ [105396] VRFv2PlusSubscriptionManager::requestRandomWords()
    │   ├─ [103119] 0xD7f86b4b8Cae7D942340FF628F82735b7a20893a::requestRandomWords(RandomWordsRequest({ keyHash: 0xc6bf2e7b88e5cfbb4946ff23af846494ae1f3c65270b79ee7876c9aa99d3d45f, subId: 80313898388987824823670616157380900304990752060512189001106977364756476193512 [8.031e76], requestConfirmations: 3, callbackGasLimit: 100000 [1e5], numWords: 1, extraArgs: 0x92fd13380000000000000000000000000000000000000000000000000000000000000000 }))
    │   │   ├─ emit RandomWordsRequested(keyHash: 0xc6bf2e7b88e5cfbb4946ff23af846494ae1f3c65270b79ee7876c9aa99d3d45f, requestId: 4, preSeed: 1, subId: 80313898388987824823670616157380900304990752060512189001106977364756476193512 [8.031e76], minimumRequestConfirmations: 3, callbackGasLimit: 100000 [1e5], numWords: 1, extraArgs: 0x92fd13380000000000000000000000000000000000000000000000000000000000000000, sender: VRFv2PlusSubscriptionManager: [0xb02E20C920e123A277eA060C187162090dE352Fb])
    │   │   └─ ← [Return] 4
    │   └─ ← [Stop]
    ├─ [0] console::log("Random Word requested...") [staticcall]
    │   └─ ← [Stop]
    ├─ [394] VRFv2PlusSubscriptionManager::s_requestId() [staticcall]
    │   └─ ← [Return] 4
    ├─ [909] VRFv2PlusSubscriptionManager::rawFulfillRandomWords(4, [10, 2310, 20, 140, 50, 60, 601, 112])
    │   └─ ← [Stop]
    ├─ [374] VRFv2PlusSubscriptionManager::s_randomWords() [staticcall]
    │   └─ ← [Return] 10
    ├─ [0] console::log("Word :", 10) [staticcall]
    │   └─ ← [Stop]
    ├─ [0] VM::stopBroadcast()
    │   └─ ← [Return]
    └─ ← [Return] Raffle: [0x6809327344D63088C19f67c32390D41eFEDc0131], HelperConfig: [0xC7f2Cf4845C6db0e1a1e91ED41Bcd0FcC1b0E141]


Script ran successfully.

== Return ==
0: contract Raffle 0x6809327344D63088C19f67c32390D41eFEDc0131
1: contract HelperConfig 0xC7f2Cf4845C6db0e1a1e91ED41Bcd0FcC1b0E141

== Logs ==
  VRFv2PlusSubscriptionManager:  0xb02E20C920e123A277eA060C187162090dE352Fb
  Your subscription Id is:  80313898388987824823670616157380900304990752060512189001106977364756476193512
  Random Word requested...
  Word : 1
  Random Word requested...
  Word : 10

## Setting up 1 EVM.
==========================
Simulated On-chain Traces:

  [962243] → new VRFv2PlusSubscriptionManager@0xb02E20C920e123A277eA060C187162090dE352Fb
    ├─ [91165] 0xD7f86b4b8Cae7D942340FF628F82735b7a20893a::createSubscription()
    │   ├─ emit SubscriptionCreated(subId: 80313898388987824823670616157380900304990752060512189001106977364756476193512 [8.031e76], owner: VRFv2PlusSubscriptionManager: [0xb02E20C920e123A277eA060C187162090dE352Fb])
    │   └─ ← [Return] 80313898388987824823670616157380900304990752060512189001106977364756476193512 [8.031e76]
    ├─ [68037] 0xD7f86b4b8Cae7D942340FF628F82735b7a20893a::addConsumer(80313898388987824823670616157380900304990752060512189001106977364756476193512 [8.031e76], VRFv2PlusSubscriptionManager: [0xb02E20C920e123A277eA060C187162090dE352Fb])
    │   ├─ emit SubscriptionConsumerAdded(subId: 80313898388987824823670616157380900304990752060512189001106977364756476193512 [8.031e76], consumer: VRFv2PlusSubscriptionManager: [0xb02E20C920e123A277eA060C187162090dE352Fb])
    │   └─ ← [Stop]
    └─ ← [Return] 3106 bytes of code

  [24795] 0x514910771AF9Ca656af840dff83E8264EcF986CA::approve(VRFv2PlusSubscriptionManager: [0xb02E20C920e123A277eA060C187162090dE352Fb], 20000000000000000000 [2e19])
    ├─ emit Approval(owner: 0x2882cAA7e14bdf432A295cFbAD5CA22e69b42E39, spender: VRFv2PlusSubscriptionManager: [0xb02E20C920e123A277eA060C187162090dE352Fb], amount: 20000000000000000000 [2e19])
    └─ ← [Return] true

  [30445] 0x514910771AF9Ca656af840dff83E8264EcF986CA::transfer(VRFv2PlusSubscriptionManager: [0xb02E20C920e123A277eA060C187162090dE352Fb], 10000000000000000000 [1e19])
    ├─ emit Transfer(from: 0x2882cAA7e14bdf432A295cFbAD5CA22e69b42E39, to: VRFv2PlusSubscriptionManager: [0xb02E20C920e123A277eA060C187162090dE352Fb], amount: 10000000000000000000 [1e19])
    └─ ← [Return] true

  [70405] VRFv2PlusSubscriptionManager::topUpSubscription(10000000000000000000 [1e19])
    ├─ [58335] 0x514910771AF9Ca656af840dff83E8264EcF986CA::transferAndCall(0xD7f86b4b8Cae7D942340FF628F82735b7a20893a, 10000000000000000000 [1e19], 0xb1900e3ae6b3e10046b686de2f39164a813823c1e67d51bb09467da160c7eae8)
    │   ├─ emit Transfer(from: VRFv2PlusSubscriptionManager: [0xb02E20C920e123A277eA060C187162090dE352Fb], to: 0xD7f86b4b8Cae7D942340FF628F82735b7a20893a, amount: 10000000000000000000 [1e19])
    │   ├─ emit Transfer(from: VRFv2PlusSubscriptionManager: [0xb02E20C920e123A277eA060C187162090dE352Fb], to: 0xD7f86b4b8Cae7D942340FF628F82735b7a20893a, value: 10000000000000000000 [1e19], data: 0xb1900e3ae6b3e10046b686de2f39164a813823c1e67d51bb09467da160c7eae8)
    │   ├─ [38298] 0xD7f86b4b8Cae7D942340FF628F82735b7a20893a::onTokenTransfer(VRFv2PlusSubscriptionManager: [0xb02E20C920e123A277eA060C187162090dE352Fb], 10000000000000000000 [1e19], 0xb1900e3ae6b3e10046b686de2f39164a813823c1e67d51bb09467da160c7eae8)
    │   │   ├─ emit SubscriptionFunded(subId: 80313898388987824823670616157380900304990752060512189001106977364756476193512 [8.031e76], oldBalance: 0, newBalance: 10000000000000000000 [1e19])
    │   │   └─ ← [Stop]
    │   └─ ← [Return] true
    └─ ← [Stop]

  [66593] VRFv2PlusSubscriptionManager::addConsumer(0x271682DEB8C4E0901D1a1550aD2e64D568E69909)
    ├─ [56937] 0xD7f86b4b8Cae7D942340FF628F82735b7a20893a::addConsumer(80313898388987824823670616157380900304990752060512189001106977364756476193512 [8.031e76], 0x271682DEB8C4E0901D1a1550aD2e64D568E69909)
    │   ├─ emit SubscriptionConsumerAdded(subId: 80313898388987824823670616157380900304990752060512189001106977364756476193512 [8.031e76], consumer: 0x271682DEB8C4E0901D1a1550aD2e64D568E69909)
    │   └─ ← [Stop]
    └─ ← [Stop]

  [883745] → new Raffle@0x6809327344D63088C19f67c32390D41eFEDc0131
    └─ ← [Return] 4068 bytes of code

  [172596] VRFv2PlusSubscriptionManager::requestRandomWords()
    ├─ [135819] 0xD7f86b4b8Cae7D942340FF628F82735b7a20893a::requestRandomWords(RandomWordsRequest({ keyHash: 0xc6bf2e7b88e5cfbb4946ff23af846494ae1f3c65270b79ee7876c9aa99d3d45f, subId: 80313898388987824823670616157380900304990752060512189001106977364756476193512 [8.031e76], requestConfirmations: 3, callbackGasLimit: 100000 [1e5], numWords: 1, extraArgs: 0x92fd13380000000000000000000000000000000000000000000000000000000000000000 }))
    │   ├─ emit RandomWordsRequested(keyHash: 0xc6bf2e7b88e5cfbb4946ff23af846494ae1f3c65270b79ee7876c9aa99d3d45f, requestId: 3, preSeed: 0, subId: 80313898388987824823670616157380900304990752060512189001106977364756476193512 [8.031e76], minimumRequestConfirmations: 3, callbackGasLimit: 100000 [1e5], numWords: 1, extraArgs: 0x92fd13380000000000000000000000000000000000000000000000000000000000000000, sender: VRFv2PlusSubscriptionManager: [0xb02E20C920e123A277eA060C187162090dE352Fb])
    │   └─ ← [Return] 3
    └─ ← [Stop]

  [24909] VRFv2PlusSubscriptionManager::rawFulfillRandomWords(3, [1, 231, 2, 14, 5, 6, 6, 12])
    └─ ← [Stop]

  [138396] VRFv2PlusSubscriptionManager::requestRandomWords()
    ├─ [118719] 0xD7f86b4b8Cae7D942340FF628F82735b7a20893a::requestRandomWords(RandomWordsRequest({ keyHash: 0xc6bf2e7b88e5cfbb4946ff23af846494ae1f3c65270b79ee7876c9aa99d3d45f, subId: 80313898388987824823670616157380900304990752060512189001106977364756476193512 [8.031e76], requestConfirmations: 3, callbackGasLimit: 100000 [1e5], numWords: 1, extraArgs: 0x92fd13380000000000000000000000000000000000000000000000000000000000000000 }))
    │   ├─ emit RandomWordsRequested(keyHash: 0xc6bf2e7b88e5cfbb4946ff23af846494ae1f3c65270b79ee7876c9aa99d3d45f, requestId: 4, preSeed: 1, subId: 80313898388987824823670616157380900304990752060512189001106977364756476193512 [8.031e76], minimumRequestConfirmations: 3, callbackGasLimit: 100000 [1e5], numWords: 1, extraArgs: 0x92fd13380000000000000000000000000000000000000000000000000000000000000000, sender: VRFv2PlusSubscriptionManager: [0xb02E20C920e123A277eA060C187162090dE352Fb])
    │   └─ ← [Return] 4
    └─ ← [Stop]

  [7809] VRFv2PlusSubscriptionManager::rawFulfillRandomWords(4, [10, 2310, 20, 140, 50, 60, 601, 112])
    └─ ← [Stop]


==========================

Chain 11380

Estimated gas price: 0.079310615 gwei

Estimated total gas used for script: 3698663

Estimated amount required: 0.000293343237207745 ETH

==========================

SIMULATION COMPLETE. To broadcast these transactions, add --broadcast and wallet configuration(s) to the previous command. See forge script --help for more.

Transactions saved to: D:/WORK/BuildBear/buildbear-vrf-lottery/broadcast\DeployRaffle.s.sol\11380\dry-run\run-latest.json

Sensitive values saved to: D:/WORK/BuildBear/buildbear-vrf-lottery/cache\DeployRaffle.s.sol\11380\dry-run\run-latest.json
```
