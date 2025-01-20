// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {HelperConfig} from "./HelperConfig.s.sol";
import {Raffle} from "../src/Raffle.sol";
import {AddConsumer, CreateSubscription, FundSubscription, CreateSubscriptionManager} from "./Interactions.s.sol";
import {console2} from "forge-std/console2.sol";
import {VRFv2PlusSubscriptionManager} from "../src/utils/SubscriptionManager.sol";

// sub manager, and link transfers work correctly with broadcast

contract DeployRaffle is Script {
    function run() external returns (Raffle, HelperConfig) {
        HelperConfig helperConfig = new HelperConfig(); // This comes with our mocks!
        AddConsumer addConsumer = new AddConsumer();
        HelperConfig.NetworkConfig memory config = helperConfig.getConfig();
        address customSubscriptionManager;
        uint256 subId;
        if (config.subscriptionId == 0) {
            // CreateSubscription createSubscription = new CreateSubscription();
            // (config.subscriptionId, config.vrfCoordinatorV2_5) =
            //     createSubscription.createSubscription(config.vrfCoordinatorV2_5, config.account);

            // FundSubscription fundSubscription = new FundSubscription();
            // fundSubscription.fundSubscription(
            //     config.vrfCoordinatorV2_5, config.subscriptionId, config.link, config.account
            // );

            CreateSubscriptionManager subscriptionManager = new CreateSubscriptionManager();
            (subId, customSubscriptionManager) =
                subscriptionManager.createSubscriptionManager(config.vrfCoordinatorV2_5, config.account, config.link);

            config.subscriptionId = subId;
            helperConfig.setConfig(block.chainid, config);
        }

        vm.startBroadcast(config.account);
        console2.log("subId", subId);
        console2.log("config.automationUpdateInterval", config.automationUpdateInterval);
        console2.log("config.raffleEntranceFee", config.raffleEntranceFee);
        console2.log("config.callbackGasLimit", config.callbackGasLimit);
        console2.log(
            "VRFv2PlusSubscriptionManager(customSubscriptionManager).vrfCoordinatorV2Plus()",
            VRFv2PlusSubscriptionManager(customSubscriptionManager).vrfCoordinatorV2Plus()
        );

        Raffle raffle = new Raffle(
            subId,
            config.gasLane,
            config.automationUpdateInterval,
            config.raffleEntranceFee,
            config.callbackGasLimit,
            VRFv2PlusSubscriptionManager(customSubscriptionManager).vrfCoordinatorV2Plus()
        );

        uint256[] memory randomWords = new uint256[](8);
        randomWords[0] = 1;
        randomWords[1] = 231;
        randomWords[2] = 2;
        randomWords[3] = 14;
        randomWords[4] = 5;
        randomWords[5] = 6;
        randomWords[6] = 6;
        randomWords[7] = 12;

        VRFv2PlusSubscriptionManager(customSubscriptionManager).requestRandomWords();
        console2.log("Random Word requested...");
        VRFv2PlusSubscriptionManager(customSubscriptionManager).rawFulfillRandomWords(
            VRFv2PlusSubscriptionManager(customSubscriptionManager).s_requestId(), randomWords
        );
        console2.log("Word :", VRFv2PlusSubscriptionManager(customSubscriptionManager).s_randomWords());
        // --------------------------------------------------------------------------------------------------
        randomWords[0] = 10;
        randomWords[1] = 2310;
        randomWords[2] = 20;
        randomWords[3] = 140;
        randomWords[4] = 50;
        randomWords[5] = 60;
        randomWords[6] = 601;
        randomWords[7] = 112;
        VRFv2PlusSubscriptionManager(customSubscriptionManager).requestRandomWords();
        console2.log("Random Word requested...");
        VRFv2PlusSubscriptionManager(customSubscriptionManager).rawFulfillRandomWords(
            VRFv2PlusSubscriptionManager(customSubscriptionManager).s_requestId(), randomWords
        );
        console2.log("Word :", VRFv2PlusSubscriptionManager(customSubscriptionManager).s_randomWords());

        // VRFv2PlusSubscriptionManager(customSubscriptionManager).fulfillRandomWords();
        vm.stopBroadcast();

        // We already have a broadcast in here
        // addConsumer.addConsumer(address(raffle), config.vrfCoordinatorV2_5, config.subscriptionId, config.account);
        // return (raffle, helperConfig);
    }
}
