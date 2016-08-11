#!/bin/bash
# Charge credit or debit card via stripe 
#Johnathan Martin 2016

APIKEY='sk_live' #APIKEY FROM STRIPE
PS3='Please enter your choice: '
options=("View Balance" "Create Token" "Create Charge" "Quit")
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
	
           curl https://api.stripe.com/v1/tokens \
   -u $APIKEY: \
   -d card[number]=$CARD \
   -d card[exp_month]=$expmonth \
   -d card[exp_year]=$expyear 
            ;;
        "Create Charge")
            echo "Token"
	    read token
	echo "Amount"
	read AMT
#            echo "Charge Description"
#            read description
curl https://api.stripe.com/v1/charges \
   -u $APIKEY: \
   -d amount=$AMT \
   -d currency=usd \
   -d source=$token \
   -d description="Business Name"
            ;;
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done
