PATHS = +incdir+../../rtl/ \
        +incdir+../src/ \
        +incdir+../src/agent/ \
        +incdir+../src/rb_agent/

IFS = ../src/agent/interface.sv \
      ../src/rb_agent/interface_rb.sv

PKGS = ../src/pkg.sv

TOP = ../src/top.sv

MODEL = ../src/external.cpp

RTL = ../../rtl/datapath.sv \
      ../../rtl/mux.sv \
      ../../rtl/rb.sv \
      ../../rtl/ula.sv

RUN_ARGS_COMMON = -access +r -input ../script/shm.tcl \
		  +uvm_set_config_int=*,recording_detail,1 -coverage all -covoverwrite

sim:
	@g++ -g -fPIC -Wall -std=c++0x $(MODEL) -shared -o test.so
	xrun -64bit -uvm -vtimescale 1ns/1ps $(PATHS) $(PKGS) $(IFS) $(RTL) $(TOP) -sv_lib test.so \
		+UVM_TESTNAME=parallel_test $(RUN_ARGS_COMMON) -svseed 1

gui:
	@g++ -g -fPIC -Wall -std=c++0x $(MODEL) -shared -o test.so
	xrun -64bit -uvm -vtimescale 1ns/1ps $(PATHS) $(PKGS) $(IFS) $(RTL) $(TOP) -sv_lib test.so \
		+UVM_TESTNAME=parallel_test $(RUN_ARGS_COMMON) -svseed 1 -gui

clean:
	@rm -rf *.shm *.history *.log *.key *.log *.key *.err *.trn *.dsn *.o *.so .reinvoke.sim simvision* .simvision/ xcelium.d INCA_libs cov_work/