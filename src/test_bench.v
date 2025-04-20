`timescale 1ns / 1ps

module score_tb();

    reg clk;
    reg reset;
    reg [9:0] ball_x;
    reg [1:0] ball_direction; // not used by score module, but needs to be assigned
    wire [3:0] p1_score;
    wire [3:0] p2_score;

    // Instantiate the module
    score uut (
        .clk(clk),
        .reset(reset),
        .ball_x(ball_x),
        .ball_direction(ball_direction),
        .p1_score(p1_score),
        .p2_score(p2_score)
    );

    // Clock generation: 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        // Initialize
        reset = 1;
        ball_x = 320; // Start from middle
        ball_direction = 2'b10; // Moving right (x_dir=1)

        #10;
        reset = 0;

        // Move the ball towards the right edge
        repeat (65) begin
            #10;
            ball_x = ball_x + 5; // Move ball to the right every clock cycle
        end

        // Hold after crossing boundary
        #100;

        $finish;
    end

endmodule
