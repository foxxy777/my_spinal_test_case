import spinal.core._
class top7 extends Component {
  val dataIn = in UInt(1 bits)
  val dataOut= out UInt(1 bits)
  //0: SYNC FALLING LOW
  val config000 = ClockDomainConfig(resetKind = SYNC, clockEdge = FALLING, resetActiveLevel = LOW)  //0
  val config001 = ClockDomainConfig(resetKind = SYNC, clockEdge = FALLING, resetActiveLevel = HIGH) //1
  val config010 = ClockDomainConfig(resetKind = SYNC, clockEdge = RISING, resetActiveLevel = LOW)   //2
  val config011 = ClockDomainConfig(resetKind = SYNC, clockEdge = RISING, resetActiveLevel = HIGH)  //3
  val config100 = ClockDomainConfig(resetKind = ASYNC, clockEdge = FALLING, resetActiveLevel = LOW) //4
  val config101 = ClockDomainConfig(resetKind = ASYNC, clockEdge = FALLING, resetActiveLevel = HIGH)//5
  val config110 = ClockDomainConfig(resetKind = ASYNC, clockEdge = RISING, resetActiveLevel = LOW)  //6
  val config111 = ClockDomainConfig(resetKind = ASYNC, clockEdge = RISING, resetActiveLevel = HIGH) //7

  def RegFactory[T <: Data, C <: ClockDomainConfig](dataType: HardType[T], config: ClockDomainConfig): T = {
    val domain0 = ClockDomain.external("", config)
    val area = new ClockingArea(domain0) {
      val ret = Reg(dataType)
    }
    area.ret
  }

  def buildChain(order:Seq[Int])={
    val reg0 = RegFactory(UInt(1 bits), config000)
    val reg1 = RegFactory(UInt(1 bits), config001).addTag(crossClockDomain)
    val reg2 = RegFactory(UInt(1 bits), config010).addTag(crossClockDomain)
    val reg3 = RegFactory(UInt(1 bits), config011).addTag(crossClockDomain)
    val reg4 = RegFactory(UInt(1 bits), config100).addTag(crossClockDomain)
    val reg5 = RegFactory(UInt(1 bits), config101).addTag(crossClockDomain)
    val reg6 = RegFactory(UInt(1 bits), config110).addTag(crossClockDomain)
    val reg7 = RegFactory(UInt(1 bits), config111).addTag(crossClockDomain)
    reg0.init(0)
    reg1.init(0)
    reg2.init(0)
    reg3.init(0)
    reg4.init(0)
    reg5.init(0)
    reg6.init(0)
    reg7.init(0)
    //chain together
    val regseq1 = Seq(reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7)
    val reorderedRegs = (0 until 8).map(i =>regseq1(order(i)))
    reorderedRegs(0) := dataIn
    // init:0,1,2,3,4,5,6
    // tail:1,2,3,4,5,6,7
    reorderedRegs.init.zip(reorderedRegs.tail).foreach{case (prev , next)=>next:=prev}
    dataOut := reorderedRegs.last
  }
  val order = Seq(0,1,2,3,4,5,6,7)
  //val order = Seq(0,2,7,4,3,1,5,6)
  buildChain(order)
}

object regchain {
  def main(args: Array[String]) {
    SpinalSystemVerilog(new top7())
  }
}
