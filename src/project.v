/*
 * Copyright (c) 2024 Sally Qiao (Hui Qiao)
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_MUX (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  
  assign uio_oe  = 1;

    always @(*) beigin
        if (uio_in[7] == uio_oe[7]) begin
            uio_out[6:0] = uio_in[6:0];
        end else begin
            uio_out[6:0] = uio_oe[6:0];
        end
        uio_out[7] = 1
    end
                            
  // List all unused inputs to prevent warnings
  wire _unused = &{ena, clk, rst_n, 1'b0};

endmodule
