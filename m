Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 219166E265
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jan 2019 23:59:58 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Wed, 23 Jan 2019 23:59:56 +0000
Message-ID: <e64f3111c4040ba97d3f69bdb8ab16031c4bd8c3.camel@intel.com>
References: <20190123010950.25867-1-jose.souza@intel.com>
 <20190123113719.GB4038@platvala-desk.ger.corp.intel.com>
 <642db4b96db1775294d30cb45f08f4bae4b6a637.camel@intel.com>
In-Reply-To: <642db4b96db1775294d30cb45f08f4bae4b6a637.camel@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/2] tests/intel-ci: Add basic PSR2
 tests to fast feedback test list
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0399498373=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Latvala, Petri" <petri.latvala@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Pandiyan,
 Dhinakaran" <dhinakaran.pandiyan@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0399498373==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-/wAt4elpOtrUiH8qLwBP"

--=-/wAt4elpOtrUiH8qLwBP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-01-23 at 21:00 +0000, Souza, Jose wrote:
> On Wed, 2019-01-23 at 13:37 +0200, Petri Latvala wrote:
> > On Tue, Jan 22, 2019 at 05:09:49PM -0800, Jos=C3=A9 Roberto de Souza
> > wrote:
> > > Lets run the same PSR1 basic tests for PSR2 to caught PSR2
> > > regressions faster.
> > >=20
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
> > > Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> > > ---
> > >  tests/intel-ci/fast-feedback.testlist | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >=20
> > > diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-
> > > ci/fast-feedback.testlist
> > > index da3c4c8e..e48cb8a5 100644
> > > --- a/tests/intel-ci/fast-feedback.testlist
> > > +++ b/tests/intel-ci/fast-feedback.testlist
> > > @@ -227,6 +227,10 @@ igt@kms_psr@primary_page_flip
> > >  igt@kms_psr@cursor_plane_move
> > >  igt@kms_psr@sprite_plane_onoff
> > >  igt@kms_psr@primary_mmap_gtt
> > > +igt@kms_psr@psr2_primary_page_flip
> > > +igt@kms_psr@psr2_cursor_plane_move
> > > +igt@kms_psr@psr2_sprite_plane_onoff
> > > +igt@kms_psr@psr2_primary_mmap_gtt
> >=20
> > The BAT results mail said success because these are new tests, but
> > do
> > note that they failed. They must pass to get onto the BAT list.
> >=20
> >=20
>=20
> <7>[   91.805388] [drm:intel_psr_compute_config [i915]] PSR2 not
> enabled, resolution 3840x2160 > max supported 3640x2304
>=20
> It failed because the GEN9 PSR2 HW only supports resolutions up to
> 3640x2304, so it switched back go PSR1 and the test failed because it
> was expecting a PSR2 state not a PSR1.
>=20
> I talked with DK, he thinks that the panel should be replaced in that
> machine so we can have some PSR2 test coverage in GEN9.
>=20
> If not possible we should add more code in igt_fixture() to check if
> PSR2 is supported but that could potentially hide PSR2 issues behind
> tests skipped or whitelist PSR2 tests in fi-whl-u.

Bypassed with: https://patchwork.freedesktop.org/patch/279874/

Let me know what you guys think about this.

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

--=-/wAt4elpOtrUiH8qLwBP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlxI//oACgkQVenbO/mO
WkndMwf6AoGZONW8gbQHNfxQJDcBcBEq76LzL4dwPihjQj0HDfYNn3SvdlmsKIq4
Rk6oazPgvr6KJL9zaGxUTwvk5HY41MKJXDyODM7FGCDsPMy68vEMa6F/Fcqyl4lW
cN4WcVWVCv81k8Vhb61BR3C+OPLP3jamA3jDwYd0gOKjESVpz9X9zjf8yizQjZKb
NRWAsNic9J/FV68tgrHyNy60XqU4+sOQtiM2W1K7m35CoXARg0DYNOV4kMUJtc5v
c2bZoe7mngUmE6sqv5aYQm98ugRz3dr9ON7FGyqKn+ESg9UFPycHGS2M+fnZqM5h
AG/sPhNcOMZNN0FBofFTtCIa6CrBlQ==
=9FCI
-----END PGP SIGNATURE-----

--=-/wAt4elpOtrUiH8qLwBP--

--===============0399498373==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0399498373==--
