import { LightningElement,api } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
export default class UploadFilesLWC extends LightningElement {
    @api recordId;
    get acceptedFormats(){
        return ['.pdf' , '.png' , '.jpg' , '.jpeg'];
    }
    handleUploadFinished(event){
        //get uploaded files

        const uploadedFiles = event.detail.files;
        let uploadedFilesName = '';
        uploadedFiles.forEach(file => {
            uploadedFileNames += file.name + ', ';
        });
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: uploadedFiles.length + ' Files uploaded Successfully: ' + uploadedFileNames,
                variant: 'success',
            }),
        );
    }
}