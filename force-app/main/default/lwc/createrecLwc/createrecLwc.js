//Wire Function
import { LightningElement,api,track,wire } from "lwc";
import { getRecord } from "lightning/uiRecordApi";
export default class WireFunction extends LightningElement{
    @api recordId;
    record;
    error;

    @wire(getRecord,{recordId:'$recordId',fields:['Account.Name']})
    wiredAccount({error,data}){
        if(data){
            this.record = data;
            this.error = undefined;
        }
        else if(error){
            this.error = error;
            this.record = undefined;
        }
    }
    get name(){
        return this.record.fields.Name.value;
    }
}

// import { LightningElement } from 'lwc';
// import { ShowToastEvent } from 'lightning/platformShowToastEvent';
// import ACCOUNT_OBJECT from '@salesforce/schema/Account';
// import Name_FIELD from '@salesforce/schema/Account.Name';
// import WEBSITE_FIELD from '@salesforce/schema/Account.Website';

// export default class CreaterecLwc extends LightningElement {

//     AccountObject=AccountObject;
//     myFields =[Name_FIELD, WEBSITE_FIELD];


//     handleAccountCreated(event){

//     }
// } 