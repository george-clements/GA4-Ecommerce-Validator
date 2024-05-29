var ecommerce_object = {
    currency: "USD",
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
  
  !function(){

    var isString = function(value){
        return typeof(value) === 'string'
    }
    var isNumber = function(value){
        return typeof(value) === 'number'
    }
    var isPrice = function(value){
        return /^[0-9]*\.[0-9]*$/.test(value)
    }
    
     // Deep clone object to remove references
     // I recommend using v1 to prevent recursive merge - so that we see the original object only
    // var ecommerce_object = JSON.parse(JSON.stringify('{{dlv_object_v1}}'));
    if (!ecommerce_object){
      return undefined
    }
      // Define Schema for view_item
      var schema = {
        "currency": function(value){
            return isString(value) && value.length > 0
        },
        "value": function(value){
            return isNumber(value) && isPrice(value)
        },
        "items": [{
            item_id: function(value){
                return isString(value) && value.length > 0
            },
            item_name: function(value){
                return isString(value) && value.length > 0
            },
            affiliation: function(value){
                return isString(value) && value.length > 0
            },
            coupon: function(value){
                return isString(value)
            },
            discount: function(value){
                return isNumber(value) && isPrice(value)
            },
            index: function(value){
                return isNumber(value)
            },
            item_brand: function(value){
                return isString(value) && value.length > 0
            },
            item_category: function(value){
                return isString(value) && value.length > 0
            },
            item_category2: function(value){
                return isString(value) && value.length > 0
            },
            item_category3: function(value){
                return isString(value) && value.length > 0
            },
            item_category4: function(value){
                return isString(value) && value.length > 0
            },
            item_category5: function(value){
                return isString(value) && value.length > 0
            },
            item_list_id: function(value){
                return isString(value) && value.length > 0
            },
            item_list_name: function(value){
                return isString(value) && value.length > 0
            },
            item_variant: function(value){
                return isString(value) && value.length > 0
            },
            location_id: function(value){
                return isString(value) && value.length > 0
            },
            price: function(value){
                return isNumber(value) && isPrice(value)
            },
            quantity: function(value){
                return isNumber(value) && value > 0
            }
        }]
    }

      
  var errors = [];
  var validate = function(object, schema){
      Object.keys(schema).forEach(function(key){
        //Expand the schemas items array to handle multiple items in object
        if (key === 'items' && object[key].length !== schema[key].length){
            for (var i = 1; i < object[key].length; i++){
                schema[key].push(schema[key][0]);
            }
        }
          if (typeof(schema[key]) === 'object' && schema[key] !== null){
            if (typeof(object[key]) !== 'object' || object[key] === null){
               errors.push(key + ' is missing')
            }  else {
              validate(object[key], schema[key])
            }
          } else if (!schema[key](object[key])) {
              errors.push(key);
          }
      })
  };
    validate (ecommerce_object, schema);
       if (errors.length > 0) {
        var error_string = errors.join(',');
     window.dataLayer = window.dataLayer || [];
     window.dataLayer.push({event: 'dataLayer_validator', validator_event_name: '{{Event}}', invalid: error_string })
       }
   }();
