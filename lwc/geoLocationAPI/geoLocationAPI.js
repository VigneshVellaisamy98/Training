import { LightningElement } from 'lwc';
import getWeather from '@salesforce/apex/WeatherAPI.getWeather';


export default class GeoLocationAPI extends LightningElement {
    city;
    imageUrl;
    condition;
    tempC;
    tempF;
    
    onchange(event){
        this.city = event.target.value;
    }
    handleClick(){
        getWeather({city: this.city}).then((response)=>{
            console.log(response);
            let parsedDate = JSON.parse(response);
            this.imageUrl = parsedDate.current.condition.icon;
            this.condition = parsedDate.current.condition.text;
            this.tempC = parsedDate.current.temp_c;
            this.tempF = parsedDate.current.temp_f;
            
            
        })
        .catch((error)=>{
            this.condition = 'No Matching Found';
            console.log('Error-> ' + JSON.stringify(error));
        })
    }
}