Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 552496E03C
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Aug 2018 11:47:04 +0000 (UTC)
Date: Thu, 23 Aug 2018 13:46:52 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20180823114652.3a4qtwaz23ayuzmq@flea>
References: <cover.85e5bbe6ef5f0fd420e1fc21fc248471b98481e5.1532596850.git-series.maxime.ripard@bootlin.com>
 <cbedc79edb2bcfc1ad2ed89cb86b15bc9088e634.1532596850.git-series.maxime.ripard@bootlin.com>
 <87tvo3s00j.fsf@anholt.net>
MIME-Version: 1.0
In-Reply-To: <87tvo3s00j.fsf@anholt.net>
Subject: Re: [igt-dev] [PATCH v4 08/13] chamelium: Use preferred mode when
 testing a single mode
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1928422169=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Eric Anholt <eric@anholt.net>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, eben@raspberrypi.org, igt-dev@lists.freedesktop.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============1928422169==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="teqdxeg4ug72cx4d"
Content-Disposition: inline


--teqdxeg4ug72cx4d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Eric,

On Thu, Aug 09, 2018 at 02:28:12PM -0700, Eric Anholt wrote:
> Maxime Ripard <maxime.ripard@bootlin.com> writes:
>=20
> > The current code is testing the first mode in the connector list when i=
t's
> > testing a single mode. While this is arbitrarily chosen, it makes more
> > sense to use the preferred mode reported by the display.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > ---
> >  tests/kms_chamelium.c | 19 ++++++++++++++++++-
> >  1 file changed, 18 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
> > index 490bacc6f5fe..5d7fb83fb74f 100644
> > --- a/tests/kms_chamelium.c
> > +++ b/tests/kms_chamelium.c
> > @@ -534,6 +534,20 @@ static void do_test_display_crc(data_t *data, stru=
ct chamelium_port *port,
> >  	igt_remove_fb(data->drm_fd, &fb);
> >  }
> > =20
> > +static drmModeModeInfo *find_preferred_mode(drmModeConnector *connecto=
r)
> > +{
> > +	int i;
> > +
> > +	for (i =3D 0; i < connector->count_modes; i++) {
> > +		drmModeModeInfo *mode =3D &connector->modes[i];
> > +
> > +		if (mode->type & DRM_MODE_TYPE_PREFERRED)
> > +			return mode;
> > +	}
> > +
> > +	return NULL;
> > +}
> > +
> >  static void test_display_crc_one_mode(data_t *data, struct chamelium_p=
ort *port,
> >  				      int count)
> >  {
> > @@ -549,7 +563,10 @@ static void test_display_crc_one_mode(data_t *data=
, struct chamelium_port *port,
> >  	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> >  	igt_assert(primary);
> > =20
> > -	do_test_display_crc(data, port, output, &connector->modes[0], count);
> > +	mode =3D find_preferred_mode(connector);
> > +	igt_assert(mode);
> > +
> > +	do_test_display_crc(data, port, output, mode, count);
>=20
> Instead of asserting, should we pick the first if there was no
> preferred?  I don't really know, so I'd ack the patch either way.

I've changed the return NULL above to return &connector->modes[0]
instead.

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--teqdxeg4ug72cx4d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlt+nqsACgkQ0rTAlCFN
r3SjJA//ZhGafYnDuqmDjozecbtHyXTJsCSYot14uSHfI1E10rA3O9BqaGt5SBcz
QYb7X8G+RcjsUot8Fs33l0x8RPynuXDW25aP+jCY8MATIjxix6xZfn51rOxmOAxn
oCPZa1YNCoYGq9g1iJin/IUsKyR+Jkv9z9A+NRAShiiYrac4HZqxOS4wbfO4wBVn
caxQwHli0726HtKUVPMfsw7bnyQmvSyzTxehy13+WILtUxqfOxHeXtAkfpGTNixS
Yx9IHa1hWdJbgChYeDcxW9WxL/7XwCdjuuu+45FL9WjuhmblXi6xD8/YjTSp6TXA
kY+1jbSKCGeGv8xmMQRH4o+TiMV+pSZSAcZWb3Odc5EMJLexlkLQ6fBT6gSZ7zeh
SNWnkPIs9KXG86dXxp3B1BPfNc24sXgkn7yNMBwf0WsKde5qTIRap6yjMCkse885
nXel1Ec0afkmeO5b77QrQgXPUJFTbqFJYDrbBFrtOSkovxt0iQBbrFh4sqNz7lJd
PCKjRdpPpEKEY26x3ZKi/Xg5DR0b0k21KAKzkkuV3eV7cl/LwvadKfFerV4GUSfR
yrqTdYGlXU3+jh2y5AIo0GGarF41s4wWZp3OBMwIvO2Sp39aJgpgcCWRCK3Z0zqt
pDHXo+PCPJzVX+fdyqMclVIbQtvukdK4ocUZDGF3jUCpLJSDx/M=
=MwmE
-----END PGP SIGNATURE-----

--teqdxeg4ug72cx4d--

--===============1928422169==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1928422169==--
