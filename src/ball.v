/*
 * Ball Module
 * -------------------
 * Controls ball position, direction, and collision logic.
 */

module ball (
    input wire clk,
    input wire reset,
    input wire [9:0] x_pos,
    input wire [9:0] y_pos,
    input wire [9:0] paddle1_y,
    input wire [9:0] paddle2_y,
    input wire [9:0] paddle_height,

    output reg [9:0] ball_x,
    output reg [9:0] ball_y,
    output reg [1:0] ball_direction,
    output reg pixel_state
);

// Example initial values
parameter BALL_SPEED = 1;
parameter SCREEN_WIDTH = 640;
parameter SCREEN_HEIGHT = 480;
parameter BALL_SIZE = 4;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        ball_x <= SCREEN_WIDTH / 2;
        ball_y <= SCREEN_HEIGHT / 2;
        ball_direction <= 2'b10;  // initial direction
    end else begin
        // basic movement logic (this is a placeholder)
        ball_x <= ball_x + BALL_SPEED;
        ball_y <= ball_y + BALL_SPEED;

        // TODO: add collision with paddles/boundaries
    end
end

// Pixel render logic (optional)
always @(*) begin
    pixel_state = (x_pos >= ball_x && x_pos < ball_x + BALL_SIZE &&
                   y_pos >= ball_y && y_pos < ball_y + BALL_SIZE);
end

endmodule
