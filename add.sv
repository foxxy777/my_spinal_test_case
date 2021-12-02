// Generator : SpinalHDL v1.5.0    git head : 83a031922866b078c411ec5529e00f1b6e79f8e7
// Component : add



module add (
  input               io_a,
  input               io_b,
  output              io_c
);

  assign io_c = (io_a && io_b);

endmodule
