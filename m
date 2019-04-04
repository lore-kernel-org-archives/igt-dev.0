Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EBB56EA1A
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Apr 2019 15:27:04 +0000 (UTC)
From: "Mrzyglod, Daniel T" <daniel.t.mrzyglod@intel.com>
Date: Thu, 4 Apr 2019 15:27:01 +0000
Message-ID: <1386d332abb790d967c560140a78d5c13bc24b44.camel@intel.com>
References: <20190404131805.18110-1-daniel.t.mrzyglod@intel.com>
 <20190404131805.18110-4-daniel.t.mrzyglod@intel.com>
 <20190404144746.GF12599@kdec5-desk.ger.corp.intel.com>
In-Reply-To: <20190404144746.GF12599@kdec5-desk.ger.corp.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] lib/intel_mmio: Remove global
 igt_global_mmio
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0304496890=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dec, Katarzyna" <katarzyna.dec@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0304496890==
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-1;
	protocol="application/x-pkcs7-signature"; boundary="=-wD9OjQD4BJs8rTEwu7WW"

--=-wD9OjQD4BJs8rTEwu7WW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-04-04 at 16:47 +0200, Katarzyna Dec wrote:
> On Thu, Apr 04, 2019 at 03:18:05PM +0200, Daniel Mrzyglod wrote:
> > In future tests there will be multiple PCI devices run at once.
> > It's good for them to have different mmio space.
> >=20
> > Signed-off-by: Daniel Mrzyglod <daniel.t.mrzyglod@intel.com>
> > ---
<CUT>
> > diff --git a/lib/intel_iosf.c b/lib/intel_iosf.c
> > index 3b5a1370..52a885f5 100644
> > --- a/lib/intel_iosf.c
> > +++ b/lib/intel_iosf.c
> > @@ -19,8 +19,8 @@
> >  /* Private register write, double-word addressing, non-posted */
> >  #define SB_CRWRDA_NP   0x07
> > =20
> > -static int vlv_sideband_rw(uint32_t port, uint8_t opcode, uint32_t
> > addr,
> > -			   uint32_t *val)
> > +static int vlv_sideband_rw(struct mmio_data *mmio_data, uint32_t
> > port,
> > +			   uint8_t opcode, uint32_t addr, uint32_t
> > *val)
> As I undestand VLV is quite an old gen, do we need to add mmio_data
> here? Or not
> adding it breaks some compatibility?
>=20
> nit: patch is almost 3000 lines of different changes, please divide
> it in
> smaller chunks. It is hard to read so large changes and yet we need
> to
> understand what is going on :/
> Kasia

The problem is that igt_global_mmio is using by VLV also and almost all
functions in intel_io.h

Design that was chosen was perfect for single device for now there are
many challenges for us and that there will be in many future scenarios:
- For example we will run competition card and ours - run some 	scenari
os
- Run our integrated and our future PCI card
- Put few different models PCI cards to limit CI cost.
- other more real scenarios

When I moved igt_global_mmio there was a need to update everything
that  was using that global pointer.=20

There were few Tools that required more changes that were using
INREG/OUTREG directly.... i think intel_audio.c was a leader in diff :>

It's used by tools/tests/benchmarks others... but if i divide this
patch it will probably not compile... so it will not meet acceptance
criteria.

There is a need for v2 so i will try to adress those problems.=20

Daniel

