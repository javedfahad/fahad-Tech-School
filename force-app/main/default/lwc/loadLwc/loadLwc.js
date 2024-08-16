import { LightningElement, api } from 'lwc';
// import ACCOUNT_FIELD from '@salesforce/schema/Contact.AccountId';
// import NAME_FIELD from '@salesforce/schema/Contact.Name';
// import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
// import PHONE_FIELD from '@salesforce/schema/Contact.Phone';
// import TITLE_FIELD from '@salesforce/schema/Contact.Title';

export default class LoadLwc extends LightningElement {

    // Flexipage provides recordId and objectApiName
    @api recordId;
    @api objectApiName;

    // fields = [ACCOUNT_FIELD,NAME_FIELD,EMAIL_FIELD,PHONE_FIELD,TITLE_FIELD];

}
