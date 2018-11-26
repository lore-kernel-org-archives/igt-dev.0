Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id AEBD689A88
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Nov 2018 20:49:08 +0000 (UTC)
From: Eric Anholt <eric@anholt.net>
In-Reply-To: <20181126153624.3690-1-lukasz.kalamarz@intel.com>
References: <20181126153624.3690-1-lukasz.kalamarz@intel.com>
Date: Mon, 26 Nov 2018 12:49:06 -0800
Message-ID: <87ftvnbm4d.fsf@anholt.net>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/3] lib/ioctl_wrapper: Add
 i915_get_param helper
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0083182555=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lukasz Kalamarz <lukasz.kalamarz@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0083182555==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Lukasz Kalamarz <lukasz.kalamarz@intel.com> writes:

> getparam is used in few places across IGT, but no helper function
> is used to reduce code duplication.
> v2: Added doc part and changed return value in case of error
>
> Signed-off-by: Lukasz Kalamarz <lukasz.kalamarz@intel.com>
>
> Cc: Michal Winiarski <michal.winiarski@intel.com>
> Cc: Katarzyna Dec <katarzyna.dec@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>  lib/ioctl_wrappers.c | 22 ++++++++++++++++++++++
>  lib/ioctl_wrappers.h |  1 +
>  2 files changed, 23 insertions(+)
>
> diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
> index 9f255508..aec4f15e 100644
> --- a/lib/ioctl_wrappers.c
> +++ b/lib/ioctl_wrappers.c
> @@ -468,6 +468,28 @@ void gem_sync(int fd, uint32_t handle)
>  	errno =3D 0;
>  }
>=20=20
> +/**
> + * drm_get_param:
> + * @fd: open i915 drm file descriptor
> + * @param: drm parameter we want to read

Could we please call this i915_get_param, to match the commit message,
instead of drm_get_param()?  I know igt used to call i915-only ioctls
drm_* or gem_*, but it would be nice to see new functions use a more
appropriate namespace.

(I wouldn't block this, but if people decide not to do that then the
commit message subject should at least change)

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlv8XEIACgkQtdYpNtH8
nuh1UA//Si+DaeXfWtVzqawoQVCaVmPpKYBPe+iqJzRsdMxnDUYIE2WHPcabbhMm
1hVFmWJN8UeL2px75MPjCAs5tZi6eoaeRmtZ+h1RYdtgilLaXArbONTM+d19yKyx
f9S79y1Fd1DM0q7l3rX34E1FIJzj3OYUe/M1K/tFL3YYLCD+nV2GkaObtG4q+EqP
qfXS6r1+XsbBgRuoP/T+bN0O1/o31bq6ZrAj7P3scJ6nxT0KdjQQLETIVQaTHMe/
AJHckf4VamXRxLlfDnDrjlcsm7gUH5m9LQgDB8CcCaii5JWn5gdUy5y2Qe/3RYQE
OOWobiN1Fn5GpaauYevvSQ/Rsd6Tga2sPE3ZL0tosIxok8I/noUNDwS/YqoWcw7U
PI+7495x3uc5pDW5isIWWi6HpWlKM0ihEkfrOM51h6A/RzRo7mYm6/pucoM7mvAl
h/mZYSmOyYE27E2PHB8vM6kI0DFbliHJawjM2HzBSN73dH0KMhZC+Y7gc8Atrh8B
VBac2ZhR8JDJAqMCOSoK8gu9VJQPqEI+0FZeMmgeJUdMkach+VAdBBMqukw6vK5G
yX6/N/VKjMqqvSoUh78+lOv1lFs83g8GD1g8Y3l1XgyRKdogURClEnU0qr0Yj1eX
gE4ZO5i3s6Db7M3eI1s1mkPhOUbYQYRfosba03qMqeCL6Gd6cZI=
=15gq
-----END PGP SIGNATURE-----
--=-=-=--

--===============0083182555==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0083182555==--
