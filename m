Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E038D10EE53
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jun 2022 10:24:31 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id w20so21430457lfa.11
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jun 2022 03:24:31 -0700 (PDT)
Date: Tue, 28 Jun 2022 13:24:19 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Message-ID: <20220628132419.47ac8742@eldfell>
In-Reply-To: <20220610121647.975942-2-maxime@cerno.tech>
References: <20220610121647.975942-1-maxime@cerno.tech>
 <20220610121647.975942-2-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nKS_LwwY4tsLaxd_krB+4bG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/3] tests/kms_writeback: Use
 endianness accessor to fill pixels
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

--Sig_/nKS_LwwY4tsLaxd_krB+4bG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 10 Jun 2022 14:16:45 +0200
Maxime Ripard <maxime@cerno.tech> wrote:

> The fill_fb() function in the kms_writeback test suite will fill an
> XRGB8888 buffer using a pattern passed an an argument. However, the
> pattern is native endian, while XRGB8888 is little-endian.
>=20
> Add an accessor and use it to fill the framebuffer with our pattern.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  lib/igt_core.h        | 9 +++++++++
>  tests/kms_writeback.c | 2 +-
>  2 files changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index 526282faff24..aa98e8ed8deb 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -31,6 +31,7 @@
>  #define IGT_CORE_H
> =20
>  #include <assert.h>
> +#include <byteswap.h>
>  #include <setjmp.h>
>  #include <stdbool.h>
>  #include <stdint.h>
> @@ -1447,6 +1448,14 @@ void igt_kmsg(const char *format, ...);
>  #define READ_ONCE(x) (*(volatile typeof(x) *)(&(x)))
>  #define WRITE_ONCE(x, v) do *(volatile typeof(x) *)(&(x)) =3D (v); while=
 (0)
> =20
> +#if __BYTE_ORDER__ =3D=3D __ORDER_BIG_ENDIAN__
> +#define cpu_to_le32(x)  bswap_32(x)
> +#define le32_to_cpu(x)  bswap_32(x)
> +#else
> +#define cpu_to_le32(x)  (x)
> +#define le32_to_cpu(x)  (x)
> +#endif
> +

The explanation makes sense and these macros look right.

>  #define MSEC_PER_SEC (1000)
>  #define USEC_PER_SEC (1000*MSEC_PER_SEC)
>  #define NSEC_PER_SEC (1000*USEC_PER_SEC)
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
> index 6efc72df4327..cf70a28e7d56 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -244,7 +244,7 @@ static void fill_fb(igt_fb_t *fb, uint32_t pixel)
> =20
>  	pixel_count =3D fb->strides[0] * fb->height / sizeof(uint32_t);
>  	for (i =3D 0; i < pixel_count; i++)
> -		ptr[i] =3D pixel;
> +		ptr[i] =3D cpu_to_le32(pixel);
> =20
>  	igt_fb_unmap_buffer(fb, ptr);
>  }

There just isn't enough context in this patch to see if this is
correct, but at least it matches the commit message.

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/nKS_LwwY4tsLaxd_krB+4bG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmK61tMACgkQI1/ltBGq
qqeKQBAAik1KdrQwi0EV6YttUovB6Yx4O1/8++vtOlVHwLIOVQApR7NA86QJ9YfG
a86Ztxc+NnUc7MgVMQkq5acl9Xz8H27wvKfu48MRZk57icD1/l00nmYw+vzYkVmU
HqIoO6a8qgMmSFEkourx2FrqreEDjGVmCcX4phgWwmKvxjSjrKQSRkcwtYtciJS9
WZLpFNIuNNx2YjQEeAG1lYL/LdSpO9lClOu3g/dhhMzhwO228C1TPXx8utHfdkCr
ybkjhI+rugxjSSL31oqihH4p57Xdazq3u7juli4gkS+mEPrdvE/ZBjlQw/UTtyC8
aaKzCGOYTTnKb7rIVyOkWNsO5DPvJcTZ+YXE5rUg7eAk2mamLk364g2ShTpyEnck
MyM7ctYSCyPdVvqmQQd1Z8NHVRY4SL7DnO/RaHw2OGEsIusVxG358W6KwzwgAxMn
XUblsDODvk5eBHSCRbjPih+10JUlB8hfEsmJ2yQ36rydD7U3IMh5zWwHmH3Kd/ab
IjJ1peESzTq2KmdrPsWPLSohyYMMVxhxKb93i1SZ+gycMvj5+VLcEQ6wg7DUiQ4T
UNf74wS6LdR6dFJORSDGdegHO1CGlfttXrs8WbQZFnotc5tzt6ALu6Vgjo1Oy0J4
sZ10dLzPe08myDDMv1Gc1tYJ8GsdVoTjcsNtMVd8SOt0byHwmd4=
=EAPt
-----END PGP SIGNATURE-----

--Sig_/nKS_LwwY4tsLaxd_krB+4bG--
