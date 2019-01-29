Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB6C6E3A3
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Jan 2019 20:45:49 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Tue, 29 Jan 2019 20:45:38 +0000
Message-ID: <0f21ace4b347e74fe5b480b3fb31c8e27fc66bc0.camel@intel.com>
References: <20190128200126.1270-1-ville.syrjala@linux.intel.com>
 <20190128200126.1270-3-ville.syrjala@linux.intel.com>
 <0e82117dda2d41318e5086c39efa694050e0975b.camel@intel.com>
 <20190129132344.GX20097@intel.com>
In-Reply-To: <20190129132344.GX20097@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/6] tools/intel_watermark: Decode wm
 blocks correctly
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0860793082=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0860793082==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-STLEh1vEpMrYUxYYEy/B"

--=-STLEh1vEpMrYUxYYEy/B
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-01-29 at 15:23 +0200, Ville Syrj=C3=A4l=C3=A4 wrote:
> On Mon, Jan 28, 2019 at 10:30:18PM +0000, Souza, Jose wrote:
> > On Mon, 2019-01-28 at 22:01 +0200, Ville Syrjala wrote:
> > > From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > >=20
> > > Bump up the width of the wm blocks to 11 bits, which it is on
> > > icl.
> > > On earlier platforms it was actually 10 bits but the code decoded
> > > it as 9 bits.
> >=20
> > 11? Where did you get that? BSpec says ICL still uses 10 bits and
> > kernel is also using 10 bits for ICL.
> > BSpec: 7670
>=20
> My bspec clearly says 11. Are you looking at the pre-icl field?

My bad, this is right.

Reviewed-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>

>=20
> I guess I'll have to go fix the kernel too then.

Cc me or if you want I can send this patch.

>=20
> > > Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
>
> > > ---
> > >  tools/intel_watermark.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/tools/intel_watermark.c b/tools/intel_watermark.c
> > > index c98b8649cc9c..97b769250927 100644
> > > --- a/tools/intel_watermark.c
> > > +++ b/tools/intel_watermark.c
> > > @@ -319,7 +319,7 @@ static void skl_wm_dump(void)
> > >  		for (level =3D 0; level < num_levels; level++) {
> > >  			printf("%5d", level);
> > >  			for (plane =3D 0; plane < num_planes; plane++) {
> > > -				blocks =3D
> > > REG_DECODE1(wm[level][pipe][plane], 0, 9);
> > > +				blocks =3D
> > > REG_DECODE1(wm[level][pipe][plane], 0, 11);
> > >  				lines =3D
> > > REG_DECODE1(wm[level][pipe][plane], 14, 5);
> > >  				enable =3D
> > > REG_DECODE1(wm[level][pipe][plane], 31, 1);
> > > =20
> > > @@ -334,7 +334,7 @@ static void skl_wm_dump(void)
> > > =20
> > >  		printf("TRANS");
> > >  		for (plane =3D 0; plane < num_planes; plane++) {
> > > -			blocks =3D REG_DECODE1(wm_trans[pipe][plane], 0,
> > > 9);
> > > +			blocks =3D REG_DECODE1(wm_trans[pipe][plane], 0,
> > > 11);
> > >  			lines =3D REG_DECODE1(wm_trans[pipe][plane], 14,
> > > 5);
> > >  			enable =3D REG_DECODE1(wm_trans[pipe][plane], 31,
> > > 1);
> > > =20
>=20
>=20

--=-STLEh1vEpMrYUxYYEy/B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlxQu3AACgkQVenbO/mO
WknW6gf7BepefYN4c7EoA0BCB1aJh5bkNgqdLLbe/rHJbWjyhR6W/pMdxaLZEd+w
79sP5ft1NwVP5X3RoEj9DSHh5N/gdL0GYiY74OHWG8DoHqJxXbXGNvEpGktzDGgX
l/lI6Uag/Eo3qH5HtYRwgZXHIADnja19ypqjOPd96vLhaD7Mpay/QZ1veJTXOcK7
IA+DnrH4ZKoAsVd5a8hz3JSH2QF2vOnRLcMvl1KdvRlWMWbh4ZeoJJCafgtfAZEe
9ANjOVpaqVSKgI1tg1qSvegbG36fmulX10S5DG1BULsEhQVEUvJgEDfZd2XVFwRu
3e+3oqQl2bZOSZZ812WE8ryw+CdQFw==
=GLDP
-----END PGP SIGNATURE-----

--=-STLEh1vEpMrYUxYYEy/B--

--===============0860793082==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0860793082==--
