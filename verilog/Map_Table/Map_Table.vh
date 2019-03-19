`ifndef __MAP_TABLE__
`define __MAP_TABLE__

`include "../../sys_config.vh"
`include "../../sys_defs.vh"

typedef struct packed {
  logic [$clog2(`NUM_PR)-1:0] PR_idx;            // PR index
  logic                       T_plus_status;     // Tag plus state
} MAP_TABLE_t;

typedef struct packed {
  logic                         Dispatch_enable;   // no Dispatch hazard
  logic [4:0]                   reg_dest;          // reg from dispatch
  logic [4:0]                   reg_a;
  logic [4:0]                   reg_b;
  logic [$clog2(`NUM_PR)-1:0]   Freelist_T;        // tags from freelist
  logic [$clog2(`NUM_PR)-1:0]   CDB_T;             // broadcast from CDB
  logic                         CDB_enable;        // CDB enable
  logic                         rollback_en;       //
  logic [$clog2(`NUM_ROB)-1:0]  br_idx;            //
  logic [$clog2(`NUM_ROB)-1:0]  tail_idx;
} MAP_TABLE_PACKET_IN;

typedef struct packed {
  logic [$clog2(`NUM_PR)-1:0] Told_to_ROB;       // output Told to ROB
  MAP_TABLE_t                 T1_to_RS;
  MAP_TABLE_t                 T2_to_RS;
} MAP_TABLE_PACKET_OUT;

`endif
