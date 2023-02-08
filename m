Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7789410E1F0
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Feb 2023 10:27:39 +0000 (UTC)
Date: Wed, 8 Feb 2023 09:27:10 -0100
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Message-ID: <20230208102710.6aytohkwffaxpmtk@mail.igalia.com>
References: <20230113124453.196280-1-mcanal@igalia.com>
 <20230113124453.196280-4-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="opdofobo2c7wjbf3"
Content-Disposition: inline
In-Reply-To: <20230113124453.196280-4-mcanal@igalia.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] tests/v3d_job_submission: Create
 tests to mix CL and CSD jobs
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


--opdofobo2c7wjbf3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 01/13, Ma=EDra Canal wrote:
> Add three igt_subtests that combine CL jobs and CSD jobs, to assure the
> proper synchronization of different queues, especially the
> independence between them. Moreover, it tests the relationship between
> single syncobjs and multisync using mixed jobs as well.
>=20
> Signed-off-by: Ma=EDra Canal <mcanal@igalia.com>
> ---
>  tests/v3d/meson.build          |   1 +
>  tests/v3d/v3d_job_submission.c | 212 +++++++++++++++++++++++++++++++++
>  tests/v3d_ci/v3d.testlist      |   3 +
>  3 files changed, 216 insertions(+)
>  create mode 100644 tests/v3d/v3d_job_submission.c
>=20
> diff --git a/tests/v3d/meson.build b/tests/v3d/meson.build
> index d070fdb5..03b4de61 100644
> --- a/tests/v3d/meson.build
> +++ b/tests/v3d/meson.build
> @@ -2,6 +2,7 @@ v3d_progs =3D [
>  	'v3d_create_bo',
>  	'v3d_get_bo_offset',
>  	'v3d_get_param',
> +	'v3d_job_submission',
>  	'v3d_mmap',
>  	'v3d_submit_cl',
>  	'v3d_submit_csd',
> diff --git a/tests/v3d/v3d_job_submission.c b/tests/v3d/v3d_job_submissio=
n.c
> new file mode 100644
> index 00000000..3050284c
> --- /dev/null
> +++ b/tests/v3d/v3d_job_submission.c
> @@ -0,0 +1,212 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =A9 2022 Igalia S.L.
> + */
> +
> +#include "igt.h"
> +#include "igt_v3d.h"
> +#include "igt_syncobj.h"
> +
> +static int fd;
> +
> +#define NUM_CL_JOBS  1000
> +#define NUM_CSD_JOBS 250
> +
> +static int syncobj_wait_array(uint32_t *handles, uint32_t count)
> +{
> +	int i, ret =3D 0;
> +
> +	for (i =3D 0; i < count; i++) {
> +		ret =3D syncobj_wait_err(fd, &handles[i], 1, INT64_MAX, 0);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static void *create_cl_jobs(void *args)
> +{
> +	struct v3d_cl_job **jobs =3D args;
> +	int i;
> +
> +	for (i =3D 0; i < NUM_CL_JOBS; i++) {
> +		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, jobs[i]->submit);
> +		igt_assert(syncobj_wait(fd, &jobs[i]->submit->out_sync, 1,
> +					INT64_MAX, 0, NULL));
> +	}
> +
> +	return NULL;
> +}
> +
> +static void *create_csd_jobs(void *args)
> +{
> +	struct v3d_csd_job **jobs =3D args;
> +	int i;
> +
> +	for (i =3D 0; i < NUM_CSD_JOBS; i++) {
> +		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CSD, jobs[i]->submit);
> +		igt_assert(syncobj_wait(fd, &jobs[i]->submit->out_sync, 1,
> +					INT64_MAX, 0, NULL));
> +	}
> +
> +	return NULL;
> +}
> +
> +igt_main
> +{
> +	igt_fixture {
> +		fd =3D drm_open_driver(DRIVER_V3D);
> +		igt_require(igt_v3d_get_param(fd, DRM_V3D_PARAM_SUPPORTS_CSD));
> +		igt_require(igt_v3d_get_param(fd, DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT=
));
> +	}
> +
> +	igt_describe("Test if the out-sync of an array of mixed jobs is behavin=
g correctly.");
> +	igt_subtest("array-job-submission") {
> +		uint32_t handles[4];
> +		struct v3d_cl_job *cl_jobs[2];
> +		struct v3d_csd_job *csd_jobs[2];
> +		int i;
> +
> +		for (i =3D 0; i < ARRAY_SIZE(handles); i++)
> +			handles[i] =3D syncobj_create(fd, 0);
> +
> +		for (i =3D 0; i < 2; i++) {
> +			cl_jobs[i] =3D igt_v3d_noop_job(fd);
> +			csd_jobs[i] =3D igt_v3d_empty_shader(fd);
> +		}
> +
> +		cl_jobs[0]->submit->out_sync =3D  handles[0];
> +		csd_jobs[0]->submit->out_sync =3D  handles[1];
> +		cl_jobs[1]->submit->out_sync =3D  handles[2];
> +		csd_jobs[1]->submit->out_sync =3D  handles[3];
> +
> +		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, cl_jobs[0]->submit);
> +		igt_assert_eq(syncobj_wait_array(handles, ARRAY_SIZE(handles)), -EINVA=
L);
> +
> +		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CSD, csd_jobs[0]->submit);
> +		igt_assert_eq(syncobj_wait_array(handles, ARRAY_SIZE(handles)), -EINVA=
L);
> +
> +		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, cl_jobs[1]->submit);
> +		igt_assert_eq(syncobj_wait_array(handles, ARRAY_SIZE(handles)), -EINVA=
L);
> +
> +		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CSD, csd_jobs[1]->submit);
> +		igt_assert_eq(syncobj_wait_array(handles, ARRAY_SIZE(handles)), 0);
> +
> +		for (i =3D 0; i < 2; i++) {
> +			igt_v3d_free_cl_job(fd, cl_jobs[i]);
> +			igt_v3d_free_csd_job(fd, csd_jobs[i]);
> +		}
> +	}
> +
> +	igt_describe("Test if multiple singlesyncs have the same behaviour as o=
ne multisync.");
> +	igt_subtest("multiple-singlesync-to-multisync") {
> +		struct drm_v3d_multi_sync ms =3D { 0 };
> +		uint32_t handles[4];
> +		struct v3d_cl_job *cl_jobs[2];
> +		struct v3d_csd_job *csd_jobs[2];
> +		struct drm_v3d_sem *in_syncs, *out_syncs;
> +		int i;
> +
> +		for (i =3D 0; i < ARRAY_SIZE(handles); i++)
> +			handles[i] =3D syncobj_create(fd, 0);
> +
> +		for (i =3D 0; i < 2; i++) {
> +			cl_jobs[i] =3D igt_v3d_noop_job(fd);
> +			csd_jobs[i] =3D igt_v3d_empty_shader(fd);
> +		}
> +
> +		cl_jobs[0]->submit->out_sync =3D  handles[0];
> +		csd_jobs[0]->submit->out_sync =3D  handles[1];
> +		cl_jobs[1]->submit->out_sync =3D  handles[2];
> +
> +		igt_v3d_set_multisync(&ms, V3D_CSD);
> +		ms.in_sync_count =3D 3;
> +		ms.out_sync_count =3D 1;
> +
> +		in_syncs =3D malloc(ms.in_sync_count * sizeof(*in_syncs));
> +		out_syncs =3D malloc(ms.out_sync_count * sizeof(*in_syncs));
> +
> +		for (i =3D 0; i < ms.in_sync_count; i++)
> +			in_syncs[i].handle =3D handles[i];
> +
> +		out_syncs[0].handle =3D handles[3];
> +
> +		ms.in_syncs =3D to_user_pointer(in_syncs);
> +		ms.out_syncs =3D to_user_pointer(out_syncs);
> +
> +		csd_jobs[1]->submit->flags =3D DRM_V3D_SUBMIT_EXTENSION;
> +		csd_jobs[1]->submit->extensions =3D to_user_pointer(&ms);
> +
> +		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, cl_jobs[0]->submit);
> +
> +		do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CSD, csd_jobs[1]->submit, EINVAL=
);
> +		igt_assert_eq(syncobj_wait_array(handles, ARRAY_SIZE(handles)), -EINVA=
L);
> +
> +		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CSD, csd_jobs[0]->submit);
> +
> +		do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CSD, csd_jobs[1]->submit, EINVAL=
);
> +		igt_assert_eq(syncobj_wait_array(handles, ARRAY_SIZE(handles)), -EINVA=
L);
> +
> +		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, cl_jobs[1]->submit);
> +		igt_assert_eq(syncobj_wait_array(handles, ARRAY_SIZE(handles)), -EINVA=
L);
> +
> +		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CSD, csd_jobs[1]->submit);
> +		igt_assert_eq(syncobj_wait_array(handles, ARRAY_SIZE(handles)), 0);
> +
> +		for (i =3D 0; i < 2; i++) {
> +			igt_v3d_free_cl_job(fd, cl_jobs[i]);
> +			igt_v3d_free_csd_job(fd, csd_jobs[i]);
> +		}
> +	}
> +
> +	igt_describe("Test if all queues are progressing independently.");
> +	igt_subtest("threaded-job-submission") {

As this test takes longer than usual, can you add a progress bar here?
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/lib/igt_aux.=
c#L686

> +		struct v3d_cl_job **cl_jobs =3D NULL;
> +		struct v3d_csd_job **csd_jobs =3D NULL;
> +		pthread_t *threads[2];
> +		int i, ret;
> +
> +		cl_jobs =3D malloc(NUM_CL_JOBS * sizeof(*cl_jobs));
> +		csd_jobs =3D malloc(NUM_CSD_JOBS * sizeof(*csd_jobs));
> +
> +		for (i =3D 0; i < NUM_CL_JOBS; i++) {
> +			cl_jobs[i] =3D igt_v3d_noop_job(fd);
> +			cl_jobs[i]->submit->out_sync =3D syncobj_create(fd, DRM_SYNCOBJ_CREAT=
E_SIGNALED);
> +		}
> +
> +		for (i =3D 0; i < NUM_CSD_JOBS; i++) {
> +			csd_jobs[i] =3D igt_v3d_empty_shader(fd);
> +			csd_jobs[i]->submit->out_sync =3D syncobj_create(fd, DRM_SYNCOBJ_CREA=
TE_SIGNALED);
> +		}
> +
> +		for (i =3D 0; i < ARRAY_SIZE(threads); i++) {
> +			threads[i] =3D malloc(sizeof(*threads[i]));
> +			igt_assert(threads[i] !=3D NULL);
> +		}
> +
> +		ret =3D pthread_create(threads[0], NULL, &create_cl_jobs, cl_jobs);
> +		igt_assert_eq(ret, 0);
> +
> +		ret =3D pthread_create(threads[1], NULL, &create_csd_jobs, csd_jobs);
> +		igt_assert_eq(ret, 0);
> +
> +		for (i =3D 0; i < ARRAY_SIZE(threads); i++)
> +			pthread_join(*threads[i], NULL);
> +
> +		for (i =3D 0; i < NUM_CL_JOBS; i++)
> +			igt_v3d_free_cl_job(fd, cl_jobs[i]);
> +
> +		for (i =3D 0; i < NUM_CSD_JOBS; i++)
> +			igt_v3d_free_csd_job(fd, csd_jobs[i]);
> +
> +		for (i =3D 0; i < ARRAY_SIZE(threads); i++)
> +			free(threads[i]);
> +
> +		free(cl_jobs);
> +		free(csd_jobs);
> +	}
> +
> +	igt_fixture
> +		close(fd);
> +}
> diff --git a/tests/v3d_ci/v3d.testlist b/tests/v3d_ci/v3d.testlist
> index 5452fd99..106e9cf2 100644
> --- a/tests/v3d_ci/v3d.testlist
> +++ b/tests/v3d_ci/v3d.testlist
> @@ -7,6 +7,9 @@ igt@v3d/v3d_get_bo_offset@get-bad-handle
>  igt@v3d/v3d_get_param@base-params
>  igt@v3d/v3d_get_param@get-bad-param
>  igt@v3d/v3d_get_param@get-bad-flags
> +igt@v3d/v3d_job_submission@array-job-submission
> +igt@v3d/v3d_job_submission@multiple-singlesync-to-multisync
> +igt@v3d/v3d_job_submission@threaded-job-submission
>  igt@v3d/v3d_mmap@mmap-bad-flags
>  igt@v3d/v3d_mmap@mmap-bad-handle
>  igt@v3d/v3d_mmap@mmap-bo
> --=20
> 2.39.0
>=20

