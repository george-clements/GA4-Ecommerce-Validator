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
    "name": "ecommerce_source",
    "displayName": "Ecommerce Source",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "dataLayer",
        "displayValue": "dataLayer"
      },
      {
        "value": "javascript_variable",
        "displayValue": "Javascript Variable"
      }
    ],
    "simpleValueType": true,
    "subParams": [
      {
        "type": "RADIO",
        "name": "single_or_multiple",
        "displayName": "Single or Multiple",
        "radioItems": [
          {
            "value": "single",
            "displayValue": "Same variable for all events"
          },
          {
            "value": "multiple",
            "displayValue": "Different variable for each event"
          }
        ],
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "ecommerce_source",
            "paramValue": "javascript_variable",
            "type": "EQUALS"
          }
        ],
        "subParams": []
      }
    ]
  },
  {
    "type": "SELECT",
    "name": "single_variable_mapping",
    "displayName": "dataLayer Variable",
    "macrosInSelect": true,
    "selectItems": [],
    "simpleValueType": true,
    "enablingConditions": [
      {
        "paramName": "single_or_multiple",
        "paramValue": "single",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "event_variable_mapping",
    "displayName": "Event Variable Mapping",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "SELECT",
        "name": "view_item_list",
        "displayName": "view_item_list",
        "macrosInSelect": true,
        "selectItems": [],
        "simpleValueType": true
      },
      {
        "type": "SELECT",
        "name": "add_to_cart",
        "displayName": "add_to_cart",
        "macrosInSelect": true,
        "selectItems": [],
        "simpleValueType": true
      },
      {
        "type": "SELECT",
        "name": "view_item",
        "displayName": "view_item",
        "macrosInSelect": true,
        "selectItems": [],
        "simpleValueType": true
      },
      {
        "type": "SELECT",
        "name": "view_cart",
        "displayName": "view_cart",
        "macrosInSelect": true,
        "selectItems": [],
        "simpleValueType": true
      },
      {
        "type": "SELECT",
        "name": "begin_checkout",
        "displayName": "begin_checkout",
        "macrosInSelect": true,
        "selectItems": [],
        "simpleValueType": true
      },
      {
        "type": "SELECT",
        "name": "add_shipping_info",
        "displayName": "add_shipping_info",
        "macrosInSelect": true,
        "selectItems": [],
        "simpleValueType": true
      },
      {
        "type": "SELECT",
        "name": "add_payment_info",
        "displayName": "add_payment_info",
        "macrosInSelect": true,
        "selectItems": [],
        "simpleValueType": true
      },
      {
        "type": "SELECT",
        "name": "purchase",
        "displayName": "purchase",
        "macrosInSelect": true,
        "selectItems": [],
        "simpleValueType": true
      }
    ],
    "enablingConditions": [
      {
        "paramName": "single_or_multiple",
        "paramValue": "multiple",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "CHECKBOX",
    "name": "fatFinger",
    "checkboxText": "fatFinger Detection™",
    "simpleValueType": true,
    "help": "Detects whitespace at the beginning/end of text values"
  },
  {
    "type": "GROUP",
    "name": "items",
    "displayName": "Item Values",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "item_id",
        "checkboxText": "item_id",
        "simpleValueType": true,
        "defaultValue": true
      },
      {
        "type": "CHECKBOX",
        "name": "item_name",
        "checkboxText": "item_name",
        "simpleValueType": true,
        "defaultValue": true
      },
      {
        "type": "CHECKBOX",
        "name": "affiliation",
        "checkboxText": "affiliation",
        "simpleValueType": true,
        "defaultValue": false
      },
      {
        "type": "CHECKBOX",
        "name": "index",
        "checkboxText": "index",
        "simpleValueType": true,
        "defaultValue": false
      },
      {
        "type": "CHECKBOX",
        "name": "item_brand",
        "checkboxText": "item_brand",
        "simpleValueType": true,
        "defaultValue": true
      },
      {
        "type": "CHECKBOX",
        "name": "item_category",
        "checkboxText": "item_category",
        "simpleValueType": true,
        "defaultValue": true
      },
      {
        "type": "CHECKBOX",
        "name": "item_category2",
        "checkboxText": "item_category2",
        "simpleValueType": true,
        "defaultValue": false
      },
      {
        "type": "CHECKBOX",
        "name": "item_category3",
        "checkboxText": "item_category3",
        "simpleValueType": true,
        "defaultValue": false
      },
      {
        "type": "CHECKBOX",
        "name": "item_category4",
        "checkboxText": "item_category4",
        "simpleValueType": true,
        "defaultValue": false
      },
      {
        "type": "CHECKBOX",
        "name": "item_category5",
        "checkboxText": "item_category5",
        "simpleValueType": true,
        "defaultValue": false
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
        ],
        "defaultValue": false
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
        ],
        "defaultValue": false
      },
      {
        "type": "CHECKBOX",
        "name": "item_variant",
        "checkboxText": "item_variant",
        "simpleValueType": true,
        "defaultValue": true
      },
      {
        "type": "CHECKBOX",
        "name": "location_id",
        "checkboxText": "location_id",
        "simpleValueType": true,
        "defaultValue": false
      },
      {
        "type": "CHECKBOX",
        "name": "price",
        "checkboxText": "price",
        "simpleValueType": true,
        "defaultValue": true
      },
      {
        "type": "CHECKBOX",
        "name": "quantity",
        "checkboxText": "quantity",
        "simpleValueType": true,
        "defaultValue": true
      }
    ]
  },
  {
    "type": "CHECKBOX",
    "name": "advanced",
    "checkboxText": "Advanced Settings",
    "simpleValueType": true,
    "subParams": [
      {
        "type": "PARAM_TABLE",
        "name": "additional_parameters",
        "displayName": "Validation",
        "paramTableColumns": [
          {
            "param": {
              "type": "TEXT",
              "name": "parameterName",
              "displayName": "Parameter Name",
              "simpleValueType": true,
              "valueValidators": [
                {
                  "type": "NON_EMPTY"
                }
              ]
            },
            "isUnique": true
          },
          {
            "param": {
              "type": "CHECKBOX",
              "name": "isString",
              "checkboxText": "Is String",
              "simpleValueType": true
            },
            "isUnique": false
          },
          {
            "param": {
              "type": "CHECKBOX",
              "name": "isNumber",
              "checkboxText": "Is Number",
              "simpleValueType": true
            },
            "isUnique": false
          },
          {
            "param": {
              "type": "CHECKBOX",
              "name": "isPrice",
              "checkboxText": "Is Price",
              "simpleValueType": true
            },
            "isUnique": false
          },
          {
            "param": {
              "type": "CHECKBOX",
              "name": "fatFinger",
              "checkboxText": "fatFinger Detection™",
              "simpleValueType": true
            },
            "isUnique": false
          },
          {
            "param": {
              "type": "CHECKBOX",
              "name": "longerThan0",
              "checkboxText": "Longer than 0",
              "simpleValueType": true
            },
            "isUnique": false
          },
          {
            "param": {
              "type": "SELECT",
              "name": "parameterType",
              "displayName": "Parameter Type",
              "macrosInSelect": false,
              "selectItems": [
                {
                  "value": "standard",
                  "displayValue": "Standard"
                },
                {
                  "value": "item",
                  "displayValue": "Item"
                }
              ],
              "simpleValueType": true
            },
            "isUnique": false
          }
        ],
        "enablingConditions": [
          {
            "paramName": "advanced",
            "paramValue": true,
            "type": "EQUALS"
          }
        ],
        "newRowButtonText": "Add Custom Parameter"
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
const copyFromDataLayer = require('copyFromDataLayer');
const getType = require('getType');
const JSON = require('JSON');

var event = copyFromDataLayer('event');

var ecommerce;
if (data.ecommerce_source === 'dataLayer'){
  ecommerce = copyFromDataLayer('ecommerce');
}
  else if (data.single_or_multiple === 'single') {
    ecommerce = data.single_variable_mapping;
  }
  else if (getType(data[event]) === "object") {
    ecommerce = data[event];
}

// Universal Checks

var isString = function(value){
    return typeof(value) === 'string';
    };
var isNumber = function(value){
    return typeof(value) === 'number';
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
        return isNumber(value);
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
            return isNumber(value);
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
            return isString(value) && longerThan0(value) && !!event.match(data.event_regex_item_list_id);
        },
        item_list_name: function(value){
            return isString(value) && longerThan0(value) && fatFinger(value) && !!event.match(data.event_regex_item_list_name);
        },
        item_variant: function(value){
            return isString(value) && longerThan0(value);
        },
        location_id: function(value){
            return isString(value) && longerThan0(value);
        },
        price: function(value){
            return isNumber(value);
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

// Add custom parameters from the user to the schema
if (data.advanced && getType(data.additional_parameters) === 'array'){
    data.additional_parameters.forEach(function(param){
      // Nest item parameters in the items array
      var base_object = schema;
        if (param.parameterType === 'item'){
          base_object = schema.items[0];
        }
         base_object[param.parameterName] = function(value){
             return ((!param.isNumber || isNumber(value)) && (!param.fatFinger || fatFinger(value)) && (!param.isString || isString(value)));
         };
    });
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
if (typeof(ecommerce) === 'object' && ecommerce !== null){
  // Begin validating
validate (ecommerce, schema);
}
else {
  log('invalid_object_provided');
}
  // If anything failed validation, push an event with the details
if (errors.length > 0) {
        
     dataLayerPush({event: 'dataLayer_validator', validator_event_name: event, invalid: JSON.stringify(errors) });
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
  },
  {
    "instance": {
      "key": {
        "publicId": "read_data_layer",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedKeys",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "keyPatterns",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "event"
              },
              {
                "type": 1,
                "string": "ecommerce"
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
        "ecommerce_source": "dataLayer",
        "advanced": false,
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
    };

    mock('copyFromDataLayer', key => {
      if (key === "event") {
        return 'view_item';
      }
      else if (key === 'ecommerce'){
        return {
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
        };
      }
    });

    const expectedPushedEvents = [
        // Define the expected pushed events based on your template logic
        { event: "dataLayer_validator", validator_event_name: "view_item", invalid: '["currency_failed_with_usd"]'}
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
        "ecommerce_source": "dataLayer",
        "advanced": false,
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
    };

    mock('copyFromDataLayer', key => {
      if (key === "event") {
        return 'view_item';
      }
      else if (key === 'ecommerce'){
        return {
            currency: "USD",
            value: 30.03,
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
        };
      }
    });

    const expectedPushedEvents = [
        // Define the expected pushed events based on your template logic
        { event: "dataLayer_validator", validator_event_name: "view_item", invalid: '["item_id_missing"]'}
        // Add other expected pushed events here based on your logic
    ];

    // Call runCode to run the template's code.
    runCode(mockData);

    // Verify that the tag finished successfully.
    assertThat(pushedEvents).isEqualTo(expectedPushedEvents);
    assertApi('gtmOnSuccess').wasCalled();
- name: fatFinger Detection™
  code: |-
    const mockData = {
        "ecommerce_source": "dataLayer",
        "advanced": false,
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
    };

    mock('copyFromDataLayer', key => {
      if (key === "event") {
        return 'view_item';
      }
      else if (key === 'ecommerce'){
        return {
            currency: "USD",
            value: 30.03,
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
        };
      }
    });


    const expectedPushedEvents = [
        // Define the expected pushed events based on your template logic
        { event: "dataLayer_validator", validator_event_name: "view_item", invalid: '["item_name_failed_with_ Stan and Friends Tee"]'}
        // Add other expected pushed events here based on your logic
    ];

    // Call runCode to run the template's code.
    runCode(mockData);

    // Verify that the tag finished successfully.
    assertThat(pushedEvents).isEqualTo(expectedPushedEvents);
    assertApi('gtmOnSuccess').wasCalled();
- name: Barebones checks
  code: |-
    const mockData = {
        "ecommerce_source": "dataLayer",
        "advanced": false,
        "quantity": true,
        "coupon": false,
        "item_id": true,
        "item_category4": false,
        "index": false,
        "discount": false,
        "item_category5": false,
        "item_name": false,
        "item_category2": false,
        "item_category3": false,
        "item_brand": false,
        "item_category": false,
        "location_id": false,
        "event_regex_item_list_name": ".*",
        "item_list_id": false,
        "affiliation": false,
        "item_list_name": false,
        "price": true,
        "event_regex_item_list_id": ".*",
        "item_variant": false,
        "fatFinger": false,
    };

    mock('copyFromDataLayer', key => {
      if (key === "event") {
        return 'view_item';
      }
      else if (key === 'ecommerce'){
        return {
            currency: "USD",
            value: 30.03,
            items: [
                {
                    item_id: "SKU_12345",
                    item_name: " Stan and Friends Tee",
                    affiliation: "Google Merchandise Store",
                    coupon: "SUMMER_FUN",
                    discount: 2.22,
                    index: 0,
                    item_brand: "Google",
                    item_list_id: "related_products",
                    item_list_name: "Related Products",
                    item_variant: "green",
                    location_id: "ChIJIQBpAG2ahYAR_6128GcTUEo",
                    price: 10.01,
                    quantity: 3
                }
            ]
        };
      }
    });

    const expectedPushedEvents = [];

    // Call runCode to run the template's code.
    runCode(mockData);

    // Verify that the tag finished successfully.
    assertThat(pushedEvents).isEqualTo(expectedPushedEvents);
    assertApi('gtmOnSuccess').wasCalled();
- name: Null Currency
  code: |-
    const mockData = {
        "ecommerce_source": "dataLayer",
        "advanced": false,
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
    };

    mock('copyFromDataLayer', key => {
      if (key === "event") {
        return 'add_to_cart';
      }
      else if (key === 'ecommerce'){
        return {
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
        };
      }
    });

    const expectedPushedEvents = [
        // Define the expected pushed events based on your template logic
        { event: "dataLayer_validator", validator_event_name: "add_to_cart", invalid: '["currency_missing"]'}
        // Add other expected pushed events here based on your logic
    ];

    // Call runCode to run the template's code.
    runCode(mockData);

    // Verify that the tag finished successfully.
    assertThat(pushedEvents).isEqualTo(expectedPushedEvents);
    assertApi('gtmOnSuccess').wasCalled();
- name: Additional Parameter Missing
  code: |-
    const mockData = {
        "ecommerce_source": "dataLayer",
        "advanced": false,
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
        "additional_parameters":[
        {
            "parameterName": "item_type",
            "isString": true,
            "isNumber": false,
            "isPrice": false,
            "fatFinger": false,
            "parameterType": "item"
        }
    ]
    };

    mock('copyFromDataLayer', key => {
      if (key === "event") {
        return 'add_to_cart';
      }
      else if (key === 'ecommerce'){
        return {
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
        };
      }
    });

    const expectedPushedEvents = [
        // Define the expected pushed events based on your template logic
        { event: "dataLayer_validator", validator_event_name: "add_to_cart", invalid: '["currency_missing"]'}
        // Add other expected pushed events here based on your logic
    ];

    // Call runCode to run the template's code.
    runCode(mockData);

    // Verify that the tag finished successfully.
    assertThat(pushedEvents).isEqualTo(expectedPushedEvents);
    assertApi('gtmOnSuccess').wasCalled();
- name: Additional Parameter Failed Validation
  code: |-
    const mockData = {
        "ecommerce_source": "dataLayer",
        "advanced": false,
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
        "additional_parameters":[
        {
            "parameterName": "item_type",
            "isString": true,
            "isNumber": false,
            "isPrice": false,
            "fatFinger": false,
            "parameterType": "item"
        }
    ]
    };

    mock('copyFromDataLayer', key => {
      if (key === "event") {
        return 'add_to_cart';
      }
      else if (key === 'ecommerce'){
        return {
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
                    item_type: 12345,
                    item_variant: "green",
                    location_id: "ChIJIQBpAG2ahYAR_6128GcTUEo",
                    price: 10.01,
                    quantity: 3
                }
            ]
        };
      }
    });

    const expectedPushedEvents = [
        // Define the expected pushed events based on your template logic
        { event: "dataLayer_validator", validator_event_name: "add_to_cart", invalid: '["currency_missing"]'}
        // Add other expected pushed events here based on your logic
    ];

    // Call runCode to run the template's code.
    runCode(mockData);

    // Verify that the tag finished successfully.
    assertThat(pushedEvents).isEqualTo(expectedPushedEvents);
    assertApi('gtmOnSuccess').wasCalled();
- name: Mapped Variable - view_item
  code: |-
    const mockData = {
        "ecommerce_source": "javascript_variable",
        "single_or_multiple": "multiple",
        "view_item": {
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
        },
        "advanced": false,
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
    };

    mock('copyFromDataLayer', key => {
      if (key === "event") {
        return 'view_item';
      }
    });

    const expectedPushedEvents = [
        // Define the expected pushed events based on your template logic
        { event: "dataLayer_validator", validator_event_name: "view_item", invalid: '["currency_failed_with_usd"]'}
        // Add other expected pushed events here based on your logic
    ];

    // Call runCode to run the template's code.
    runCode(mockData);

    // Verify that the tag finished successfully.
    assertThat(pushedEvents).isEqualTo(expectedPushedEvents);
    assertApi('gtmOnSuccess').wasCalled();
- name: Mapped Variable - add_to_cart
  code: |-
    const mockData = {
        "ecommerce_source": "javascript_variable",
        "single_or_multiple": "multiple",
        "add_to_cart": {
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
        },
        "advanced": false,
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
    };

    mock('copyFromDataLayer', key => {
      if (key === "event") {
        return 'add_to_cart';
      }
    });

    const expectedPushedEvents = [
        // Define the expected pushed events based on your template logic
        { event: "dataLayer_validator", validator_event_name: "add_to_cart", invalid: '["currency_failed_with_usd"]'}
        // Add other expected pushed events here based on your logic
    ];

    // Call runCode to run the template's code.
    runCode(mockData);

    // Verify that the tag finished successfully.
    assertThat(pushedEvents).isEqualTo(expectedPushedEvents);
    assertApi('gtmOnSuccess').wasCalled();
setup: |-
  let pushedEvents = [];

  // Mocking the createQueue function to capture pushed events
  mock("createQueue", function () {
      return function (event) {
          pushedEvents.push(event);
      };
  });


___NOTES___

Created on 20/01/2025, 22:22:29


