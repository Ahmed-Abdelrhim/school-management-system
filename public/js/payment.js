const API = "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T0RJMk56YzRMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuc3o5RktzNF93RUZmaDVJYWNlUVpzdmFlRUlKMHlMS3R3TVpKNjREZlBxYmR6SE10dmtGcTluTXBFaDZhRTVsLXpTajk0RDJ5MGY0ZUdPNU8xSzl4WkE=";
async function firstStep() {
    let data = {
        "api_key": API,
    };

    let request = await fetch('https://accept.paymob.com/api/auth/tokens', {
        method: 'post',
        headers: { 'Content-Type' : 'application/json' },
        body: JSON.stringify(data),
    });

    let response = await request.json();
    // console.log(response.token);
    token = response.token;
    secondStep(token);
}


async function secondStep(token) {
    let data = {
        "auth_token": token,
        "delivery_needed" : 'false',
        "amount_cents" : '100',
        "currency" : 'EGP',
        "merchant_order_id": 5,
        "items": [],
    };

    let request = await fetch('https://accept.paymob.com/api/ecommerce/orders', {
        method: 'post',
        headers: { 'Content-Type' : 'application/json' },
        body: JSON.stringify(data),
    });

    let response = await request.json();
    // console.log(response);
    id = response.id;
    thirdStep(token , id);
}



async function thirdStep(token , id) {
    let data = {
        "auth_token": token,
        "amount_cents": "100",
        "expiration": 3600,
        "order_id": id,
        "billing_data": {
          "apartment": "1",
          "email": "aabdelrhim974@gmail.com",
          "floor": "42",
          "first_name": "Ahmed",
          "street": "12",
          "building": "18",
          "phone_number": "+20(2)01152067271",
          "shipping_method": "PKG",
          "postal_code": "11731",
          "city": "Cairo",
          "country": "EGYPT",
          "last_name": "Abdelrhim",
          "state": "Helwan"
        },
        "currency": "EGP",
        // "integration_id": 3932234,
        "integration_id": 3932234,
      };

    let request = await fetch('https://accept.paymob.com/api/acceptance/payment_keys', {
        method: 'post',
        headers: { 'Content-Type' : 'application/json' },
        body: JSON.stringify(data),
    });

    let response = await request.json();
    // console.log(response.token);
    finalToken = response.token;
    cardPayment(finalToken);

}


async function cardPayment(token)
{
    console.log(token);
    // iframeUrl = `https://accept.paymob.com/api/acceptance/iframes/767818?payment_token=${token}`;
    iframeUrl = `https://accept.paymob.com/api/acceptance/iframes/767817?payment_token=${token}`;
    location.href = iframeUrl;
}
