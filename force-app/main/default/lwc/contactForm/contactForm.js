import { LightningElement, track } from 'lwc';
import saveContact from '@salesforce/apex/contactDataset.saveContact';

export default class ContactForm extends LightningElement {
    @track selectedRecordType = '';
    @track name = '';
    @track email = '';
    @track phoneNumber = '';
    @track address = '';

    get recordTypeOptions() {
        return [
            { label: 'Parent/Guardian', value: 'Parent/Guardian' },
            { label: 'Individual', value: 'Individual' },
            { label: 'School Staff', value: 'School Staff' },
            { label: 'Student', value: 'Student' }
        ];
    }

    handleRecordTypeChange(event) {
        this.selectedRecordType = event.target.value;
    }

    handleNameChange(event) {
        this.name = event.target.value;
    }

    handleEmailChange(event) {
        this.email = event.target.value;
    }

    handlePhoneNumberChange(event) {
        this.phoneNumber = event.target.value;
    }

    handleAddressChange(event) {
        this.address = event.target.value;
    }

    handleSubmit() {
        if (this.selectedRecordType && this.name && this.email && this.phoneNumber && this.address) {
            saveContact({
                recordTypeName: this.selectedRecordType,
                name: this.name,
                email: this.email,
                phoneNumber: this.phoneNumber,
                address: this.address
            })
                .then(() => {
                    this.selectedRecordType = '';
                    this.name = '';
                    this.email = '';
                    this.phoneNumber = '';
                    this.address = '';
                    alert('Contact saved successfully!');
                })
                .catch((error) => {
                    console.error('Error saving contact:', error);
                    alert('Failed to save contact.');
                });
        } else {
            alert('Please fill out all fields.');
        }
    }
}
