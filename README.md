# PES_Dfilter
### Brief: 
A digital filter takes in an input signal and allows only a select set of frequencies to pass through.
a butterworth filter for example takes in an input and allows only components having low frequency to go through, we here design an FIR lowpass filter.
Fir stands for finite impulse response. 

### Setup and simulation:
 we use gedit to write our code, use iverilog to simulate and gtkwave to see waveforms 

The below command opens the editor
 ```
gedit filename.v 
```

This command helps us simulate the design
```
iverilog design.v testbench.v
```

Then finally after generating the vcd dumpfile we use the .vcd file to open gtkwave

```
gtkwave dumpfile.vcd
```
![image](https://github.com/Anirudh-Sridharr/PES_Dfilter/assets/140473803/aa3c65b9-5719-40d1-b4d2-234702d5f7db)

![image](https://github.com/Anirudh-Sridharr/PES_Dfilter/assets/140473803/a665c5ea-6595-47f6-b58e-6a40fd93df5b)


### Synthesis and netlist generation:

We use yosys to synthesize our design we launch yosys with the command 
```
yosys
```

call the necessary liberty files and standard cells using 
```
read_liberty -lib ~/Desktop/sky130RTLDesignAndSynthesisWorkshop/lib/sky130_fd_sc_hd_tt_025C_1v80.lib
```

Then we read the design file to be synthesized using 
```
read_verilog design.v 
```

To synthesize, we use
```
abc -liberty ~/Desktop/sky130RTLDesignAndSynthesisWorkshop/lib/sky130_fd_sc_hd_tt_025C_1v80.lib
```

To generate netlist we use
```
write_verilog -noattr netlist.v 
```

finally to see the synthesized design - i.e. our verilog code in terms of the present standard cells, use
```
show
```
![image](https://github.com/Anirudh-Sridharr/PES_Dfilter/assets/140473803/ded6e208-871b-4656-9d6c-ce34c9326476)



and finally, the synthesized circuit, 
![image](https://github.com/Anirudh-Sridharr/PES_Dfilter/assets/140473803/2e557b99-be4e-45fa-992b-7d09ce9d9c34)


## **OpenLane:**
We use openlane for the physical design of our digital filter, 
to initialize, let us begin by installing the necessary tools for the process:
these tools are: yosys, iverilog, ngspice, gtkwave, magic and finally openlane along with skywater's 130 nm pdks

after having installed the tools and necessary pdks, we proceed to the design. 

### Invoking openlane and setting up the files to be used:
we go to the designs directory in openlane, create a directory in there in the name of the project and in the project directory we further
create a directory named src. this has all the standard library pdks of different speeds slow, typical and fast cells.

going back to the openlane directory, we create a directory called pdks and there we store our .tech file for the layouts.

we then use 
```
make mount
```
to enter a container where we use a command 
```
./flow.tcl -design dfilter -init_design_config -add_to_designs
```
to generate a config.tcl file having information about our design dfilter.v
![image](https://github.com/Anirudh-Sridharr/PES_Dfilter/assets/140473803/90eaf119-02e4-4c67-914d-a536a65fc7af)

The config file:
![image](https://github.com/Anirudh-Sridharr/PES_Dfilter/assets/140473803/5d1e91bc-83db-482b-92fa-c5b57101cb1b)

This config file is stored in the project directory
now we are good to go with using openlane for pd. 

Firstly, we engage openlane in an interactive session. 
we again use 
```
make mount
```
and first we type in 
```
package require openlane 0.9
```
Next after we see the 0.9 on screen we use
```
./flow.tcl -interactive
```
this is to summon the interactive design flow from synthesis to routing 

then the next set of commands is pretty simple,
first we set up the design to be dealt with using
```
./flow.tcl -design dfilter
```
![image](https://github.com/Anirudh-Sridharr/PES_Dfilter/assets/140473803/5acc7572-d812-44d5-a499-1c401ce4d35c)



this will set up our design file, merge the lef files, the lef and techlef and then will set up all the pdks to be ready 
for the design flow to execute


then the first step, synthesis:
use the command:
```
run_synthesis
```
this should generate log and report files as below 
the area report:
![image](https://github.com/Anirudh-Sridharr/PES_Dfilter/assets/140473803/889a6c59-890b-4d6d-8691-d5a13f617456)

the yosys log:
![image](https://github.com/Anirudh-Sridharr/PES_Dfilter/assets/140473803/b1b9f0ed-32a1-40e6-a38e-61c69ade4da4)

the next thing we do is floor planning :
we use the commmand 
```
run_floorplan
```
this generates a layout which I failed to achieve my magic isn't working but yes, this does generate a .def file which I got.
the file:
![image](https://github.com/Anirudh-Sridharr/PES_Dfilter/assets/140473803/bd82f24d-98a3-4554-9f78-7b867bf2a6fb)


![image](https://github.com/Anirudh-Sridharr/PES_Dfilter/assets/140473803/f1be6d22-8c28-43ed-b4e4-9ca2c77bdcf0)

All good, next we do the placement using 
```
run_placement
```
placement ensures proper placing of standard cells along dictated slots of the main cell 
the log file:
![image](https://github.com/Anirudh-Sridharr/PES_Dfilter/assets/140473803/29d9d073-77ae-4bb1-be6a-299c789063f9)


now to clock tree synthesis:
we use the command 
```
run_cts
```
this is used to optimally distribute a global clock with optimal power utilization and avoid illegal clocks such as gated or skewed clocks
the log file:
![image](https://github.com/Anirudh-Sridharr/PES_Dfilter/assets/140473803/16330c74-1884-4325-b8c9-d3bcfd1b0a99)

then we finally run routing for the signals and data paths to be specified
```
run_routing
```
the log file:
![image](https://github.com/Anirudh-Sridharr/PES_Dfilter/assets/140473803/a9fe3c4e-7602-4aeb-bd1a-aeb4bc6a68f6)



Here's what the entire process looks like on the container while running openlane

![image](https://github.com/Anirudh-Sridharr/PES_Dfilter/assets/140473803/028ee33c-72ec-4b7b-b79d-a21546aa3b22)
![image](https://github.com/Anirudh-Sridharr/PES_Dfilter/assets/140473803/49b46a13-9dd8-407b-bae9-f2542a4fa194)


That ends PD using openlane.




