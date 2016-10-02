APIKEY='sk_live_'
echo 'Amount (in pennies)'
read AMOUNT
echo 'Customer ID'
read CUSTOMER
curl https://api.stripe.com/v1/charges \
-u $APIKEY: \
-d amount=$AMOUNT \
-d currency=usd \
-d customer=$CUSTOMER \
-d description="FitTech Web Development"
