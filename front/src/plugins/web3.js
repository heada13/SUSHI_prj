import Web3 from 'web3'
// import Artifacts from '../../build/contracts/SushiToken.json'

// async function (context,inject){
  let web3js
  if (typeof window !== 'undefined'){
    // && typeof window.web3 !== 'undefined'
    web3js = new Web3(window.web3.currentProvider);
    window.ethereum.enable();
    console.log(web3js,"web3 instance created js")
  }
  else{
    console.log(web3js,"you should install metamask js")
  }

  web3js.eth.getAccounts(function(err, accounts) {
    let coinbase = accounts[0];
    console.log("coinbase is " + coinbase);
    if (typeof coinbase === 'undefined') {
        alert("MetaMaskを起動してください．")
    }
  });

  // const sushiTokenAddress = "0xC433767C0C08B6Abc7cB45e09430AED9ed59b254";
  // const sushiCreate = new web3js.eth.Contract(Artifacts.abi, sushiTokenAddress);
  // let sushiCreate = new web3js.eth.Contract(Artifacts.abi, sushiTokenAddress);
  // console.log(sushiCreate,"contract");


  // inject("web3js",web3js);
  // let networkId = await web3js.eth.net.getId();
  // console.log(networkId,"networkId")
// }

  // let sushiTokenAddress = "0xB7B4E530d840e77D8023c0A3CD8a6Dd331B51Ed7"
  // let sushiCreate = new web3js.eth.Contract(Artifacts.abi, sushiTokenAddress);
  // console.log(sushiCreate,"sushi create")
  // let networkId = await web3.eth.net.getId();
  // inject('web3',web3)
// }
  // let web3js; // ローカルの Web3 オブジェクトを格納するための変数
//   window.addEventListener('load', function() {
//     // Web3 が Ethereum 対応ブラウザ （Mist や MetaMask） によってインジェクトされているかどうかをチェックします。
//     if (typeof web3 !== 'undefined') {
//         // Mist または MetaMask のプロバイダを使用して Web3 を初期化します。
//         web3js = new Web3(web3.currentProvider);
//     } else {
//         // Mist や MetaMask 等の Ethereum 対応ブラウザを使用していない場合の初期化です。
//         // 必要に応じて、ローカルノードやホスティングしているノード等を使用します。
//         document.getElementById('warning').innerHTML = 'メタマスクにログインして下さい'
//     }
//   })
export default web3js
  