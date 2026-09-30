# LC-3 Decode Stage UVM Verification

A Universal Verification Methodology (UVM) testbench for the Decode block of an LC-3 microprocessor. This project demonstrates industry-standard transaction-level verification using SystemVerilog.

## Highlights
* Utilizes a Bus Functional Model (BFM) architecture,  separating static hardware toggling from dynamic UVM protocol classes.
* Implements `uvm_analysis_port` broadcasting to isolate the monitor's observation path from the driver's stimulus path.
* Uses `uvm_config_db` to pass virtual interfaces and configuration objects from the top-level module to the UVM environment.

## Directory Structure
* `project_bench/decode/sim/`: Makefiles and `wave.do`.
* `project_bench/decode/tb/testbench/`: Top-level modules.
* `project_bench/decode/tb/test/`: UVM test configurations
* `verification_ip/interface_packages/decode_in_pkg/`: UVM Agent VIP.

## Tools Used
* **Language:** SystemVerilog, UVM 1.2
* **Simulator:** QuestaSim/2026.1

## Execution

To compile and run the simulation in the QuestaSim GUI, navigate to the `sim/` directory and execute:
```bash
make p1_debug
