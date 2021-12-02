import spinal.core._
class TopLevel extends Component {
  val clkA = ClockDomain.external("clkA")
  val clkB = ClockDomain.external("clkB")

  val regA = clkA(Reg(UInt(8 bits)))
  val regB = clkB(Reg(UInt(8 bits))).addTag(crossClockDomain)


  val tmp = regA + regA
  regB := tmp
}

object TopLevel {
  def main(args: Array[String]) {
    SpinalVerilog(new TopLevel())
  }
}
