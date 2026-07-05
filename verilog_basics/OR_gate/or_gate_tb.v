`timescale 1ns/1ps

module or_gate_tb;

    reg a, b;
    wire y;

    // Instantiate the OR gate
    or_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        // Create waveform file
        $dumpfile("or_gate.vcd");
        $dumpvars(0, or_gate_tb);

        // Display output in terminal
        $display("Time\tA B | Y");
        $monitor("%0t\t%b %b | %b", $time, a, b, y);

        // Apply test vectors
        a = 0; b = 0;
        #10 a = 0; b = 1;
        #10 a = 1; b = 0;
        #10 a = 1; b = 1;
        #10 $finish;
    end

endmodule