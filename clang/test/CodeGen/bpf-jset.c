// RUN: %clang -target bpfel -O2 -S -o - %s | FileCheck %s

volatile unsigned long g1;
volatile unsigned long g2;

void c64_rr(unsigned long x, unsigned long m) {
  if ((x & m) == 0)
    g1 = x;
  else
    g2 = m;
}

// CHECK-LABEL: c64_rr:
// CHECK:       if r{{[0-9]+}} & r{{[0-9]+}} goto [[ELSE:LBB[0-9_]+]]
// CHECK-NOT:   &=
