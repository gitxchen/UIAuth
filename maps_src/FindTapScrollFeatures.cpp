#include <iostream>
#include <vector>
#include <string>
#include <sstream>
#include <fstream>
#include <cmath>
#include <unistd.h>
#include <cstdlib>
using namespace std;

std::vector<std::string> &split(const std::string &s, char delim, vector<string> &elems) {
  std::stringstream ss(s);
  std::string item;
  while (std::getline(ss, item, delim)) {
    elems.push_back(item);
  }
  return elems;
}

double string_to_double( const std::string& s )
{
  std::istringstream i(s);
  double x;
  if (!(i >> x))
    return 0;
  return x;
}

int string_to_int( const std::string& s )
{
  std::istringstream i(s);
  int x;
  if (!(i >> x))
    return 0;
  return x;
}

double distanceCalculate(double x1, double y1, double x2, double y2)
{
  double x = x1 - x2;
  double y = y1 - y2;
  double dist;
  dist = pow(x,2)+pow(y,2);           //calculating distance by euclidean formula
  dist = sqrt(dist);                  //sqrt is function in math.h
  return dist;
}

struct TapdownEvent {
  double down_x,down_y,down_p,down_s;
  int down_t;
  double scroll_x,scroll_y,scroll_p,scroll_s;
  int scroll_t;
};

//Find the last Scroll event after the Tap Down

//argv[0] - program name
//argv[1] - search string e.g. next_button
//argv[2] - search-filename e.g. app1.txt
//argv[3] - userID-<input_control> e.g. user1-button
int main(int argc,char *argv[]) {
  string input_file_name( string("user-all.txt"));
  string search_string(string("grep \"")+argv[1]+"\" "+argv[2]+" >"+input_file_name);
  system(search_string.c_str());
  ifstream fin(input_file_name.c_str());
  string output_file_name(string(argv[3])+"-downup.log");
  ofstream fout(output_file_name.c_str(),fstream::app);
  string s1,s2,s3,s4,line;
  int found_down=0;
  vector<TapdownEvent> event_info;
  TapdownEvent e;
  bool picker=false;
  while(getline(fin,line)) {
    if(line.find("Down")!=string::npos) {
      if(found_down==1) break;
	  s1="";
      s2="";
      s3="";
      s4="";
      found_down=1;
      getline(fin,s1);
      getline(fin,s2);
      continue;
    }
    if(line.find("At time")!=string::npos) {
      found_down=0;
      string tmpstr;
      s3=line;
	  getline(fin,s4);
	  continue;
	}
  }
  //Do feature extraction from s1,s2,s3,s4 here
  vector<string> v_s1,v_s2,v_s3,v_s4;
  v_s1=split(s1,' ',v_s1);
  int v_s1_sz = v_s1.size();
  v_s2=split(s2,' ',v_s2);
  int v_s2_sz=v_s2.size();

  v_s3=split(s3,' ',v_s3);
  int v_s3_sz=v_s3.size();
  v_s4=split(s4,' ',v_s4);
  int v_s4_sz=v_s4.size();
  
  e.down_x=string_to_double(v_s2[v_s2_sz-5].c_str());
  e.down_y=string_to_double(v_s2[v_s2_sz-4].c_str());
  e.down_p=string_to_double(v_s2[v_s2_sz-3].c_str());
  e.down_s=string_to_double(v_s2[v_s2_sz-1].c_str());
  e.down_t=string_to_int(v_s1[v_s1_sz-1].c_str());

  e.scroll_x=string_to_double(v_s4[v_s4_sz-5].c_str());
  e.scroll_y=string_to_double(v_s4[v_s4_sz-4].c_str());
  e.scroll_p=string_to_double(v_s4[v_s4_sz-3].c_str());
  e.scroll_s=string_to_double(v_s4[v_s4_sz-1].c_str());
  e.scroll_t=string_to_int(v_s3[v_s3_sz-1].c_str());

  /*if(string(argv[1]).find("picker")!=string::npos) {
      picker=true;
  }*/
  double direction = atan2(e.scroll_y-e.down_y,e.scroll_x-e.down_x);
  fout<<e.down_x<<" "<<e.down_y;
  fout<<" "<<e.down_p<<" "<<e.down_s<<" ";
  fout<<(e.scroll_x-e.down_x)<<" "<<(e.scroll_y-e.down_y)<<" ";
  fout<<(e.scroll_p-e.down_p)<<" "<<(e.scroll_s-e.down_s)<<" ";
  fout<<distanceCalculate(e.down_x,e.down_y,e.scroll_x,e.scroll_y)<<" ";
  fout<<direction<<" "<<(e.scroll_t - e.down_t)<<endl;
   
  //cout<<e.down_t<<" "<<e.down_x<<" "<<e.down_y<<" "<<e.down_p<<" "<<e.down_s<<endl;
  //cout<<e.scroll_t<<" "<<e.scroll_x<<" "<<e.scroll_y<<" "<<e.scroll_p<<" "<<e.scroll_s<<endl;
  //cout<<"-- -- -- --"<<endl;

  system(string("rm "+input_file_name).c_str());
}
