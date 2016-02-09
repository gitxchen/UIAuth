#include <iostream>
#include <vector>
#include <string>
#include <sstream>
#include <fstream>
#include <cmath>
#include <unistd.h>
using namespace std;

#define EPSILON 0.01

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

struct ParamVal {
  float param1,param2;
  int same_score,diff_score;
  ParamVal(float _p1,float _p2) {
    param1=_p1;
    param2=_p2;
    same_score=-1;
    diff_score=1000;
  }
};

bool AreSame(float a, float b)
{
  return fabs(a - b) < EPSILON;
}

int indexForParams(vector<ParamVal> v,float p1, float p2) {
  for(int i=0;i<v.size();i++) {
    if(AreSame(v[i].param1,p1) && AreSame(v[i].param2,p2)) {
      return i;
    }
  }
  cout<<"Could not find p1="<<p1<<" p2="<<p2<<endl;
  return -1;
}

int main() {
  ifstream fin("svm_params.log");
  string line;
  vector<ParamVal> v;
  for(int p1=5;p1<=50;p1+=5) {
    for(float p2=60;p2<=100;p2+=5) {
      ParamVal p(p1/100.0,p2/100.0);
      v.push_back(p);
    }
  }
  cout<<v.size()<<endl;
	while(getline(fin,line)) {
    vector<string> v_s;
    v_s=split(line,' ',v_s);
    float param1=string_to_double(v_s[0]);
    float param2=string_to_double(v_s[1]);
    int class1=string_to_int(v_s[2]);
    int class2=string_to_int(v_s[3]);
    int test_app=string_to_int(v_s[4]);
    int score=string_to_int(v_s[5]);
    int i=indexForParams(v,param1,param2);
    if(class1==class2) {
      //Find max for this param val set
      if(score>v[i].same_score) v[i].same_score=score;
    }
    if(class1!=class2) {
      //Find min for this param val set
      if(score<v[i].diff_score) v[i].diff_score=score;
    }
  }
	for(int i=0;i<v.size();i++) {
		if(v[i].same_score<=v[i].diff_score) 
		  cout<<v[i].param1<<" "<<v[i].param2<<" "<<v[i].same_score<<" "<<v[i].diff_score<<endl;
	}
}
