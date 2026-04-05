#include <iostream>
#include <vector>

using namespace std;

int max_vector(const vector<int>&v) {

	int max_vector{v[0]};

	for (size_t i{1}; i < v.size(); i++) {


		if (v[i] > max_vector) {

			max_vector = v[i];
		}
	}

	return max_vector;
}

int main() {

	vector<int>v{1,3,5,20,3,56,2,6,9,4};

	cout << "El elemento más grande del vector es: " << max_vector(v);
}