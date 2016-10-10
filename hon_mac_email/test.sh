#!/bin/zsh

echo "hello, I will checking HON house every minute"

DAY_16=FALSE

echo $DAY_16


#alert for any apartments
#command of applying 11.16

while true
do

    echo "========curl start@!!!===================="
    echo
    echo
    echo 

    if [ $DAY_16 != "FALSE" ]
    then
        echo " in day 16th"
        COMMAND_11_16=`curl -i -d "start_tag=Mitte&start_monat=11&start_jahr=2016&end_tag=Ende&end_monat=08&end_jahr=2017&datum=16.11.2016&uhrzeit=13%3A00&typ%5B%5D=0&typ%5B%5D=1&typ%5B%5D=2&typ%5B%5D=3&absenden=%C2%A0%C2%A0Next%C2%A0%C2%A0" http://87.106.84.161/hon/whm_showunit.php | grep -c "Es wurden keine Ergebnisse zu ihrer Anfrage gefunden."`

        COMMAND_DA_DAP_ONLY_16=`curl -i -d "start_tag=Mitte&start_monat=11&start_jahr=2016&end_tag=Ende&end_monat=08&end_jahr=2017&datum=16.11.2016&uhrzeit=13%3A00&typ%5B%5D=2&typ%5B%5D=3&absenden=%C2%A0%C2%A0Next%C2%A0%C2%A0" http://87.106.84.161/hon/whm_showunit.php | grep -c "Es wurden keine Ergebnisse zu ihrer Anfrage gefunden."`
    fi

    COMMAND_DA_DAP_ONLY_01=`curl -i -d "start_tag=Anfang&start_monat=11&start_jahr=2016&end_tag=Ende&end_monat=08&end_jahr=2017&datum=01.11.2016&uhrzeit=13%3A00&typ%5B%5D=2&typ%5B%5D=3&absenden=%C2%A0%C2%A0Next%C2%A0%C2%A0" http://87.106.84.161/hon/whm_showunit.php | grep -c "Es wurden keine Ergebnisse zu ihrer Anfrage gefunden."`

    COMMAND_11_01=`curl -i -d "start_tag=Anfang&start_monat=11&start_jahr=2016&end_tag=Ende&end_monat=08&end_jahr=2017&datum=01.11.2016&uhrzeit=13%3A00&typ%5B%5D=0&typ%5B%5D=1&typ%5B%5D=2&typ%5B%5D=3&absenden=%C2%A0%C2%A0Next%C2%A0%C2%A0" http://87.106.84.161/hon/whm_showunit.php | grep -c "Es wurden keine Ergebnisse zu ihrer Anfrage gefunden."`

    echo "========curl ended@!!!===================="


    echo "========result ==========================="

    echo "COMMAND_11_01:"$COMMAND_11_01
    echo "COMMAND_DA_DAP_ONLY_01:"$COMMAND_DA_DAP_ONLY_01

    if [ $DAY_16 = "FALSE" ]
    then
        echo $COMMAND_11_16
        echo $COMMAND_DA_DAP_ONLY_16
    fi



    if [ $COMMAND_11_01 = "0" ]
    then
        echo "COMMAND_11_01: TRUE [$COMMAND_11_01]"
        echo "found house in 11.01, not sure its a double room"
        echo "found house in 11.01, not sure its a double room" | mail -s "11.01 new house alert" wdm228@126.com

    else
        echo "COMMAND_11_01: FALSE [$COMMAND_11_01]"
    fi


    if [ $COMMAND_DA_DAP_ONLY_01 = "0" ]
    then
        echo "COMMAND_DA_DAP_ONLY_01: TRUE [$COMMAND_DA_DAP_ONLY_01]"
        echo "found house in 11.01, DA !!!!"
        echo "found house in 11.01, DA !!!!" | mail -s "11.01 DAAAAAAAA alert" wdm228@126.com

    else
        echo "COMMAND_DA_DAP_ONLY_01: FALSE [$COMMAND_DA_DAP_ONLY_01]"
    fi


    if [ $DAY_16 != "FALSE" ]
    then
        echo "day 16"
        if [ $COMMAND_11_01 = "0" ]
        then
            echo "COMMAND_11_01: TRUE [$COMMAND_11_01]"
            echo "found house in 11.01, not sure its a double room"
            echo "found house in 11.01, not sure its a double room" | mail -s "11.01 new house alert" wdm228@126.com

        else
            echo "COMMAND_11_01: FALSE [$COMMAND_11_01]"
        fi


        if [ $COMMAND_DA_DAP_ONLY_01 = "0" ]
        then
            echo "COMMAND_DA_DAP_ONLY_01: TRUE [$COMMAND_DA_DAP_ONLY_01]"
            echo "found house in 11.01, DA !!!!"
            echo "found house in 11.01, DA !!!!" | mail -s "11.01 DAAAAAAAA alert" wdm228@126.com

        else
            echo "COMMAND_DA_DAP_ONLY_01: FALSE [$COMMAND_DA_DAP_ONLY_01]"
        fi
    fi

    echo "========result ended======================"



    sleep 5

done