// Generator : SpinalHDL v1.5.0    git head : 83a031922866b078c411ec5529e00f1b6e79f8e7
// Component : clockdemo



module clockdemo (
  output reg [31:0]   io_data,
  input               clk,
  input               reset
);

  always @(negedge clk) begin
    if(reset) begin
      io_data <= 32'h0;
    end else begin
      io_data <= (io_data + 32'h00000001);
    end
  end


endmodule
