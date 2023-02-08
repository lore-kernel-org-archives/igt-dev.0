Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21BAA10E60E
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Feb 2023 10:31:44 +0000 (UTC)
Date: Wed, 8 Feb 2023 09:31:27 -0100
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Message-ID: <20230208103101.xetna4f5r2mqrugc@mail.igalia.com>
References: <20230113124453.196280-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="e6df3f5rm4gpamr4"
Content-Disposition: inline
In-Reply-To: <20230113124453.196280-1-mcanal@igalia.com>
Subject: Re: [igt-dev] [PATCH i-g-t 0/3] V3D Mixed Job Submission Tests
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
 Iago Toral Quiroga <itoral@igalia.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


--e6df3f5rm4gpamr4
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o2t46ecbr3e6kn5q"
Content-Disposition: inline


--o2t46ecbr3e6kn5q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 01/13, Ma=EDra Canal wrote:
> Currently, the V3D tests only support CL job submissions [1], while V3D h=
as also
> capabilities for CSD and TFU jobs. Therefore, create tests for
> DRM_IOCTL_V3D_SUBMIT_CSD, an ioctl for dispatching compute shader jobs to=
 the
> GPU. In order to create a simple CSD job, I hard-coded the pipeline assem=
bly
> shader of an empty shader in order to reproduce a shader and be able to c=
reate
> an acceptable packet that can be sent to the GPU.
>=20
> So, patch 1 introduces a helper function to submit a minimal CSD job to t=
he GPU,
> which will be useful for the tests. The minimal job will use the pipeline
> assembly shader of an empty shader. Patches 2-3 will include new tests in=
 the
> V3D test suite for DRM_IOCTL_V3D_SUBMIT_CSD and create tests that mix dif=
ferent
> types of jobs, in order to evaluate the synchronization between the two t=
ypes of
> jobs.=20
>=20
> [1] This series depends on https://patchwork.freedesktop.org/series/11236=
3/

Hi Ma=EDra,

Thanks for the extensive testing.
I just commented about a minor improvement for threaded-submission test.
With this in the next version, you can add:

Reviewed-by: Melissa Wen <mwen@igalia.com>

Thanks,

Melissa
>=20
> Best Regards,
> - Ma=EDra Canal
>=20
> Ma=EDra Canal (3):
>   lib/v3d: Add a helper to create a empty shader
>   tests/v3d_submit_csd: Create test for V3D's Submit CSD IOCTL
>   tests/v3d_job_submission: Create tests to mix CL and CSD jobs
>=20
>  lib/igt_v3d.c                  |  60 ++++++
>  lib/igt_v3d.h                  |  20 ++
>  tests/v3d/meson.build          |   2 +
>  tests/v3d/v3d_job_submission.c | 212 ++++++++++++++++++++
>  tests/v3d/v3d_submit_csd.c     | 357 +++++++++++++++++++++++++++++++++
>  tests/v3d_ci/v3d.testlist      |  21 ++
>  6 files changed, 672 insertions(+)
>  create mode 100644 tests/v3d/v3d_job_submission.c
>  create mode 100644 tests/v3d/v3d_submit_csd.c
>=20
> --=20
> 2.39.0
>=20

--o2t46ecbr3e6kn5q--

--e6df3f5rm4gpamr4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmPjef8ACgkQwqF3j0dL
ehyLNg//RR4cJyDZdrdl6T8KBQAIcuJ7rKv6yEm9xYDHO7SfuZdSJYMXedPVBIzd
M6eRIUwCPgxpDznAnr4BD16lwcZhx0b3qGYPEyDeKBOImZtKs9pB8rGc40TdLhND
4xslxN3fZ/YEkeIT9JVRFdgB58hFu4FZBCSTodLh8yT+0zL/l3EXlGkVNGdnNGBa
DWNDvBFff9agN6ne3b37QyRoBk4J5WXLjnH9chSOSpOvC4gaFgUbW6E7yA6dB8Q6
U+pCy7+mxINg13gW/jOfnumv4Q9j8gHO+TTs1VAymNVOBd43tcI3AEeWBm+7cEsu
77a7AzIMIMlrH1Hw0XHL8qibr2dWlF9Rotx/ESfE/r5pwBB4byxwIxXseZwBdEmT
vH5RKbgcZXJZi40VnPvlFo5pg4Yf/x23R5HyF67uhF3ZjDDGvCSUKY4AdI0EI1/P
DVtzs/Iu/4bhY0mJiDxXwVq0HE+icyHt2nEcxSevOdDsi8Ku7iIXO/ofZ8rNBsGt
ed5Ve7WZTgaFYLsdGU5DVjehhgMsU3/1pS1SFzGiE6+zm//b4t0CEpkeE4VfWmtm
Xv+W03kCpp/Yh4RR3cmU21pVWxbSuxuofpbaAEPEFlfo7EgRvyGyGJj8jRSX/j9L
27XJknh8oD2wd8TyVa0GDsNbuv9UUvKo9QgMssbdKn4hdI9McUI=
=k/2U
-----END PGP SIGNATURE-----

--e6df3f5rm4gpamr4--
