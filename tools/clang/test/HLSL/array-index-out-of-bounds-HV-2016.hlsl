// RUN: %clang_cc1 -Wno-unused-value -fsyntax-only -ffreestanding -HV 2016 -verify %s

void dead()
{
    // expected-note@+2 {{array 'array' declared here}}
    // expected-note@+1 {{array 'array' declared here}}
    int array[2];
    array[-1] = 0;                                          /* expected-warning {{array index -1 is before the beginning of the array}} fxc-pass {{}} */
    array[0] = 0;
    array[1] = 0;
    array[2] = 0;                                           /* expected-warning {{array index 2 is past the end of the array (which contains 2 elements)}} fxc-pass {{}} */
}

void main() {}
