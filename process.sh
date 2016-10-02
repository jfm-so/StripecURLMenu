#!/bin/bash
# Charge credit card via strope API
APIKEY='sk_live_'
PS3='Please enter your choice: '
options=("View Account Balance" "Create Charge Token" "Create Charge" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "View Account Balance")
            curl https://api.stripe.com/v1/balance \
   -u $APIKEY:
            ;;

        "Create Charge Token")
echo "Card Number"        
  read CARD
echo "exp month"
	read expmonth
echo "exp year"
	read expyear
#echo "CVC"
#	read cvc
#echo "Zip Code"
#	read zip
	
           curl https://api.stripe.com/v1/tokens \
   -u $APIKEY: \
   -d card[number]=$CARD \
   -d card[exp_month]=$expmonth \
   -d card[exp_year]=$expyear 
 #  -d card[cvc]=$cvc \
#   -d card[address_zip]=$zip
            ;;

        "Create Charge")
            echo "Token"
	    read token
	echo "Amount"
	read AMT
curl https://api.stripe.com/v1/charges \
   -u $APIKEY: \
   -d amount=$AMT \
   -d currency=usd \
   -d source=$token \
   -d description="FitTech"
            ;;

        "Quit")
            break
            ;;

        *) echo invalid option;;
    esac
done
