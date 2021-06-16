Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE2CC89D63
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jun 2021 22:08:26 +0000 (UTC)
Date: Wed, 16 Jun 2021 18:08:19 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20210616220819.24oajh2al4ne7ivp@outlook.office365.com>
References: <20210616135547.154645-1-Anson.Jacob@amd.com>
In-Reply-To: <20210616135547.154645-1-Anson.Jacob@amd.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH V2] tests/amdgpu: Add amdgpu module reload test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1859847873=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Anson Jacob <Anson.Jacob@amd.com>
Cc: igt-dev@lists.freedesktop.org, Mark Yacoub <markyacoub@google.com>, Petri Latvala <petri.latvala@intel.com>, Victor Lu <victorchengchi.lu@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1859847873==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a2ovq7bbdawod2ka"
Content-Disposition: inline

--a2ovq7bbdawod2ka
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 06/16, Anson Jacob wrote:
> From: Victor Lu <victorchengchi.lu@amd.com>
>=20
> Test to ensure unloading and loading of amdgpu driver works
>=20
> Tested on:
> ASIC: NAVI14
>=20
> Changes since v1:
> * Added documentaion
> * Updated commit message
>=20
> Signed-off-by: Victor Lu <victorchengchi.lu@amd.com>
> Co-developed-by: Anson Jacob <Anson.Jacob@amd.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Mark Yacoub <markyacoub@google.com>
> ---
>  lib/igt_kmod.c                 | 59 ++++++++++++++++++++++++
>  lib/igt_kmod.h                 |  3 ++
>  tests/amdgpu/amd_module_load.c | 83 ++++++++++++++++++++++++++++++++++
>  tests/amdgpu/meson.build       |  1 +
>  4 files changed, 146 insertions(+)
>  create mode 100644 tests/amdgpu/amd_module_load.c
>=20
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 55295fa5d09d..10e983844066 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -433,6 +433,65 @@ igt_i915_driver_unload(void)
>  	return IGT_EXIT_SUCCESS;
>  }
> =20
> +/**
> + * igt_amdgpu_driver_load:
> + * @opts: options to pass to amdgpu driver
> + *
> + * Returns: IGT_EXIT_SUCCESS or IGT_EXIT_FAILURE.
> + *
> + * Loads the amdgpu driver and its dependencies.
> + *
> + */
> +int
> +igt_amdgpu_driver_load(const char *opts)
> +{
> +	if (opts)
> +		igt_info("Reloading amdgpu with %s\n\n", opts);
> +
> +	if (igt_kmod_load("amdgpu", opts)) {
> +		igt_warn("Could not load amdgpu\n");
> +		return IGT_EXIT_FAILURE;
> +	}
> +
> +	bind_fbcon(true);
> +
> +	return IGT_EXIT_SUCCESS;
> +}
> +
> +/**
> + * igt_amdgpu_driver_unload:
> + *
> + * Returns: IGT_EXIT_SUCCESS on success, IGT_EXIT_FAILURE on failure
> + * and IGT_EXIT_SKIP if amdgpu could not be unloaded.
> + *
> + * Unloads the amdgpu driver and its dependencies.
> + *
> + */
> +int
> +igt_amdgpu_driver_unload(void)
> +{
> +	bind_fbcon(false);
> +
> +	if (igt_kmod_is_loaded("amdgpu")) {
> +		if (igt_kmod_unload("amdgpu", 0)) {
> +			igt_warn("Could not unload amdgpu\n");
> +			igt_kmod_list_loaded();
> +			igt_lsof("/dev/dri");
> +			return IGT_EXIT_SKIP;
> +		}
> +	}
> +
> +	igt_kmod_unload("drm_kms_helper", 0);
> +	igt_kmod_unload("drm", 0);
> +
> +	if (igt_kmod_is_loaded("amdgpu")) {
> +		igt_warn("amdgpu.ko still loaded!\n");
> +		return IGT_EXIT_FAILURE;
> +	}
> +
> +	return IGT_EXIT_SUCCESS;
> +}
> +
>  static void kmsg_dump(int fd)
>  {
>  	char record[4096 + 1];
> diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
> index c71ec147621a..04c87516f1e6 100644
> --- a/lib/igt_kmod.h
> +++ b/lib/igt_kmod.h
> @@ -39,6 +39,9 @@ int igt_kmod_unload(const char *mod_name, unsigned int =
flags);
>  int igt_i915_driver_load(const char *opts);
>  int igt_i915_driver_unload(void);
> =20
> +int igt_amdgpu_driver_load(const char *opts);
> +int igt_amdgpu_driver_unload(void);
> +
>  void igt_kselftests(const char *module_name,
>  		    const char *module_options,
>  		    const char *result_option,
> diff --git a/tests/amdgpu/amd_module_load.c b/tests/amdgpu/amd_module_loa=
d.c
> new file mode 100644
> index 000000000000..77df96d50bb6
> --- /dev/null
> +++ b/tests/amdgpu/amd_module_load.c
> @@ -0,0 +1,83 @@
> +/*
> + * Copyright 2021 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be includ=
ed in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES=
 OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + */
> +
> +#include "igt.h"
> +#include "igt_kmod.h"
> +
> +#include <amdgpu.h>
> +#include <amdgpu_drm.h>
> +#include <sys/ioctl.h>
> +
> +/**
> + * sanity_check:
> + *
> + * Ensures the driver is able to respond to DRM_IOCTL_AMDGPU_INFO ioctl
> + * with a timeout.
> + *
> + */
> +static void sanity_check(void)
> +{
> +	int err =3D 0;
> +	int fd;
> +	int arg_ret;
> +	struct drm_amdgpu_info args =3D {0};
> +
> +	args.return_pointer =3D (uintptr_t) &arg_ret;
> +	args.return_size =3D sizeof(int);
> +	args.query =3D AMDGPU_INFO_HW_IP_INFO;
> +	args.query_hw_ip.type =3D AMDGPU_HW_IP_COMPUTE;
> +
> +	fd =3D drm_open_driver(DRIVER_AMDGPU);
> +	igt_set_timeout(1, "Module reload timeout!");
> +
> +	if (ioctl(fd, DRM_IOCTL_AMDGPU_INFO, &args) < 0)
> +		err =3D -errno;
> +
> +	igt_set_timeout(0, NULL);
> +	close(fd);
> +
> +	igt_assert_eq(err, 0);
> +}
> +
> +igt_main
> +{
> +	igt_describe("Make sure reloading amdgpu drivers works");
> +	igt_subtest("reload") {
> +		int err;
> +		igt_amdgpu_driver_unload();
> +
> +		err =3D igt_amdgpu_driver_load(NULL);
> +
> +		igt_assert_eq(err, 0);
> +
> +		sanity_check();
> +
> +		igt_amdgpu_driver_unload();
> +	}
> +
> +	igt_fixture
> +	{
> +		/* load the module back in */
> +		igt_amdgpu_driver_load(NULL);
> +	}
> +}
> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
> index b92aa22b78e6..84179410b8d3 100644
> --- a/tests/amdgpu/meson.build
> +++ b/tests/amdgpu/meson.build
> @@ -9,6 +9,7 @@ if libdrm_amdgpu.found()
>  			  'amd_cs_nop',
>  			  'amd_info',
>  			  'amd_prime',
> +			  'amd_module_load',
>  			]
>  	amdgpu_deps +=3D libdrm_amdgpu
>  endif
> --=20
> 2.25.1
>

lgtm, thanks

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--a2ovq7bbdawod2ka
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAmDKdk0ACgkQWJzP/com
vP8GKw//UW1JalXazLChXrQaBPW1ax+oBLtPKKnhAVZjU6uHTvHrst1x4blXxauC
H6vJdrlToUF7U0wSAqEKsCXpLTARc0V8JE2pA1IsBWGiE82jqUx8h2/S5uOjcCTm
8fhl0/5AbEmMjOS1dRArzgGFWsfkYjc6XTCFH2XHe9ittH/QnfLBxzSWlCZj5UyZ
T5n233BucWu4wC7RWA759cxC18qSL0oyIiXY7ZSBbt0NYCOB7cuIyLGWibF6rrIb
Ll2lgusCzcGbQ/q1xhSNxYDjyFaTzTEa8sqD/zw8yKjRdTu5mWOVYtKqydeMNKhM
7vXqoeYpjlGHw+6y+nAFLbgwYFGako/YpUnR4dGGKw/Jb/YdOiqCwXNnJgjiSnL+
dX7XLMv83lipiyddizLSilu04zvrnwb7a4Ka/p5EkXT3nQ7iRZZ0ZvH3773RZeE/
jk2Ueb8rPfeV1+QLGxUXrAuODEctkfBPatAex+xDbn2EdKS6nXIvdA176qw65ETF
Le/wvrOkckYVlG7cVFAxUcrKRe2hDXoVAEy6Fb3kU5PWaG4z+ItpoUBoDoNv4zvN
kH+SljHsjDKFTnAHX9De2xMdi/msHwdyU02PJjJCHx85NABBo8rFyZLNhAo0fN0S
QJULij+UQoNZjXnIdcjqEyWpXbGN0vDckWx9kmsHXwvpw2z89ig=
=1Vcs
-----END PGP SIGNATURE-----

--a2ovq7bbdawod2ka--

--===============1859847873==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1859847873==--
