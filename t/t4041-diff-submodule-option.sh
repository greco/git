	(
		cd "$1" &&
		shift &&
		for name
		do
			echo "$name" >"$name" &&
			git add "$name" &&
			test_tick &&
			git commit -m "Add $name" || exit
		done >/dev/null &&
		git rev-parse --short --verify HEAD
	)
fullhead1=$(cd sm1; git rev-parse --verify HEAD)
test_expect_success 'added submodule' '
	Submodule sm1 0000000...$head1 (new submodule)
	EOF
'
test_expect_success 'added submodule, set diff.submodule' '
	Submodule sm1 0000000...$head1 (new submodule)
	EOF
'
test_expect_success '--submodule=short overrides diff.submodule' '
	diff --git a/sm1 b/sm1
	new file mode 160000
	index 0000000..$head1
	--- /dev/null
	+++ b/sm1
	@@ -0,0 +1 @@
	+Subproject commit $fullhead1
	EOF
'