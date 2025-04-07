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
