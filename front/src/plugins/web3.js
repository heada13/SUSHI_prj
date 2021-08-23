import Web3 from 'web3'

// export default async function (context,inject){
  let web3js
  if (typeof window !== 'undefined'){
    // && typeof window.web3 !== 'undefined'
    web3js = new Web3(window.web3.currentProvider);
    console.log(web3js,"web3 instance created js")
  }
  else{
    console.log(web3js,"you should install metamask js")
  }

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
  