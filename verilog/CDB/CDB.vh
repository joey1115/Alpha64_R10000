`ifndef __CT_VH__
`define __CT_VH__

`include "../../sys_config.vh"

typedef struct packed {
  logic taken;
  logic [$clog2(`NUM_PR)-1:0] T;
  logic [$clog2(`NUM_ROB)-1:0] ROB_idx;
  logic [63:0] result;
} CDB_entry_t;



typedef struct packed {
  logic                                         rollback_en;        // rollback_en from X/C
  logic                [$clog2(`NUM_ROB)-1:0]   ROB_rollback_idx;   // ROB# of mispredicted branch/incorrect load from br module/LSQ
  logic                [$clog2(`NUM_ROB)-1:0]   diff_ROB;           // diff_ROB = ROB_tail of the current cycle - ROB_rollback_idx
  logic  [`NUM_FU-1:0]                          FU_done;            // valid signal from FU
  logic  [`NUM_FU-1:0]  [$clog2(`NUM_PR)-1:0]   T_idx;              // tag from FU
  logic  [`NUM_FU-1:0] [$clog2(`NUM_ROB)-1:0]   ROB_idx;            // ROB_idx from FU
  logic  [`NUM_FU-1:0]                 [63:0]   FU_result;          // result from FU
  logic                 [$clog2(`NUM_PR)-1:0]   dest_idx;           // from FU
} CDB_PACKET_IN;

typedef struct packed {
  logic [`NUM_FU-1:0]         CDB_valid;                            // valid=0, entry is free, to FU
  logic                       complete_en;                          // RS, ROB, MapTable
  logic                       write_en;                             // valid signal to PR
  logic [$clog2(`NUM_PR)-1:0] T_idx;                                // tag to PR
  logic [63:0]                T_value;                              // result to PR
  logic [$clog2(`NUM_PR)-1:0] dest_idx;                             // to map_table
} CDB_PACKET_OUT;

`endif
