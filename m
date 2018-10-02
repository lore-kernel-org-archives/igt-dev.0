Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2B3C86E34E
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Oct 2018 14:57:03 +0000 (UTC)
Date: Tue, 2 Oct 2018 16:56:51 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20181002145651.7ls3jabpwhvigd35@flea>
References: <cover.cafc7aee9c887562e8432741cd1f0543ff92121a.1536655647.git-series.maxime.ripard@bootlin.com>
 <3048e3bbb684b05aa15be23e224f3090d7818a7c.1536655647.git-series.maxime.ripard@bootlin.com>
 <20180919132138.GG5565@intel.com>
 <20180925085124.wqwx5e2uxk3waviw@flea>
 <20181001104712.crtapjpb3beklium@ahiler-desk1.fi.intel.com>
 <20181001135522.GH9144@intel.com>
 <20181001141014.z36yypia5t2h6t57@ahiler-desk1.fi.intel.com>
MIME-Version: 1.0
In-Reply-To: <20181001141014.z36yypia5t2h6t57@ahiler-desk1.fi.intel.com>
Subject: Re: [igt-dev] [PATCH v7 02/14] fb: Use an igt_fb for the cairo
 shadow buffer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1416707510=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, eben@raspberrypi.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============1416707510==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qhzcfmzusqqhppii"
Content-Disposition: inline


