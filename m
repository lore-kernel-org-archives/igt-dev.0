Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2076.outbound.protection.outlook.com [40.107.96.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646826E845
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jun 2021 23:01:19 +0000 (UTC)
Date: Wed, 16 Jun 2021 19:01:13 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20210616230113.hpaw3vp6uvznpnt2@outlook.office365.com>
References: <20210616135547.154645-1-Anson.Jacob@amd.com>
 <20210616220819.24oajh2al4ne7ivp@outlook.office365.com>
In-Reply-To: <20210616220819.24oajh2al4ne7ivp@outlook.office365.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH V2] tests/amdgpu: Add amdgpu module reload test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1343475748=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Anson Jacob <Anson.Jacob@amd.com>
Cc: igt-dev@lists.freedesktop.org, Mark Yacoub <markyacoub@google.com>, Petri Latvala <petri.latvala@intel.com>, Victor Lu <victorchengchi.lu@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1343475748==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qwufla4ihmdg5lbk"
Content-Disposition: inline

--qwufla4ihmdg5lbk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 06/16, Rodrigo Siqueira wrote:
> On 06/16, Anson Jacob wrote:
> > From: Victor Lu <victorchengchi.lu@amd.com>
> >=20
> > Test to ensure unloading and loading of amdgpu driver works
> >=20
> > Tested on:
> > ASIC: NAVI14
> >=20
> > Changes since v1:
> > * Added documentaion
> > * Updated commit message
> >=20
> > Signed-off-by: Victor Lu <victorchengchi.lu@amd.com>
> > Co-developed-by: Anson Jacob <Anson.Jacob@amd.com>
> > Cc: Petri Latvala <petri.latvala@intel.com>
> > Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> > Cc: Harry Wentland <harry.wentland@amd.com>
> > Cc: Mark Yacoub <markyacoub@google.com>
> > ---
> >  lib/igt_kmod.c                 | 59 ++++++++++++++++++++++++
> >  lib/igt_kmod.h                 |  3 ++
> >  tests/amdgpu/amd_module_load.c | 83 ++++++++++++++++++++++++++++++++++
> >  tests/amdgpu/meson.build       |  1 +
> >  4 files changed, 146 insertions(+)
> >  create mode 100644 tests/amdgpu/amd_module_load.c
> >=20
> > diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> > index 55295fa5d09d..10e983844066 100644
> > --- a/lib/igt_kmod.c
> > +++ b/lib/igt_kmod.c
> > @@ -433,6 +433,65 @@ igt_i915_driver_unload(void)
> >  	return IGT_EXIT_SUCCESS;
> >  }
> > =20
> > +/**
> > + * igt_amdgpu_driver_load:
> > + * @opts: options to pass to amdgpu driver
> > + *
> > + * Returns: IGT_EXIT_SUCCESS or IGT_EXIT_FAILURE.
> > + *
> > + * Loads the amdgpu driver and its dependencies.
> > + *
> > + */
> > +int
> > +igt_amdgpu_driver_load(const char *opts)
> > +{
> > +	if (opts)
> > +		igt_info("Reloading amdgpu with %s\n\n", opts);
> > +
> > +	if (igt_kmod_load("amdgpu", opts)) {
> > +		igt_warn("Could not load amdgpu\n");
> > +		return IGT_EXIT_FAILURE;
> > +	}
> > +
> > +	bind_fbcon(true);
> > +
> > +	return IGT_EXIT_SUCCESS;
> > +}
> > +
> > +/**
> > + * igt_amdgpu_driver_unload:
> > + *
> > + * Returns: IGT_EXIT_SUCCESS on success, IGT_EXIT_FAILURE on failure
> > + * and IGT_EXIT_SKIP if amdgpu could not be unloaded.
> > + *
> > + * Unloads the amdgpu driver and its dependencies.
> > + *
> > + */
> > +int
> > +igt_amdgpu_driver_unload(void)
> > +{
> > +	bind_fbcon(false);
> > +
> > +	if (igt_kmod_is_loaded("amdgpu")) {
> > +		if (igt_kmod_unload("amdgpu", 0)) {
> > +			igt_warn("Could not unload amdgpu\n");
> > +			igt_kmod_list_loaded();
> > +			igt_lsof("/dev/dri");
> > +			return IGT_EXIT_SKIP;
> > +		}
> > +	}
> > +
> > +	igt_kmod_unload("drm_kms_helper", 0);
> > +	igt_kmod_unload("drm", 0);
> > +
> > +	if (igt_kmod_is_loaded("amdgpu")) {
> > +		igt_warn("amdgpu.ko still loaded!\n");
> > +		return IGT_EXIT_FAILURE;
> > +	}
> > +
> > +	return IGT_EXIT_SUCCESS;
> > +}
> > +
> >  static void kmsg_dump(int fd)
> >  {
> >  	char record[4096 + 1];
> > diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
> > index c71ec147621a..04c87516f1e6 100644
> > --- a/lib/igt_kmod.h
> > +++ b/lib/igt_kmod.h
> > @@ -39,6 +39,9 @@ int igt_kmod_unload(const char *mod_name, unsigned in=
t flags);
> >  int igt_i915_driver_load(const char *opts);
> >  int igt_i915_driver_unload(void);
> > =20
> > +int igt_amdgpu_driver_load(const char *opts);
> > +int igt_amdgpu_driver_unload(void);
> > +
> >  void igt_kselftests(const char *module_name,
> >  		    const char *module_options,
> >  		    const char *result_option,
> > diff --git a/tests/amdgpu/amd_module_load.c b/tests/amdgpu/amd_module_l=
oad.c
> > new file mode 100644
> > index 000000000000..77df96d50bb6
> > --- /dev/null
> > +++ b/tests/amdgpu/amd_module_load.c
> > @@ -0,0 +1,83 @@
> > +/*
> > + * Copyright 2021 Advanced Micro Devices, Inc.
> > + *
> > + * Permission is hereby granted, free of charge, to any person obtaini=
ng a
> > + * copy of this software and associated documentation files (the "Soft=
ware"),
> > + * to deal in the Software without restriction, including without limi=
tation
> > + * the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,
> > + * and/or sell copies of the Software, and to permit persons to whom t=
he
> > + * Software is furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be incl=
uded in
> > + * all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT =
SHALL
> > + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAG=
ES OR
> > + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWIS=
E,
> > + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE =
OR
> > + * OTHER DEALINGS IN THE SOFTWARE.
> > + *
> > + */
> > +
> > +#include "igt.h"
> > +#include "igt_kmod.h"
> > +
> > +#include <amdgpu.h>
> > +#include <amdgpu_drm.h>
> > +#include <sys/ioctl.h>
> > +
> > +/**
> > + * sanity_check:
> > + *
> > + * Ensures the driver is able to respond to DRM_IOCTL_AMDGPU_INFO ioctl
> > + * with a timeout.
> > + *
> > + */
> > +static void sanity_check(void)
> > +{
> > +	int err =3D 0;
> > +	int fd;
> > +	int arg_ret;
> > +	struct drm_amdgpu_info args =3D {0};
> > +
> > +	args.return_pointer =3D (uintptr_t) &arg_ret;
> > +	args.return_size =3D sizeof(int);
> > +	args.query =3D AMDGPU_INFO_HW_IP_INFO;
> > +	args.query_hw_ip.type =3D AMDGPU_HW_IP_COMPUTE;
> > +
> > +	fd =3D drm_open_driver(DRIVER_AMDGPU);
> > +	igt_set_timeout(1, "Module reload timeout!");
> > +
> > +	if (ioctl(fd, DRM_IOCTL_AMDGPU_INFO, &args) < 0)
> > +		err =3D -errno;
> > +
> > +	igt_set_timeout(0, NULL);
> > +	close(fd);
> > +
> > +	igt_assert_eq(err, 0);
> > +}
> > +
> > +igt_main
> > +{
> > +	igt_describe("Make sure reloading amdgpu drivers works");
> > +	igt_subtest("reload") {
> > +		int err;
> > +		igt_amdgpu_driver_unload();
> > +
> > +		err =3D igt_amdgpu_driver_load(NULL);
> > +
> > +		igt_assert_eq(err, 0);
> > +
> > +		sanity_check();
> > +
> > +		igt_amdgpu_driver_unload();
> > +	}
> > +
> > +	igt_fixture
> > +	{
> > +		/* load the module back in */
> > +		igt_amdgpu_driver_load(NULL);
> > +	}
> > +}
> > diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
> > index b92aa22b78e6..84179410b8d3 100644
> > --- a/tests/amdgpu/meson.build
> > +++ b/tests/amdgpu/meson.build
> > @@ -9,6 +9,7 @@ if libdrm_amdgpu.found()
> >  			  'amd_cs_nop',
> >  			  'amd_info',
> >  			  'amd_prime',
> > +			  'amd_module_load',
> >  			]
> >  	amdgpu_deps +=3D libdrm_amdgpu
> >  endif
> > --=20
> > 2.25.1
> >
>=20
> lgtm, thanks
>=20
> Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>=20
>=20
> --=20
> Rodrigo Siqueira
> https://siqueira.tech

Applied,

Thanks a lot for your patch.

--=20
Rodrigo Siqueira
https://siqueira.tech

--qwufla4ihmdg5lbk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAmDKgrUACgkQWJzP/com
vP9YRw//XfiOEXVg+dmA/KyE9hVmBnP/VGIEezacyT+JMp11x0KDt1QjNGeQbqza
kU/nWm0+dPb5Fn+6G6m2jE94927GMjD6opPKmdYeQSP8XXWduVVaVbskEK+efZ54
j6fr/xaS8PLJZFIDuhijrmp2o0UJdHl4YBq9HVkL7AtwBN4oSIzm6zEwQGy+/lXp
VHbiY22EkM4/+S3s3YPqJp2EdU91RIRlqYRINfZFrQuvDv0x3g7oAJ347LA4NkwM
LNkD2wGjXa/t2PMORD3uTP8wbqqqUb4+wwz7wBi55JB8LvCTpy0vy7yi+KY8e4tR
BIjTdqeW7i6kakdYNiRXRfYD8U7NnAITCGnbwHq6LIziCTyrTT0HzV25NRsg/bME
b4BYkN4Tixye8GJSHT6GerD7tlfLLCtMqQsw2a3rSKrrWTqNblRzfnTDLwlfG9bC
CEhykRyoy3gEP/QNpqcbp87h0Jab7dVt9ZBCOqOMjILJA8lxEw54CL+SMt90gXHt
1VikCdfWsmL0BENE9VVP+bfTnjm0YiiyMfYyKQxbqmnZ2xJ4HweLLl/khD2cjGl9
PPK+gmVoEK6H3wYrB0gTV/ohhm7oP8g/vXNFwbH4wEm+bk101QB55hmjrUejNonF
OBq+dQ5WUy9EMGUYgdeWqdpblkY6bRl7ewAgE0ujeOVMjbaHL5E=
=KSB4
-----END PGP SIGNATURE-----

--qwufla4ihmdg5lbk--

--===============1343475748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1343475748==--
