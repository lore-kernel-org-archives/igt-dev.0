Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2866E311
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jul 2019 08:36:16 +0000 (UTC)
From: "Vasilev, Oleg" <oleg.vasilev@intel.com>
Date: Fri, 12 Jul 2019 08:36:12 +0000
Message-ID: <3304ffa3cc7ec535c09a69434aec743b909fddd6.camel@intel.com>
References: <20190704095604.16589-1-oleg.vasilev@intel.com>
 <20190704095604.16589-2-oleg.vasilev@intel.com>
 <20190710163542.GX15868@phenom.ffwll.local>
 <d98e878cf1d19c32ffb25f30f665bcdd5d48e802.camel@intel.com>
 <CAKMK7uEPZC1B2YuecKzg1NPs-Kt9Uny-HmdAN_2SD7w6mMF4Yg@mail.gmail.com>
 <a8368d4de10e3d1496404fb41fc671958be924c9.camel@intel.com>
 <20190711171903.GP15868@phenom.ffwll.local>
In-Reply-To: <20190711171903.GP15868@phenom.ffwll.local>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 2/2] tests/prime_generic: add vendor-agnostic
 prime tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0192980601=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, "Ser, Simon" <simon.ser@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0192980601==
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-1;
	protocol="application/x-pkcs7-signature"; boundary="=-JXX7dhyS+XBvcn3KSZfj"

