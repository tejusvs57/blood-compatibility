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



module pro;

reg a,b,rhd,a1,b1,rhp;
wire ap, bp, op,abp,p1,p2,ad,bd,od,abd,x;

candonate t1(a,b,rhd,ad,bd,od,abd,p1,p2);
bdec t2(a1,b1,ap,bp,op,abp);
bmatch t3(ad,bd,od,abd,rhd,ap,bp,op,abp,rhp,x);

initial
begin
a=1;b=0;rhd=0;a1=0;b1=0;rhp=1;
end

initial
begin

$monitor("donor:a=%d,b=%d,rhd=%d,  patient:a1=%d,b1=%d,rhp=%d ,compatible:x=%d",a,b,rhd,a1,b1,rhp,x);

end

endmodule