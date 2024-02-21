import { LightningElement , wire } from 'lwc';
import getProductQuery from '@salesforce/apex/getProducts.getProductQuery';

export default class ShowProductsUsingApex extends LightningElement {
    @wire(getProductQuery)
    products;

    constructor(){
        super()
    }
    connectedCallback(){
        2
    }
    renderedCallback(){
        3
    }
    disconnectedCallback(){
        4
    }
    errorCallback(){
        5
    }

    
}