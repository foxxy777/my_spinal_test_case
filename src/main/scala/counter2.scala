import spinal.core._
import spinal.lib._
case class example1() extends Component{
  val io=new Bundle{
    val sigIn=in Bool
    val clear=in Bool
    val cnt=out UInt (32 bits)
  }
  val counter=new Area{
    val cnt=Counter(32 bits,io.sigIn.rise(False))
    when(io.clear){
      cnt.value.clearAll()
    }
    io.cnt:=cnt.value
  }
}
object example1App extends App{
  SpinalConfig(
    defaultClockDomainFrequency = FixedFrequency(100 MHz)
  ).generateSystemVerilog(example1()).printPruned()
}