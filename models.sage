from sage.schemes.elliptic_curves.weierstrass_morphism import *
S.<a,b,p,l,u,v,c,d,r,s,t,x,y,k,j,e>=QQ[]

# p-adic valuation
def vp(n,p):
	if n==0:
		return 'infinity'
	else:
		return log(1/Qp(p)(n).abs(),p)

# Reduces a polynomial mod n
def PolyMod(f,n):
    R = IntegerModRing(n)
    S.<a,b,p,l,u,v,c,d,r,s,t,x,y>=R[]
    return S(f)

# Factors a polynomial over a finite field of order p.
def PolyModFactor(f,p):
	R=GF(p)
	S.<a,b,p,l,u,v,c,d,r,s,t,x,y>=R[];S
	return factor(S(f))

# Models for the family of elliptic curves E_T. We use the following naming convention:
#    E_{C_N}  is EN
#    E_{C_2 \times C_{N}}  is E2N

def E2(a,b,d):
	A=a
	B=b^2*d
	return EllipticCurve(S.fraction_field(),[0,2*A,0,A^2-B,0])
def F2(a,b):
    return E2(a,b,d).change_ring(QQ)
def E3(a,b):
    return EllipticCurve(S.fraction_field(),[a,0,a^2*b,0,0])
def F3(a,b):
    return E3(a,b).change_ring(QQ)
def E30(a,b): # This is E_{C_3^0}
    return EllipticCurve(S.fraction_field(),[0,0,a,0,0])
def F30(a,b):
    return E30(a,b).change_ring(QQ)
def E4(a,b):
    return EllipticCurve(S.fraction_field(),[a,-a*b,-a^2*b,0,0])
def F4(a,b):
    return E4(a,b).change_ring(QQ)
def E5(a,b):
    return EllipticCurve(S.fraction_field(),[a-b,-a*b,-a^2*b,0,0])
def F5(a,b):
    return E5(a,b).change_ring(QQ)
def E6(a,b):
    return EllipticCurve(S.fraction_field(),[a - b, -a*b - b^2, -a^2*b - a*b^2, 0, 0])
def F6(a,b):
    return E6(a,b).change_ring(QQ)
def E7(a,b):
    return EllipticCurve(S.fraction_field(),[a^2 + a*b - b^2, a^2*b^2 - a*b^3, a^4*b^2 - a^3*b^3, 0, 0])
def F7(a,b):
    return E7(a,b).change_ring(QQ)
def E8(a,b):
    return EllipticCurve(S.fraction_field(),[-a^2 + 4*a*b - 2*b^2, -a^2*b^2 + 3*a*b^3 - 2*b^4, -a^3*b^3 + 3*a^2*b^4 - 2*a*b^5, 0, 0])
def F8(a,b):
    return E8(a,b).change_ring(QQ)
def E9(a,b):
    return EllipticCurve(S.fraction_field(),[a^3 + a*b^2 - b^3, a^4*b^2 - 2*a^3*b^3 + 2*a^2*b^4 - a*b^5, a^7*b^2 - 2*a^6*b^3 + 2*a^5*b^4 - a^4*b^5, 0, 0])
def F9(a,b):
    return E9(a,b).change_ring(QQ)
def E10(a,b):
    return EllipticCurve(S.fraction_field(),[a^3 - 2*a^2*b - 2*a*b^2 + 2*b^3, -a^3*b^3 + 3*a^2*b^4 - 2*a*b^5, -a^6*b^3 + 6*a^5*b^4 - 12*a^4*b^5 + 9*a^3*b^6 - 2*a^2*b^7, 0, 0])
def F10(a,b):
    return E10(a,b).change_ring(QQ)
def E12(a,b):
    return EllipticCurve(S.fraction_field(),[-a^4 + 2*a^3*b + 2*a^2*b^2 - 8*a*b^3 + 6*b^4, a^7*b - 9*a^6*b^2 + 36*a^5*b^3 - 83*a^4*b^4 + 119*a^3*b^5 - 106*a^2*b^6 + 54*a*b^7 - 12*b^8, -a^11*b + 12*a^10*b^2 - 66*a^9*b^3 + 219*a^8*b^4 - 485*a^7*b^5 + 748*a^6*b^6 - 812*a^5*b^7 + 611*a^4*b^8 - 304*a^3*b^9 + 90*a^2*b^10 - 12*a*b^11, 0, 0])
