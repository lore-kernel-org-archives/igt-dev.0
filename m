Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Thu, 18 Apr 2019 09:00:21 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <20190418120021.z54wa6wf7w4q64db@smtp.gmail.com>
References: <20190403222439.jidjcpw7ywd6eomz@smtp.gmail.com>
 <20190410112808.fhaezu5y5ozwreu4@ahiler-desk1.fi.intel.com>
MIME-Version: 1.0
In-Reply-To: <20190410112808.fhaezu5y5ozwreu4@ahiler-desk1.fi.intel.com>
Subject: Re: [Intel-gfx] [PATCH i-g-t] lib: Rework __kms_addfb() function
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1630882649=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============1630882649==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kl6wldugmzl4lrsg"
Content-Disposition: inline


--kl6wldugmzl4lrsg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

First of all, thank you for your review.

I just have a few questions below.

On 04/10, Arkadiusz Hiler wrote:
> On Wed, Apr 03, 2019 at 07:24:39PM -0300, Rodrigo Siqueira wrote:
> > The function __kms_addfb() and drmModeAddFB2WithModifiers() have a
> > similar code. Due to this similarity, this commit replace part of the
> > code inside __kms_addfb() by using drmModeAddFB2WithModifiers().
>=20
> igt master % grep '^libdrm_version' meson.build
> libdrm_version =3D '>=3D2.4.82'
>=20
> libdrm master % git log -S drmModeAddFB2WithModifiers
> commit abfa680dbdfa4600105d904f4903c047d453cdb5
> Author: Kristian H. Kristensen <hoegsberg@chromium.org>
> Date:   Thu Sep 8 13:08:59 2016 -0700
>=20
>     Add drmModeAddFB2WithModifiers() which takes format modifiers
>=20
>     The only other user of this feature open codes the ioctl. Let's add an
>     entry point for this to libdrm.
>=20
>     Signed-off-by: Kristian H. Kristensen <hoegsberg@chromium.org>
>     Reviewed-by: Rob Clark <robdclark@gmail.com>
>=20
> libdrm master % git describe abfa680
> libdrm-2.4.70-15-gabfa680d
>=20
> We are good on this front.
>=20
> >=20
> > Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > ---
> >  lib/ioctl_wrappers.c | 27 ++++++---------------------
> >  1 file changed, 6 insertions(+), 21 deletions(-)
> >=20
> > diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
> > index 39920f87..4240d138 100644
> > --- a/lib/ioctl_wrappers.c
> > +++ b/lib/ioctl_wrappers.c
> > @@ -46,6 +46,7 @@
> >  #include <sys/utsname.h>
> >  #include <termios.h>
> >  #include <errno.h>
> > +#include <xf86drmMode.h>
> > =20
> >  #include "drmtest.h"
> >  #include "i915_drm.h"
> > @@ -1479,29 +1480,13 @@ int __kms_addfb(int fd, uint32_t handle,
> >  		uint32_t strides[4], uint32_t offsets[4],
> >  		int num_planes, uint32_t flags, uint32_t *buf_id)
> >  {
> > -	struct drm_mode_fb_cmd2 f;
> > -	int ret, i;
> > +	uint32_t handles[4] =3D {handle};
> > +	uint64_t modifiers[4] =3D {modifier};
>=20
> This notation will initialize first element to handle and zero out the
> remining ones.

Nice catch, I didn=E2=80=99t know about that. I=E2=80=99ll fix it in the V2.

> It is not equivalent to what is done below, where handle and modifier
> are commpied to each of the num_planes first elements of the arrays.
>=20
> >  	if (flags & DRM_MODE_FB_MODIFIERS)
> >  		igt_require_fb_modifiers(fd);
> > =20
> > -	memset(&f, 0, sizeof(f));
> > -
> > -	f.width  =3D width;
> > -	f.height =3D height;
> > -	f.pixel_format =3D pixel_format;
> > -	f.flags =3D flags;
> > -
> > -	for (i =3D 0; i < num_planes; i++) {
> > -		f.handles[i] =3D handle;
> > -		f.modifier[i] =3D modifier;
>=20
> here ^^^
>=20
> Which may break testing if we ever call it with (num_planes > 1).
>=20
> > -		f.pitches[i] =3D strides[i];
> > -		f.offsets[i] =3D offsets[i];
> > -	}
> > -
> > -	ret =3D igt_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &f);
> > -
> > -	*buf_id =3D f.fb_id;
> > -
> > -	return ret < 0 ? -errno : ret;
>=20
> This also changes behavior, as we log return value of __kms_addfb in few
> places, so we lose the information from errno and we would get -1 in
> case of any failue now.

