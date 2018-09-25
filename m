Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 581F76E139
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Sep 2018 07:51:26 +0000 (UTC)
Date: Tue, 25 Sep 2018 09:51:15 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20180925075115.sxoslqeh5txpsdpw@flea>
References: <cover.cafc7aee9c887562e8432741cd1f0543ff92121a.1536655647.git-series.maxime.ripard@bootlin.com>
 <dd62ceae2c027b591b00606f5ae8cf4d5148dfe7.1536655647.git-series.maxime.ripard@bootlin.com>
 <20180919130325.GE5565@intel.com>
MIME-Version: 1.0
In-Reply-To: <20180919130325.GE5565@intel.com>
Subject: Re: [igt-dev] [PATCH v7 04/14] fb: Create common function to
 convert frame formats
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0832965646=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, eben@raspberrypi.org, igt-dev@lists.freedesktop.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0832965646==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jfc22auletorlim2"
Content-Disposition: inline


--jfc22auletorlim2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 19, 2018 at 04:03:25PM +0300, Ville Syrj=E4l=E4 wrote:
> On Tue, Sep 11, 2018 at 10:47:31AM +0200, Maxime Ripard wrote:
> > The current code to convert between two buffer formats is quite tied to=
 the
> > cairo surface infrastructure. Since we'll want to reuse it, make that
> > function more generic by introducing a common structure that passes all=
 the
> > arguments and a common function that will call the right functions we
> > needed.
> >=20
> > Reviewed-by: Eric Anholt <eric@anholt.net>
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > ---
> >  lib/igt_fb.c | 220 ++++++++++++++++++++++++++++++----------------------
> >  1 file changed, 130 insertions(+), 90 deletions(-)
> >=20
> > diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> > index 66bdc02a0ce7..f829df59e9fa 100644
> > --- a/lib/igt_fb.c
> > +++ b/lib/igt_fb.c
> > @@ -1391,6 +1391,19 @@ struct fb_convert_blit_upload {
> >  	struct fb_blit_linear linear;
> >  };
> > =20
> > +struct fb_convert_buf {
> > +	void			*ptr;
> > +	struct igt_fb		*fb;
> > +};
> > +
> > +struct fb_convert {
> > +	unsigned int		width;
> > +	unsigned int		height;
>=20
> Are we expecting to convert between different sized fbs, or why do we
> need these?

This was meant to express that a conversion should happen on a given
size, common to both fb. I guess we can remove it, but which one
should we choose in such a case? The destination?

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--jfc22auletorlim2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlup6PIACgkQ0rTAlCFN
r3T2Ag//aeibLHrPA/c864/bAUJpNSPeWPYTUospm23RE5vx878OAxNNzwBy+P26
KAHJicOSeSPOI1imGQdUHwF6vH+PbqExWSZylSNpaSHF1/uPi/jfpoRoMgg5PjfS
RuopXAL7V1OsvRgFwRYr2+5LaTmNgyP8pi+0E91/ajVJF+F3c5JOBOvVfJO3vzWj
DE3DgW1YoYjEzoPCE9saZUgk7Ervtm8KGdwgPayL/oDRNzJW1Ur/RV8VTtu3Ud+i
pzDMPznhjQjqQUXhikySdW3TpwoIU3utPxHLDb79/t9/Ke1vDJ5N7wIpxL8HiWPE
9PqpICFzNpcNhi6lQs8N0CrDKYX770SEhLlJ6EJdToQe4eaA4kadFF2nTusrk7Kz
hhjH8pIOf4ZjHp6NX00qJK9uPzb7SH047d4IVGxdKGE+2pv0fm+5ViaX8R3X2rg6
PV/aAeiBjsIGkwiQJsfnA0G+5Rz5tYvegyAvM16fYJkgMM7KLUovdR7I6tlIHAzf
fkeNQ2JOP0gVM+8+IfitXFP3hCV/RBOSAv0CH0eWinKG3Aqv88iCqlS1z3S8rMYQ
udzdJa+ZDz9QeSVnk9WwT3mM7Sk2l2ypGgzVRSQS0GaY90claGtbeGxCujtsodjC
Nrcbi70TihfDm05bC+yBplMbX7gzMmbcAWECQAawshXzJpFL2EQ=
=7UeE
-----END PGP SIGNATURE-----

--jfc22auletorlim2--

--===============0832965646==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0832965646==--
