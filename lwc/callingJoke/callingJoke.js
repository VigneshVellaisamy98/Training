import { LightningElement ,wire } from 'lwc';
import getJoke from '@salesforce/apex/CallingJoke.getJoke';

export default class CallingJoke extends LightningElement {
    joke;
    error;

    @wire(getJoke)
    wiredJoke({error,data}){
        if(data){
            this.joke = data.setup + " " + data.punchline;
            this.error = undefined; // Clear any previous error
        }
        else if(error){
            this.joke = undefined; // Clear joke if there's an error
            this.error = 'Error Fetching Joke: ' + error.body.message;
            console.error('Error Fetching Joke ', error);
        }
    }
}
