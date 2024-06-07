// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

//import NFT from openzeppelin

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

import "hardhat/console.sol";

contract NFTmarketplace is ERC721URIStorage {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIds;
    Counters.Counter private _itemsSold;
    uint256 listingPrice = 0.0025 ether;

    address payable owner;
    mapping(uint256 => MarketItem) private idMarketItem;

    struct MarketItem{
        uint256 tokenId;
        address payable seller;
        address payable owner;
        uint256 price;
        bool sold;
    }

    event idMarketItemCreated(
        uint256 indexed tokenId,
        address seller ,
        address owner,
        uint256 price,
        bool sold
    );

    modifier onlyOwner{
        require(msg.sender == owner, "only owner of the marketplace can change the listing price ");
        _;
    }

    constructor() ERC721("NFT meatverse token", "MYNFT"){
        owner == payable(msg.sender);
    }

    function updateListingPrice(uint256 _listingPrice) public payable onlyOwner{
        listingPrice = _listingPrice;

    }

    function getListingPrice() public view returns(uint256 ){
        return listingPrice;

    }

    // Let create NFT token function 
    
}