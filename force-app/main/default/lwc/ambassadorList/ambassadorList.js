import { track, api, wire, LightningElement } from 'lwc';
import { getListUi } from 'lightning/uiListApi';

const fieldsByEntity = {
    "Contact" : ["Name", "Title", "Email", "Phone"]
}

export default class AmbassadorList extends LightningElement {
    @api
    apiName = "Contact";

    @api
    listViewApiName = "Brand_Ambassadors";

    @track
    records;
    
    @track
    show = false;

    @wire(getListUi, { objectApiName: '$apiName', listViewApiName: '$listViewApiName', pageSize: 100 })
    wiredListUI({ data, error }) {
        if (!data) return;
        this.records = data.records.records.map((record) => {
            return {
                id : record.fields.Id.value,
                field1 : (record.fields[fieldsByEntity[this.apiName][0]] || { value : ""}).value,
                field2 : (record.fields[fieldsByEntity[this.apiName][1]] || { value : ""}).value,
                field3 : (record.fields[fieldsByEntity[this.apiName][2]] || { value : ""}).value,
                field4 : (record.fields[fieldsByEntity[this.apiName][3]] || { value : ""}).value
            }
        });
        this.show = true;
//        this.fireEvent(this.records[0].id);
    }

    handleClick(event) {
        this.fireEvent(event.target.parentElement.getAttribute('data-record-id'));
    }

    fireEvent(recordId, apiName) {
        this.dispatchEvent(
            new CustomEvent('itemselected', {
                cancelable : true,
                bubbles : true,
                composed : true,
                detail : {
                    apiName : this.apiName,
                    recordId : recordId
                }
            })
        );
    }
}