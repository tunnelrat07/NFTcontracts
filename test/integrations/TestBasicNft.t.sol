// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {DeployBasicNft} from "../../script/DeployBasicNFT.s.sol";
import {BasicNft} from "../../src/BasicNft.sol";
import {Test} from "forge-std/Test.sol";

contract TestBasicNFT is Test {
    DeployBasicNft public deployer;
    BasicNft public basicNft;
    address public USER = makeAddr("user");
    string public constant PUG =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function setUp() public {
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

    // testing if the name is correct
    function testIfNameIsCorrect() public view {
        string memory expectedName = "Doggie";
        string memory actualName = basicNft.name();
        // strings are special types
        // cannot be compared directly
        // we can compare the hash of the arrays (strings)
        assertEq(abi.encodePacked(expectedName), abi.encodePacked(actualName));
    }

    // testing if token can be minted and sent to an account
    function testCanMintAndHaveABalance() public {
        vm.prank(USER);
        basicNft.mintNFT(PUG);
        assert(basicNft.balanceOf(USER) == 1);
        assert(
            keccak256(abi.encodePacked(PUG)) ==
                keccak256(abi.encodePacked(basicNft.tokenURI(0)))
        );
    }
}
