/*
 * Player Module
 * -------------------
 * This module handles player input and paddle control logic.
 * It performs the following functions:
 * - Reads user input (e.g., button presses or keyboard input)
 * - Updates paddle positions (Player 1 and Player 2)
 * - Provides current paddle positions to the ball and score modules
 */

module player (
    input wire clk,
    input wire reset,
    input wire p1_up,
    input wire p1_down,
    input wire p2_up,
    input wire p2_down,

    output wire [9:0] paddle1_y,
    output wire [9:0] paddle2_y
);

    // Instantiate Paddle for Player 1
    paddle paddle1 (
        .clk(clk),
        .rst(reset),
        .move_up(p1_up),
        .move_down(p1_down),
        .paddle_y(paddle1_y)
    );

    // Instantiate Paddle for Player 2
    paddle paddle2 (
        .clk(clk),
        .rst(reset),
        .move_up(p2_up),
        .move_down(p2_down),
        .paddle_y(paddle2_y)
    );

endmodule
