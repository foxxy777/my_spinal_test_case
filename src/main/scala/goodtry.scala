import spinal.core._
class top extends Component {
  val dataIn = in UInt(4 bits)
  val dataOut= out UInt(4 bits)
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
    val reg000 = RegFactory(UInt(4 bits), config000)
    val reg001 = RegFactory(UInt(4 bits), config001).addTag(crossClockDomain)
    val reg010 = RegFactory(UInt(4 bits), config010).addTag(crossClockDomain)
    val reg011 = RegFactory(UInt(4 bits), config011).addTag(crossClockDomain)
    val reg100 = RegFactory(UInt(4 bits), config100).addTag(crossClockDomain)
    val reg101 = RegFactory(UInt(4 bits), config101).addTag(crossClockDomain)
    val reg110 = RegFactory(UInt(4 bits), config110).addTag(crossClockDomain)
    val reg111 = RegFactory(UInt(4 bits), config111).addTag(crossClockDomain)
    reg000.init(0)
    reg001.init(0)
    reg010.init(0)
    reg011.init(0)
    reg100.init(0)
    reg101.init(0)
    reg110.init(0)
    reg111.init(0)
//chain together
    val regseq1 = Seq(reg000,reg001,reg010,reg011,reg100,reg101,reg110,reg111)
    //(0 until 8).foreach(i => regseq1(i).setName(s"reg_$i"))

    val reorderedRegs = (0 until 8).map(i =>regseq1(order(i)))
    reorderedRegs(0) := dataIn
    // init:0,1,2,3,4,5,6
    // tail:1,2,3,4,5,6,7
    reorderedRegs.init.zip(reorderedRegs.tail).foreach{case (prev , next)=>next:=prev}
    dataOut := reorderedRegs.last
  }
  //val order = Seq(0,1,2,3,4,5,6,7)  =>result: 01452367
  //val order = Seq(2,3,6,7,0,1,4,5)  =>result: 01452367
  val order = Seq(5,4,3,2,1,0,7,6)
  buildChain(order)
}

object top {
  def main(args: Array[String]) {
    SpinalSystemVerilog(new top())
  }
}