I=E2=80=99m little bit confused here, because drmModeAddFB2WithModifiers() =
has
the following code:

 if ((ret =3D DRM_IOCTL(fd, DRM_IOCTL_MODE_ADDFB2, &f)))
    return ret;

In its turn, DRM_IOCTL(), has the following code:

static inline int DRM_IOCTL(int fd, unsigned long cmd, void *arg)
{
    int ret =3D drmIoctl(fd, cmd, arg);
    return ret < 0 ? -errno : ret;
}

Because of this, I thought that =E2=80=9Creturn drmModeAddFB2WithModifiers(=
)=E2=80=9D
has the same behaviour of the previous code. Could you give me some
extra explanation on this issue?
=20
> > +	return drmModeAddFB2WithModifiers(fd, width, height, pixel_format,
> > +					  handles, strides, offsets, modifiers,
> > +					  buf_id, flags);
> >  }
>=20
> igt master % ff __kms_addfb
> tests/kms_draw_crc.c:166:9:             ret =3D  __kms_addfb(drm_fd, gem_=
handle, 64, 64,
> tests/kms_available_modes_crc.c:228:8:  ret =3D __kms_addfb(data->gfx_fd,=
 data->gem_handle, w, h,
> tests/prime_vgem.c:765:15:              igt_require(__kms_addfb(i915, han=
dle[i],
> lib/igt_fb.c:1243:12:                   do_or_die(__kms_addfb(fb->fd, fb-=
>gem_handle,
> lib/ioctl_wrappers.h:217:5:             int __kms_addfb(int fd, uint32_t =
handle,
> lib/ioctl_wrappers.c:1457:5:            int __kms_addfb(int fd, uint32_t =
handle,
>=20
> We call __kms_addfb in 4 places only. It may be worth dropping this
> ioctl wrapper introduced in 2015 (so prior to drmModeAddFB2WithModifiers
> addition) altogether.

I agree about removing __kms_addfb(); however, I notice the following
side effect:

1. Probably, we=E2=80=99ll duplicate some pieces of code in those 4 functio=
ns.
2. The function igt_create_fb_with_bo_size() is used around all of the
   tests, and remove __kms_addfb() may impact in this function.

Anyway, what do you think about that? Should I prepare a V2 that removes
this function? I prefer to keep it based on the above points.

Best Regards,
Rodrigo Siqueira

> --=20
> Cheers,
> Arek

--=20
Rodrigo Siqueira
https://siqueira.tech

--kl6wldugmzl4lrsg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAly4ZtQACgkQWJzP/com
vP+3Jw/+OwNgwItRs978cQl/d5gqBxhXFzIU7NdWTdJ/cOxZUksh2iQbkXJd0NzN
v/lsKK1XGTamXqg2w6XKoOqeA8VqYdtd+ihfVx9xFu/rOssVNJXbK7wg9WC8HPKW
V0iShG6HAI+aY27RQ5QIWwCEq6NHam1QKmPAbUljdhw6/QlzL0nD5OaqZTcqdM76
xwHYOA8jo0IAfidGYQC9q8LeRvkgqh/Hv6PYOGsoWzh5MOwZ121tM52WxOxYxbRj
gw4zYMIN6W7VaBkZ/NQgO2Zqt9uDNOJ4Nx9AsBj9yExRw/BvNju3WFGixMLuJoZl
lc7BA46ydlIJKqvwWRcB7uJyvshJ5t1XqAf49ywQTBYKvjaOuCNttgA/e05644IO
4ROr7PGFrSIiZoHX55yc2V6kHw+/AV1C9ETHgDTxdID0KkA/NgKr0jUeGNdvosM3
WVxjNDAeFCjm3DQJgpgTh6aUyw+Va/ZOQSSQoBKMyhAVtiL08l5AEJenR3aPJjz8
8Q4FrwDvD1WrLx6Q6FuJ7wmj/i2U3DGe+kCBH8GNz3KZEkCgDABnMGQn7QqLBc0X
1HxrlsCwhYp9rtg8qrlsfMUXE5HXuFeeXoNuuZ/Eje0Q01z2W7B3P00+SmwHVHUF
Z1sjNTFAf2hMwzM54XNFnlMonB+EqeHe3qsk8RUKiA67ktTf1M8=
=wvA4
-----END PGP SIGNATURE-----

--kl6wldugmzl4lrsg--

--===============1630882649==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4

--===============1630882649==--
