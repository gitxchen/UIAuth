#!/bin/bash
cd $HOME/logs/;
c++ $HOME/src/FindTapFeatures.cpp -o $HOME/src/FindTapFeatures;
c++ $HOME/src/FindTapFlingFeatures.cpp -o $HOME/src/FindTapFlingFeatures;
c++ $HOME/src/FindTapPressFeatures.cpp -o $HOME/src/FindTapPressFeatures;

USERS="user1 user2 user3 user4 user5 user6 user7 user8 user9 user10 user12 user13 user14 user15 user16";

SEARCH_STRINGS="";
LOG_PREFIX="";
BINARY="";

if [ "$1" == "--button" ]; then
  SEARCH_STRINGS="next_button";
  LOG_PREFIX="button";
  BINARY="FindTapFeatures"
fi

if [ "$1" == "--checkbox" ]; then
  SEARCH_STRINGS="checkbox_answer";
  LOG_PREFIX="checkbox";
  BINARY="FindTapFeatures"
fi

if [ "$1" == "--togglebutton" ]; then
  SEARCH_STRINGS="togglebutton_answer";
  LOG_PREFIX="togglebutton";
  BINARY="FindTapFeatures"
fi

if [ "$1" == "--radiobutton" ]; then
  SEARCH_STRINGS="radiobutton_answer11( radiobutton_answer12( radiobutton_answer21( radiobutton_answer22( radiobutton_answer31( radiobutton_answer32( radiobutton_answer41( radiobutton_answer42( radiobutton_answer51( radiobutton_answer52( radiobutton_answer61( radiobutton_answer62( radiobutton_answer71( radiobutton_answer72( radiobutton_answer81( radiobutton_answer82( radiobutton_answer91( radiobutton_answer92( radiobutton_answer101( radiobutton_answer102(";
  LOG_PREFIX="radiobutton";
  BINARY="FindTapFeatures"
fi

if [ "$1" == "--switch" ]; then
  SEARCH_STRINGS="switch_answer1( switch_answer2( switch_answer5( switch_answer6( switch_answer8( switch_answer9( switch_answer10( switch_answer11( switch_answer12( switch_answer14( switch_answer15( switch_answer17( switch_answer18( switch_answer20(";
  LOG_PREFIX="switch";
  BINARY="FindTapFeatures FindTapFlingFeatures"
fi

if [ "$1" == "--edittext" ]; then
  SEARCH_STRINGS="text_answer3( text_answer4( text_answer5( text_answer6( text_answer7( text_answer8( text_answer9(";
  LOG_PREFIX="edittext";
  BINARY="FindTapPressFeatures"
fi

if [ "$1" == "--edittext1" ]; then
  SEARCH_STRINGS="/number_string( /qwerty_string( /subject_number( /text_subject_number( /number_string_final( /qwerty_string_final( /subject_number_final(";
  LOG_PREFIX="edittext1";
  BINARY="FindTapPressFeatures"
fi

if [ "$1" == "--spinner" ]; then
  SEARCH_STRINGS="spinner1( spinner2( spinner3( spinner4( spinner5( spinner6( spinner7( spinner8( spinner9( spinner10(";
  LOG_PREFIX="spinner";
  BINARY="FindTapFeatures"
fi

if [ "$1" == "--picker" ]; then
  SEARCH_STRINGS="number_picker1( number_picker2( number_picker3( number_picker4( number_picker5( number_picker6( number_picker7( number_picker8( number_picker9( number_picker10( number_picker11( number_picker12(";
  LOG_PREFIX="picker";
  BINARY="FindTapFlingFeatures"
fi




for user in $USERS
do
  echo "Collecting $LOG_PREFIX data for "$user;
  rm $HOME/logs/logs/$user-$LOG_PREFIX-app1-downup.log;
  rm $HOME/logs/logs/$user-$LOG_PREFIX-app2-downup.log;
  rm $HOME/logs/logs/$user-$LOG_PREFIX-app3-downup.log;
  cd $HOME/logs/$user;
  rm *-$LOG_PREFIX*;
  for search_string in $SEARCH_STRINGS
  do
    for b in $BINARY
    do
      cp $HOME/src/$b $HOME/logs/$user;
      $HOME/logs/$user/$b $search_string app1.txt $user-$LOG_PREFIX-app1;
      $HOME/logs/$user/$b $search_string app2.txt $user-$LOG_PREFIX-app2;
      $HOME/logs/$user/$b $search_string app3.txt $user-$LOG_PREFIX-app3;
      rm $HOME/logs/$user/$b;
    done
  done
  mv $HOME/logs/$user/$user-$LOG_PREFIX-app1-downup.log $HOME/logs/logs;
  mv $HOME/logs/$user/$user-$LOG_PREFIX-app2-downup.log $HOME/logs/logs;
  mv $HOME/logs/$user/$user-$LOG_PREFIX-app3-downup.log $HOME/logs/logs;
  #mv $HOME/logs/$user/$user-$LOG_PREFIX-test-downup.log $HOME/logs/logs;
  cd $HOME/logs;
done

