Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A9CD6E964
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Dec 2019 19:05:15 +0000 (UTC)
From: "Summers, Stuart" <stuart.summers@intel.com>
Date: Wed, 4 Dec 2019 19:05:12 +0000
Message-ID: <51b5ad4f3363fcc0948d123407371349b5342524.camel@intel.com>
References: <20191203051154.13734-1-stuart.summers@intel.com>
 <50126f00-021d-71a8-1b68-718f4e4efae7@linux.intel.com>
 <20191204145323.GA25209@platvala-desk.ger.corp.intel.com>
In-Reply-To: <20191204145323.GA25209@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915: Use engine query interface
 for gem_ctx_isolation/persistence
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1378609425=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Latvala, Petri" <petri.latvala@intel.com>, "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1378609425==
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-1;
	protocol="application/x-pkcs7-signature"; boundary="=-frgLI7+TF/6+g/bWX1kD"

--=-frgLI7+TF/6+g/bWX1kD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-12-04 at 16:53 +0200, Petri Latvala wrote:
> On Wed, Dec 04, 2019 at 09:36:11AM +0000, Tvrtko Ursulin wrote:
> >=20
> > On 03/12/2019 05:11, Stuart Summers wrote:
> > > Align with gem_exec_basic and other tests using the newer
> > > engine query interface into i915 to enumerate active engines.
> > >=20
> > > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> > > ---
> > >   tests/i915/gem_ctx_isolation.c   | 4 ++--
> > >   tests/i915/gem_ctx_persistence.c | 2 +-
> > >   2 files changed, 3 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/tests/i915/gem_ctx_isolation.c
> > > b/tests/i915/gem_ctx_isolation.c
> > > index 6aa27133..9435209e 100644
> > > --- a/tests/i915/gem_ctx_isolation.c
> > > +++ b/tests/i915/gem_ctx_isolation.c
> > > @@ -856,6 +856,7 @@ static unsigned int
> > > __has_context_isolation(int fd)
> > >   igt_main
> > >   {
> > > +	struct intel_execution_engine2 *e;
> > >   	unsigned int has_context_isolation =3D 0;
> > >   	int fd =3D -1;
> > > @@ -876,8 +877,7 @@ igt_main
> > >   		igt_skip_on(gen > LAST_KNOWN_GEN);
> > >   	}
> > > -	for (const struct intel_execution_engine2 *e =3D
> > > intel_execution_engines2;
> > > -	     e->name; e++) {
> > > +	__for_each_physical_engine(fd, e) {
> > >   		igt_subtest_group {
> > >   			igt_fixture {
> > >   				igt_require(has_context_isolati
> > > on & (1 << e->class));
> > > diff --git a/tests/i915/gem_ctx_persistence.c
> > > b/tests/i915/gem_ctx_persistence.c
> > > index d68431ae..30772159 100644
> > > --- a/tests/i915/gem_ctx_persistence.c
> > > +++ b/tests/i915/gem_ctx_persistence.c
> > > @@ -727,7 +727,7 @@ igt_main
> > >   	igt_subtest("hangcheck")
> > >   		test_nohangcheck_hostile(i915);
> > > -	__for_each_static_engine(e) {
> > > +	__for_each_physical_engine(i915, e) {
> > >   		igt_subtest_group {
> > >   			igt_fixture {
> > >   				gem_require_ring(i915, e-
> > > >flags);
> > >=20
> >=20
> > __for_each_static_engine is correct, at least if you don't want CI
> > folks go
> > look for their pitchforks. :) Same for the first hunk, everything
> > that
> > enumerates subtests needs to be static.
> >=20
> > Option 2, the preferred one - convert the tests to
> > igt_subtest_with_dynamic
> > and then you can use __for_each_physical_engine.
>=20
> Doesn't __for_each_physical_engine anyway have a hack for being
> called in that context?
>=20
> Btw, option 2 is=20
> https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/44
>=20
> Currently blocking that effort is getting
> https://patchwork.freedesktop.org/series/70286/ into shape.

Wait I'm a little confused, sorry for the naivete here. Does this mean
these kinds of changes are blocked on the above series? Or are you
saying I should go ahead and convert this to the dynamic subtests? Or
that we can move forward with the current approach and convert at a
later time?

Thanks,
Stuart

>=20
>=20

--=-frgLI7+TF/6+g/bWX1kD
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

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
PwuHX1mRETAlwqXCZa6ba8eraUCltlCb/ZiEk9UFRVLjbLNPh9IYOi+sWkS6n5CovLKAqhMCAwEA
AaOCAjMwggIvMB0GA1UdDgQWBBSgeYqvLV4nBaCUzAXLr0TeMJYR5zAfBgNVHSMEGDAWgBTaQSOc
Wo9xr1eDPiDT42XbDMsL2zBlBgNVHR8EXjBcMFqgWKBWhlRodHRwOi8vd3d3LmludGVsLmNvbS9y
ZXBvc2l0b3J5L0NSTC9JbnRlbCUyMEV4dGVybmFsJTIwQmFzaWMlMjBJc3N1aW5nJTIwQ0ElMjA0
Qi5jcmwwgZ8GCCsGAQUFBwEBBIGSMIGPMCIGCCsGAQUFBzABhhZodHRwOi8vb2NzcC5pbnRlbC5j
b20vMGkGCCsGAQUFBzAChl1odHRwOi8vd3d3LmludGVsLmNvbS9yZXBvc2l0b3J5L2NlcnRpZmlj
YXRlcy9JbnRlbCUyMEV4dGVybmFsJTIwQmFzaWMlMjBJc3N1aW5nJTIwQ0ElMjA0Qi5jcnQwCwYD
VR0PBAQDAgeAMDwGCSsGAQQBgjcVBwQvMC0GJSsGAQQBgjcVCIbDjHWEmeVRg/2BKIWOn1OCkcAJ
Z4HevTmV8EMCAWQCAQkwHwYDVR0lBBgwFgYIKwYBBQUHAwQGCisGAQQBgjcKAwwwKQYJKwYBBAGC
NxUKBBwwGjAKBggrBgEFBQcDBDAMBgorBgEEAYI3CgMMME0GA1UdEQRGMESgKAYKKwYBBAGCNxQC
A6AaDBhzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb22BGHN0dWFydC5zdW1tZXJzQGludGVsLmNvbTAN
BgkqhkiG9w0BAQUFAAOCAQEAfyIC7rzSi6S8O+sdH384K8zyeMRJnl6vR7whl9PuEat+BkKpoxHn
jQ0SFyF/cyI4lH/n938Pm3/Ctq0Z5GTldX6hhxxcLAR0qbk6AQU0Cq2nYMlZfX4FUz3FRsazbjTW
1qObcvPRUAVScaa7SRGdensvbNV++pN1XqEdc++szxo58UzPaEgDlHIe2sEIVXnFkHnJv0ikRHG3
urcA1bdj7Rac7dJBeQOQMdZEGmrWWmmbJzvk3OmoK9tKN7wcErQSdlqyYOMLesPfa7YNyLFYEJQd
CC/N7V8U9yFZx8akWREb8lJYDl9KypirEsufleiew26CWrwcbmdlldDCFS6/HDGCAhcwggITAgEB
MIGQMHkxCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJDQTEUMBIGA1UEBxMLU2FudGEgQ2xhcmExGjAY
BgNVBAoTEUludGVsIENvcnBvcmF0aW9uMSswKQYDVQQDEyJJbnRlbCBFeHRlcm5hbCBCYXNpYyBJ
c3N1aW5nIENBIDRCAhMzAAB04Th3owY0UbEUAAAAAHThMAkGBSsOAwIaBQCgXTAYBgkqhkiG9w0B
CQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xOTEyMDQxOTA1MDlaMCMGCSqGSIb3DQEJ
BDEWBBQ7vQs6AyModJeUCE4wfnP9IRj+yzANBgkqhkiG9w0BAQEFAASCAQA/eRkczXzuvAf76QAt
OYUo21aqiNesYyAHzmPQDSC0eei2zQz39JKBJJKnELKOhlYO65F7H6U7yuRP5dYV8xrFd6kg5zyX
nNdpxqnxHviD9qKh5GyyS0MuWj7pyum7DI+La9HCH/B54Rp4C/1WY+scV9nDu6pQFEoSaOfDucd/
CVNtd0+N7N9S9087Nna6QYOZXnYX+8/dGb+6FBSI83exL1rbRJCagpMpEjPMvftoN772ycEDR07b
BW8AcFs3xLmfxiMANc1x151o+7t0KjdeYcRRfoT9TuMRJ8GorZ71hPKxkc0wHEDigt1YuNeXeCGV
8x+YYZNQ6mjEyFXXs5bRAAAAAAAA


--=-frgLI7+TF/6+g/bWX1kD--

--===============1378609425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============1378609425==--
