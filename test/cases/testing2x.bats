load ../lib/common

@test "move any package" {
	releasePackage core pkg-any-a
	db-update

	updatePackage pkg-any-a

	releasePackage testing pkg-any-a
	db-update

	testing2x pkg-any-a

	checkPackage core pkg-any-a 1-2
	checkRemovedPackage testing pkg-any-a
}


@test "move debug package" {
	releasePackage core pkg-debuginfo
	db-update

	updatePackage pkg-debuginfo

	releasePackage testing pkg-debuginfo
	db-update

	testing2x pkg-debuginfo

	checkPackage core pkg-debuginfo 1-2
	checkRemovedPackage testing pkg-debuginfo
	checkPackage core-debug pkg-debuginfo 1-2
	checkRemovedPackage testing-debug pkg-debuginfo
}
