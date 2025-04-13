/*
 * Test Bench Implementation for the Pong Game
 * ---------------------------------------------------
 * Connects control buttons, clock, and display signals to game modules.
 * 
 *  input wire clk,
 *  input wire reset,
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
    output wire ball_pixel
 */

 /*
  * Expected output:
  * 
  * Ball moves in a stright line towards the left (player 1)
  * Ball collides with left paddle (player 1) and bounces back in a stright line
  * Ball collides with right paddle (player 2) and bounces back in a stright line
  * Left paddle moves up
  * Ball collides with the left wall and resets to the center
  * 
  */

 
 `timescale 1ns/100ps
 module testBench();
    parameter  = ;