Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F69110F528
 for <igt-dev@lists.freedesktop.org>; Thu,  5 May 2022 07:21:24 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id bu29so6083756lfb.0
 for <igt-dev@lists.freedesktop.org>; Thu, 05 May 2022 00:21:24 -0700 (PDT)
Date: Thu, 5 May 2022 10:21:11 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Message-ID: <20220505102111.3a29571d@eldfell>
In-Reply-To: <20220504145631.jau23ekng6zdzhv4@houat>
References: <20220328145509.2331195-1-maxime@cerno.tech>
 <20220328145509.2331195-5-maxime@cerno.tech>
 <20220429154645.1680bad2@eldfell>
 <20220504145631.jau23ekng6zdzhv4@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/q/hBQYRsqGdhw+ZhXYyOxVH";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Subject: Re: [igt-dev] [PATCH i-g-t v2 4/8] lib/igt_frame: Add function to
 dump frames in RGB and raw
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--Sig_/q/hBQYRsqGdhw+ZhXYyOxVH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 4 May 2022 16:56:31 +0200
Maxime Ripard <maxime@cerno.tech> wrote:

> Hi Pekka,
>=20
> Thanks for reviewing those patches
>=20
> On Fri, Apr 29, 2022 at 03:46:45PM +0300, Pekka Paalanen wrote:
> > On Mon, 28 Mar 2022 16:55:05 +0200
> > Maxime Ripard <maxime@cerno.tech> wrote:
> >  =20
> > > The igt_write_frame_to_png() already allows to dump the content of a
> > > cairo surface into a PNG image. However, it can be useful to have the
> > > raw content of the buffer as well, so let's create a function that wi=
ll
> > > dump both a PNG image and its raw buffer.
> > >=20
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech> =20
> >=20
> > Hi,
> >=20
> > when exactly is the raw dump useful? Do you need it for checking alpha?
> > Or for YUV formats? Or for multi-planar formats? Or for greater than 8
> > bpc or floating point formats? =20
>=20
> Anything, really :)
>=20
> When I started debugging this, the only feedback I got from IGT was the
> hash it computed from the image, which isn't particularly useful for
> debugging.
>=20
> > How do you make use of the raw dump? =20
>=20
> I'm using http://rawpixels.net/
>=20
> > PNG can store alpha channel as well, and if that's not convenient
> > alongsize RGB, you could save another image where alpha has been
> > converted to gray scale.
> >=20
> > PNG can also go up to 16 bpc I think?
> >=20
> > PAM file format (netpbm type P7) might also be an option, looks like it
> > can do up to RGBA 16 bpc, and is trivial to generate.
> > http://netpbm.sourceforge.net/doc/pam.html
> >=20
> > It's not much different from a raw dump, but contains enough metadata
> > for tools to understand the image. =20
>=20
> TIL :)
>=20
> But I'd assume all those formats are still RGB, right? So if we ever go
> to check other formats, we'll get back into the same situation.

Yes, they are all RGB(A).

I think you have to get rid of Cairo first, before non-RGB can even be
a problem in file saving.

Cairo does not even do 16 bpc RGB(A):
https://www.cairographics.org/manual/cairo-Image-Surfaces.html#cairo-format=
-t
It only goes up to 10 bpc.

> That being said, I don't have a strong opinion for that patch (and the
> next one). I've found it to be useful when debugging, but I'd definitely
> understand if that's not something we want in IGT.

I'm not opposing this patch, I just wanted to know how it's useful.
Something to add to the commit message maybe?


Thanks,
pq

--Sig_/q/hBQYRsqGdhw+ZhXYyOxVH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmJzeucACgkQI1/ltBGq
qqfCnA//fj6ZadUYHjDKTiDTJ0db94f2oHpDzZrFr1BIgwqm1ym2wl/mMya2pyyo
DHNtPK8860pRlZY9LxM5+pkU3ZUXUJ1qtN9NmV/KZX+jXNo+/V8LJPb+vwYZSLYu
9gusUk8+xXoDra8NalMdosSHylzmVfbwwhOQmT7sLa948LEuhu4tSgbLdHb15om8
uKsSqIsf0bil/zywO/eghg/EGoWie/zZ2ibjimxBuSJWqxakwm+OxubBs3gYlG3b
YcemhkNMFOyat622rrX6PD9bj/INF4ddeK8lAifOQZrmG27nulih4+rsOPDaq8QE
SK5G/2n2nqxL42h5vAKiPNYKSV4Q9OnhgAPDLdh13TrfIB6OVP/2hZxrgEQXQ5T6
v4RQDxeFktsv7Ci9nD8Q5yDq1Hw5qyjahUfSiohx5Sf892hAz71S2NKp3NI1Ws6S
D4rGJZfv4OWSGv0BKNC5lXYgUmkAPVS4k5Npu8LiEbUSUwIToz4NbuhfeWNYT+Pz
Dwa5I1HsOYc7X2K2LjPF9CsqDrw7x/RiE0lF3D1Swky0t73NT2wW9cz9NAhg2FqH
Ao4/qF30MU2kFr0OqdvSrj3DI/x7lkZf0B1YqRNBaQwmDWscZblHhu2W/pzhkMaW
Mj3mjKd87Bc9R/ARaVm+tZpdUwKQCYiq9MssSym+7bjHotYbTwk=
=2SX1
-----END PGP SIGNATURE-----

--Sig_/q/hBQYRsqGdhw+ZhXYyOxVH--
