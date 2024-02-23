// childComponent.js
import { LightningElement, api, wire } from 'lwc';
import getNumberOfCases from '@salesforce/apex/GetNoOfContactsInAccount.getNumberOfCases';

export default class ChildComponent extends LightningElement {
    @api accountId;
    numberOfCases;

    @wire(getNumberOfCases, { accountId: '$accountId' })
    wiredCases({ error, data }) {
        if (data) {
            this.numberOfCases = data;
        } else if (error) {
            // Handle error
        }
    }
}
