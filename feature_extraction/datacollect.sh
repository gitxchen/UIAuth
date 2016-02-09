#!/bin/bash
cd $HOME/new_logs/;
c++ $HOME/src/FindTapFeatures.cpp -o $HOME/new_logs/FindTapFeatures;
c++ $HOME/src/FindTapFlingFeatures.cpp -o $HOME/new_logs/FindTapFlingFeatures;
c++ $HOME/src/FindTapPressFeatures.cpp -o $HOME/new_logs/FindTapPressFeatures;
c++ $HOME/src/FindTapScrollFeatures.cpp -o $HOME/new_logs/FindTapScrollFeatures;

USERS="user42";
#USERS="user1 user2 user3 user4 user5 user6 user7 user8 user9 user10 user11 user12 user13 user14 user15 user16 user17 user18 user19 user20 user21 user22 user23 user24";

SEARCH_STRINGS="";
LOG_PREFIX="";
BINARY="";

if [ "$1" == "--button" ]; then
  SEARCH_STRINGS="next_button";
  LOG_PREFIX="button";
  BINARY="FindTapFeatures"
fi

if [ "$1" == "--checkbox" ]; then
  SEARCH_STRINGS="checkbox_answer31( checkbox_answer32( \
                  checkbox_answer41( checkbox_answer42( \
                  checkbox_answer51( checkbox_answer52( \
                  checkbox_answer61( checkbox_answer62( \
                  checkbox_answer71( checkbox_answer72( \
                  checkbox_answer81( checkbox_answer82( \
                  checkbox_answer91( checkbox_answer92( \
                  checkbox_answer101( checkbox_answer102( \
                  checkbox_answer111( checkbox_answer112( \
                  checkbox_answer121( checkbox_answer122( \
                  checkbox_answer131( checkbox_answer132( \
                  checkbox_answer141( checkbox_answer142( \
                  checkbox_answer151( checkbox_answer152( \
                  checkbox_answer161( checkbox_answer162( \
                  checkbox_answer171( checkbox_answer172( \
                  checkbox_answer181( checkbox_answer182( \
                  checkbox_answer191( checkbox_answer192( \
                  checkbox_answer201( checkbox_answer202( \
                  checkbox_answer211( checkbox_answer212( \
                  checkbox_answer221( checkbox_answer222(";
  LOG_PREFIX="checkbox";
  BINARY="FindTapFeatures"
fi

if [ "$1" == "--togglebutton" ]; then
  SEARCH_STRINGS="togglebutton_answer";
  LOG_PREFIX="togglebutton";
  BINARY="FindTapFeatures"
fi

if [ "$1" == "--radiobutton" ]; then
  SEARCH_STRINGS="radiobutton_answer11( radiobutton_answer12( \
                  radiobutton_answer21( radiobutton_answer22( \
                  radiobutton_answer31( radiobutton_answer32( \
                  radiobutton_answer41( radiobutton_answer42( \
                  radiobutton_answer51( radiobutton_answer52( \
                  radiobutton_answer61( radiobutton_answer62( \
                  radiobutton_answer71( radiobutton_answer72( \
                  radiobutton_answer81( radiobutton_answer82( \
                  radiobutton_answer91( radiobutton_answer92( \
                  radiobutton_answer101( radiobutton_answer102( \
                  radiobutton_answer111( radiobutton_answer112( \
                  radiobutton_answer121( radiobutton_answer122( \
                  radiobutton_answer131( radiobutton_answer132( \
                  radiobutton_answer141( radiobutton_answer142( \
                  radiobutton_answer151( radiobutton_answer152( \
                  radiobutton_answer161( radiobutton_answer162( \
                  radiobutton_answer171( radiobutton_answer172( \
                  radiobutton_answer181( radiobutton_answer182( \
                  radiobutton_answer191( radiobutton_answer192( \
                  radiobutton_answer201( radiobutton_answer202(";
  LOG_PREFIX="radiobutton";
  BINARY="FindTapFeatures"
fi

if [ "$1" == "--switch" ]; then
  SEARCH_STRINGS="switch_answer1( switch_answer2( \
                  switch_answer3( switch_answer4( \
                  switch_answer5( switch_answer6( \
                  switch_answer7( switch_answer8( \
                  switch_answer9( switch_answer10( \
                  switch_answer11( switch_answer12( \
                  switch_answer13( switch_answer14( \
                  switch_answer15( switch_answer16( \
                  switch_answer17( switch_answer18( \
                  switch_answer19( switch_answer20(";
  LOG_PREFIX="switch";
  BINARY="FindTapFeatures FindTapFlingFeatures"
fi

