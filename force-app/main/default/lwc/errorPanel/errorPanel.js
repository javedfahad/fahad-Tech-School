import { LightningElement, api } from "lwc";

export default class ErrorPanel extends LightningElement {
  @api errors;

  get errorMessage() {
    if (Array.isArray(this.errors)) {
      return this.errors.map((error) => error.message).join(", ");
    }
    return this.errors ? this.errors.message : null;
  }
}
