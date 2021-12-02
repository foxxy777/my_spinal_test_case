import spinal.core
import spinal.core._
class test extends Component {
  val io = new Bundle{
    val a = in Bool()
    val b = in Bits (8 bits)
    val b1 = in UInt(32 bits)
    val c,d,e = out Bool()
  }
  io.c := RegInit(False)setWhen (io.b =/=2)
  io.d := RegNextWhen(io.a,(io.b1 > 3 ))
  io.e := RegNextWhen(io.a,(U(io.b) < 5))

}

object test1 {
  def main(args: Array[String]) {
    SpinalSystemVerilog(new test())
  }
}
