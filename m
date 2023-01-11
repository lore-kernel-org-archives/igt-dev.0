Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7367410E7D6
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jan 2023 18:05:25 +0000 (UTC)
Date: Wed, 11 Jan 2023 17:04:17 -0100
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Message-ID: <20230111180417.5xno43p7bpxzwv7b@mail.igalia.com>
References: <20230103175244.958771-1-mcanal@igalia.com>
 <20230103175244.958771-2-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="a2pqotklspsgwbcz"
Content-Disposition: inline
In-Reply-To: <20230103175244.958771-2-mcanal@igalia.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/3] lib/igt_vc4: Rework
 igt_vc4_get_param()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


--a2pqotklspsgwbcz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 01/03, Ma=EDra Canal wrote:
> Instead of returning the error code of the DRM_IOCTL_VC4_GET_PARAM ioctl,
> make igt_vc4_get_param() return the value of the parameter, considering
> that the current return is not being used and the value of the parameter
> is being used.
>=20
> Signed-off-by: Ma=EDra Canal <mcanal@igalia.com>
> ---
>  lib/igt_vc4.c                | 19 ++++++++++++-------
>  lib/igt_vc4.h                |  2 +-
>  tests/vc4/vc4_purgeable_bo.c |  5 +----
>  3 files changed, 14 insertions(+), 12 deletions(-)
>=20
> diff --git a/lib/igt_vc4.c b/lib/igt_vc4.c
> index 6b6ad16c..a9084f01 100644
> --- a/lib/igt_vc4.c
> +++ b/lib/igt_vc4.c
> @@ -168,19 +168,24 @@ uint64_t igt_vc4_get_tiling(int fd, uint32_t handle)
>  	return get.modifier;
>  }
> =20
> -int igt_vc4_get_param(int fd, uint32_t param, uint64_t *val)
> +/**
> + * igt_vc4_get_param:
> + * @fd: device file descriptor
> + * @param: vc4 parameter
> + *
> + * This wraps the GET_PARAM ioctl.
> + *
> + * Returns the current value of the parameter.
> + */
> +uint64_t igt_vc4_get_param(int fd, uint32_t param)
>  {
>  	struct drm_vc4_get_param arg =3D {
>  		.param =3D param,
>  	};
> -	int ret;
> =20
> -	ret =3D igt_ioctl(fd, DRM_IOCTL_VC4_GET_PARAM, &arg);
> -	if (ret)
> -		return ret;
> +	do_ioctl(fd, DRM_IOCTL_VC4_GET_PARAM, &arg);
> =20
> -	*val =3D arg.value;
> -	return 0;
> +	return arg.value;
>  }
> =20
>  bool igt_vc4_purgeable_bo(int fd, int handle, bool purgeable)
> diff --git a/lib/igt_vc4.h b/lib/igt_vc4.h
> index 384d7d6e..4c08f175 100644
> --- a/lib/igt_vc4.h
> +++ b/lib/igt_vc4.h
> @@ -31,7 +31,7 @@
>  uint32_t igt_vc4_get_cleared_bo(int fd, size_t size, uint32_t clearval);
>  int igt_vc4_create_bo(int fd, size_t size);
>  void *igt_vc4_mmap_bo(int fd, uint32_t handle, uint32_t size, unsigned p=
rot);
> -int igt_vc4_get_param(int fd, uint32_t param, uint64_t *val);
> +uint64_t igt_vc4_get_param(int fd, uint32_t param);
>  bool igt_vc4_purgeable_bo(int fd, int handle, bool purgeable);
>  bool igt_vc4_is_tiled(uint64_t modifier);
>  bool igt_vc4_is_v3d(int fd);
> diff --git a/tests/vc4/vc4_purgeable_bo.c b/tests/vc4/vc4_purgeable_bo.c
> index 676bc1f3..27771012 100644
> --- a/tests/vc4/vc4_purgeable_bo.c
> +++ b/tests/vc4/vc4_purgeable_bo.c
> @@ -102,11 +102,8 @@ igt_main
>  	int fd, ret;
> =20
>  	igt_fixture {
> -		uint64_t val =3D 0;
> -
>  		fd =3D drm_open_driver(DRIVER_VC4);
> -		igt_vc4_get_param(fd, DRM_VC4_PARAM_SUPPORTS_MADVISE, &val);
> -		igt_require(val);
> +		igt_require(igt_vc4_get_param(fd, DRM_VC4_PARAM_SUPPORTS_MADVISE));

LGTM.

Reviewed-by: Melissa Wen <mwen@igalia.com>

Thanks!

>  		IGT_INIT_LIST_HEAD(&list);
>  	}
> =20
> --=20
> 2.38.1
>=20

--a2pqotklspsgwbcz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmO++hAACgkQwqF3j0dL
ehz0IRAAw+zLdzfWtqrmS1dOrqxEJUqOM3J0yDbjaVjgAGYKjjSl5vduKBYWPGrM
39AJodCpKPwHW7uG98+KFenwBluJ+nSNrw+7XezheZecFjviPumeL5zlETArYmMG
n9yaeqeaHWxaNRfbYm3tenkJ7BehcodtVzjMAu5TAAyYuGAspUt2OCIhu933N5B4
c/ZnOlhk4xmTDNpsGUqwQ+ShkWKVOwMoPObz5xOz1LNDEs5LQxQcCRVGIokAO7Sp
nV1vigIM096BTgX7rViS9+JArK/ORlM7K5/uDbsGQz26iBmVSSa15KsrPDZKwQet
cU8TD8Nd/4oPFWGgSH4tATsJfZwuaBTcM/HV6RhRQxc+nRY3LCgLmDWQccbwXvgM
UCV4K2Qd4Nc/CfHfFeeLJe6/sTahGrz7T7JcdqSw1ljUqWwKGtpG+1/XmXCbisgZ
gllEE2XGX2eiihm33D5i0RhnbDlelya9vhi/WgaScehRC8kds8qCMcCgN4P2JszK
ndTbGddveIdqCTogX1qsDSPrOw+p/vNZ5wVw3uiA3cql2QCnI8puQxCKg9j2LpXD
Qju17frwbnbyaSfzTdvIdkAmdA6r2epRxep01dCeB6+TxSANQ7aeoqrLqk8rUHVv
33QCA4ShMUdaAjCzfuZ8GVJtYlYKEKHSEd61zbXuTuo5uEJwv+U=
=NTD8
-----END PGP SIGNATURE-----

--a2pqotklspsgwbcz--
