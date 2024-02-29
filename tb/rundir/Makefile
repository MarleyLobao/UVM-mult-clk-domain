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

TESTS := 5

SEED = 1

RUN_ARGS_COMMON = -access +r -input ../script/shm.tcl \
		  +uvm_set_config_int=*,recording_detail,1 -coverage all -covoverwrite

compile_model:
	@g++ -g -fPIC -Wall -std=c++0x $(MODEL) -shared -o test.so

base_test: compile_model
	xrun -64bit -uvm -vtimescale 1ns/1ps $(PATHS) $(PKGS) $(IFS) $(RTL) $(TOP) -sv_lib test.so \
		+UVM_TESTNAME=base_test $(RUN_ARGS_COMMON) -svseed $(SEED)

base_gui: compile_model
	xrun -64bit -uvm -vtimescale 1ns/1ps $(PATHS) $(PKGS) $(IFS) $(RTL) $(TOP) -sv_lib test.so \
		+UVM_TESTNAME=base_test $(RUN_ARGS_COMMON) -svseed $(SEED) -gui

coverage_tests:
	@mkdir --parents reports/;
	@for i in `seq 1 ${TESTS}`; do \
	seed=$$((1 + RANDOM-32767/2)); \
	echo "Running test: " $$i; \
	mkdir reports/run_$$i; \
	make base_test SEED=$$seed | grep "uvm_error" > reports/run_$$i/errors_$$seed; \
	mv xrun.log reports/run_$$i; \
	mv cov_work/ reports/run_$$i; \
	done;
	@make merge TESTS=${TESTS};
	@echo "END REGRESSION."

merge:
	@for report in reports/run_*/cov_work/scope/test_sv*/; do \
	list="$${list} $$report"; \
	if [[ $${report} == reports/run_${TESTS}/* ]]; then \
	list="$${list}" make -e exec_merge; \
	fi; \
	done;
	@echo "END MERGING COVERAGE."

exec_merge:
	@echo "Merging the coverage...";
	@imc -execcmd "merge $${list} -out all"

clean:
	@rm -rf *.shm *.history *.log *.key *.log *.key *.err *.trn *.dsn *.o *.so .reinvoke.sim simvision* .simvision/ xcelium.d INCA_libs cov_work/
