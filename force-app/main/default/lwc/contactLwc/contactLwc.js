// contactList.js
import { LightningElement, wire } from 'lwc';
import getAllContacts from '@salesforce/apex/ContactController.getAllContacts';

const COLUMNS = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Email', fieldName: 'Email', type: 'email' },
    { label: 'Phone', fieldName: 'Phone', type: 'phone' }
];

export default class ContactList extends LightningElement {
    contacts;
    error;
    columns = COLUMNS;

    @wire(getAllContacts)
    wiredContacts({ error, data }) {
        if (data) {
            this.contacts = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.contacts = undefined;
        }
    }
}