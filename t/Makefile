.PHONY: testbox_centos8

test:
	$(MAKE) -C testbox_centos8     prepare wait_start test
	$(MAKE) -C testbox_centos8     clean
	$(MAKE) -C testbox_ubuntu18.04 prepare wait_start test
	$(MAKE) -C testbox_ubuntu18.04 clean

clean:
	$(MAKE) -C testbox_centos8 clean
	$(MAKE) -C testbox_ubuntu18.04 clean

testbox_centos8:
	$(MAKE) -C testbox_centos8 prepare wait_start
