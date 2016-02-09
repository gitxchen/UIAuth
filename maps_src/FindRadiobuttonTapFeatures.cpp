#include <iostream>
#include <vector>
#include <string>
#include <sstream>
#include <fstream>
#include <cmath>
#include <unistd.h>
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
  double up_x,up_y,up_p,up_s;
  int up_t;
};

int main(int argc,char *argv[]) {
  system("grep radiobutton_answer * >user-radiobutton-all.txt");
  ifstream fin("user-radiobutton-all.txt");
  ofstream fout(string(argv[1])+"-radiobutton-downup.log");
  string s1,s2,s3,s4,line;
  int found_down=0;
  vector<TapdownEvent> event_info;
  TapdownEvent e;
  while(getline(fin,line)) {
    if(line.find("Down")!=string::npos) {
      s1="";
      s2="";
      s3="";
      s4="";
      found_down=1;
      getline(fin,s1);
      getline(fin,s2);
      //cout<<line<<endl;
      //cout<<s1<<endl;
      //cout<<s2<<endl;
      continue;
    }
    if(line.find("Up")!=string::npos) {
      found_down=0;
      getline(fin,s3);
      getline(fin,s4);
      vector<string> v_s1,v_s2,v_s3,v_s4;
      v_s1=split(s1,' ',v_s1);
      int v_s1_sz = v_s1.size();
      ////cout<<tmpv[tmpv.size()-1]<<endl;
      v_s2=split(s2,' ',v_s2);
      int v_s2_sz=v_s2.size();
      ////cout<<tmpv[sz-5]<<" "<<tmpv[sz-4]<<" "<<tmpv[sz-3]<<" "<<tmpv[sz-1]<<endl;

      //cout<<line<<endl;
      //cout<<s3<<endl<<s4<<endl<<"****"<<endl;
      v_s3=split(s3,' ',v_s3);
      int v_s3_sz=v_s3.size();
      v_s4=split(s4,' ',v_s4);
      int v_s4_sz=v_s4.size();

      e.down_x=string_to_double(v_s2[v_s2_sz-5].c_str());
      e.down_y=string_to_double(v_s2[v_s2_sz-4].c_str());
      e.down_p=string_to_double(v_s2[v_s2_sz-3].c_str());
      e.down_s=string_to_double(v_s2[v_s2_sz-1].c_str());
      e.down_t=string_to_int(v_s1[v_s1_sz-1].c_str());

      e.up_x=string_to_double(v_s4[v_s4_sz-5].c_str());
      e.up_y=string_to_double(v_s4[v_s4_sz-4].c_str());
      e.up_p=string_to_double(v_s4[v_s4_sz-3].c_str());
      e.up_s=string_to_double(v_s4[v_s4_sz-1].c_str());
      e.up_t=string_to_int(v_s3[v_s3_sz-1].c_str());

      double direction = atan2(e.up_y-e.down_y,e.up_x-e.down_x);
      fout<<e.down_x<<" "<<e.down_y<<" "<<e.down_p<<" "<<e.down_s<<" ";
      fout<<(e.up_x-e.down_x)<<" "<<(e.up_y-e.down_y)<<" ";
      fout<<(e.up_p-e.down_p)<<" "<<(e.up_s-e.down_s)<<" ";
      fout<<distanceCalculate(e.down_x,e.down_y,e.up_x,e.up_y)<<" ";
      fout<<direction<<" "<<(e.up_t - e.down_t)<<endl;
          

      //cout<<e.down_t<<" "<<e.down_x<<" "<<e.down_y<<" "<<e.down_p<<" "<<e.down_s<<endl;
      //cout<<e.up_t<<" "<<e.up_x<<" "<<e.up_y<<" "<<e.up_p<<" "<<e.up_s<<endl;
      //cout<<"-- -- -- --"<<endl;

      s1="";
      s2="";
      s3="";
      s4="";
    }
  }
}
