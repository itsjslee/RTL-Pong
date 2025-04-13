/*
 * Score Module
 * -------------------
 * This module handles the scoring logic in the Pong game.
 * It detects when the ball crosses the left or right boundary (missed by paddle),
 * and updates the score for Player 1 or Player 2 accordingly.
 */

module score (
    input wire clk,
    input wire reset,
    input wire [9:0] ball_x,
    input wire [1:0] ball_direction, // [x_dir, y_dir]

    output reg [3:0] p1_score, // HEX-display compatible (0-9)
    output reg [3:0] p2_score
);

    // Constants for screen edges
    parameter SCREEN_WIDTH = 640;
    parameter BALL_SIZE = 10;

    // Internal state
    reg scored;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            p1_score <= 0;
            p2_score <= 0;
            scored <= 0;
        end else begin
            // Avoid multiple increments per score event
            if (!scored) begin
                if (ball_x <= 0) begin // Ball missed by Player 1
                    if (p2_score < 9)
                        p2_score <= p2_score + 1;
                    scored <= 1;
                end else if (ball_x >= SCREEN_WIDTH - BALL_SIZE) begin // Ball missed by Player 2
                    if (p1_score < 9)
                        p1_score <= p1_score + 1;
                    scored <= 1;
                end
            end else begin
                // Reset 'scored' once ball returns to center field
                if (ball_x > 100 && ball_x < SCREEN_WIDTH - 100)
                    scored <= 0;
            end
        end
    end

endmodule
