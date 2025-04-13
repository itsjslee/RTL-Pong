/*
 * Top-Level Pong Game Module for DE2-115 (LabsLand)
 * ---------------------------------------------------
 * Connects control buttons, clock, and display signals to game modules.
 * 
 * Inputs:
 * - CLOCK_50: system clock
 * - KEY[0]: reset
 * - KEY[1]: Player 1 up
 * - KEY[2]: Player 1 down
 * - KEY[3]: Player 2 up
 * - SW[0]:  Player 2 down
 *
 * Outputs (optional):
 * - LEDR[0]: ball pixel for debug
 * - HEX0, HEX1: score displays
 */

module pong (
    input wire CLOCK_50,
    input wire [3:0] KEY,
    input wire [9:0] SW,

    output wire [6:0] HEX0,
    output wire [6:0] HEX1,
    output wire [9:0] LEDR
);

    // Internal signal connections
    wire clk = CLOCK_50;
    wire reset = ~KEY[0];     // Inverted because KEY is active-low
    wire p1_up = ~KEY[1];
    wire p1_down = ~KEY[2];
    wire p2_up = ~KEY[3];
    wire p2_down = SW[0];     // Active-high

    wire [9:0] x_pos = 10'd0; // Not used in this version (for VGA)
    wire [9:0] y_pos = 10'd0;

    wire [9:0] ball_x, ball_y;
    wire [9:0] paddle1_y, paddle2_y;
    wire [1:0] ball_direction;
    wire ball_pixel;

    wire [3:0] p1_score;
    wire [3:0] p2_score;

    // Instantiate movement module (the game logic hub)
    movement game_core (
        .clk(clk),
        .reset(reset),
        .p1_up(p1_up),
        .p1_down(p1_down),
        .p2_up(p2_up),
        .p2_down(p2_down),
        .x_pos(x_pos),
        .y_pos(y_pos),
        .paddle1_y(paddle1_y),
        .paddle2_y(paddle2_y),
        .ball_x(ball_x),
        .ball_y(ball_y),
        .ball_direction(ball_direction),
        .p1_score(p1_score),
        .p2_score(p2_score),
        .ball_pixel(ball_pixel)
    );

    // Output debug signal (e.g., ball presence)
    assign LEDR[0] = ball_pixel;

    // Display scores on HEX0 (p1) and HEX1 (p2)
    hex_decoder hex0 (.bin(p1_score), .hex(HEX0));
    hex_decoder hex1 (.bin(p2_score), .hex(HEX1));

endmodule
