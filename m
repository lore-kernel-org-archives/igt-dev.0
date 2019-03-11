Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299358997E
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2019 14:24:34 +0000 (UTC)
From: "Mrzyglod, Daniel T" <daniel.t.mrzyglod@intel.com>
Date: Mon, 11 Mar 2019 14:24:30 +0000
Message-ID: <6da230dfea84930d39c7e86c39976aa94d173070.camel@intel.com>
References: <20190311132309.11061-1-daniel.t.mrzyglod@intel.com>
 <155231236196.19206.14507886008669232156@skylake-alporthouse-com>
In-Reply-To: <155231236196.19206.14507886008669232156@skylake-alporthouse-com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib: add pci helper functions to
 intel_chipset
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1149431659=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1149431659==
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-1;
	protocol="application/x-pkcs7-signature"; boundary="=-vyz74t1WR9eZ86HBV8y1"

--=-vyz74t1WR9eZ86HBV8y1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-03-11 at 13:52 +0000, Chris Wilson wrote:
> Quoting Daniel Mrzyglod (2019-03-11 13:23:09)
> > +       error =3D pci_device_map_range(dev,
> > +                                    dev-
> > >regions[mmio_bar].base_addr,
> > +                                    mmio_size,
> > +                                    PCI_DEV_MAP_FLAG_WRITABLE,
> > +                                    &igt_mmio);
>=20
> This wasn't enough clue to consider intel_mmio.c instead?
> -Chris

You are correct I will move to v2 for second iteration.

--=-vyz74t1WR9eZ86HBV8y1
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

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
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
XTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xOTAzMTExNDI0Mjla
MCMGCSqGSIb3DQEJBDEWBBTdkLiK/MEElOhjcJZCT1+IW29Q7zANBgkqhkiG9w0BAQEFAASCAQBF
ORIU9/MZMym3gUd7kauhTF98ofaE68J1M/ZZeIqWg+u3UDXzvySRP5UtAT1UR2eqng+cHm2LQ0qx
g6kCMW/21BT6tMkmUq3wsNvbcwoOdqh/cjxp+PGRFeMC2WP8P5sA2KRuKiU6ocI93hvoQJOPQMvz
5Oc7lUr+Nskt51kAOaweE6RKzMCeDEtEk7Pinqi06G5qw+7Bhnh2vpAbH/Rt3sRrzXgPPgeLTOTS
1WWTXIUrR4gM5IZbvuqc/a5Nd78KlaSCwsjjbGzuAB/iS9P45y0gOjTeesL+W7nBc7R+85K8ANEa
bJTo9B5gSzk5Tmv5hBbdaP0njCDsFb6iuwt4AAAAAAAA


--=-vyz74t1WR9eZ86HBV8y1--

--===============1149431659==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============1149431659==--
