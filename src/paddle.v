/*
 * Pong Paddle Module
 * -------------------
 * This module controls paddle movement based on user input.
 * It handles:
 * - Paddle position tracking (y coordinate)
 * - Paddle movement based on up/down signals
 * - Screen boundary checking
 * - Reset functionality
 */

module paddle (
    input wire clk,
    input wire rst,
    input wire move_up,
    input wire move_down,
    output reg [9:0] paddle_y   // Output paddle position (vertical)
);

    // Parameters
    parameter SCREEN_HEIGHT = 480;
    parameter PADDLE_HEIGHT = 60;
    parameter PADDLE_SPEED = 4;

    // Movement logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Center the paddle on reset
            paddle_y <= (SCREEN_HEIGHT - PADDLE_HEIGHT) / 2;
        end else begin
            if (move_up && paddle_y > 0)
                paddle_y <= paddle_y - PADDLE_SPEED;
            else if (move_down && paddle_y < (SCREEN_HEIGHT - PADDLE_HEIGHT))
                paddle_y <= paddle_y + PADDLE_SPEED;
        end
    end

endmodule