--qhzcfmzusqqhppii
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Mon, Oct 01, 2018 at 05:10:14PM +0300, Arkadiusz Hiler wrote:
> On Mon, Oct 01, 2018 at 04:55:22PM +0300, Ville Syrj=E4l=E4 wrote:
> > On Mon, Oct 01, 2018 at 01:47:12PM +0300, Arkadiusz Hiler wrote:
> > > On Tue, Sep 25, 2018 at 10:51:24AM +0200, Maxime Ripard wrote:
> > > > On Wed, Sep 19, 2018 at 04:21:38PM +0300, Ville Syrj=E4l=E4 wrote:
> > > > > On Tue, Sep 11, 2018 at 10:47:29AM +0200, Maxime Ripard wrote:
> > > > > > In the case where an igt_fb user wants to get a cairo surface o=
ut of that
> > > > > > framebuffer, if the format of that framebuffer cannot be import=
ed as-is in
> > > > > > Cairo, the current code will do an anonymous mapping to create =
a shadow
> > > > > > buffer where an RGB24 copy of that buffer will be created.
> > > > > >=20
> > > > > > However, making that shadow buffer into an igt_fb itself will h=
elp us do
> > > > > > further improvements on the conversion code.
> > > > > >=20
> > > > > > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > > > > > ---
> > > > > >  lib/igt_fb.c | 28 +++++++++++++++++-----------
> > > > > >  1 file changed, 17 insertions(+), 11 deletions(-)
> > > > > >=20
> > > > > > diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> > > > > > index 542c62610412..dd180c6c8016 100644
> > > > > > --- a/lib/igt_fb.c
> > > > > > +++ b/lib/igt_fb.c
> > > > > > @@ -1381,12 +1381,12 @@ static void create_cairo_surface__gtt(i=
nt fd, struct igt_fb *fb)
> > > > > > =20
> > > > > >  struct fb_convert_blit_upload {
> > > > > >  	int fd;
> > > > > > +
> > > > > >  	struct igt_fb *fb;
> > > > > > +	uint8_t *ptr;
> > > > > > =20
> > > > > > -	struct {
> > > > > > -		uint8_t *map;
> > > > > > -		unsigned stride, size;
> > > > > > -	} rgb24;
> > > > > > +	struct igt_fb shadow_fb;
> > > > > > +	uint8_t *shadow_ptr;
> > > > >=20
> > > > > We seem to be pairing fb and ptr a lot. I wonder if we should suc=
k the
> > > > > the ptr into the fb struct. But maybe someone wants to map the sa=
me
> > > > > thing multiple times? Not sure.
> > > >=20
> > > > Is it something you want me to change then?
> > > >=20
> > > > > >  	struct fb_blit_linear linear;
> > > > > >  };
> > > > > > @@ -1780,7 +1780,8 @@ static void destroy_cairo_surface__conver=
t(void *arg)
> > > > > >  			     fb->drm_format);
> > > > > >  	}
> > > > > > =20
> > > > > > -	munmap(blit->rgb24.map, blit->rgb24.size);
> > > > > > +	igt_fb_unmap_buffer(&blit->shadow_fb, blit->shadow_ptr);
> > > > > > +	igt_remove_fb(blit->fd, &blit->shadow_fb);
> > > > > > =20
> > > > > >  	if (blit->linear.handle)
> > > > > >  		free_linear_mapping(blit->fd, blit->fb, &blit->linear);
> > > > > > @@ -1795,14 +1796,19 @@ static void destroy_cairo_surface__conv=
ert(void *arg)
> > > > > >  static void create_cairo_surface__convert(int fd, struct igt_f=
b *fb)
> > > > > >  {
> > > > > >  	struct fb_convert_blit_upload *blit =3D malloc(sizeof(*blit));
> > > > > > +	int shadow_id;
> > > > > > +
> > > > > >  	igt_assert(blit);
> > > > > > =20
> > > > > >  	blit->fd =3D fd;
> > > > > >  	blit->fb =3D fb;
> > > > > > -	blit->rgb24.stride =3D ALIGN(fb->width * 4, 16);
> > > > > > -	blit->rgb24.size =3D ALIGN(blit->rgb24.stride * fb->height, s=
ysconf(_SC_PAGESIZE));
> > > > > > -	blit->rgb24.map =3D mmap(NULL, blit->rgb24.size, PROT_READ | =
PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> > > > > > -	igt_assert(blit->rgb24.map !=3D MAP_FAILED);
> > > > > > +
> > > > > > +	shadow_id =3D igt_create_fb(fd, fb->width, fb->height, DRM_FO=
RMAT_RGB888,
> > > > > > +				  LOCAL_DRM_FORMAT_MOD_NONE, &blit->shadow_fb);
> > > > > > +	igt_assert(shadow_id > 0);
> > > > >=20
> > > > > We can't actually expect addfb to work for RGB888.
> > > >=20
> > > > Because the driver might not support it?
> > > >=20
> > > > > That thing is not supported by most hardware. Since my series add=
ing
> > > > > fb_init() etc. hasn't gotten reviewed I guess we'll just need to
> > > > > populate the igt_fb by hand here, or something.
> > > >=20
> > > > At this point, I have to ask: is there any actual will to have this
> > > > patch merged at some point?
> > > >=20
> > > > This series is just a long history of either being ignored, dealing
> > > > with the i915-specific changes that got in and are breaking the oth=
er
> > > > users, or huge reworks for i915-specific uses cases I have no way to
> > > > test.
> > > >=20
> > > > If the current idea is back to igt is for i915 solely, then there's=
 no
> > > > point in wasting time on this.
> > >=20
> > > Sorry for wasting your time up to this point. If you will ever feel
> > > blocked, please do contact me or Petri.
> > >=20
> > > Seeing some comments here and there, as well as reviewed-bys I was
> > > wrongly assuming that this is progressing. This is my failure here, a=
nd
> > > getting to v7 should have alarmed me. I am truly sorry.
> > >=20
> > > Back to the topic - yes your contributions are welcome.
> > >=20
> > > I really like the idea, that instead of manually fiddling with rgb24 =
we
> > > could deal with a proper igt_fb here, because it makes life easier la=
ter.
> > >=20
> > > @Ville: We have your fb_init() merged now, so we can use it here, so =
it
> > > should be hardware-that-does-not-support-rgb888-proof. And it's not l=
ike
> > > we should have blocked here in the first place, as all the hardware we
> > > run on seems to support it, and it could be reworked later on.
> >=20
> > Practically nothing supports 24bpp.
>=20
> Misread that as XRGB8888, my bad. It would have worked with that.
>=20
> @Maxime: I guess fbinit() + malloc for the dummy fb will do the trick
> for you, as you seem use that just for the conversion purposes.

Yep. I actually rolled back to the previous approach that was usisng
an anonymous mapping. It should work for everyone.

I've also rebased on current master, and it turns out I introduced a
regression on Intel platforms, so I've setup a platform here so that I
can test on some intel hardware at least. I'll resend a new version
with hopefully all the comments and breakages addressed.

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--qhzcfmzusqqhppii
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAluzhzMACgkQ0rTAlCFN
r3Qufg//YUhbjsA6JIyQp0etFZOdZ9ikp+mfL01XaN9qiu+ttNoz1N+jvmXlvH1K
YpWcqZk3WzQaaDCzQBnYKMfL0rPQd4EAs5I1wVEWzxfLv+Lva0FMSNSSiB2yEkVv
WScVql2yswga6V9uGUzRbNg0SjxVVxsyOhFa0jjPJZfLXIjJH1LI7Za3B/kHl1W2
QaNV/1EpqLL8byMUVISW8xjzQ4ZVtw5UofokFDrsvIHjMurvAMCpU3g4/6yH2ScB
nQbL/wHCnrIB9pt4NiXHbw3ROCt2IOMUa4gt5Z0dSbCEEIHNVdGy0BSCjjIX/Csn
ClNfBxHnC316l0elTToZJ2ENfmblMPsaIiSb0k3/2KD/NJ126TKBhxtMk+7o3Yno
izN25iDeLVwLfNSDnd+NlNtIl4mxQSk9gQPOWKlV7Am5T0HlaUmrCbXYySOE038M
JKdR05DCgK6sVLuYJqfhIbn2HOwLupXre8P25eHZHXoZT7zU1QutRG6Gq7A682tV
j8MW/j8VZMlFMZqMOLerUfsbZLVqRPzQza2yYFZ9cXuI5YANYf+g9Re/va8M/o7X
8t+GomOQBLzR2KlcXEUizKO9g1oUl1R2Zgj+sWVACZkz51HDJNbaxhJL1F6Mipqv
8yRGB7+cZo3tfMpfL+GyDFfDKlPgY73rww9J5qto66W+xrqzBnk=
=GTEt
-----END PGP SIGNATURE-----

--qhzcfmzusqqhppii--

--===============1416707510==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1416707510==--