--=-JXX7dhyS+XBvcn3KSZfj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-07-11 at 19:19 +0200, Daniel Vetter wrote:
> On Thu, Jul 11, 2019 at 03:20:52PM +0000, Ser, Simon wrote:
> > On Thu, 2019-07-11 at 14:36 +0200, Daniel Vetter wrote:
> > > On Thu, Jul 11, 2019 at 11:09 AM Vasilev, Oleg <
> > > oleg.vasilev@intel.com> wrote:
> > > > On Wed, 2019-07-10 at 18:35 +0200, Daniel Vetter wrote:
> > > > > On Thu, Jul 04, 2019 at 12:56:04PM +0300, Oleg Vasilev wrote:
> > > > > > Currently, we have different sets of prime tests:
> > > > > >  - vgem+i915
> > > > > >  - amdgpu+i915
> > > > > >  - nv+i915
> > > > > >=20
> > > > > > Those tests use vendor-specific ioctls, therefore, not
> > > > > > interchangeable.
> > > > > > The idea is to create a set of tests which are expected to
> > > > > > work on
> > > > > > any
> > > > > > prime-compatible driver. It can be run with any combination
> > > > > > of
> > > > > > exporter+importer, where
> > > > > >=20
> > > > > > The first test is simple:
> > > > > > 1. Exporter creates a framebuffer and fills it with a plain
> > > > > > color
> > > > > > 2. Fb is transferred to the importer
> > > > > > 3. Importer modesets and computes pipe CRC
> > > > > > 4. Importer draws the same color through cairo and compares
> > > > > > CRC
> > > > > >=20
> > > > > > The initial motivation comes from the need to test prime
> > > > > > support in
> > > > > > vkms.
> > > > > >=20
> > > > > > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > > > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > > > Signed-off-by: Oleg Vasilev <oleg.vasilev@intel.com>
> > > > > > ---
> > > > > >  tests/meson.build     |   1 +
> > > > > >  tests/prime_generic.c | 238
> > > > > > ++++++++++++++++++++++++++++++++++++++++++
> > > > > >  2 files changed, 239 insertions(+)
> > > > > >  create mode 100644 tests/prime_generic.c
> > > > > >=20
> > > > > > diff --git a/tests/meson.build b/tests/meson.build
> > > > > > index 34a74025..1c938e95 100644
> > > > > > --- a/tests/meson.build
> > > > > > +++ b/tests/meson.build
> > > > > > @@ -76,6 +76,7 @@ test_progs =3D [
> > > > > >     'prime_self_import',
> > > > > >     'prime_udl',
> > > > > >     'prime_vgem',
> > > > > > +   'prime_generic',
> > > > > >     'syncobj_basic',
> > > > > >     'syncobj_wait',
> > > > > >     'template',
> > > > > > +
> > > > > > +igt_main
> > > > > > +{
> > > > > > +   igt_fixture {
> > > > > > +           kmstest_set_vt_graphics_mode();
> > > > > > +   }
> > > > > > +   igt_subtest("crc-vgem-vkms")
> > > > > > +           run_test_crc(DRIVER_VGEM, DRIVER_VKMS);
> > > > > > +   igt_subtest("crc-i915-vkms")
> > > > > > +           run_test_crc(DRIVER_INTEL, DRIVER_VKMS);
> > > > > > +   igt_subtest("crc-vgem-i915")
> > > > > > +           run_test_crc(DRIVER_VGEM, DRIVER_INTEL);
> > > > > > +   igt_subtest("crc-amd-i915")
> > > > > > +           run_test_crc(DRIVER_AMDGPU, DRIVER_INTEL);
> > > > > > +   igt_subtest("crc-i915-amd")
> > > > > > +           run_test_crc(DRIVER_INTEL, DRIVER_AMDGPU);
> > > > >=20
> > > > > This isn't any more generic than what we have e.g. in
> > > > > prime_vgem
> > > > > already.
> > > >=20
> > > > Here non-generic part is only those 10 lines of subtests
> > > > definitions.
> > > > The rest is common code.
> > > >=20
> > > > I guess, this separate subtest definitions can document the
> > > > device
> > > > pairs the test is expected to work + we can blacklist tests
> > > > which we
> > > > don't have the hardware for.
> > >=20
> > > But we already have tests for specific pairs, which can also test
> > > specific stuff. In general we don't do tests with -gen9, gen11,
> > > -gen8
> > > prefixes either. This here would be a first I'd say.
> > >=20
> > > > > The way to do a generic kms testcase is to use DRIVER_ANY
> > > > > (yes some
> > > > > of the
> > > > > earlier conversion unfortunately used stuff like DRIVER_INTEL
> > > > > |
> > > > > DRIVER_AMDGPU). With that you also don't need your library
> > > > > prep
> > > > > patch,
> > > > > because no need for a DRIVER_VKMS.
> > > >=20
> > > > But how can we open two different devices with DRIVER_ANY? If I
> > > > put
> > > >=20
> > > > fd =3D drm_open_driver(DRIVER_ANY)
> > > > fd2 =3D drm_open_driver(DRIVER_ANY)
> > > >=20
> > > > I get the same device opened two times, do I?
> > >=20
> > > One of them would be DRIVER_VGEM. And I think we already make
> > > sure
> > > that you don't accidentally get vgem for DRIVER_ANY. Otherwise I
> > > guess
> > > we'd need a DRIVER_ANY_BUT_VGEM. Well really what we want is
> > > DRIVER_ANY_KMS here, which would also exclude vgem. So if it
> > > doesn't
> > > work already, small patch needed in lib/, but DRIVER_VKMS also
> > > needs
> > > that. And I really don't want more DRIVER_FOO defines for a plain
> > > old
> > > kms-only driver. kms is supposed to be a shared cross-driver
> > > standard,
> > > if we can't even write shared testcases it's just epic fail :-)
> > >=20
> > > > > Imo best to start out by converting prime_vgem.c for this,
> > > > > and adding
> > > > > for
> > > > > the i915 specific tests (but _only_ for those) a specific "is
> > > > > this
> > > > > i915"
> > > > > check, so we skip those tests. And replace DRIVER_INTEL by
> > > > > DRIVER_ANY.
> > > > > Well, anything except vgem :-)
> > > >=20
> > > > If I am not mistaken, all tests in prime_vgem are intel-
> > > > specific :D
> > > >=20
> > > > Some ideas can be taken from it, but anyway, it probably needs
> > > > a deep
> > > > rewrite.
> > > >=20
> > > > And prime_vgem use only vgem as an exporter device. Here we can
> > > > use any
> > > > device. Sure, some tests would eventually use vgem-specific
> > > > features,
> > > > but some could remain more generic.
> > >=20
> > > Maybe I wasn't all that clear then, I think what we want to test
> > > in a
> > > generic prime test is vgem+DRIVER_ANY_KMS. Then drivers can test
> > > the
> > > render side using DRIVER_FOO+vgem. This way you only need to have
> > > 1
> > > generic kms test, plus N tests for all the rendering drivers.
> > > Instead
> > > of M x N testcases like you're proposing here. vgem is just the
> > > abstraction layer/mocking layer we use to separate these two
> > > worlds.
> > > And of course for specific sharing you can still do that, e.g. to
> > > test
> > > dma engine compatibility between amdgpu and i915, or nouveau and
> > > i915.
> > > But those tests don't need to involve kms.
> > >=20
> > > And yeah prime_vgem might need to be split into prime_i915_vgem
> > > and
> > > prime_kms_vgem. But all the display related testcases should be
> > > possible to extract into such a prime_kms_vgem framework.
> >=20
> > One could also want to test drmPrimeHandleToFD and
> > drmPrimeFDToHandle
> > between e.g. amdgpu and i915. I guess it's using a different code
> > path
> > than gem.
>=20
> Yeah, but only if you also do some i915 or amdgpu specific command
> submission. Otherwise if it's all cpu-only, then you wont hit any
> additional path than what you can test with vgem already. Kinda my
> point
> really, there's no room really for a "generic" i915+amdgpu prime
> test. As
> soon as you look at that combo, it's all about specifics.
> -Daniel

Ok, now I got the point, thanks for the explanation.=20
I will send an updated patch.

