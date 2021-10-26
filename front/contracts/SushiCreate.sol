// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721.sol";
import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
// import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/extensions/ERC721Burnable.sol";
// import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/extensions/ERC721Pausable.sol";
import "../node_modules/openzeppelin-solidity/contracts/utils/Counters.sol";
// import "../node_modules/openzeppelin-solidity/contracts/utils/Context.sol";
// import "../node_modules/openzeppelin-solidity/contracts/access/AccessControlEnumerable.sol";
// import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/presets/ERC721PresetMinterPauserAutoId.sol";

// for remix
// import "https://github.com/openzeppelin-solidity/contracts/token/ERC721/ERC721.sol";
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
// import "https://github.com/openzeppelin-solidity/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
// import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/extensions/ERC721Burnable.sol";
// import "https://github.com/openzeppelin-solidity/contracts/token/ERC721/extensions/ERC721Pausable.sol";
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721Pausable.sol";
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/utils/Counters.sol";


contract SushiToken is 
//   ERC721,
  ERC721Enumerable
//   ERC721Pausable,
//   AccessControlEnumerable
    // ERC721URIStorage
  {
  using Counters for Counters.Counter;

  Counters.Counter private _tokenIdTracker;
  
  string private _baseTokenURI;

  // コントラクト呼び出し時に一度だけ実行
  constructor () ERC721("sushigametoken", "SGT") {
        // _baseTokenURI = baseTokenURI;

        // _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());

        // _setupRole(MINTER_ROLE, _msgSender());
        // _setupRole(PAUSER_ROLE, _msgSender());
    }

  // sushiキャラクターのステータス
  struct SushiStatus {
    uint32 sushiRank;
    uint32 birthday;
    uint256 tokneId;
    string sushiNeta;
    string charactorImageURL;
  }

//   bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
//   bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");

  // sushiを格納する配列
  SushiStatus[] public sushis;

  /// @dev A mapping from cat IDs to the address that owns them. All cats have
  ///  some valid owner address, even gen0 cats are created with a non-zero owner.
  mapping (uint256 => address) public sushiIndexToOwner;

  // mapping (address => uint256) public sushiOwnerToTokenId;
  // Mapping from owner to a list of owned sushi
  // mapping (address => uint[]) public sushiOwner;
  mapping (address => uint) public sushiOwner;

  // @dev A mapping from owner address to count of tokens that address owns.
  //  Used internally inside balanceOf() to resolve ownership count.
  mapping (address => uint256) public ownershipTokenCount;

  /// @dev A mapping from KittyIDs to an address that has been approved to call
  ///  transferFrom(). Each Kitty can only have one approved address for transfer
  ///  at any time. A zero value means no approval is outstanding.
  mapping (uint256 => address) public sushiIndexToApproved;


  // キャラクター生成時のイベント
  event SushiCreation(
      uint32 sushiRank,
      uint32 birthday,
      string sushiNeta,
      string charactorImageURL
    );

  function createSushi (
    uint32 _birthday,
    string memory _charactorImageURL
    )
    public
    {

    // トークンIdを取得
    // uint tokenId = _tokenIdTracker.current();
    
    // トークンが一万体以下ならmintする
    require(_tokenIdTracker.current() < 9999);
    
    // すでにトークンを所持している場合、mint不可とする
    require(balanceOf(msg.sender)==0);
    
    // idをインクリメント
    _tokenIdTracker.increment();
    // uint256 tokenid = _tokenIdTracker;
    // _mint(msg.sender,_tokenIdTracker.current());
    _safeMint(msg.sender,_tokenIdTracker.current());
    
    // 生成した構造体をshshisに追加し、idに格納
    sushis.push(SushiStatus(0, _birthday, _tokenIdTracker.current(), "syari", _charactorImageURL));

    // _setTokenURI(_tokenIdTracker.current(),_charactorImageURL);

    // 生成したsushiの配列の位置を取得
    // uint id = sushis.length -1;

    // 生成した構造体にオーナーのアドレスをマッピング
    // キーには配列の位置を指定する
    // sushiIndexToOwner[id] = msg.sender;

    // オーナーごとに所有するsushiの配列位置をarray形式で格納する
    // オーナーアドレスから、所有する全てのsushiが把握できる
    // sushiOwner[msg.sender].push(id);
    // sushiOwner[msg.sender] = id;
    // sushiOwnerToTokenId[msg.sender] = _tokenIdTracker._value;

    // オーナーのsushi所持数をインクリメント
    // ownershipTokenCount[msg.sender]++;

    // 作成したトークンをオーナ-に送付
    // _transfer(from, msg.sender, tokenId);

    // イベント発火
    // emit SushiCreation(_aliveFlag, _birthday, _deadTime, _charaImage, _difficulty);
    
  }

//   function mint(address to) public virtual {
//         require(hasRole(MINTER_ROLE, _msgSender()), "ERC721PresetMinterPauserAutoId: must have minter role to mint");

//         // We cannot just use balanceOf to create the new tokenId because tokens
//         // can be burned (destroyed), so we need a separate counter.
//         _mint(to, _tokenIdTracker.current());
//         _tokenIdTracker.increment();
//   }

//   function _beforeTokenTransfer(
//         address from,
//         address to,
//         uint256 tokenId
//     ) internal virtual override(ERC721, ERC721Enumerable, ERC721Pausable) {
//         super._beforeTokenTransfer(from, to, tokenId);
//   }


//   function supportsInterface(bytes4 interfaceId)
//         public
//         view
//         virtual
//         override(AccessControlEnumerable, ERC721, ERC721Enumerable)
//         returns (bool)
//     {
//         return super.supportsInterface(interfaceId);
//     }

  function evoloveSushi (string memory sushineta, string memory changeimage) public {
      uint tmpowner = sushiOwner[msg.sender];
      sushis[tmpowner].charactorImageURL = changeimage;
      sushis[tmpowner].sushiNeta = sushineta;
      uint sushirank = sushis[tmpowner].sushiRank;
      
      if(sushirank == 0){
          sushis[tmpowner].sushiRank = 1;
      }
      else if(sushirank == 1){
          sushis[tmpowner].sushiRank = 2;
      }
      else if(sushirank == 2){
          sushis[tmpowner].sushiRank = 3;
      }
      else if(sushirank == 3){
          sushis[tmpowner].sushiRank = 4;
      }
  }
}