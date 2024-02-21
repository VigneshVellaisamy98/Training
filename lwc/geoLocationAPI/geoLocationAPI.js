import { LightningElement } from 'lwc';


export default class GeoLocationAPI extends LightningElement {
    city;
    onchange(event){
        this.city = event.target.value;
    }
    handleClick(){
        
    }
}