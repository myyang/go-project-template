//Package internal provides protection of libs under internal directorys
//ex:
//project1
//	|
//	|- foo.go
//	|- internal
//			|- bar.go
//			|- bar2
//				|- bar2.go
//
//while working on project2 and importing with:
//
//	import "project1"
//
//you may access proejct1.foo but not project1.bar
//
//
package internal
