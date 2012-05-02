require './lib/yareq'
y = Yareq::Request.new "ford", { lr: "2" }
puts y.process
