/*
 *  Copyright (c) 2008  Zeus Gomez Marmolejo <zeus@opencores.org>
 *
 *  This file is part of the Zet processor. This processor is free
 *  hardware; you can redistribute it and/or modify it under the terms of
 *  the GNU General Public License as published by the Free Software
 *  Foundation; either version 3, or (at your option) any later version.
 *
 *  Zet is distrubuted in the hope that it will be useful, but WITHOUT
 *  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 *  or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
 *  License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with Zet; see the file COPYING. If not, see
 *  <http://www.gnu.org/licenses/>.
 */

`timescale 1ns/10ps

module ram_2k_attr (clk, rst, cs, we, addr, rdata, wdata);
  // IO Ports
  input clk;
  input rst;
  input cs;
  input we;
  input [10:0] addr;
  output [7:0] rdata;
  input [7:0] wdata;

  // Net declarations
  wire dp;

  // Module instantiations
  RAMB16_S9 ram (.DO(rdata),
                 .DOP (dp),
                 .ADDR (addr),
                 .CLK (clk),
                 .DI (wdata),
                 .DIP (dp),
                 .EN (cs),
                 .SSR (rst),
                 .WE (we));

    defparam ram.INIT_00 = 256'h1f1e1d1c1b1a191817161514131211100f0e0d0c0b0a09080706050403020100;
    defparam ram.INIT_01 = 256'h3f3e3d3c3b3a393837363534333231302f2e2d2c2b2a29282726252423222120;
    defparam ram.INIT_02 = 256'h5f5e5d5c5b5a595857565554535251504f4e4d4c4b4a49484746454443424140;
    defparam ram.INIT_03 = 256'h7f7e7d7c7b7a797877767574737271706f6e6d6c6b6a69686766656463626160;
    defparam ram.INIT_04 = 256'h4747474746464646454545454444444443434343424242424141414140404040;
    defparam ram.INIT_05 = 256'h5757575756565656555555555454545453535353525252525151515150505050;
    defparam ram.INIT_06 = 256'h6767676766666666656565656464646463636363626262626161616160606060;
    defparam ram.INIT_07 = 256'h7777777776767676757575757474747473737373727272727171717170707070;
    defparam ram.INIT_08 = 256'h0f0f0f0f0e0e0e0e0d0d0d0d0c0c0c0c0b0b0b0b0a0a0a0a0909090908080808;
    defparam ram.INIT_09 = 256'h1f1f1f1f1e1e1e1e1d1d1d1d1c1c1c1c1b1b1b1b1a1a1a1a1919191918181818;
    defparam ram.INIT_0A = 256'h2f2f2f2f2e2e2e2e2d2d2d2d2c2c2c2c2b2b2b2b2a2a2a2a2929292928282828;
    defparam ram.INIT_0B = 256'h3f3f3f3f3e3e3e3e3d3d3d3d3c3c3c3c3b3b3b3b3a3a3a3a3939393938383838;
    defparam ram.INIT_0C = 256'h4f4f4f4f4e4e4e4e4d4d4d4d4c4c4c4c4b4b4b4b4a4a4a4a4949494948484848;
    defparam ram.INIT_0D = 256'h5f5f5f5f5e5e5e5e5d5d5d5d5c5c5c5c5b5b5b5b5a5a5a5a5959595958585858;
    defparam ram.INIT_0E = 256'h6f6f6f6f6e6e6e6e6d6d6d6d6c6c6c6c6b6b6b6b6a6a6a6a6969696968686868;
    defparam ram.INIT_0F = 256'h7f7f7f7f7e7e7e7e7d7d7d7d7c7c7c7c7b7b7b7b7a7a7a7a7979797978787878;
    defparam ram.INIT_10 = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_11 = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_12 = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_13 = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_14 = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_15 = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_16 = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_17 = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_18 = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_19 = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_1A = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_1B = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_1C = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_1D = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_1E = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_1F = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_20 = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_21 = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_22 = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_23 = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_24 = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_25 = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_26 = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_27 = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_28 = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_29 = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_2A = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_2B = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_2C = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_2D = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_2E = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_2F = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_30 = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_31 = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_32 = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_33 = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_34 = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_35 = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_36 = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_37 = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_38 = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_39 = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_3A = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_3B = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_3C = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_3D = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_3E = 256'h0707070707070707070707070707070707070707070707070707070707070707;
    defparam ram.INIT_3F = 256'h0707070707070707070707070707070707070707070707070707070707070707;

endmodule