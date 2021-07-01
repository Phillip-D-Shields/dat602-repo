import React from "react";

const DisplayCard = (props) => {
  return (
    <article className="mv4 mh2 w-100">
      <h1 className="bb f4 light-green mv0 pv2 ph2">{props.title}</h1>
      <div className="pa3 bt h-100 flex flex-column justify-between">
        <p className="f6 f5-ns lh-copy measure mv2">{props.text}</p>
        <a className="f6 link dim br1 ba bw2 ph3 pv2 mb2 dib light-red mv4 tr" href={props.link}>link to {props.linkToText}</a>
      </div>
    </article>
  );
};

export default DisplayCard;
