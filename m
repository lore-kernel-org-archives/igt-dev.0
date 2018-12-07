Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2B90F6E798
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Dec 2018 15:30:39 +0000 (UTC)
Date: Fri, 7 Dec 2018 16:29:54 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20181207152954.immaynpf3vab7zug@flea>
References: <cover.c2054fa47f16b6319869fa4a8a2357a3a13e6d6c.1543917797.git-series.maxime.ripard@bootlin.com>
 <20181204100826.15522-7-maxime.ripard@bootlin.com>
 <20181204193205.GP9144@intel.com>
MIME-Version: 1.0
In-Reply-To: <20181204193205.GP9144@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 7/8] igt: fb: Fallback on KMS dumb
 buffer allocation for YUV buffers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0283862172=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>, eben@raspberrypi.org, igt-dev@lists.freedesktop.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0283862172==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j7zlztwbo64kw6l2"
Content-Disposition: inline


--j7zlztwbo64kw6l2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 04, 2018 at 09:32:05PM +0200, Ville Syrj=E4l=E4 wrote:
> On Tue, Dec 04, 2018 at 11:08:22AM +0100, Maxime Ripard wrote:
> > The current YUV buffer allocation only works on the i915 driver, since
> > it uses some private ioctl. However, we can to use that code on other
> > drivers that implement only KMS, so if the driver is something else
> > than the i915 driver, let's allocate a dumb buffer.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > ---
> >  lib/igt_fb.c | 35 +++++++++++++++++++++++++++++++++--
> >  1 file changed, 33 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> > index d6242a6652f1..f2e6c89f3884 100644
> > --- a/lib/igt_fb.c
> > +++ b/lib/igt_fb.c
> > @@ -501,6 +501,8 @@ static int i915_create_gem_for_fb(struct igt_fb *fb)
> > =20
> >  static int create_yuv_bo_for_fb(struct igt_fb *fb)
> >  {
> > +	unsigned int virtual_height;
> > +	unsigned int bpp;
> >  	uint64_t size =3D calc_fb_size(fb);
> >  	int fd =3D fb->fd;
> > =20
> > @@ -511,8 +513,37 @@ static int create_yuv_bo_for_fb(struct igt_fb *fb)
> >  	if (is_i915_device(fd))
> >  		return i915_create_gem_for_fb(fb);
> > =20
> > -	/* We cannot allocate any other buffer type */
> > -	igt_assert(true);
> > +	switch (fb->drm_format) {
> > +	case DRM_FORMAT_NV12:
> > +		bpp =3D 8;
> > +		break;
> > +
> > +	case DRM_FORMAT_UYVY:
> > +	case DRM_FORMAT_VYUY:
> > +	case DRM_FORMAT_YUYV:
> > +	case DRM_FORMAT_YVYU:
> > +		bpp =3D 16;
> > +		break;
> > +
> > +	default:
> > +		igt_assert_f(false, "Unsupported YUV format\n");
> > +	}
> > +
> > +	switch (fb->drm_format) {
> > +	case DRM_FORMAT_NV12:
> > +		virtual_height =3D fb->height * 3 / 2;
> > +		break;
>=20
> A bit of a hack. The main problem with this is that the kernel won't
> know anything about any stride alignment limitations etc. If we do use
> this hack I guess it would be more technically correct to write it as
> DIV_ROUND_UP(fb->size, fb->stride[0]), or something along those lines.

It's the same algorithm that modetest is using, which is why I went
for that. It must have been tested on a wide variety of platforms.

> Which also brings me to the other issue we have. calc_plane_stride()
> and calc_plane_size() are somewhat i915 specific. We should probably
> do something about that.

Ah, right, I missed that.

When will we start to put some intel specific code in a generic code
path?

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--j7zlztwbo64kw6l2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXAqR8gAKCRDj7w1vZxhR
xXlhAQDR5WkxkQx6Y3PPoxruK62SvAsGBDhf1u80G1wDUQyDRQEAtwsPTVSh8P1X
ZvqU5oZoktsLB+yqwx1u7YDljwOi8AE=
=dFTa
-----END PGP SIGNATURE-----

--j7zlztwbo64kw6l2--

--===============0283862172==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0283862172==--
