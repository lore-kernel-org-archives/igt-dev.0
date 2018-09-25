Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 85ACA891B7
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Sep 2018 08:51:35 +0000 (UTC)
Date: Tue, 25 Sep 2018 10:51:24 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20180925085124.wqwx5e2uxk3waviw@flea>
References: <cover.cafc7aee9c887562e8432741cd1f0543ff92121a.1536655647.git-series.maxime.ripard@bootlin.com>
 <3048e3bbb684b05aa15be23e224f3090d7818a7c.1536655647.git-series.maxime.ripard@bootlin.com>
 <20180919132138.GG5565@intel.com>
MIME-Version: 1.0
In-Reply-To: <20180919132138.GG5565@intel.com>
Subject: Re: [igt-dev] [PATCH v7 02/14] fb: Use an igt_fb for the cairo
 shadow buffer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0242397625=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, eben@raspberrypi.org, igt-dev@lists.freedesktop.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0242397625==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fyhvmj4ran2h7d42"
Content-Disposition: inline


--fyhvmj4ran2h7d42
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 19, 2018 at 04:21:38PM +0300, Ville Syrj=E4l=E4 wrote:
> On Tue, Sep 11, 2018 at 10:47:29AM +0200, Maxime Ripard wrote:
> > In the case where an igt_fb user wants to get a cairo surface out of th=
at
> > framebuffer, if the format of that framebuffer cannot be imported as-is=
 in
> > Cairo, the current code will do an anonymous mapping to create a shadow
> > buffer where an RGB24 copy of that buffer will be created.
> >=20
> > However, making that shadow buffer into an igt_fb itself will help us do
> > further improvements on the conversion code.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > ---
> >  lib/igt_fb.c | 28 +++++++++++++++++-----------
> >  1 file changed, 17 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> > index 542c62610412..dd180c6c8016 100644
> > --- a/lib/igt_fb.c
> > +++ b/lib/igt_fb.c
> > @@ -1381,12 +1381,12 @@ static void create_cairo_surface__gtt(int fd, s=
truct igt_fb *fb)
> > =20
> >  struct fb_convert_blit_upload {
> >  	int fd;
> > +
> >  	struct igt_fb *fb;
> > +	uint8_t *ptr;
> > =20
> > -	struct {
> > -		uint8_t *map;
> > -		unsigned stride, size;
> > -	} rgb24;
> > +	struct igt_fb shadow_fb;
> > +	uint8_t *shadow_ptr;
>=20
> We seem to be pairing fb and ptr a lot. I wonder if we should suck the
> the ptr into the fb struct. But maybe someone wants to map the same
> thing multiple times? Not sure.

Is it something you want me to change then?

> >  	struct fb_blit_linear linear;
> >  };
> > @@ -1780,7 +1780,8 @@ static void destroy_cairo_surface__convert(void *=
arg)
> >  			     fb->drm_format);
> >  	}
> > =20
> > -	munmap(blit->rgb24.map, blit->rgb24.size);
> > +	igt_fb_unmap_buffer(&blit->shadow_fb, blit->shadow_ptr);
> > +	igt_remove_fb(blit->fd, &blit->shadow_fb);
> > =20
> >  	if (blit->linear.handle)
> >  		free_linear_mapping(blit->fd, blit->fb, &blit->linear);
> > @@ -1795,14 +1796,19 @@ static void destroy_cairo_surface__convert(void=
 *arg)
> >  static void create_cairo_surface__convert(int fd, struct igt_fb *fb)
> >  {
> >  	struct fb_convert_blit_upload *blit =3D malloc(sizeof(*blit));
> > +	int shadow_id;
> > +
> >  	igt_assert(blit);
> > =20
> >  	blit->fd =3D fd;
> >  	blit->fb =3D fb;
> > -	blit->rgb24.stride =3D ALIGN(fb->width * 4, 16);
> > -	blit->rgb24.size =3D ALIGN(blit->rgb24.stride * fb->height, sysconf(_=
SC_PAGESIZE));
> > -	blit->rgb24.map =3D mmap(NULL, blit->rgb24.size, PROT_READ | PROT_WRI=
TE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> > -	igt_assert(blit->rgb24.map !=3D MAP_FAILED);
> > +
> > +	shadow_id =3D igt_create_fb(fd, fb->width, fb->height, DRM_FORMAT_RGB=
888,
> > +				  LOCAL_DRM_FORMAT_MOD_NONE, &blit->shadow_fb);
> > +	igt_assert(shadow_id > 0);
>=20
> We can't actually expect addfb to work for RGB888.

Because the driver might not support it?

> That thing is not supported by most hardware. Since my series adding
> fb_init() etc. hasn't gotten reviewed I guess we'll just need to
> populate the igt_fb by hand here, or something.

At this point, I have to ask: is there any actual will to have this
patch merged at some point?

This series is just a long history of either being ignored, dealing
with the i915-specific changes that got in and are breaking the other
users, or huge reworks for i915-specific uses cases I have no way to
test.

If the current idea is back to igt is for i915 solely, then there's no
point in wasting time on this.

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--fyhvmj4ran2h7d42
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlup9wsACgkQ0rTAlCFN
r3R5JQ//SXH29t8jyG7HCbjv5O9JCQ7AEUDCzRbRTcgqCXN/vGiavE5aQ57VQap6
dGyFSpx/EKpYn3mmo5jlewtK3VuGkQFwWgQ7knupUEOfyvsGgD4lWpziTAva5HxW
NdWgSfoXsgZeM7OrmBr+bJxSHCz7+koxKA366BG7XY9OL9aVb0AZ04Gl8elm5x9/
+5zXyJLR+KTEUB4zSYwiRbqEr/jIqCDa54yh7ymNWaEYUK1pcyINMdpZXpxHFaIW
+ybgUYo9khRPvRvytBhzCXOofXiB8E8qeXk/2Y+hf/hWi/gXroGc9LVcCkCCH+Gb
lngEfqQp5zhbTHL+zVYvhuh4N8/fwomxG32lrGoTbI9r85geP5FUqef5IcLFHGLq
XEVO/hn+nh9QRDtJzEyRM9e5vcPzRI30ATZHNJdbaVrm8P+N19kwu9FMu782JTgj
xwKXu/FbxreA6elmXYu3z+5auPuC9qIYx6FUw8+xlKzrCO97OIwMZg/aFriZMvXm
KriGQ51psQPru31oZB6WED1jrqaJsBDkVqlkSqWj8N5VxRsidWK21JGu5Dm2Lmb+
UjXgy7vSBNtaztJGePq1kemC+xba/XNxcVA5KCwGPxjt9mWJTuJZ2iql5D/QONO4
wsaMNFkGHcPWpp5uvm7Sv8LNqOA+/1HXHUSuBAM3W2J3c/7R3HY=
=kdQG
-----END PGP SIGNATURE-----

--fyhvmj4ran2h7d42--

--===============0242397625==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0242397625==--
