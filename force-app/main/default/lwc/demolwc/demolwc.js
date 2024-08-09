import { LightningElement } from 'lwc';
import welcomeImage from '@salesforce/resourceUrl/welcomeImage';

export default class Demolwc extends LightningElement {
    name = 'Fahad';
    compony = 'Tech School';
    designation = 'Developer';
    salary = '$10000';
    welcomeImage = welcomeImage;

    handleFlowStart() {
        const flow = this.template.querySelector('lightning-flow');
        if (flow) {
            flow.startFlow('New_Record');
        } else {
            console.error('Flow component not found');
        }
    }
}
