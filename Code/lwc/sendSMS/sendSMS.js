import { LightningElement ,api,wire, track} from 'lwc';
import sendSMS from '@salesforce/apex/SendSMSService.SendSMS'
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class SendSMS extends LightningElement {    
    @api recordId;
    message  = '';


    onTextChange(event){
        this.message = event.detail.value;
        console.log('@@@'+this.message);
    }
    
    handleclick(){
        this.accountid =this.recordId;
        sendSMS({ message:this.message , accId:this.accountid})
       .then(result => {;
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message:  result,
                    variant: 'success'
                })
            );
        })
        .catch(error => {
            console.log("error:"+JSON.stringify(error));
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error',
                    message:  JSON.stringify(error),
                    variant: 'error'
                })
            );
        })
    }
}