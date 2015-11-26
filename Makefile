clean:
	rm -fR puppet/vendor puppet/modules puppet/.tmp puppet/.bundle

aws-3: clean
	packer build packer/aws-3.json

aws-8: clean
	packer build packer/aws-8.json

azure-8: clean
	packer build packer/azure-8.json

azure-8-ha: clean
	packer build packer/azure-8-ha.json

all: aws-3 azure-8 azure-8-ha
