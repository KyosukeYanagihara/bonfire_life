$(function() {
    return $('#user_address_attributes_postcode').jpostal({
      postcode: ['#user_address_attributes_postcode'],
      address: {
        '#user_address_attributes_prefecture_code': '%3',
        '#user_address_attributes_city': '%4%5%6',
        '#user_address_attributes_address1': '%7',
      },
    });
  });