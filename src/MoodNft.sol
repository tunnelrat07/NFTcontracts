// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract MoodNft is ERC721 {
    // custom errors
    error MoodNft__CantFlipMoodIfNotOwner();
    uint256 private s_tokenCounter;
    string private s_sadSvgImageURI;
    string private s_happySvgImageURI;

    enum Mood {
        HAPPY,
        SAD
    }
    mapping(uint256 => Mood) private s_tokenIdToMood;

    constructor(
        string memory sadSvgImageURI,
        string memory happySvgImageURI
    ) ERC721("MoodNft", "MN") {
        s_sadSvgImageURI = sadSvgImageURI;
        s_tokenIdToMood[s_tokenCounter] = Mood.HAPPY;
        s_happySvgImageURI = happySvgImageURI;
    }

    function mintNft() public {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function _baseURI() internal pure override returns (string memory) {
        return "data:application/json;base64,";
    }

    function flipMood(uint256 tokenId) public {
        // we only want the NFT owner to be able to flip the mood
        // ERC721 has this function _isApprovedOrOwner
        if (!_isAuthorized(_ownerOf(tokenId), msg.sender, tokenId)) {
            revert MoodNft__CantFlipMoodIfNotOwner();
        }
        if (s_tokenIdToMood[tokenId] == Mood.HAPPY) {
            s_tokenIdToMood[tokenId] = Mood.SAD;
        } else {
            s_tokenIdToMood[tokenId] = Mood.HAPPY;
        }
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        string memory ImageURI;
        if (s_tokenIdToMood[tokenId] == Mood.HAPPY) {
            ImageURI = s_happySvgImageURI;
        } else {
            ImageURI = s_sadSvgImageURI;
        }

        return
            string(
                abi.encodePacked(
                    _baseURI(),
                    Base64.encode(
                        bytes(
                            abi.encodePacked(
                                '{ "name": "',
                                name(),
                                '" , "description" : "An NFT that reflects the owners mood.", "attributes" : [{"trait_type" : "moddiness" , "value" : 100}] , "image" : "',
                                ImageURI,
                                '"}'
                            )
                        )
                    )
                )
            );

        // { "name" : "MoodNft"}
    }

    // creating a getter function for the happy and sad svg URI
    function getSadSvgURI() external view returns (string memory sad) {
        return s_sadSvgImageURI;
    }

    function getHappySvgURI() external view returns (string memory sad) {
        return s_happySvgImageURI;
    }
}
