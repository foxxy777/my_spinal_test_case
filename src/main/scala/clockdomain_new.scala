import spinal.core._
import spinal.lib.StreamFifoCC
/*
class clockdomainnew extends Component {
  val a = in Bits(8 bits)
  val b = RegNext(a) init 0
  val myclk,myrst = in Bool()
  val myClockDomain = ClockDomain(myclk,myrst,
    config = ClockDomainConfig(
      clockEdge        = FALLING,
      resetKind        = ASYNC,
      resetActiveLevel = LOW
    ))
  new ClockingArea(myClockDomain){
    val reg0 = RegNext(a) init 0
    b := reg0
  }
}
*/
class Sub extends Component{
  val a = in Bits(8 bits)
  val b = out(RegNext(a) init 0)
}
class Top extends Component {
  val myclk, myrst = in Bool()
  val mycd = ClockDomain(myclk, myrst)
  val u_sub0 = mycd(new Sub) //mycd时钟包裹Sub模块的例化
}

object CrossingExample2 {
  def main(args: Array[String]) {
    SpinalVerilog(new Top())
  }
}
