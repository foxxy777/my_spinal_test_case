// Generator : SpinalHDL v1.5.0    git head : 83a031922866b078c411ec5529e00f1b6e79f8e7
// Component : CrossingExample



module CrossingExample (
  input               io_clkA,
  input               io_rstA,
  input               io_clkB,
  input               io_rstB,
  input               io_dataIn,
  output              io_dataOut
);
  reg                 area_clkA_reg;
  (* async_reg = "true" *) reg                 area_clkB_buf0;
  reg                 area_clkB_buf1;

  assign io_dataOut = area_clkB_buf1;
  always @(posedge io_clkA or posedge io_rstA) begin
    if(io_rstA) begin
      area_clkA_reg <= 1'b0;
    end else begin
      area_clkA_reg <= io_dataIn;
    end
  end

  always @(posedge io_clkB or posedge io_rstB) begin
    if(io_rstB) begin
      area_clkB_buf0 <= 1'b0;
      area_clkB_buf1 <= 1'b0;
    end else begin
      area_clkB_buf0 <= area_clkA_reg;
      area_clkB_buf1 <= area_clkB_buf0;
    end
  end


endmodule