if [ "$1" == "--edittext" ]; then
  SEARCH_STRINGS="text_answer3( text_answer4( \
                  text_answer5( text_answer6( \
                  text_answer7( text_answer8( \
                  text_answer9( text_answer10( \
                  text_answer11( text_answer12(\
                  text_answer13( text_answer14(\
                  text_answer15( text_answer16(\
                  text_answer17( text_answer18(\
                  text_answer19( text_answer20(\
                  text_answer21( text_answer22(\
                  text_answer23( "; 
  LOG_PREFIX="edittext";
  BINARY="FindTapPressFeatures"
fi

if [ "$1" == "--edittext1" ]; then
  SEARCH_STRINGS="/number_string( /qwerty_string( /subject_number( \
                  /text_subject_number( /number_string_final( \
				  /qwerty_string_final( /subject_number_final(";
  LOG_PREFIX="edittext1";
  BINARY="FindTapPressFeatures"
fi

if [ "$1" == "--spinner" ]; then
  SEARCH_STRINGS="spinner1_answer( spinner2_answer( \
                  spinner3_answer( spinner4_answer( \
				  spinner5_answer( spinner6_answer( \
				  spinner7_answer( spinner8_answer( \
				  spinner9_answer( spinner10_answer(\
				  spinner11_answer( spinner12_answer(\
				  spinner13_answer( spinner14_answer(\
				  spinner15_answer( spinner16_answer(\
				  spinner17_answer( spinner18_answer(\
				  spinner19_answer( spinner20_answer(";
  LOG_PREFIX="spinner";
  BINARY="FindTapFeatures"
fi

if [ "$1" == "--spinner-button" ]; then
  SEARCH_STRINGS="spinner_button1( spinner_button2( \
                  spinner_button3( spinner_button4( \
				  spinner_button5( spinner_button6( \
				  spinner_button7( spinner_button8( \
				  spinner_button9( spinner_button10(\
				  spinner_button11( spinner_button12(\
				  spinner_button13( spinner_button14(\
				  spinner_button15( spinner_button16(\
				  spinner_button17( spinner_button18(\
				  spinner_button19( spinner_button20(";
  LOG_PREFIX="spinner-button";
  BINARY="FindTapFeatures"
fi



if [ "$1" == "--picker" ]; then
  SEARCH_STRINGS="number_picker1( number_picker2( \
                  number_picker3( number_picker4( \
				  number_picker5( number_picker6( \
				  number_picker7( number_picker8( \
				  number_picker9( number_picker10( \
				  number_picker11( number_picker12( \
				  number_picker13( number_picker14( \
				  number_picker15( number_picker16("; 
  LOG_PREFIX="picker";
  BINARY="FindTapScrollFeatures"
fi



for user in $USERS
do
  echo "Collecting $LOG_PREFIX data for "$user;
  #rm $HOME/new_logs/new_logs/$user-$LOG_PREFIX-downup.log;
  #rm $HOME/new_logs/new_logs/$user-$LOG_PREFIX-test-downup.log;
  cd $HOME/new_logs/$user;
  rm *-$LOG_PREFIX*;
  for search_string in $SEARCH_STRINGS
  do
    for b in $BINARY
    do
      cp $HOME/new_logs/$b $HOME/new_logs/$user;
      $HOME/new_logs/$user/$b $search_string app1.txt $user-$LOG_PREFIX-app1;
      $HOME/new_logs/$user/$b $search_string app2.txt $user-$LOG_PREFIX-app2;
      $HOME/new_logs/$user/$b $search_string app3.txt $user-$LOG_PREFIX-app3;
      $HOME/new_logs/$user/$b $search_string app4.txt $user-$LOG_PREFIX-app4;
      $HOME/new_logs/$user/$b $search_string app5.txt $user-$LOG_PREFIX-app5;
      rm $HOME/new_logs/$user/$b;
    done
  done
  mv $HOME/new_logs/$user/$user-$LOG_PREFIX-app1-downup.log $HOME/new_logs/new_logs;
  mv $HOME/new_logs/$user/$user-$LOG_PREFIX-app2-downup.log $HOME/new_logs/new_logs;
  mv $HOME/new_logs/$user/$user-$LOG_PREFIX-app3-downup.log $HOME/new_logs/new_logs;
  mv $HOME/new_logs/$user/$user-$LOG_PREFIX-app4-downup.log $HOME/new_logs/new_logs;
  mv $HOME/new_logs/$user/$user-$LOG_PREFIX-app5-downup.log $HOME/new_logs/new_logs;
  #mv $HOME/new_logs/$user/$user-$LOG_PREFIX-test-downup.log $HOME/new_logs/new_logs;
  cd $HOME/new_logs;
done

