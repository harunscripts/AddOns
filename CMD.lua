local a=tonumber;local b=string.byte;local c=string.char;local d=string.sub;local e=string.gsub;local f=string.rep;local g=table.concat;local h=table.insert;local i=getfenv or function()return _ENV end;local j=setmetatable;local k=pcall;local l=select;local m=unpack or table.unpack;local n=tonumber;local function o(p,q)local r=1;local s;p=e(d(p,5),"..",function(t)if b(t,2)==79 then s=a(d(t,1,1))return""else local u=c(a(t,16))if s then local v=f(u,s)s=nil;return v else return u end end end)local function w(x,y,z)if z then local C=x/2^(y-1)%2^(z-1-(y-1)+1)return C-C%1 else local D=2^(y-1)return x%(D+D)>=D and 1 or 0 end end;local function E()local u=b(p,r,r)r=r+1;return u end;local function F()local u,v=b(p,r,r+2)r=r+2;return v*256+u end;local function G()local u,v,H,I=b(p,r,r+3)r=r+4;return I*16777216+H*65536+v*256+u end;local function J()local K=G()local L=G()return(-2*w(L,32)+1)*2^(w(L,21,31)-1023)*((w(L,1,20)*2^32+K)/2^52+1)end;local function M(N)local O;if not N then N=G()if N==0 then return""end end;O=d(p,r,r+N-1)r=r+N;local P={}for Q=1,#O do P[Q]=c(b(d(O,Q,Q)))end;return g(P)end;local R=G;local function S(...)return{...},l("#",...)end;local function T()local U={}local V={}local W={}local X={U,V,nil,W}local Y=G()local Z={}for Q=1,Y do local _=E()local a0;if _==1 then a0=E()~=0 elseif _==2 then a0=J()elseif _==3 then a0=M()end;Z[Q]=a0 end;X[3]=E()for Q=1,G()do local a1=E()if w(a1,1,1)==0 then local _=w(a1,2,3)local a2=w(a1,4,6)local a3={F(),F(),nil,nil}if _==0 then a3[3]=F()a3[4]=F()elseif _==1 then a3[3]=G()elseif _==2 then a3[3]=G()-2^16 elseif _==3 then a3[3]=G()-2^16;a3[4]=F()end;if w(a2,1,1)==1 then a3[2]=Z[a3[2]]end;if w(a2,2,2)==1 then a3[3]=Z[a3[3]]end;if w(a2,3,3)==1 then a3[4]=Z[a3[4]]end;U[Q]=a3 end end;for Q=1,G()do V[Q-1]=T()end;for Q=1,G()do W[Q]=G()end;return X end;local function a4(X,a5,a6)local a7=X[1]local a8=X[2]local a9=X[3]return function(...)local aa=1;local ab=-1;local ac={...}local ad=l("#",...)-1;local function ae()local a7=a7;local Const=Const;local a8=a8;local a9=a9;local S=S;local af={}local ag={}local ah={}for Q=0,ad do if Q>=a9 then af[Q-a9]=ac[Q+1]else ah[Q]=ac[Q+1]end end;local ai=ad-a9+1;local a3;local aj;while true do a3=a7[aa]aj=a3[1]if aj<=12 then if aj<=5 then if aj<=2 then if aj<=0 then local A=a3[2]ah[A](ah[A+1])elseif aj>1 then ah[a3[2]]=a3[3]else local A=a3[2]ah[A]=ah[A](m(ah,A+1,a3[3]))end elseif aj<=3 then local A=a3[2]local ak,al=S(ah[A](ah[A+1]))ab=al+A-1;local am=0;for Q=A,ab do am=am+1;ah[Q]=ak[am]end elseif aj==4 then if ah[a3[2]]==a3[4]then aa=aa+1 else aa=a3[3]end else ah[a3[2]]=a4(a8[a3[3]],nil,a6)end elseif aj<=8 then if aj<=6 then ah[a3[2]]=a5[a3[3]]elseif aj==7 then do return end else ah[a3[2]]=a3[3]~=0 end elseif aj<=10 then if aj==9 then local A=a3[2]local an=ah[A]local B=a3[3]for Q=1,B do an[Q]=ah[A+Q]end else local A=a3[2]ah[A]=ah[A](ah[A+1])end elseif aj>11 then ah[a3[2]]=ah[a3[3]][a3[4]]else ah[a3[2]][a3[3]]=ah[a3[4]]end elseif aj<=19 then if aj<=15 then if aj<=13 then local A=a3[2]local ao=a3[4]local ap=A+2;local aq={ah[A](ah[A+1],ah[ap])}for Q=1,ao do ah[ap+Q]=aq[Q]end;local ar=aq[1]if ar then ah[ap]=ar;aa=a3[3]else aa=aa+1 end elseif aj>14 then ah[a3[2]]=a6[a3[3]]else aa=a3[3]end elseif aj<=17 then if aj>16 then local A=a3[2]local ak={ah[A](m(ah,A+1,ab))}local am=0;for Q=A,a3[4]do am=am+1;ah[Q]=ak[am]end else local A=a3[2]ah[A](m(ah,A+1,a3[3]))end elseif aj==18 then ah[a3[2]]()else ah[a3[2]]={}end elseif aj<=22 then if aj<=20 then local A=a3[2]local B=ah[a3[3]]ah[A+1]=B;ah[A]=B[a3[4]]elseif aj>21 then if ah[a3[2]]then aa=aa+1 else aa=a3[3]end else ah[a3[2]][a3[3]]=a3[4]end elseif aj<=24 then if aj==23 then local as=a8[a3[3]]local at;local au={}at=j({},{__index=function(av,aw)local ax=au[aw]return ax[1][ax[2]]end,__newindex=function(av,aw,ay)local ax=au[aw]ax[1][ax[2]]=ay end})for Q=1,a3[4]do aa=aa+1;local az=a7[aa]if az[1]==24 then au[Q-1]={ah,az[3]}else au[Q-1]={a5,az[3]}end;ag[#ag+1]=au end;ah[a3[2]]=a4(as,at,a6)else ah[a3[2]]=ah[a3[3]]end elseif aj>25 then local A=a3[2]local an=ah[A]for Q=A+1,a3[3]do h(an,ah[Q])end elseif not ah[a3[2]]then aa=aa+1 else aa=a3[3]end;aa=aa+1 end end;A,B=S(k(ae))if not A[1]then local aA=X[4][aa]or"?"error("Script error at ["..aA.."]:"..A[2])else return m(A,2,B)end end end;return a4(T(),{},q)()end;o("LOL!023O0003043O007461736B03053O00737061776E00053O00120F3O00013O00200C5O000200020500019O00000200012O00073O00013O00013O00043O00030A3O00412O64436F2O6D616E642O033O00616632030A3O00616E7469666C696E6732032D3O004D616B657320796F7520756E61626C6520746F20626520666C756E6720312O3025206F66207468652074696D6500093O00120F3O00013O001202000100024O0013000200013O001202000300034O0009000200010001001202000300043O00020500046O00103O000400012O00073O00013O00013O00093O0003043O0067616D65030A3O004765745365727669636503073O00506C6179657273030B3O004C6F63616C506C6179657203053O007061697273030A3O00476574506C6179657273030B3O00506C61796572412O64656403073O00436F2O6E656374030E3O00436861726163746572412O64656400263O00120F3O00013O0020145O0002001202000200034O00013O0002000200200C5O000400061700013O000100012O00187O00120F000200053O00120F000300013O002014000300030002001202000500034O00010003000500020020140003000300062O0003000300044O001100023O000400040E3O001400012O0018000700014O0018000800064O000800096O001000070009000100060D000200100001000200040E3O0010000100120F000200013O002014000200020002001202000400034O000100020004000200200C0002000200070020140002000200082O0018000400014O000800056O001000020005000100200C00023O000900201400020002000800061700040001000100022O00188O00183O00014O00100002000400012O00073O00013O00023O00033O0003043O007461736B03053O00737061776E03053O007063612O6C02093O00120F000200013O00200C00020002000200120F000300033O00061700043O000100032O00188O00068O00183O00014O00100002000400012O00073O00013O00013O00033O0003053O007063612O6C030E3O00436861726163746572412O64656403073O00436F2O6E656374000F3O0006175O000100022O00068O00063O00013O00120F000100014O001800028O0001000200012O0006000100023O0006190001000E0001000100040E3O000E00012O000600015O00200C0001000100020020140001000100032O001800036O00100001000300012O00073O00013O00013O00193O0003093O00436861726163746572030E3O00436861726163746572412O64656403043O005761697403043O007461736B03043O0077616974030E3O0046696E6446697273744368696C6403083O0048756D616E6F696403043O004865616403053O007061697273030E3O0047657444657363656E64616E747303043O004E616D6503153O004E6F436F2O6C6973696F6E436F6E73747261696E7403073O0044657374726F7903093O00436C612O734E616D6503053O006C6F77657203043O0066696E6403043O007061727403083O00496E7374616E63652O033O006E657703073O00456E61626C65642O0103053O00506172743003053O005061727431030F3O0044657363656E64616E74412O64656403073O00436F2O6E656374005A4O00067O00200C5O00010006193O00080001000100040E3O000800012O00067O00200C5O00020020145O00036O0002000100120F3O00043O00200C5O00052O00123O000100012O00067O00200C5O00010020145O0006001202000200074O00013O000200020006163O000800013O00040E3O000800012O00067O00200C5O00010020145O0006001202000200084O00013O000200020006163O000800013O00040E3O0008000100120F3O00094O000600015O00200C00010001000100201400010001000A2O0003000100024O00115O000200040E3O0025000100200C00050004000B002604000500250001000C00040E3O0025000100201400050004000D4O00050002000100060D3O00200001000200040E3O0020000100120F3O00094O000600015O00200C00010001000100201400010001000A2O0003000100024O00115O000200040E3O0050000100200C00050004000E00201400050005000F2O000A000500020002002014000500050010001202000700114O00010005000700020006160005005000013O00040E3O005000012O0018000500043O00120F000600094O0006000700013O00200C00070007000100201400070007000A2O0003000700084O001100063O000800040E3O004E000100200C000B000A000E002014000B000B000F2O000A000B00020002002014000B000B0010001202000D00114O0001000B000D0002000616000B004E00013O00040E3O004E000100120F000B00123O00200C000B000B0013001202000C000C4O0018000D00054O0001000B000D0002003015000B0014001500100B000B0016000A00100B000B0017000500060D0006003E0001000200040E3O003E000100060D3O002E0001000200040E3O002E00012O00067O00200C5O000100200C5O00180020145O001900061700023O000100012O00063O00014O00103O000200012O00073O00013O00013O000E3O0003093O00436C612O734E616D6503053O006C6F77657203043O0066696E6403043O007061727403053O00706169727303093O00436861726163746572030E3O0047657444657363656E64616E747303083O00496E7374616E63652O033O006E657703153O004E6F436F2O6C6973696F6E436F6E73747261696E7403073O00456E61626C65642O0103053O00506172743003053O00506172743101233O00200C00013O00010020140001000100022O000A000100020002002014000100010003001202000300044O00010001000300020006160001002200013O00040E3O002200012O001800015O00120F000200054O000600035O00200C0003000300060020140003000300072O0003000300044O001100023O000400040E3O0020000100200C0007000600010020140007000700022O000A000700020002002014000700070003001202000900044O00010007000900020006160007002000013O00040E3O0020000100120F000700083O00200C0007000700090012020008000A4O0018000900014O00010007000900020030150007000B000C00100B0007000D000600100B0007000E000100060D000200100001000200040E3O001000012O00073O00017O00233O00203O00203O00203O00203O00203O00203O00203O00203O00213O00223O00223O00223O00223O00223O00223O00223O00233O00233O00233O00233O00233O00233O00233O00233O00243O00243O00243O00243O00243O00253O00263O00273O00223O00283O002B3O005A3O00073O00073O00073O00073O00083O00083O00083O00083O000B3O000B3O000B3O000C3O000C3O000C3O000C3O000C3O000C3O000C3O000C3O000C3O000C3O000C3O000C3O000C3O000C3O000D3O000D3O000D3O000D3O000D3O000D3O000D3O000E3O000E3O000E3O000F3O000F3O000D3O00103O00123O00123O00123O00123O00123O00123O00123O00133O00133O00133O00133O00133O00133O00133O00133O00143O00153O00153O00153O00153O00153O00153O00153O00163O00163O00163O00163O00163O00163O00163O00163O00173O00173O00173O00173O00173O00183O00193O001A3O00153O001B3O00123O001D3O001F3O001F3O001F3O001F3O002B3O002B3O001F3O002C3O000F3O002C3O002C3O002C3O002D3O002D3O002D3O002E3O002E3O002E3O002F3O002F3O002F3O002F3O002F3O00313O00093O00053O00053O00053O00313O00313O00313O00313O00053O00323O000B3O0003043O007461736B03043O007761697403093O00436861726163746572030E3O0046696E6446697273744368696C6403043O004865616403083O0048756D616E6F696403053O00706169727303043O0067616D65030A3O004765745365727669636503073O00506C6179657273030A3O00476574506C617965727300213O00120F3O00013O00200C5O00022O00123O000100012O00067O00200C5O00030020145O0004001202000200054O00013O000200020006165O00013O00040E5O00012O00067O00200C5O00030020145O0004001202000200064O00013O000200020006165O00013O00040E5O000100120F3O00073O00120F000100083O0020140001000100090012020003000A4O000100010003000200201400010001000B2O0003000100024O00115O000200040E3O001E00012O0006000500014O0018000600044O000800076O001000050007000100060D3O001A0001000200040E3O001A00012O00073O00017O00213O00393O00393O00393O003A3O003A3O003A3O003A3O003A3O003A3O003A3O003A3O003A3O003A3O003A3O003A3O003A3O003A3O003B3O003B3O003B3O003B3O003B3O003B3O003B3O003B3O003B3O003C3O003C3O003C3O003C3O003B3O003C3O003E3O00263O00033O00033O00033O00033O00033O00323O00323O00333O00333O00333O00333O00333O00333O00333O00333O00333O00343O00343O00343O00343O00333O00343O00363O00363O00363O00363O00363O00363O00363O00363O00363O00373O00373O003E3O003E3O003E3O00373O003F3O00093O00023O00023O00023O00023O00023O00023O003F3O00023O00403O00053O00013O00013O00403O00013O00403O00",i())