--opdofobo2c7wjbf3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmPjeOwACgkQwqF3j0dL
ehxDGBAApZhEHPBZDv4CHSI/IP+TO7sbtM/Ra9vy+XVZtbNMYRhbBzLOPR5SjYX1
vmbDv9nhfNlbtxHJRA4VcPQydkDjScAdZUcCOJuPH1+Vzr5yhXiJl4K4YKCJvLey
VuLcWjn6n3JXhPcl5cJYLQ8ibiYZEHroqh2VVJwf+JbehPyz2UDZ6x8DXR5t3Xrg
4uWJAXA/Yxw/r69CqGLVS8UjppstTzs0Pk6QNc0avwD0qxvlOsn1ByQngj0DBDwD
cv/xxJMs7UmaVe6abTv1uE+Cyc/JOJfwQFImMrpunCF26ZWfgpbBI/BAaULuNumA
8Kq7k7vnIwlzqZqn3juYigNry4ex2EgcZvLRmbDaYQAOW32r3CbkMGdbSl54/oEn
X58FvoHS64UvSjD+9KXeXFW1O40Lg68Jlo0ygGjMHEZBbDkQpZlbLEIJmOxwD1w2
EfeuYtzLsPLodRp5BIHEeRnmlDaoVTssjx04gGuZ6mKHKAA8P5CLBG/CD9FDg9SB
zZBXb+K7v+mTj3Sr6NyBJtlGWub0eK+Fx4oTutSCKr6qp1vMbqyPPT5tgSK4pUaB
GaPUYubs6vm/Fu+fqdPJZOSciNEy1QIjKOIaaqJ2lGCrfehmjejS0Hvvv6naED+8
71tVrzuFexdrA1Ilp88o8TbGczQdoBu/kuBljO2nRl+ZnduvROA=
=6duG
-----END PGP SIGNATURE-----

--opdofobo2c7wjbf3--
