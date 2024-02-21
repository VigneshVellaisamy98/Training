import { LightningElement , track } from 'lwc';

export default class InputComponent extends LightningElement {
    inputValue;
    clickedButtonLabel;
    newVal = false;

    handleInput(event){
        this.inputValue = event.target.value;
    }
    handleClick(event){
      this.newVal = true;
      console.log(this.newVal)
      //const buttonLabel = this.inputValue;
      this.clickedButtonLabel = this.inputValue;
      console.log(this.clickedButtonLabel);
    }
    
}