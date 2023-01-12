Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA3910E1A0
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jan 2023 11:24:18 +0000 (UTC)
Date: Thu, 12 Jan 2023 10:24:02 -0100
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Message-ID: <20230112112402.y3p5l2r2vjim4mir@mail.igalia.com>
References: <20230103105835.604394-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="45xrnl7njy3mykbm"
Content-Disposition: inline
In-Reply-To: <20230103105835.604394-1-mcanal@igalia.com>
Subject: Re: [igt-dev] [PATCH i-g-t 0/6] V3D Job Submission Tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>, igt-dev@lists.freedesktop.org,
 Petri Latvala <petri.latvala@intel.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Jason Ekstrand <jason.ekstrand@collabora.com>,
 Iago Toral Quiroga <itoral@igalia.com>, Emma Anholt <emma@anholt.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


--45xrnl7njy3mykbm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 01/03, Ma=EDra Canal wrote:
> Currently, the V3D tests don't cover the job submission feature of the dr=
iver.
> Therefore, create tests for DRM_IOCTL_V3D_SUBMIT_CL, an ioctl for submitt=
ing
> commands to the 3D engine. In order to develop the tests, it was necessar=
y to
> bring some Mesa structures to IGT. Those structures have the definitions =
needed
> for the creation of an acceptable packet that can be sent to the GPU.
>=20
> So, patches 1-3 add the Mesa structures needed for the tests and also cre=
ate a
> struct to manage a CL job, the struct v3d_cl_job. Patch 4 introduces a he=
lper
> function to submit a minimal job to the GPU, which will be useful for the=
 tests.
> The minimal job will use the Mesa structures to produce a minimal valid p=
acket.
> Finally, patches 5-6 include new tests in the V3D test suite for
> DRM_IOCTL_V3D_WAIT_BO and DRM_IOCTL_V3D_SUBMIT_CL. The tests for the Wait=
 BO
> IOCTL depend on the submission of a job, so they are included in this ser=
ies.

Hi Ma=EDra,

I suggested minor adjusts in the last set of tests for CL job
submissions. Otherwise, LGTM.

With those comments addressed, you can add to the next version:
Reviewed-by: Melissa Wen <mwen@igalia.com>

Thanks for your comprehensive work!

Melissa
>=20
> Best Regards,
> - Ma=EDra Canal
>=20
> Ma=EDra Canal (6):
>   lib/v3d: Add V3D packet helpers
>   lib/v3d: Add V3D packet description
>   lib/v3d: Introduce the struct v3d_cl_job
>   lib/v3d: Add a helper to create a noop job
>   tests/v3d_wait_bo: Create test for V3D's Wait BO IOCTL
>   tests/v3d_submit_cl: Create test for V3D's Submit CL IOCTL
>=20
>  lib/bitpack_helpers.h        |   78 +
>  lib/igt_v3d.c                |  182 ++
>  lib/igt_v3d.h                |   18 +
>  lib/v3d/v3d_cl.h             |  157 ++
>  lib/v3d/v3d_packet.h         | 5164 ++++++++++++++++++++++++++++++++++
>  lib/v3d/v3d_packet_helpers.h |  119 +
>  tests/v3d/meson.build        |    2 +
>  tests/v3d/v3d_submit_cl.c    |  352 +++
>  tests/v3d/v3d_wait_bo.c      |  127 +
>  tests/v3d_ci/v3d.testlist    |   27 +
>  10 files changed, 6226 insertions(+)
>  create mode 100644 lib/bitpack_helpers.h
>  create mode 100644 lib/v3d/v3d_cl.h
>  create mode 100644 lib/v3d/v3d_packet.h
>  create mode 100644 lib/v3d/v3d_packet_helpers.h
>  create mode 100644 tests/v3d/v3d_submit_cl.c
>  create mode 100644 tests/v3d/v3d_wait_bo.c
>=20
> --=20
> 2.38.1
>=20

--45xrnl7njy3mykbm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmO/7dIACgkQwqF3j0dL
ehxWRw/8DXcVdbGugzczXzx7RVYTk+65HG9T1Yxa7WLN7SaNvXJy+qFw7ZlrDgYh
KdPH6rOUAI5nZ4bcef+FOFr7gYqIAO7FoEx0SR4AorepDHwglmttIvQfE32Bz0FL
i0GvtJcewv/3wBh3TrmPP1ltQBZalvOGO/kMib7mOUn1MaFEGmnirsPM4VcWIWiZ
2jIZhGpWe3Br9Ygww7hlRTQhvHV7e2GkVHZyWFbju8bs3E27HzaE7X9Os9zG5OWu
bCs7ageJKgWKu521PWYh60CAyDloK5TCyVQG+HKO+NALrxmbNr4V9L/hx+hYHovs
CYuJCAiOpGng1r8QTa4e2dnGd9QgOnd6e0IOF7WYO7doqJtlSB9Hp1DvjNgR0EER
o2Tm4ERFAxuAE3boxKGveOJUNc8x2FwPcYnQsGingFE+0EfKaqcimwJ8XO1a4GD8
8u7du8xBFOBOSu2OBEkXPLw+jHm9KfcbLMq84EIX2mK1rks3CSg6qXkj9dQR55jW
+AA1W2bfUySEJ3SOoM39EcX0Bxm2fwP6/pxQ3E+DfWzWtoKRc60HCJt1ki9N94RX
1IQza7fRa+hDDPWIb40Aotmo1VgNzWKvgnjIfobL9JtNyHEYXqrzS+K6FUysFyqF
RJg81VmpTD/MuKVbLjkY2rnmi7ppjYVCgeC5PphYPDGq06wNWEQ=
=2Dab
-----END PGP SIGNATURE-----

--45xrnl7njy3mykbm--
