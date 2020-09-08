import React from 'react';

class Calculator extends React.Component{
  constructor(props){
    super(props);
    this.state = {result: 0, num1: "", num2: ""}
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
  }

  setNum1(e){
    e.preventDeafult();
    const num1 = e.target.value;
    num1 = (num1 ? parseInt(num1) : "");
    this.setState({num1});
  }

  setNum2(e){
    e.preventDeafult();
    const num2 = e.target.value;
    num2 = (num2 ? parseInt(num2) : "");
    this.setState({num2});
  }

  render(){
    return (
      <div>
        <h1>{this.state.result}</h1>
          <input type="text" value={num1}></input>
      </div>
    );
  }
}

export default Calculator;
