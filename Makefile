ami-3:
	# Cleaning up vendor / modules / librarian / bundler.
	rm -fR puppet/vendor puppet/modules puppet/.tmp puppet/.bundle
	# Running packer.
	packer build ami-3.json
