import React from "react";

const Header = (props) => {
  return (
    <nav className="pa3 pa4-ns bg-dark-green fixed w-100 z-1">
      <a 
        className="link dim washed-green b f4 f3-ns dib mr3" 
        href="/" 
        title="Home">
        Nest
      </a>
      <a 
        className="link dim washed-green f4 f3-ns dib ml3" href="/" 
        title="links">
        Links
      </a>
      <span
        className="o-80 f4 f3-ns washed-red dib mr3 fr b"
      >
          {props.accountHash}
      </span>
      
    </nav>
  );
};

export default Header;
