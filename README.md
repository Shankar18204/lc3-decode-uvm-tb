# LC-3 Decode Stage UVM Verification

A Universal Verification Methodology (UVM) testbench for the Decode block of an LC-3 microprocessor. This project demonstrates industry-standard transaction-level verification using SystemVerilog.

## Architecture Highlights
* Utilizes a Bus Functional Model (BFM) architecture,  separating static hardware toggling from dynamic UVM protocol classes.
* Implements `uvm_analysis_port` broadcasting to isolate the monitor's observation path from the driver's stimulus path.
* Uses `uvm_config_db` to pass virtual interfaces and configuration objects from the top-level module to the UVM environment.

## Directory Structure
* `project_bench/decode/sim/`: Makefiles and `wave.do`.
* `project_bench/decode/tb/testbench/`: Top-level modules (`hdl_top.sv` and `hvl_top.sv`).
* `project_bench/decode/tb/test/`: UVM test configurations and the base test suite (`decode_test_pkg`).
* `verification_ip/interface_packages/decode_in_pkg/`: Reusable UVM Agent VIP containing the Monitor, Driver, Sequencer, Coverage, and Transactions.

## Tools Used
* **Language:** SystemVerilog, UVM 1.2
* **Simulator:** QuestaSim/2026.1

## Execution
To compile and run the simulation, navigate to the `sim/` directory and execute:
```bash
make run TEST=base_test
