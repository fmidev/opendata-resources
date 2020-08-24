#!/bin/bash

# MP fmi.fi


# wget --no-clobber http://s3-eu-west-1.amazonaws.com/fmi-opendata-radar-geotiff/2020/08/21/${i}/202008211200_${i}_HCLASS.tif;
BASEURL=http://s3-eu-west-1.amazonaws.com
BUCKET=fmi-opendata-radar-geotiff

# fianj fiika fikes fikor fikuo filuo finur fipet fiuta fivan fivim
SITES=${SITES:-'fivan'}

# DBZH,VRAD,HCLASS
QUANTITIES=${QUANTITIES:-'DBZH'}

STEP=${STEP:-'5'} # minutes  

SECONDS_NOW=`date +%s`
SECONDS_NOW=$(( SECONDS_NOW - SECONDS_NOW%900 - 5*60 ))


# Online help
if [ $# == 0 ]; then
    FORMAT='%Y/%m/%d %H:%M'
    echo "Usage:"
    echo "  $0 now"
    echo "  $0 TIMESTAMP  TIMESTAMP_END"
    echo "  Timestamps are in UTC and 'date' syntax, eg '$FORMAT'."
    echo "  Timestamps may include spaces replaced with underscores."
    TIMESTAMP_END=`date +"$FORMAT" --date @$SECONDS_NOW --utc`
    SECONDS=$(( SECONDS_NOW - 15*60 ))
    TIMESTAMP=`date +"$FORMAT" --date @$SECONDS --utc` # --date='$TIMESTAMP_END'
    echo "  FMI site codes: fianj fiika fikes fikor fikuo filuo finur fipet fiuta fivan fivim"
    echo "  Available quantities: DBZH VRAD HCLASS"
    echo
    echo "Examples:"
    echo "  $0 '${TIMESTAMP}' '${TIMESTAMP_END}'"
    echo "  SITES=fivan,fikor STEP=15 $0 '${TIMESTAMP}' '${TIMESTAMP_END}'"
    echo "  SITES=fikor,fiika QUANTITIES=DBZH,VRAD $0 $TIMESTAMP"
    exit 1
fi


# First argument
if [ "$1" == 'now' ]; then
    SECONDS=SECONDS_NOW
else
    SECONDS=`date +%s --date "${1//_/ }"`
    if [ $? != 0 ]; then
	echo "Error in arg1: $1"
	exit 1	
    fi
fi

# Second argument
if [ $# == 2 ]; then
    SECONDS_END=`date +%s --date "${2//_/ }"`
    if [ $? != 0 ]; then
	echo "Error in arg2: $2"
	exit 1	
    fi
else
    SECONDS_END=$SECONDS
fi

# Check order
if (( SECONDS > SECONDS_END )); then
    echo "Error: SECONDS > SECONDS_END"
    exit 1	
fi

# Check if in future
if (( SECONDS_END > SECONDS_NOW )); then
    echo "Error: SECONDS_END in future"
    exit 1	
fi



# Main loop
s=$SECONDS
while (( s <=  SECONDS_END )); do

    T=( `date +"%Y/%m/%d %Y%m%d%H%M" --date=@$s` )
    TIMESTAMP_DIR=${T[0]}
    TIMESTAMP=${T[1]}

    #DIR="$ARCH_ROOT/$TIMESTAMP_DIR/radar/polar/$site/$ANDREDIR"
    #PRODUCT=${TIMESTAMP}_radar.polar.$site$ANDRE.h5

    for SITE in ${SITES//,/ } ; do
        for QUANTITY in ${QUANTITIES//,/ } ; do
	    wget --no-clobber $BASEURL/$BUCKET/$TIMESTAMP_DIR/${SITE}/${TIMESTAMP}_${SITE}_${QUANTITY}.tif
	done
    done

    s=$(( s + STEP*60 ))
    
done
