import spinal.core._
class CrossingExample extends Component {
  val io = new Bundle {
    val clkA,rstA = in Bool()
    val clkB,rstB  = in Bool()

    val dataIn  = in Bool()
    val dataOut = out Bool()
  }

  // sample dataIn with clkA
  val area_clkA = new ClockingArea(ClockDomain(io.clkA,io.rstA)) {
    val reg = RegNext(io.dataIn) init(False)
  }

  // 2 register stages to avoid metastability issues
  val area_clkB = new ClockingArea(ClockDomain(io.clkB,io.rstB)) {
    val buf0   = RegNext(area_clkA.reg) init(False) addTag(crossClockDomain)
    val buf1   = RegNext(buf0)          init(False)
  }

  io.dataOut := area_clkB.buf1
}


object CrossingExample {
  def main(args: Array[String]) {
    SpinalSystemVerilog(new CrossingExample())
  }
}