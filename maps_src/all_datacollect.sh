#!/bin/sh
./datacollect.sh --button;
./datacollect.sh --label;
./datacollect.sh --buildinglist;
./datacollect.sh --routinglistfragment;

cp ~/maps_logs/maps_logs/* ~/maps_src/logs/

#./datacollect.sh --button;
#./datacollect.sh --checkbox;
#./datacollect.sh --radiobutton;
#./datacollect.sh --togglebutton;
#./datacollect.sh --switch;
#./datacollect.sh --spinner;
#./datacollect.sh --spinner-button;
#./datacollect.sh --edittext;
#./datacollect.sh --picker;

