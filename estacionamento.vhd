entity estacionamento is port
(
	reset,clock,a,b : in bit;
	numcars: out bit_vector( 6 downto 0);
	lotado: out bit
);
end estacionamento;

architecture conta of estacionamento is
type state is (o,e1,e2,e3,s1,s2,s3);
signal cur , next_state:state;
signal auxlotado : bit;
signal auxnumcars: integer range 0 to 15;
signal auxcar: integer range -1 to 1;
begin

	process(clock,reset)
	begin 
	 if(clock'event and clock = '1') then
			cur<=next_state;
			auxnumcars<= auxnumcars+auxcar;
			numcars<="1000000" when auxnumcars=0else
			"1111001" when auxnumcars=1 else
			"0100100" when auxnumcars=2 else
			"0110000" when auxnumcars=3 else
			"0011000" when auxnumcars=4 else
			"0010010" when auxnumcars=5 else
			"0000010" when auxnumcars=6 else
		    "1111000" when auxnumcars=7 else
		    "0000000" when auxnumcars=8 else
		    "0011000" when auxnumcars= 9 else
			"0001000" when auxnumcars= 10 else
			"0000011" when auxnumcars= 11 else
			"1000110" when auxnumcars= 12 else
			"0100001" when auxnumcars= 13 else
			"0000110" when auxnumcars= 14 else
			cont<=cont;
				atotal5<=atotal5;
				 atotal10<= atotal10;
				 atotal25<=atotal25;
				 atotal25<= atotal25 ;
			"0001110" when auxnumcars= 15;
			
	 end if;
	 if(reset = '1') then
		lotado<='1';
		numcars<="0000000";
		cur<=o;
	  end if;
	 end process;
	 process ( a, b, reset)
	 begin
	 case cur is
		
		when O =>
			auxcar<=0;
			if a= '0' then 
				if b='1' then
					next_state <= s1;
				else
					next_state <= o;
				end if;
			else
				 if b='1' then
					next_state <= O ;
				 else
					next_state <= e1;
				 end if;
			end if;
		when e1 =>
			auxcar<=0;
			if a = '0' then
				next_state<=o;
			else
				if b='1' then
					next_state<=e2;
				else
					next_state<=e1;
				end if;
			end if;
		when e2 =>
			auxcar<=0;
			if a = '0' then
				 if b='1' then
					 next_state<=e3;
				  else
					 next_state<=e2;
				  end if;
		    else
				 if b='1' then
					 next_state<=e2;
				  else
					next_state<= e3;
				 end if;
		    end if;
		when e3 =>
			auxcar<=0;
				if a='0' then
					if b='0' then
						next_state<=o;
						auxcar<=1;
					 else
						next_state<=e3;
					 end if;
				else
					 if b='0' then
						next_state<=e3;
					  else
						 next_state<=e2;
					  end if;
				end if;
	    when s1 =>
			auxcar<=0;
			 if a = '0' then 
				if b='0' then
				    next_state<=o;
				 else
					 next_state<=s1;
				 end if;
			else
				 if b='0' then
						next_state<= s1;
				 else
						next_state<= s2;
			    end if;
			end if;
	   when s2  =>
			auxcar<=0;
			if a= '0' then 
				if b='0' then 
					next_state<=s2;
				else
					 next_state<=s1;
				end if;
			else
				if b ='0' then
					next_state<=s3;
				 else
					 next_state<=s3;
				end if;
			end if;
	 when s3 => 
			auxcar<=0;
				if a='0' then 
					if b = '0' then
						auxcar<=-1;
						next_state<=o;
					else
						next_state<=s3;
					end if;
				else
						if b ='1' then
							next_state<=s2;
						else 
							next_state<=s3;
						end if;
				end if;
				
	     end case;
	     if reset ='1' then
			next_state<=o;
		 end if;
end process;
end conta;					
	
						
						
		    
	 
		