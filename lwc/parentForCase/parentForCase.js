// parentComponent.js
import { LightningElement, api } from 'lwc';

export default class ParentComponent extends LightningElement {
    @api recordId; // Assuming you're using this component on an Account record page
}
