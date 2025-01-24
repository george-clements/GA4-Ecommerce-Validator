___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "dataLayer Validator",
  "brand": {
    "id": "brand_dummy",
    "displayName": ""
  },
  "description": "",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "SELECT",
    "name": "ecommerce",
    "displayName": "ecommerce",
    "macrosInSelect": true,
    "selectItems": [],
    "simpleValueType": true
  },
  {
    "type": "SELECT",
    "name": "event",
    "displayName": "Event",
    "macrosInSelect": true,
    "selectItems": [],
    "simpleValueType": true,
    "defaultValue": "{{Event}}"
  },
  {
    "type": "CHECKBOX",
    "name": "fatFinger",
    "checkboxText": "fatFinger Detection™",
    "simpleValueType": true,
    "help": "Detects whitespace at the beginning/end of the value"
  },
  {
    "type": "GROUP",
    "name": "items",
    "displayName": "Item Values",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "item_id",
        "checkboxText": "item_id",
        "simpleValueType": true
      },
      {
        "type": "CHECKBOX",
        "name": "item_name",
        "checkboxText": "item_name",
        "simpleValueType": true
      },
      {
        "type": "CHECKBOX",
        "name": "affiliation",
        "checkboxText": "affiliation",
        "simpleValueType": true
      },
      {
        "type": "CHECKBOX",
        "name": "coupon",
        "checkboxText": "coupon",
        "simpleValueType": true
      },
      {
        "type": "CHECKBOX",
        "name": "index",
        "checkboxText": "index",
        "simpleValueType": true
      },
      {
        "type": "CHECKBOX",
        "name": "item_brand",
        "checkboxText": "item_brand",
        "simpleValueType": true
      },
      {
        "type": "CHECKBOX",
        "name": "item_category",
        "checkboxText": "item_category",
        "simpleValueType": true
      },
      {
        "type": "CHECKBOX",
        "name": "item_category2",
        "checkboxText": "item_category2",
        "simpleValueType": true
      },
      {
        "type": "CHECKBOX",
        "name": "item_category3",
        "checkboxText": "item_category3",
        "simpleValueType": true
      },
      {
        "type": "CHECKBOX",
        "name": "item_category4",
        "checkboxText": "item_category4",
        "simpleValueType": true
      },
      {
        "type": "CHECKBOX",
        "name": "item_category5",
        "checkboxText": "item_category5",
        "simpleValueType": true
      },
      {
        "type": "CHECKBOX",
        "name": "item_list_id",
        "checkboxText": "item_list_id",
        "simpleValueType": true,
        "subParams": [
          {
            "type": "TEXT",
            "name": "event_regex_item_list_id",
            "displayName": "Event Regex",
            "simpleValueType": true,
            "help": "Provide a regex that will match against all events that should contain item_list_id. Eg. view_item|view_item_list",
            "defaultValue": ".*",
            "enablingConditions": [
              {
                "paramName": "item_list_id",
                "paramValue": true,
                "type": "EQUALS"
              }
            ]
          }
        ]
      },
      {
        "type": "CHECKBOX",
        "name": "item_list_name",
        "checkboxText": "item_list_name",
        "simpleValueType": true,
        "subParams": [
          {
            "type": "TEXT",
            "name": "event_regex_item_list_name",
            "displayName": "Event Regex",
            "simpleValueType": true,
            "help": "Provide a regex that will match against all events that should contain item_list_name. Eg. view_item|view_item_list",
            "defaultValue": ".*",
            "enablingConditions": [
              {
                "paramName": "item_list_name",
                "paramValue": true,
                "type": "EQUALS"
              }
            ]
          }
        ]
      },
      {
        "type": "CHECKBOX",
        "name": "item_variant",
        "checkboxText": "item_variant",
        "simpleValueType": true
      },
      {
        "type": "CHECKBOX",
        "name": "location_id",
        "checkboxText": "location_id",
        "simpleValueType": true
      },
      {
        "type": "CHECKBOX",
        "name": "price",
        "checkboxText": "price",
        "simpleValueType": true
      },
      {
        "type": "CHECKBOX",
        "name": "quantity",
        "checkboxText": "quantity",
        "simpleValueType": true
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Enter your template code here.
const log = require('logToConsole');
const Object = require('Object');
const createQueue = require('createQueue');
const dataLayerPush = createQueue('dataLayer');
const getType = require('getType');
const JSON = require('JSON');

// Universal Checks


var isString = function(value){
    return typeof(value) === 'string';
    };
var isNumber = function(value){
    return typeof(value) === 'number';
    };
var isPrice = function(value){
    return !!value.toString().match('[0-9]*(\\.[0-9]*)?');
    };
var fatFinger = function(value){
  if (!data.fatFinger){
    return true;
  }
  return value.trim().length === value.length;
};

var longerThan0 = function(value){
  return value.length > 0;
};

var isCurrencyCode = function(value){
  return !!value.match('[A-Z]{3}');
};

// Build Schema

var schema = {
    "currency": function(value){
        return isString(value) && isCurrencyCode(value);
    },
    "value": function(value){
        return isNumber(value) && isPrice(value);
    },
    "items": [{
        item_id: function(value){
            return isString(value) && longerThan0(value);
        },
        item_name: function(value){
            return isString(value) && longerThan0(value) && fatFinger(value);
        },
        affiliation: function(value){
            return isString(value) && longerThan0(value);
        },
        coupon: function(value){
            return isString(value);
        },
        discount: function(value){
            return isNumber(value) && isPrice(value);
        },
        index: function(value){
            return isNumber(value);
        },
        item_brand: function(value){
            return isString(value) && longerThan0(value) && fatFinger(value);
        },
        item_category: function(value){
            return isString(value) && longerThan0(value) && fatFinger(value);
        },
        item_category2: function(value){
            return isString(value) && longerThan0(value) && fatFinger(value);
        },
        item_category3: function(value){
            return isString(value) && longerThan0(value) && fatFinger(value);
        },
        item_category4: function(value){
            return isString(value) && longerThan0(value) && fatFinger(value);
        },
        item_category5: function(value){
            return isString(value) && longerThan0(value) && fatFinger(value);
        },
        item_list_id: function(value){
            return isString(value) && longerThan0(value) && !!data.event.match(data.event_regex_item_list_id);
        },
        item_list_name: function(value){
            return isString(value) && longerThan0(value) && fatFinger(value) && !!data.event.match(data.event_regex_item_list_name);
        },
        item_variant: function(value){
            return isString(value) && longerThan0(value);
        },
        location_id: function(value){
            return isString(value) && longerThan0(value);
        },
        price: function(value){
            return isNumber(value) && isPrice(value);
        },
        quantity: function(value){
            return isNumber(value) && value > 0;
        }
    }]
};

// Purchase exclusive parameters
if (data.event === 'purchase'){
  schema.transaction_id = function(value){
      return isString(value) && longerThan0(value);
  };
}

 var errors = [];
  var validate = function(object, schema) {
    Object.keys(schema).forEach(function(key) {
        if (key === 'items') {
            if (getType(object[key]) !== 'array') {
                errors.push('items_is_not_an_array');
            } else {
                object[key].forEach((item, index) => {
                    if (!item || typeof item !== 'object') {
                        errors.push('item_object_invalid');
                    } else {
                        validate(item, schema[key][0]);
                    }
                });
            }
        } 
       // If the parameter is disabled in setttings, back out
      else if (data[key] === false){
      }
      // Check if key is null or missing
      else if (object[key] === null || object[key] === undefined) {
            errors.push(key + '_missing');
        }
      // Check for object
      else if (typeof schema[key] === 'object') {
        // Check for entirely missing object
            if (typeof object[key] !== 'object' || object[key] === null) {
                errors.push(key + '_missing');
            } else {
              // Else recursively run
                validate(object[key], schema[key]);
            }
          // Otherwise run the validation on the current key
        } else if (!schema[key](object[key])) {
            errors.push(key + '_failed_with_' + object[key]);
        }
    });
};


// Check that we have a valid ecommerce object before beginning
if (typeof(data.ecommerce) === 'object' && data.ecommerce !== null){
  // Begin validating
validate (data.ecommerce, schema);
}
else {
  log('invalid_object_provided');
}
  // If anything failed validation, push an event with the details
if (errors.length > 0) {
        
     dataLayerPush({event: 'dataLayer_validator', validator_event_name: data.event, invalid: JSON.stringify(errors) });
       }


// Call data.gtmOnSuccess when the tag is finished.
data.gtmOnSuccess();


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "all"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "dataLayer"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: Lower Case Currency
  code: |-
    const mockData = {
        "quantity": true,
        "coupon": true,
        "item_id": true,
        "item_category4": true,
        "index": true,
        "item_category5": true,
        "item_name": true,
        "item_category2": true,
        "item_category3": true,
        "item_brand": true,
        "item_category": true,
        "location_id": true,
        "event_regex_item_list_name": ".*",
        "item_list_id": true,
        "affiliation": true,
        "item_list_name": true,
        "fatFinger": true,
        "price": true,
        "event_regex_item_list_id": ".*",
        "item_variant": true,
        event: 'view_item',
        ecommerce: {
            currency: "usd",
            value: 30.03,
            items: [
                {
                    item_id: "SKU_12345",
                    item_name: "Stan and Friends Tee",
                    affiliation: "Google Merchandise Store",
                    coupon: "SUMMER_FUN",
                    discount: 2.22,
                    index: 0,
                    item_brand: "Google",
                    item_category: "Apparel",
                    item_category2: "Adult",
                    item_category3: "Shirts",
                    item_category4: "Crew",
                    item_category5: "Short sleeve",
                    item_list_id: "related_products",
                    item_list_name: "Related Products",
                    item_variant: "green",
                    location_id: "ChIJIQBpAG2ahYAR_6128GcTUEo",
                    price: 10.01,
                    quantity: 3
                }
            ]
        }
    };

    let pushedEvents = [];

    // Mocking the createQueue function to capture pushed events
    mock("createQueue", function () {
        return function (event) {
            pushedEvents.push(event);
        };
    });

    const expectedPushedEvents = [
        // Define the expected pushed events based on your template logic
        { event: "dataLayer_validator", validator_event_name: "view_item", invalid: 'currency_failed_validation_with_value_usd' }
        // Add other expected pushed events here based on your logic
    ];

    // Call runCode to run the template's code.
    runCode(mockData);

    // Verify that the tag finished successfully.
    assertThat(pushedEvents).isEqualTo(expectedPushedEvents);
    assertApi('gtmOnSuccess').wasCalled();
- name: Missing Item ID
  code: |-
    const mockData = {
        "quantity": true,
        "coupon": true,
        "item_id": true,
        "item_category4": true,
        "index": true,
        "item_category5": true,
        "item_name": true,
        "item_category2": true,
        "item_category3": true,
        "item_brand": true,
        "item_category": true,
        "location_id": true,
        "event_regex_item_list_name": ".*",
        "item_list_id": true,
        "affiliation": true,
        "item_list_name": true,
        "fatFinger": true,
        "price": true,
        "event_regex_item_list_id": ".*",
        "item_variant": true,
        event: 'purchase',
        ecommerce: {
            currency: "USD",
            value: 30.03,
            transaction_id: 'order1234',
            items: [
                {
                    item_name: "Stan and Friends Tee",
                    affiliation: "Google Merchandise Store",
                    coupon: "SUMMER_FUN",
                    discount: 2.22,
                    index: 0,
                    item_brand: "Google",
                    item_category: "Apparel",
                    item_category2: "Adult",
                    item_category3: "Shirts",
                    item_category4: "Crew",
                    item_category5: "Short sleeve",
                    item_list_id: "related_products",
                    item_list_name: "Related Products",
                    item_variant: "green",
                    location_id: "ChIJIQBpAG2ahYAR_6128GcTUEo",
                    price: 10.01,
                    quantity: 3
                }
            ]
        }
    };

    let pushedEvents = [];

    // Mocking the createQueue function to capture pushed events
    mock("createQueue", function () {
      return function (event) {
        pushedEvents.push(event);
      };
    });

    const expectedPushedEvents = [
      // Define the expected pushed events based on your template logic
      { event: "dataLayer_validator", validator_event_name: "purchase", invalid: "item_id_is_null_or_missing"}
      // Add other expected pushed events here based on your logic
    ];

    // Call runCode to run the template's code.
    runCode(mockData);

    // Verify that the tag finished successfully.
    assertApi('gtmOnSuccess').wasCalled();
    assertThat(pushedEvents).isEqualTo(expectedPushedEvents);
- name: fatFinger Detection™
  code: |-
    const mockData = {
        "quantity": true,
        "coupon": true,
        "item_id": true,
        "item_category4": true,
        "index": true,
        "item_category5": true,
        "item_name": true,
        "item_category2": true,
        "item_category3": true,
        "item_brand": true,
        "item_category": true,
        "location_id": true,
        "event_regex_item_list_name": ".*",
        "item_list_id": true,
        "affiliation": true,
        "item_list_name": true,
        "price": true,
        "event_regex_item_list_id": ".*",
        "item_variant": true,
        "fatFinger": true,
        event: 'purchase',
        ecommerce: {
            currency: "USD",
            value: 30.03,
            transaction_id: 'order1234',
            items: [
                {
                    item_id: "SKU_12345",
                    item_name: " Stan and Friends Tee",
                    affiliation: "Google Merchandise Store",
                    coupon: "SUMMER_FUN",
                    discount: 2.22,
                    index: 0,
                    item_brand: "Google",
                    item_category: "Apparel",
                    item_category2: "Adult",
                    item_category3: "Shirts",
                    item_category4: "Crew",
                    item_category5: "Short sleeve",
                    item_list_id: "related_products",
                    item_list_name: "Related Products",
                    item_variant: "green",
                    location_id: "ChIJIQBpAG2ahYAR_6128GcTUEo",
                    price: 10.01,
                    quantity: 3
                }
            ]
        }
    };

    let pushedEvents = [];

    // Mocking the createQueue function to capture pushed events
    mock("createQueue", function () {
      return function (event) {
        pushedEvents.push(event);
      };
    });

    const expectedPushedEvents = [
      // Define the expected pushed events based on your template logic
      { event: "dataLayer_validator", validator_event_name: "purchase", invalid: 'item_name_failed_validation_with_value_ Stan and Friends Tee'}
      // Add other expected pushed events here based on your logic
    ];

    // Call runCode to run the template's code.
    runCode(mockData);

    // Verify that the tag finished successfully.
    assertApi('gtmOnSuccess').wasCalled();
    assertThat(pushedEvents).isEqualTo(expectedPushedEvents);
- name: Barebones checks
  code: "const mockData = {\n    \"quantity\": true,\n    \"coupon\": false,\n   \
    \ \"item_id\": true,\n    \"item_category4\": false,\n    \"index\": false,\n\
    \    \"discount\": false,\n    \"item_category5\": false,\n    \"item_name\":\
    \ false,\n    \"item_category2\": false,\n    \"item_category3\": false,\n   \
    \ \"item_brand\": false,\n    \"item_category\": false,\n    \"location_id\":\
    \ false,\n    \"event_regex_item_list_name\": \".*\",\n    \"item_list_id\": false,\n\
    \    \"affiliation\": false,\n    \"item_list_name\": false,\n    \"price\": true,\n\
    \    \"event_regex_item_list_id\": \".*\",\n    \"item_variant\": false,\n   \
    \ \"fatFinger\": false,\n    event: 'purchase',\n    ecommerce: {\n        currency:\
    \ \"USD\",\n        value: 30.03,\n        transaction_id: 'order1234',\n    \
    \    items: [\n            {  \n                item_id: \"SKU_12345\",\n    \
    \            item_name: \" Stan and Friends Tee\",\n                affiliation:\
    \ \"Google Merchandise Store\",\n                item_variant: \"green\",\n  \
    \              location_id: \"ChIJIQBpAG2ahYAR_6128GcTUEo\",\n               \
    \ price: 10.01,\n                quantity: 3\n            }\n        ]\n    }\n\
    };\n\nlet pushedEvents = [];\n\n// Mocking the createQueue function to capture\
    \ pushed events\nmock(\"createQueue\", function () {\n  return function (event)\
    \ {\n    pushedEvents.push(event);\n  };\n});\n\nconst expectedPushedEvents =\
    \ [];\n\n// Call runCode to run the template's code.\nrunCode(mockData);\n\n//\
    \ Verify that the tag finished successfully.\nassertApi('gtmOnSuccess').wasCalled();\n\
    assertThat(pushedEvents).isEqualTo(expectedPushedEvents);"
- name: Null Currency
  code: |-
    const mockData = {
        "quantity": true,
        "coupon": true,
        "item_id": true,
        "item_category4": true,
        "index": true,
        "item_category5": true,
        "item_name": true,
        "item_category2": true,
        "item_category3": true,
        "item_brand": true,
        "item_category": true,
        "location_id": true,
        "event_regex_item_list_name": ".*",
        "item_list_id": true,
        "affiliation": true,
        "item_list_name": true,
        "fatFinger": true,
        "price": true,
        "event_regex_item_list_id": ".*",
        "item_variant": true,
        event: 'view_item',
        ecommerce: {
            currency: null,
            value: 30.03,
            items: [
                {
                    item_id: "SKU_12345",
                    item_name: "Stan and Friends Tee",
                    affiliation: "Google Merchandise Store",
                    coupon: "SUMMER_FUN",
                    discount: 2.22,
                    index: 0,
                    item_brand: "Google",
                    item_category: "Apparel",
                    item_category2: "Adult",
                    item_category3: "Shirts",
                    item_category4: "Crew",
                    item_category5: "Short sleeve",
                    item_list_id: "related_products",
                    item_list_name: "Related Products",
                    item_variant: "green",
                    location_id: "ChIJIQBpAG2ahYAR_6128GcTUEo",
                    price: 10.01,
                    quantity: 3
                }
            ]
        }
    };

    let pushedEvents = [];

    // Mocking the createQueue function to capture pushed events
    mock("createQueue", function () {
        return function (event) {
            pushedEvents.push(event);
        };
    });

    const expectedPushedEvents = [
        // Define the expected pushed events based on your template logic
        { event: "dataLayer_validator", validator_event_name: "view_item", invalid: "currency_is_null_or_missing" }
        // Add other expected pushed events here based on your logic
    ];

    // Call runCode to run the template's code.
    runCode(mockData);

    // Verify that the tag finished successfully.
    assertThat(pushedEvents).isEqualTo(expectedPushedEvents);
    assertApi('gtmOnSuccess').wasCalled();


___NOTES___

Created on 20/01/2025, 22:22:29
