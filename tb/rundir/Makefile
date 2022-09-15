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

sim: clean
	@g++ -g -fPIC -Wall -std=c++0x $(MODEL) -shared -o test.so
	xrun -64bit -uvm $(PATHS) $(PKGS) $(IFS) $(RTL) $(TOP) -sv_lib test.so \
		+UVM_TESTNAME=simple_test $(RUN_ARGS_COMMON) 

clean:
	@rm -rf INCA_libs waves.shm cov_work/ *.history *.log *.key mdv.log imc.log imc.key ncvlog_*.err *.trn *.dsn .simvision/ simvision* xcelium.d simv.daidir *.so *.o *.err

gui: clean
	@g++ -g -fPIC -Wall -std=c++0x $(MODEL) -shared -o test.so
	xrun -64bit -uvm $(PATHS) $(PKGS) $(IFS) $(RTL) $(TOP) -sv_lib test.so \
		+UVM_TESTNAME=simple_test $(RUN_ARGS_COMMON) -gui