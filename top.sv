// Generator : SpinalHDL v1.5.0    git head : 83a031922866b078c411ec5529e00f1b6e79f8e7
// Component : top



module top (
  input      [3:0]    dataIn,
  output     [3:0]    dataOut,
  input               clk,
  input               resetn,
  input               clk_1,
  input               reset,
  input               clk_2,
  input               resetn_1,
  input               clk_3,
  input               reset_1,
  input               clk_4,
  input               resetn_2,
  input               clk_5,
  input               reset_2,
  input               clk_6,
  input               resetn_3,
  input               clk_7,
  input               reset_3
);
  reg        [3:0]    reg_0;
  (* async_reg = "true" *) reg        [3:0]    reg_1;
  (* async_reg = "true" *) reg        [3:0]    reg_2;
  (* async_reg = "true" *) reg        [3:0]    reg_3;
  (* async_reg = "true" *) reg        [3:0]    reg_4;
  (* async_reg = "true" *) reg        [3:0]    reg_5;
  (* async_reg = "true" *) reg        [3:0]    reg_6;
  (* async_reg = "true" *) reg        [3:0]    reg_7;

  assign dataOut = reg_6;
  always @(negedge clk) begin
    if(!resetn) begin
      reg_0 <= 4'b0000;
    end else begin
      reg_0 <= reg_1;
    end
  end

  always @(negedge clk_1) begin
    if(reset) begin
      reg_1 <= 4'b0000;
    end else begin
      reg_1 <= reg_2;
    end
  end

  always @(posedge clk_2) begin
    if(!resetn_1) begin
      reg_2 <= 4'b0000;
    end else begin
      reg_2 <= reg_3;
    end
  end

  always @(posedge clk_3) begin
    if(reset_1) begin
      reg_3 <= 4'b0000;
    end else begin
      reg_3 <= reg_4;
    end
  end

  always @(negedge clk_4 or negedge resetn_2) begin
    if(!resetn_2) begin
      reg_4 <= 4'b0000;
    end else begin
      reg_4 <= reg_5;
    end
  end

  always @(negedge clk_5 or posedge reset_2) begin
    if(reset_2) begin
      reg_5 <= 4'b0000;
    end else begin
      reg_5 <= dataIn;
    end
  end

  always @(posedge clk_6 or negedge resetn_3) begin
    if(!resetn_3) begin
      reg_6 <= 4'b0000;
    end else begin
      reg_6 <= reg_7;
    end
  end

  always @(posedge clk_7 or posedge reset_3) begin
    if(reset_3) begin
      reg_7 <= 4'b0000;
    end else begin
      reg_7 <= reg_0;
    end
  end


endmodule
