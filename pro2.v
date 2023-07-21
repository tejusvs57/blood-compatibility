`timescale 1ns/1ns

module candonate(input a ,b ,rh , output ap, bp, op,abp ,p1 ,p2 );

    assign ap=!b;
    assign bp=!a;
    assign op=!(a+b);
    assign abp=1;
    assign p1=1;
    assign p2=!rh;

endmodule

module bdec(input a,b,output ap,bp,op,abp);

assign op=(!a)&(!b);
assign bp=(!a)&(b);
assign ap=(a)&(!b);
assign abp=a&b;

endmodule

module bmatch(input ad,bd,od,abd,rhd,ap,bp,op,abp,rhp,output x);
wire t=(!(rhd|rhp))|rhp;
assign x=t&((ad&ap)+(bd&bp)+(od&op)+(abd&abp));

endmodule

module bprio(input d0,d1,d2,d3,d4,d5,d6,d7,output x,y,z);

assign x=!(d7|d6|d5|d4);
assign y=!(((!(d7|d6|d5|d4|d3))&d2)|((!(d7|d6|d5|d4))&d3)|d7|d6);
assign z=!(d7|((!(d7|d6))&d5)|((!(d7|d6|d5|d4))&d3)|((!(d7|d6|d5|d4|d3|d2))&d1));

endmodule

module pro;

reg a,b,rhd,d0,d1,d2,d3,d4,d5,d6,d7;
wire ap, bp, op,abp,p1,p2,ad,bd,od,abd,x,rhp,a1,b1;

bprio test(d0,d1,d2,d3,d4,d5,d6,d7,rhp,a1,b1);
candonate t1(a,b,rhd,ad,bd,od,abd,p1,p2);
bdec t2(a1,b1,ap,bp,op,abp);
bmatch t3(ad,bd,od,abd,rhd,ap,bp,op,abp,rhp,x);

initial
begin
  d0=0;d1=0;d2=0;d3=0;d4=0;d5=0;d6=1;d7=1;a=0;b=0;rhd=0;
end

initial
begin

$monitor("donor:a=%d,b=%d,rhd=%d,  patients:d0=%d,d1=%d,d2=%d,d3=%d,d4=%d,d5=%d,d6=%d,d7=%d ,compatible:x=%d",a,b,rhd,d0,d1,d2,d3,d4,d5,d6,d7,x);

end

endmodule