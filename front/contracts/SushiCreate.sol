// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721.sol";
import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
// import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/extensions/ERC721Pausable.sol";
import "../node_modules/openzeppelin-solidity/contracts/utils/Counters.sol";
// import "../node_modules/openzeppelin-solidity/contracts/utils/Context.sol";
import "../node_modules/openzeppelin-solidity/contracts/access/AccessControlEnumerable.sol";
// import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/presets/ERC721PresetMinterPauserAutoId.sol";

contract SushiToken is 
  ERC721,
  ERC721Enumerable,
  ERC721Pausable,
  AccessControlEnumerable
  {
  using Counters for Counters.Counter;

  Counters.Counter public _tokenIdTracker;
  
  string private _baseTokenURI;

  // コントラクト呼び出し時に一度だけ実行
  constructor () ERC721("sushigametoken", "SUSGT") {
        // _baseTokenURI = baseTokenURI;

        _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());

        _setupRole(MINTER_ROLE, _msgSender());
        _setupRole(PAUSER_ROLE, _msgSender());
    }

  // sushiキャラクターのステータス
  struct SushiStatus {
    uint8 aliveFlag;
    uint32 birthTime;
    uint32 deadTime;
    uint32 charactorImage;
    uint256 tokneId;
    string difficulty;
  }

  bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
  bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");

  // sushiを格納する配列
  SushiStatus[] public sushis;

  /// @dev A mapping from cat IDs to the address that owns them. All cats have
  ///  some valid owner address, even gen0 cats are created with a non-zero owner.
  mapping (uint256 => address) public sushiIndexToOwner;

  // mapping (address => uint256) public sushiOwnerToTokenId;
  // Mapping from owner to a list of owned sushi
  mapping (address => uint[]) public sushiOwner;

  // @dev A mapping from owner address to count of tokens that address owns.
  //  Used internally inside balanceOf() to resolve ownership count.
  mapping (address => uint256) ownershipTokenCount;

  /// @dev A mapping from KittyIDs to an address that has been approved to call
  ///  transferFrom(). Each Kitty can only have one approved address for transfer
  ///  at any time. A zero value means no approval is outstanding.
  mapping (uint256 => address) public sushiIndexToApproved;


  // キャラクター生成時のイベント
  event SushiCreation(uint8 _aliveFlag, uint32 _birthday, uint32 _deadTime, uint32 _charaImage, string _difficulty);

  function createSushi (
    uint8 _aliveFlag, 
    uint32 _birthday,
    uint32 _deadTime,
    uint32 _charaImage,
    string memory _difficulty
    ) public {

    // トークンIdを取得
    uint tokenId = _tokenIdTracker.current();

    // mintを呼び出してtokenIDを取得
    // オーナー宛にトークン発行
    // カウンターをインクリメントするので、この時点で
    // currentで返るidとトークン自体のidは異なる
    mint(msg.sender);

    // 生成した構造体をshshisに追加し、idに格納
    sushis.push(SushiStatus(_aliveFlag,_birthday,0,_charaImage,tokenId,_difficulty));

    // 生成したsushiの配列の位置を取得
    uint id = sushis.length -1;

    // 生成した構造体にオーナーのアドレスをマッピング
    // キーには配列の位置を指定する
    sushiIndexToOwner[id] = msg.sender;

    // オーナーごとに所有するsushiの配列位置をarray形式で格納する
    // オーナーアドレスから、所有する全てのsushiが把握できる
    sushiOwner[msg.sender].push(id);
    // sushiOwnerToTokenId[msg.sender] = _tokenIdTracker._value;

    // オーナーのsushi所持数をインクリメント
    ownershipTokenCount[msg.sender]++;

    // 作成したトークンをオーナ-に送付
    // _transfer(from, msg.sender, tokenId);

    // イベント発火
    emit SushiCreation(_aliveFlag, _birthday, _deadTime, _charaImage, _difficulty);

  }

  // コントラクト実行者が、alive状態のsushiを持っているかどうかをチェック
  modifier ownAliveSushi () {
    // オーナーが所有する全てのsushiを走査し、alive状態のsushiの有無を確認する
    uint[] memory tmpSushiOwner = sushiOwner[msg.sender];
    for (uint i; i<=tmpSushiOwner.length; i++){
    // sushis[sushiId].aliveFlag == 0);
      require(sushis[sushiOwner[msg.sender][i]].aliveFlag ==0);
    }
    _;
  }

  function mint(address to) public virtual {
        require(hasRole(MINTER_ROLE, _msgSender()), "ERC721PresetMinterPauserAutoId: must have minter role to mint");

        // We cannot just use balanceOf to create the new tokenId because tokens
        // can be burned (destroyed), so we need a separate counter.
        _mint(to, _tokenIdTracker.current());
        _tokenIdTracker.increment();
  } 

  function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual override(ERC721, ERC721Enumerable, ERC721Pausable) {
        super._beforeTokenTransfer(from, to, tokenId);
  }


  function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(AccessControlEnumerable, ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}