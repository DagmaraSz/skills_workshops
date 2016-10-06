require 'calculator'

describe 'A calculator' do
 describe '#add' do
   it 'adds two numbers' do
     engine = Calculator.new
     expect(engine.add(2, 3)).to eq 5
     expect(engine.add(6, 4)).to eq 10
     expect(engine.add(0, 0)).to eq 0
     expect(engine.add(-1, -1)).to eq -2
     expect(engine.add(Float::INFINITY, 0)).to eq Float::INFINITY
     expect(engine.add(Float::INFINITY, Float::INFINITY)).to eq Float::INFINITY
   end
 end

 describe '#subtract' do
   it 'subtracts two numbers' do
     engine = Calculator.new
     expect(engine.subtract(3, 2)).to eq 1
     expect(engine.subtract(6, 4)).to eq 2
     expect(engine.subtract(0, 0)).to eq 0
     expect(engine.subtract(-1, -1)).to eq 0
     expect(engine.subtract(Float::INFINITY, 0)).to eq Float::INFINITY
     expect(engine.subtract(Float::INFINITY, Float::INFINITY)).to be_nan
   end
 end

 describe '#print_answer' do
   it 'pretty prints the answer' do
     printer = Printer.new
     expect(printer.print_answer(4)).to eq "The Answer is: 4"
     expect(printer.print_answer(6)).to eq "The Answer is: 6"
     expect(printer.print_answer(-1)).to eq "The Answer is: -1"
     expect(printer.print_answer(0)).to eq "The Answer is: 0"
     expect(printer.print_answer(Float::INFINITY)).to eq "The Answer is: Infinity"
   end
 end
end
