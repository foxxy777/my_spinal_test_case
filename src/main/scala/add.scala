import spinal.core._
class add extends Component {
  val io = new Bundle{
    val a = in Bool()
    val b = in Bool()
    val c = out Bool()
  }

  io.c := io.a & io.b

}

object add1 {
  def main(args: Array[String]) {
    SpinalSystemVerilog(new add())
  }
}
