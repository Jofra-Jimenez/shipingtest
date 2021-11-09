#!/bin/sh

if [ ! -z $1 ]; then
    SPRING_PROFILE=$1
else
    SPRING_PROFILE="local"
fi

if [ "$2" == "skip" ]; then
    SKIP_TESTS="-DskipTests"
else
    SKIP_TESTS=""
fi

clear
echo --------------------------------------------------------------------
echo Starting spring_boot_794-rest using $SPRING_PROFILE profile
echo --------------------------------------------------------------------
mvn clean package $SKIP_TESTS && java -Xms128m -Xmx256m -jar  ./target/Inventory-1.0.jar
--spring.profiles.active=$SPRING_PROFILE
