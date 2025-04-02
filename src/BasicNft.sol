// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721 {
    // adding our token counter
    uint256 private s_tokenCounter;
    mapping(uint256 => string) private s_tokenIdToUri;

    // we also need to call the constructor of the parent contract (ERC721) -> takes a name and a symbol
    constructor() ERC721("Doggie", "DOG") {
        s_tokenCounter = 0;
    }

    // represents an entire collection of Doggies, each Doggy in this collection is gonna have its own unique tokenId
    function mintNFT(string memory _tokenURI) public {
        s_tokenIdToUri[s_tokenCounter] = _tokenURI;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        return s_tokenIdToUri[tokenId];
    }

    // getter function that gives the token balance of the account provided
    /*     function getBalanceOfAccount(address _user)external returns() {

    } */
}
