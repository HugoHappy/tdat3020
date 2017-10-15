#include <iostream>
#include <string>
#include <random>
#include <sstream>
#include <boost/multiprecision/cpp_int.hpp>

using namespace std;
using namespace boost::multiprecision;

int oppg1() {
  cout << "OPPGAVE 1:" << endl;
  string a = "abcdefghijklmnopqrstuvwxyz";
  string str = "judwxohuhuCghuhCkduCixqqhwCphoglqjhqD";
  
  for(size_t i = 0; i < a.size(); i++) {
    for(size_t j = 0; j < str.size(); j++) {
      for(size_t k = 0; k < a.size(); k++) {
        if(str[j] == 'C') {
          str[j] = ' ';
        } else if(str[j] == 'D') {
          str[j] = '.';
        } else if(str[j] == a[k]) {
          k++;
          if(k >= a.size()) {
            k -= a.size();
          }
          str[j] = a[k];
        }
      }
    }
    cout << (i+1) << " shift: " << str << endl;
  }
  return 0;
}

int oppg2() {
  cout << endl << "OPPGAVE 2:" << endl;
  string key = "Dette er en noekkel";
  string encrypted = "114b70745a521c57371f7a245d6440662d49";
  char encryptedHex[18] = {0x11, 0x4b, 0x70, 0x74, 0x5a, 0x52, 0x1c, 0x57, 0x37, 0x1f, 0x7a, 0x24, 0x5d, 0x64, 0x40, 0x66, 0x2d, 0x49};
  char out;
  
  string tmp;
  stringstream ss;

  seed_seq seed(key.begin(), key.end());
  minstd_rand0 generator(seed);
  uniform_int_distribution<char> distribution;
  
  for (size_t c = 0; c < 18; ++c) {
    ss << hex << distribution(generator);
    tmp = ss.str();
    
    out = encryptedHex[c]^tmp[0];
    cout << out;
    
    ss.str("");
    ss.clear();
  }
  
  cout << endl;
  return 0;
}

int oppg3() {
  cout << endl << "OPPGAVE 3:" << endl;
  cpp_int encrypted(66514), e(17), n(86609);
  cout << powm(encrypted, e, n) << endl;
  return 0;
}



int main() {
  oppg1();
  oppg2();
  oppg3();
}