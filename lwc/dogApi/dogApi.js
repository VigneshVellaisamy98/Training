import { LightningElement } from 'lwc';
import getDogPicture from '@salesforce/apex/DogApiCallout.getDogPicture';

export default class DogApi extends LightningElement {

    imageLoaded = false;
    loading     = false;
    pictureUrl;

    handleClick(){
        this.loading = true;
        this.imageLoaded = false;
        getDogPicture({}).then(result=>{
            this.pictureUrl = JSON.parse(result).message;
            this.imageLoaded = true;
            this.loading = false;

        })

        
    }

}