--=-wD9OjQD4BJs8rTEwu7WW
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIKfTCCBOsw
ggPToAMCAQICEFLpAsoR6ESdlGU4L6MaMLswDQYJKoZIhvcNAQEFBQAwbzELMAkGA1UEBhMCU0Ux
FDASBgNVBAoTC0FkZFRydXN0IEFCMSYwJAYDVQQLEx1BZGRUcnVzdCBFeHRlcm5hbCBUVFAgTmV0
d29yazEiMCAGA1UEAxMZQWRkVHJ1c3QgRXh0ZXJuYWwgQ0EgUm9vdDAeFw0xMzAzMTkwMDAwMDBa
Fw0yMDA1MzAxMDQ4MzhaMHkxCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJDQTEUMBIGA1UEBxMLU2Fu
dGEgQ2xhcmExGjAYBgNVBAoTEUludGVsIENvcnBvcmF0aW9uMSswKQYDVQQDEyJJbnRlbCBFeHRl
cm5hbCBCYXNpYyBJc3N1aW5nIENBIDRBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
4LDMgJ3YSVX6A9sE+jjH3b+F3Xa86z3LLKu/6WvjIdvUbxnoz2qnvl9UKQI3sE1zURQxrfgvtP0b
Pgt1uDwAfLc6H5eqnyi+7FrPsTGCR4gwDmq1WkTQgNDNXUgb71e9/6sfq+WfCDpi8ScaglyLCRp7
ph/V60cbitBvnZFelKCDBh332S6KG3bAdnNGB/vk86bwDlY6omDs6/RsfNwzQVwo/M3oPrux6y6z
yIoRulfkVENbM0/9RrzQOlyK4W5Vk4EEsfW2jlCV4W83QKqRccAKIUxw2q/HoHVPbbETrrLmE6RR
Z/+eWlkGWl+mtx42HOgOmX0BRdTRo9vH7yeBowIDAQABo4IBdzCCAXMwHwYDVR0jBBgwFoAUrb2Y
ejS0Jvf6xCZU7wO94CTLVBowHQYDVR0OBBYEFB5pKrTcKP5HGE4hCz+8rBEv8Jj1MA4GA1UdDwEB
/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMDYGA1UdJQQvMC0GCCsGAQUFBwMEBgorBgEEAYI3
CgMEBgorBgEEAYI3CgMMBgkrBgEEAYI3FQUwFwYDVR0gBBAwDjAMBgoqhkiG+E0BBQFpMEkGA1Ud
HwRCMEAwPqA8oDqGOGh0dHA6Ly9jcmwudHJ1c3QtcHJvdmlkZXIuY29tL0FkZFRydXN0RXh0ZXJu
YWxDQVJvb3QuY3JsMDoGCCsGAQUFBwEBBC4wLDAqBggrBgEFBQcwAYYeaHR0cDovL29jc3AudHJ1
c3QtcHJvdmlkZXIuY29tMDUGA1UdHgQuMCygKjALgQlpbnRlbC5jb20wG6AZBgorBgEEAYI3FAID
oAsMCWludGVsLmNvbTANBgkqhkiG9w0BAQUFAAOCAQEAKcLNo/2So1Jnoi8G7W5Q6FSPq1fmyKW3
sSDf1amvyHkjEgd25n7MKRHGEmRxxoziPKpcmbfXYU+J0g560nCo5gPF78Wd7ZmzcmCcm1UFFfIx
fw6QA19bRpTC8bMMaSSEl8y39Pgwa+HENmoPZsM63DdZ6ziDnPqcSbcfYs8qd/m5d22rpXq5IGVU
tX6LX7R/hSSw/3sfATnBLgiJtilVyY7OGGmYKCAS2I04itvSS1WtecXTt9OZDyNbl7LtObBrgMLh
ZkpJW+pOR9f3h5VG2S5uKkA7Th9NC9EoScdwQCAIw+UWKbSQ0Isj2UFL7fHKvmqWKVTL98sRzvI3
seNC4DCCBYowggRyoAMCAQICEzMAALzL/Z8cDroDYU4AAAAAvMswDQYJKoZIhvcNAQEFBQAweTEL
MAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRQwEgYDVQQHEwtTYW50YSBDbGFyYTEaMBgGA1UEChMR
SW50ZWwgQ29ycG9yYXRpb24xKzApBgNVBAMTIkludGVsIEV4dGVybmFsIEJhc2ljIElzc3Vpbmcg
Q0EgNEEwHhcNMTgwNDIwMTA0NjUwWhcNMTkwNDE1MTA0NjUwWjBJMRswGQYDVQQDExJNcnp5Z2xv
ZCwgRGFuaWVsIFQxKjAoBgkqhkiG9w0BCQEWG2RhbmllbC50Lm1yenlnbG9kQGludGVsLmNvbTCC
ASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKql0sQLCyRgSbw50Vm7mWes+gPUy9i4YkI5
ays0lybmxmTIzjeg16mJDZBSeTQJOIAF0UnJweBVXbp6qZKtFdKox+Wl7YnmHzhXR3DXADH14R4L
b9NmcEnelOUvBqOh+qgVc/lCMIBGGYdZuncbWSGmwQjFkg8nyPLBZOvLDRM/z8YPVerEqeEyUrwp
iRMq0SXEBVsllOHh8s+q0w1n4whFQPqxyGqCgwd2VbtF1iza3JEZaJqZ1WvCnvoZ6ILCKAH7b76e
lI/UDfjCwdb9GSdNIlWIJLgI5ReHyLR8vfweTGv4mTyCWNbx1VMf6guFT1juQ3qoQhEOwrrNjxg0
azUCAwEAAaOCAjkwggI1MB0GA1UdDgQWBBRZPxTC6CjZpQQKANfSImJLJQIYNjAfBgNVHSMEGDAW
gBQeaSq03Cj+RxhOIQs/vKwRL/CY9TBlBgNVHR8EXjBcMFqgWKBWhlRodHRwOi8vd3d3LmludGVs
LmNvbS9yZXBvc2l0b3J5L0NSTC9JbnRlbCUyMEV4dGVybmFsJTIwQmFzaWMlMjBJc3N1aW5nJTIw
Q0ElMjA0QS5jcmwwgZ8GCCsGAQUFBwEBBIGSMIGPMGkGCCsGAQUFBzAChl1odHRwOi8vd3d3Lmlu
dGVsLmNvbS9yZXBvc2l0b3J5L2NlcnRpZmljYXRlcy9JbnRlbCUyMEV4dGVybmFsJTIwQmFzaWMl
MjBJc3N1aW5nJTIwQ0ElMjA0QS5jcnQwIgYIKwYBBQUHMAGGFmh0dHA6Ly9vY3NwLmludGVsLmNv
bS8wCwYDVR0PBAQDAgeAMDwGCSsGAQQBgjcVBwQvMC0GJSsGAQQBgjcVCIbDjHWEmeVRg/2BKIWO
n1OCkcAJZ4HevTmV8EMCAWQCAQkwHwYDVR0lBBgwFgYIKwYBBQUHAwQGCisGAQQBgjcKAwwwKQYJ
KwYBBAGCNxUKBBwwGjAKBggrBgEFBQcDBDAMBgorBgEEAYI3CgMMMFMGA1UdEQRMMEqgKwYKKwYB
BAGCNxQCA6AdDBtkYW5pZWwudC5tcnp5Z2xvZEBpbnRlbC5jb22BG2RhbmllbC50Lm1yenlnbG9k
QGludGVsLmNvbTANBgkqhkiG9w0BAQUFAAOCAQEAx0MsgcJzKyv6nU/3sZRXWbCkqSm1Qfe0ovXl
/caC2Edb0jq1FOy2Wz8eJnliORocSBUy/RG26nOQ9AVOH0Fg/pSikYd6ViWVeCFhzNKkDbQpcHmL
RPt3oLU+z0JjiO/D9Wvfr5hNZl2lS9gNtTEcVqN6byieOFCrSpJK3qyehIWYWvEnrkCqG/cZdUih
Ws/2jM3CdTTWsiek/OAKCxLjZ5WJkrKmKg8FNnj/qWLScn/xMf7rBnL1OKl5o9vUv1Zv9rQpHJfD
B6h/lJ5SbpW863O+1ih2QO/ArRRHtdwsIAouR+rRRi2+ucuANVtH3JSPeldW13rgdrp9/+132O8M
gDGCAhcwggITAgEBMIGQMHkxCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJDQTEUMBIGA1UEBxMLU2Fu
dGEgQ2xhcmExGjAYBgNVBAoTEUludGVsIENvcnBvcmF0aW9uMSswKQYDVQQDEyJJbnRlbCBFeHRl
cm5hbCBCYXNpYyBJc3N1aW5nIENBIDRBAhMzAAC8y/2fHA66A2FOAAAAALzLMAkGBSsOAwIaBQCg
XTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xOTA0MDQxNTI2NTha
MCMGCSqGSIb3DQEJBDEWBBSK2h6r42aGXqdZwcO/2xSa77LXATANBgkqhkiG9w0BAQEFAASCAQAt
i36zt5gBPNpOixh3AB4oAWxDjE2eSB43KkKr0IJImTH4BGPMRcwIu08+/FRjgsqrnsqTx3L/kbjx
2K8X0CB/blBSHqFRvcFNgIx8D8R/iyxypsPfjo6DGidaXqK0t9RZT+ayXou81rqq9+7C/0qObPn7
EhpIy83iHInd5nV2e1QGb9yi4aaVnVfD4Sxky5Ns9G0PkikAUa1TUaKTeDQxOATchCq7G6RkhjOw
dtxS5xhvlFuAsjYEO/G2BdS8b4R1egClOUrjr4mFQbNuzkvZK1Z2mZrcEyht13NtHYTVTaBuGrY7
IMkN4WwSsS331ka4G+xAp4d8irDvJg0EsDh0AAAAAAAA


--=-wD9OjQD4BJs8rTEwu7WW--

--===============0304496890==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0304496890==--
