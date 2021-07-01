// ! dependancy import
import { useState } from 'react';
import "./App.css";
import axios from "axios";
import Web3 from "web3";

// ! components import
import Header from "./components/Header";
import HeroDisplay from "./components/HeroDisplay";
import DisplayCard from "./components/DisplayCard";

// ! assets import



// ! app declaration
function App() {
  // ? constants
  
  // ? state hooks

  const [account, setAccount] = useState("00000000x0");
  // const [bgImgUrl, setBgImgUrl] = useState([]);
  const [youtube, setYoutube] = useState([]);

  // ? connect to metamask using web3
  async function initMetaMask() {
    
    await loadWeb3();
    await loadBlockchainData();
    contentFetch();
    
  }

  // ? detect browser connection
  async function loadWeb3() {
    if (window.ethereum) {
      window.web3 = new Web3(window.ethereum);
      await window.ethereum.enable();
    } else if (window.web3) {
      window.web3 = new Web3(window.web3.currentProvider);
    } else {
      window.alert(
        "Non-Ethereum browser detected. You should consider trying MetaMask!"
      );
    }
  }

  // ? access blockchain address data :
  // ? evn data or simulated blockchain data
  // ! modify state with wallet address
  async function loadBlockchainData() {
    const web3 = window.web3;
    const accounts = await web3.eth.getAccounts();
    setAccount(`${accounts[0]}`);
  }

  // ? init metamask
  initMetaMask();

  const contentFetch = () => {
        axios.get("http://localhost:3000/youtube")
      .then((res) => {
          setYoutube(res.data);
        } )
      
  };

  return (
    <div className="App">
      <Header accountHash={account}></Header>

      <HeroDisplay>
        {youtube.map((item) => {
          return (
            <DisplayCard
              key={item.id}
              title={item.youtube_title}
              text={item.youtube_text}
              link={item.youtube_url}
              linkToText="youtube video"
            />
          );
        })}
      </HeroDisplay>

    </div>
  );
}

export default App;
