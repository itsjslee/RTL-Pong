/*
 * Score Module
 * -------------------
 * This module handles the scoring logic in the Pong game.
 * It performs the following functions:
 * - Detects when the ball crosses the left or right boundary (missed by paddle)
 * - Updates the score for Player 1 or Player 2 accordingly
 * - Sends updated score to a display interface
 * - Resets score if required
 * 
 * Inputs:
 * - Ball position and direction
 * - Reset signal
 * 
 * Outputs:
 * - Player 1 score
 * - Player 2 score
 * - Display-ready score signal (hex for our case)
 */
