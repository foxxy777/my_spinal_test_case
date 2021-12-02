import spinal.core.{IntToBuilder, SpinalVerilog}
import spinal.lib.soc.pinsec._

object PinsecMain{
  def main(args: Array[String]) {
    SpinalVerilog(new Pinsec(100 MHz))
  }
}