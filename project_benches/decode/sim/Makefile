# Directory Variables
VERIF_IP = ../../../verification_ip/interface_packages/decode_in_pkg
TEST_PKG = ../tb/tests/decode_test_pkg
TB       = ../tb/testbench

# Target changed to p1_debug as required by Slide 6
p1_debug: clean
	qrun -64 -gui -coverage -onfinish stop -classdebug -uvmcontrol=all -msgmode both -l run.log \
	+incdir+$(VERIF_IP) $(VERIF_IP)/decode_in_pkg.sv \
	+incdir+$(TEST_PKG) $(TEST_PKG)/decode_test_pkg.sv \
	$(VERIF_IP)/decode_in_if.sv \
	$(TB)/hdl_top.sv \
	$(TB)/hvl_top.sv \
	-do "set IterationLimit 140000; set NoQuitOnFinish 1; run 0; do wave.do; run -a;" \
	+UVM_TESTNAME=test_top \
	-top hvl_top -top hdl_top

clean:
	rm -f certe_dump.xml design.bin qwave.db run.log transaction.config transcript vsim.wlf modelsim.ini
	rm -rf qrun.out .visualizer work
