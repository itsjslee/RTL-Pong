/*
 * Movement Module
 * -------------------
 * This module acts as the central controller for game logic timing and movement coordination.
 * It handles:
 * - Clocked updates of ball and paddle positions
 * - Game speed control (optional: slow down clock for visible gameplay)
 * - Coordination of signals between ball, player, and score modules
 * - Score trigger signals when a player misses the ball
 *
 * Inputs:
 * - clk: base system clock
 * - reset: global game reset
 * - p1_up, p1_down, p2_up, p2_down: player input controls
 *
 * Outputs:
 * - paddle1_y, paddle2_y: paddle positions to draw
 * - ball_x, ball_y: current ball position
 * - p1_score, p2_score: current scores
 * - ball_direction: direction signal (may be useful for animations)
 */

 module movement (
    input wire clk,
    input wire reset,
    input wire p1_up,
    input wire p1_down,
    input wire p2_up,
    input wire p2_down,
    input wire [9:0] x_pos,     // Current VGA pixel X
    input wire [9:0] y_pos,     // Current VGA pixel Y

    output wire [9:0] paddle1_y,
    output wire [9:0] paddle2_y,
    output wire [9:0] ball_x,
    output wire [9:0] ball_y,
    output wire [1:0] ball_direction,
    output wire [3:0] p1_score,
    output wire [3:0] p2_score,
    output wire ball_pixel      // Whether this pixel is part of the ball
);

    // Clock divider for slower gameplay speed (optional)
    reg [19:0] clk_div;
    wire slow_clk = clk_div[19]; // Change the index to adjust game speed
    always @(posedge clk or posedge reset) begin
        if (reset) clk_div <= 0;
        else clk_div <= clk_div + 1;
    end

    // Parameters for paddle
    localparam PADDLE_HEIGHT = 60;

    // PLAYER module instantiation
    player player_module (
        .clk(slow_clk),
        .reset(reset),
        .p1_up(p1_up),
        .p1_down(p1_down),
        .p2_up(p2_up),
        .p2_down(p2_down),
        .paddle1_y(paddle1_y),
        .paddle2_y(paddle2_y)
    );

    // BALL module instantiation
    ball ball_module (
        .clk(slow_clk),
        .reset(reset),
        .x_pos(x_pos),
        .y_pos(y_pos),
        .paddle1_y(paddle1_y),
        .paddle2_y(paddle2_y),
        .paddle_height(PADDLE_HEIGHT),
        .ball_x(ball_x),
        .ball_y(ball_y),
        .ball_direction(ball_direction),
        .pixel_state(ball_pixel)
    );

    // SCORE module instantiation
    score score_module (
        .clk(slow_clk),
        .reset(reset),
        .ball_x(ball_x),
        .ball_direction(ball_direction),
        .p1_score(p1_score),
        .p2_score(p2_score)
    );

endmodule

