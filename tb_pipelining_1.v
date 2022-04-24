module pipe1_test;

	parameter N = 10;
	wire [N-1:0] F;
	reg [N-1:0] A, B, C, D;
	reg clk;
	
	pipe_ex MYPIPE (F, A, B, C, D, clk);
	
	initial clk = 0;
	
	always #10 clk = ~clk;

	initial
		begin
			#15	   A=10 ; B=20; C=30; D=40 ; 
			#20	A=5  ; B=15; C=25; D=35 ;
			#20	A=2  ; B=4 ; C=6 ; D=8  ;
			#20	A=3  ; B=6 ; C=8 ; D=10 ;
			#20	A=5  ; B=2 ; C=9 ; D=7  ;
		end
		
	initial
		begin
			$dumpfile("pipe_ex.vcd");
			$dumpvars (0, pipe1_test);
			$monitor ("Time: %d, F = %d", $time, F);
			#300 $finish;
		end
   


endmodule