Oleg

--=-JXX7dhyS+XBvcn3KSZfj
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

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
DdWSiLBgHgGaO0ThuDGV4bz316/+F4Vy7z9hcMbMJs41eGz9tueMREgDNywNIAdzWQIDAQABo4IC
LjCCAiowHQYDVR0OBBYEFP8BYPvxsk8Ryh4Tt/ZBT5qIg2TiMB8GA1UdIwQYMBaAFB5pKrTcKP5H
GE4hCz+8rBEv8Jj1MGUGA1UdHwReMFwwWqBYoFaGVGh0dHA6Ly93d3cuaW50ZWwuY29tL3JlcG9z
aXRvcnkvQ1JML0ludGVsJTIwRXh0ZXJuYWwlMjBCYXNpYyUyMElzc3VpbmclMjBDQSUyMDRBLmNy
bDCBngYIKwYBBQUHAQEEgZEwgY4waQYIKwYBBQUHMAKGXWh0dHA6Ly93d3cuaW50ZWwuY29tL3Jl
cG9zaXRvcnkvY2VydGlmaWNhdGVzL0ludGVsJTIwRXh0ZXJuYWwlMjBCYXNpYyUyMElzc3Vpbmcl
MjBDQSUyMDRBLmNydDAhBggrBgEFBQcwAYYVaHR0cDovL29jc3AuaW50ZWwuY29tMAsGA1UdDwQE
AwIHgDA8BgkrBgEEAYI3FQcELzAtBiUrBgEEAYI3FQiGw4x1hJnlUYP9gSiFjp9TgpHACWeB3r05
lfBDAgFkAgELMB8GA1UdJQQYMBYGCCsGAQUFBwMEBgorBgEEAYI3CgMMMCkGCSsGAQQBgjcVCgQc
MBowCgYIKwYBBQUHAwQwDAYKKwYBBAGCNwoDDDBJBgNVHREEQjBAoCYGCisGAQQBgjcUAgOgGAwW
b2xlZy52YXNpbGV2QGludGVsLmNvbYEWb2xlZy52YXNpbGV2QGludGVsLmNvbTANBgkqhkiG9w0B
AQUFAAOCAQEAffmCWGLFQzB82/D5fYYzYJ3/8uSfKWA4UPCKcqETG1Zb0vl2FPoCjNID1Bw2HNS7
TxYcXvrVDul3vdCQfQhKonJi4ioJJXPPAQBDKKPkVoL9f/maehuXJYjFNsGmHNYADJL+4bDRJJcq
wIQlFVGXvPJFuTSj9HjJAiwH4zehhiEuTTbDhbaaLVrDsEVKCFMj0nvxN4AsYfoBXbscUVLrZs8n
ZIht2nPvz2NlWwxWgl/7+T42CcriuoeLOPWjmaMncOnXaIR/XNpzvCd6N8Xurg9NhzZaCUwLPAX1
fyAyMXRsdpgqKqVNd+jLBGt87zB3FQQOh73i8+vBMqm1BfEoojGCAhcwggITAgEBMIGQMHkxCzAJ
BgNVBAYTAlVTMQswCQYDVQQIEwJDQTEUMBIGA1UEBxMLU2FudGEgQ2xhcmExGjAYBgNVBAoTEUlu
dGVsIENvcnBvcmF0aW9uMSswKQYDVQQDEyJJbnRlbCBFeHRlcm5hbCBCYXNpYyBJc3N1aW5nIENB
IDRBAhMzAADRf+xxDzfl4feqAAAAANF/MAkGBSsOAwIaBQCgXTAYBgkqhkiG9w0BCQMxCwYJKoZI
hvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xOTA3MTIwODM2MTFaMCMGCSqGSIb3DQEJBDEWBBR8UqmK
XgST0zJkDe+U0+/uC626OjANBgkqhkiG9w0BAQEFAASCAQCzJp6b+dGIGILOSwIo8fjfM4BOJ5TZ
gNb3FMHevEjIQwhB3tneJCHKkPjpgAe8WaDlrorVd6PUu45EQmY0TIZuXtoSLnRgnyI56SW+Xe3O
+oyTJiu3Dndd5oNys85Xk2D5vbaPyKklszdAZxiF+lyXs2ZQcFk8H/LbUH7t5PsyzG7YTY3FqLbB
KHZQ4dQGr7u0j5D0ceHhGO1iW/H+1cXzYTkV184nhLS/RxQ8oeYcoghrhjblDyED+fqSIHpHor4A
4nX4ZkVG4jNjKbSPj+VFOioMYXCRL/GforFEf1jeNH+rsurr4yqAUkox7tlaTzcWE/ZJ5m91xsBl
wSywjLCWAAAAAAAA


--=-JXX7dhyS+XBvcn3KSZfj--

--===============0192980601==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0192980601==--