def F12(a,b):
    return E12(a,b).change_ring(QQ)
def E22(a,b,d):
	A=a*d
	B=b*d
	return EllipticCurve(S.fraction_field(),[0,A+B,0,A*B,0])
def F22(a,b,d):
    return E22(a,b,d).change_ring(QQ)
def E24(a,b):
    return EllipticCurve(S.fraction_field(),[a, -a*b - 4*b^2, -a^2*b - 4*a*b^2, 0, 0])
def F24(a,b):
    return E24(a,b).change_ring(QQ)
def E26(a,b):
    return EllipticCurve(S.fraction_field(),[-19*a^2+2*a*b+b^2, -10*a^4+22*a^3*b-14*a^2*b^2+2*a*b^3, 90*a^6-198*a^5*b+116*a^4*b^2+4*a^3*b^3-14*a^2*b^4+2*a*b^5, 0, 0])
def F26(a,b):
    return E26(a,b).change_ring(QQ)
def E28(a,b):
    return EllipticCurve(S.fraction_field(),[-a^4 - 8*a^3*b - 24*a^2*b^2 + 64*b^4,-4*a^6*b^2 - 56*a^5*b^3 - 320*a^4*b^4 - 960*a^3*b^5 - 1536*a^2*b^6 - 1024*a*b^7,8*a^9*b^3 + 144*a^8*b^4 + 1024*a^7*b^5 + 3328*a^6*b^6 + 2048*a^5*b^7 - 21504*a^4*b^8 - 77824*a^3*b^9 - 114688*a^2*b^10 - 65536*a*b^11,0, 0])
def F28(a,b):
    return E28(a,b).change_ring(QQ)

# The models \mathcal{X}_t(T) appearing in Table 1 of Minimal models of rational elliptic curves with non-trivial torsion. We use the following naming convention:
#    \mathcal{X}_t(C_N)  is XN(t)
#    \mathcal{X}_t(C_2 \times C_{2N})  is X2N(t)

def X28(t):
	u=(16*t^3+16*t^2+6*t+1)/(8*t^2-1)^2
	v=(16*t^3+16*t^2+6*t+1)/(2*t*(4*t+1)*(8*t^2-1))
	return EllipticCurve(S.fraction_field(),[1-v,-u,-u,0,0])
def X26(t):
	u=(-2*t^3+14*t^2-22*t+10)/((t+3)^2*(t-3)^2)
	v=(-2*t+10)/((t-3)*(t+3))
	return EllipticCurve(S.fraction_field(),[1-v,-u,-u,0,0])
def X24(t):
	u=t*(4*t+1)
	v=0
	return EllipticCurve(S.fraction_field(),[1-v,-u,-u,0,0])
def X12(t):

	u=(12*t^6-30*t^5+34*t^4-21*t^3+7*t^2-t)/(t-1)^4
	v=(-6*t^4+9*t^3-5*t^2+t)/(t-1)^3
	return EllipticCurve(S.fraction_field(),[1-v,-u,-u,0,0])
def X10(t):
	u=(2*t^5-3*t^4+t^3)/(t^2-3*t+1)^2
	v=(-2*t^3+3*t^2-t)/((t^2-3*t+1))
	return EllipticCurve(S.fraction_field(),[1-v,-u,-u,0,0])
def X9(t):
	u=t^5-2*t^4+2*t^3-t^2
	v=t^3-t^2
	return EllipticCurve(S.fraction_field(),[1-v,-u,-u,0,0])
def X8(t):
	u=2*t^2-3*t+1
	v=(2*t^2-3*t+1)/t
	return EllipticCurve(S.fraction_field(),[1-v,-u,-u,0,0])
def X7(t):
	u=t^3-t^2
	v=t^2-t
	return EllipticCurve(S.fraction_field(),[1-v,-u,-u,0,0])
def X6(t):
	u=t^2+t
	v=t
	return EllipticCurve(S.fraction_field(),[1-v,-u,-u,0,0])
def X5(t):
	u=t
	v=t
	return EllipticCurve(S.fraction_field(),[1-v,-u,-u,0,0])
def X4(t):
	u=t
	v=0
	return EllipticCurve(S.fraction_field(),[1-v,-u,-u,0,0])
def X3(t):
	return EllipticCurve(S.fraction_field(),[1, 0, t, 0, 0])