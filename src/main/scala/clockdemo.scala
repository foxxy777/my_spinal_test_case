import spinal.core.internals.Operator.UInt
import spinal.core.{Bundle, ClockDomainConfig, Component, FALLING, FixedFrequency, IntToBuilder, SYNC, SpinalConfig, SpinalSystemVerilog, out}
import spinal.lib.generator.ResetSensitivity
import spinal.lib.generator.ResetSensitivity.HIGH

case class clockdemo() extends  Component{
  val io = new Bundle{
    val data = out UInt(32 bits) setAsReg() init(0)
  }
  io.data:=io.data+1
}
object clockdemoapp extends App{
  SpinalSystemVerilog(clockdemo())
}

object clockdemoappconfig extends App{
  SpinalConfig(
    defaultClockDomainFrequency = FixedFrequency(250 MHz),
    defaultConfigForClockDomains = ClockDomainConfig(resetKind = SYNC,clockEdge = FALLING)
  ).generateSystemVerilog(clockdemo())

}

