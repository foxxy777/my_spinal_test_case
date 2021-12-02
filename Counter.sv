// Generator : SpinalHDL v1.5.0    git head : 83a031922866b078c411ec5529e00f1b6e79f8e7
// Component : Counter



module Counter (
  input               io_clear,
  output     [7:0]    io_value,
  input               clk,
  input               reset
);
  (* keep *) reg        [7:0]    register_1;

  assign io_value = register_1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      register_1 <= 8'h0;
    end else begin
      if(io_clear) begin
        register_1 <= 8'h0;
      end else begin
        register_1 <= (register_1 + 8'h01);
      end
    end
  end


endmodule
