import spinal.core._

 class DFFExample() extends Component {
  //0:SYN FALLING LOW
  val config000 = ClockDomainConfig(resetKind = SYNC, clockEdge = FALLING, resetActiveLevel = LOW)
  val config001 = ClockDomainConfig(resetKind = SYNC, clockEdge = FALLING, resetActiveLevel = HIGH)
  val config010 = ClockDomainConfig(resetKind = SYNC, clockEdge = RISING, resetActiveLevel = LOW)
  val config011 = ClockDomainConfig(resetKind = SYNC, clockEdge = RISING, resetActiveLevel = HIGH)
  val config100 = ClockDomainConfig(resetKind = ASYNC, clockEdge = FALLING, resetActiveLevel = LOW)
  val config101 = ClockDomainConfig(resetKind = ASYNC, clockEdge = FALLING, resetActiveLevel = HIGH)
  val config110 = ClockDomainConfig(resetKind = ASYNC, clockEdge = RISING, resetActiveLevel = LOW)
  val config111 = ClockDomainConfig(resetKind = ASYNC, clockEdge = RISING, resetActiveLevel = HIGH)

  def RegFactory[T <: Data, C <: ClockDomainConfig](dataType: HardType[T], config: ClockDomainConfig): T = {
   val domain0 = ClockDomain.external("domain0", config)
   val area = new ClockingArea(domain0) {
    val ret = Reg(dataType)
   }
   area.ret
  }

  val dataIn = in UInt (4 bits)
  val dataOut = out UInt (4 bits)
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

  def Wireconnect[T <: Data](wire1: T, reg1: T, reg2: T, reg3: T, reg4: T, reg5: T, reg6: T, reg7: T, reg8: T, wire2: T) {
   reg1 := wire1
   reg2 := reg1
   reg3 := reg2
   reg4 := reg3
   reg5 := reg4
   reg6 := reg5
   reg7 := reg6
   reg8 := reg7
   wire2 := reg8
  }
  Wireconnect(dataIn,
   reg000,
   reg001,
   reg010,
   reg011,
   reg100,
   reg101,
   reg110,
   reg111,
   dataOut)
 }
object try1 {
  def main(args: Array[String]) {
    SpinalSystemVerilog(new DFFExample())
  }
}