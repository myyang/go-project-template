package main

import "log"
import "testing"

func TestMain(t *testing.T) {
	log.Print("Add tests here")
}

func BenchmarkMain(b *testing.B) {
	b.ReportAllocs()
	for i := 0; i < b.N; i++ {
		
	}
	log.Print("Benchmark your program")
}
