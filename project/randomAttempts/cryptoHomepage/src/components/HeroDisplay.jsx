import React from "react";
import "../App.css";

const HeroDisplay = (props) => {
  return (
    <div
      className="hero-container w-100 min-vh-100 bg-light-green flex justify-around items-center"
      style={{ backgroundImage: `url(${props.backgroundImage})` }}
    >
      <section className="h-80\ w-80 pa3 bg-navy light-green flex justify-around items-stretch o-90">
        {props.children}
      </section>
    </div>
  );
};

export default HeroDisplay;
