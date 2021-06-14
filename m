Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4576189243
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 19:38:23 +0000 (UTC)
Date: Mon, 14 Jun 2021 15:38:18 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20210614193818.xago7unmdbqk4gfk@outlook.office365.com>
References: <20210614153557.19934-1-Anson.Jacob@amd.com>
In-Reply-To: <20210614153557.19934-1-Anson.Jacob@amd.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/amdgpu: Introduced new amdgpu
 module reload test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1433877762=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Anson Jacob <Anson.Jacob@amd.com>
Cc: igt-dev@lists.freedesktop.org, Victor Lu <victorchengchi.lu@amd.com>, markyacoub@google.com
List-ID: <igt-dev@lists.freedesktop.org>

--===============1433877762==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7fad3ka4bii5qte4"
Content-Disposition: inline

--7fad3ka4bii5qte4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Anson and Victor,

First of all, thanks for sending this patch. See my comments inline.

On 06/14, Anson Jacob wrote:
> From: Victor Lu <victorchengchi.lu@amd.com>
>=20
> Based off of i915/i915_module_load, unloads and loads the
> amdgpu module.

Maybe expand this commit message to describe better why and how we test
our load and unload. Consider highlighting which ASIC you tested this
patch.
=20
> Signed-off-by: Victor Lu <victorchengchi.lu@amd.com>
> Acked-by: Anson Jacob <Anson.Jacob@amd.com>

Anson, since you're working in this test, I think it make sense that you
add the tag "Co-developed-by: YOUR NAME <YOUR@EMAIL>" and your Sob.

> ---
>  lib/igt_kmod.c                 | 41 ++++++++++++++++++
>  lib/igt_kmod.h                 |  3 ++
>  tests/amdgpu/amd_module_load.c | 77 ++++++++++++++++++++++++++++++++++
>  tests/amdgpu/meson.build       |  1 +
>  4 files changed, 122 insertions(+)
>  create mode 100644 tests/amdgpu/amd_module_load.c
>=20
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 55295fa5..69bdc810 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -433,6 +433,47 @@ igt_i915_driver_unload(void)
>  	return IGT_EXIT_SUCCESS;
>  }
> =20
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
> index c71ec147..04c87516 100644
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
> index 00000000..e682d2c5
> --- /dev/null
> +++ b/tests/amdgpu/amd_module_load.c
> @@ -0,0 +1,77 @@
> +/*
> + * Copyright 2020 Advanced Micro Devices, Inc.

s/2020/2021/

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
> + * Adapted from /tests/i915/i915_module_load.c
> + */

Consider describing our way to run this sanity check instead of
referencing another file.

> +static void
> +sanity_check(void)

In this patch, I noticed that you declared functions with two and one
lines. How about keeping all functions declared in a single line (when
it is possible, ofc) to keep things consistent?

> +{
> +	int err =3D 0;
> +	int fd;
> +	int arg_ret;
> +	struct drm_amdgpu_info args =3D {0};

Add a new line to separate the declaration from the utilization.

> +	args.return_pointer =3D (uintptr_t) &arg_ret;
> +	args.return_size =3D sizeof(int);
> +	args.query =3D AMDGPU_INFO_HW_IP_INFO;
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
> +	igt_assert_f(err, 0);
> +}
> +
> +igt_main
> +{
> +	igt_subtest("reload") {

Add an igt_describe.

Best Regards
Siqueira

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
> index b92aa22b..84179410 100644
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
>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--7fad3ka4bii5qte4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAmDHsCoACgkQWJzP/com
vP//xhAAq9EcW4vDhGIpeF2JI1YFlD1y0zi65e67IL4gLw559EVQJlouHiQ2EVO7
YhFa+f1fLBqOmDZgdEc8LLDB2PCfk6xye6S89u3sLLF2L+hezbhIZUp0NNxJrsOa
DPjFmBFSX5FuolLRJMjxfpsCBx8do5INcGZZxfbUZnkJB40Oy03sseoOGWiCLq1S
G1jwQH9yNYFidTg7cCo/VKR7cYYBINzKIEMJ95WhwmFGHFs8CEl3L4cR8FYYGYcy
Ld1r92wwkMfDCMnzLwZcZj3EEzDJQU5n8ar0a+jr2INmzC4f4c2iLBnuketf2toN
JTzwlkmkhvUHrcTNb4ua5uhmz9+KJHlO5jONrU4YjWfMswTzoLnVZ2OKGvLghrZi
LeppMz5Dzfw+yxpREU9r88HhwCCgxnGmre13X4MF69RQS5WlVb1DkOfEZPyJtZ3q
FdK7Dz+lMVjsdLJSV/V3iy+WzoLh2mWODMhqlUCIgoJAn9AOsAIuGBrSQz9Yfmxf
S+CUupUtpYFTS+L37a9lSNMVcP3LjlMrCvGiLpS5HmfgV7+S414UiJ4i7LNwYA0y
de3omyzkZHIO8VBBbLC7SxT/za2h/FDJdBsjeu+EkzylVmldPsTzKuMfHrodkv44
KkbbS0cmiQXr8wAo/sykn7P/MYrGqC1H4BvPLr3Vs1Fl+pxftt4=
=iJbY
-----END PGP SIGNATURE-----

--7fad3ka4bii5qte4--

--===============1433877762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1433877762==--
