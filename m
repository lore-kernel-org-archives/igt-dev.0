Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48DF6E5E5
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Jan 2019 14:25:40 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 723B73A7B46
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Jan 2019 15:18:32 +0100 (CET)
Date: Wed, 30 Jan 2019 15:18:08 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20190130141808.v5jcwxndjxmbvxwu@flea>
References: <20190125145842.15738-1-maxime.ripard@bootlin.com>
 <20190125145842.15738-6-maxime.ripard@bootlin.com>
 <d038487f20dfc7d8f847fb232c0709e49fd742c9.camel@vmware.com>
MIME-Version: 1.0
In-Reply-To: <d038487f20dfc7d8f847fb232c0709e49fd742c9.camel@vmware.com>
Subject: Re: [igt-dev] [PATCH i-g-t v5 05/13] igt: fb: Refactor dumb buffer
 allocation path
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1997841927=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Deepak Singh Rawat <drawat@vmware.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, eben@raspberrypi.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============1997841927==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tt2zez35xucgpi2a"
Content-Disposition: inline


--tt2zez35xucgpi2a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Fri, Jan 25, 2019 at 08:16:52AM -0800, Deepak Singh Rawat wrote:
> On Fri, 2019-01-25 at 15:58 +0100, Maxime Ripard wrote:
> > The else condition is not needed, since all the other conditions
> > return
> > when they are done.
> >=20
> > Move the KMS dumb buffer allocation outside of the outer else
> > condition,
> > this will also allow to ease later changes.
> >=20
> > Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > ---
> >  lib/igt_fb.c | 25 +++++++++++++++++--------
> >  1 file changed, 17 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> > index d69c3fb2d38d..270db8d6dc90 100644
> > --- a/lib/igt_fb.c
> > +++ b/lib/igt_fb.c
> > @@ -557,15 +557,24 @@ static int create_bo_for_fb(struct igt_fb *fb)
> >  			igt_require(driver_has_gem_api);
> >  			return -EINVAL;
> >  		}
> > -	} else {
> > -		fb->is_dumb =3D true;
> > -
> > -		fb->gem_handle =3D kmstest_dumb_create(fd, fb->width, fb-
> > >height,
> > -						     fb->plane_bpp[0],
> > -						     &fb->strides[0],
> > &fb->size);
> > -
> > -		return fb->gem_handle;
> >  	}
> > +
> > +	/*
> > +	 * The current dumb buffer allocation API doesn't really allow
> > to
> > +	 * specify a custom size or stride. Yet the caller is free to
> > specify
> > +	 * them, so we need to make sure to error out in this case.
> > +	 */
> > +	igt_assert(fb->size =3D=3D 0);
> > +	igt_assert(fb->strides[0] =3D=3D 0);
>=20
> Hi Maxime, thanks for doing this. I am not an expert but do you think
> this should be igt_skip instead? Tests will simply fail where they
> should really be skipping if driver don't support the feature.

That's a good suggestion :)

I'm not sure what the proper behaviour here is though. Both approaches
make sense I guess, but skiping the test would hide that issue under
the carpet which might or might not be an issue, I don't know.

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--tt2zez35xucgpi2a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXFGyIAAKCRDj7w1vZxhR
xZSaAQDxFV1K17DXaCGf2xhYzc/QUNVmvgOu//QWia19xzO3XgD/QLnLiXorpUWR
G3oQagahvZ1i0E07HVBDNHTP5IXgRg4=
=bmMp
-----END PGP SIGNATURE-----

--tt2zez35xucgpi2a--

--===============1997841927==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1997841927==--
