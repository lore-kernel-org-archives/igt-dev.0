Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6867E10E1A0
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jan 2023 11:20:56 +0000 (UTC)
Date: Thu, 12 Jan 2023 10:20:32 -0100
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Message-ID: <20230112112032.jsk3ufradyj4tpai@mail.igalia.com>
References: <20230103105835.604394-1-mcanal@igalia.com>
 <20230103105835.604394-7-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2dife6v7f4ifnww5"
Content-Disposition: inline
In-Reply-To: <20230103105835.604394-7-mcanal@igalia.com>
Subject: Re: [igt-dev] [PATCH i-g-t 6/6] tests/v3d_submit_cl: Create test
 for V3D's Submit CL IOCTL
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


--2dife6v7f4ifnww5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 01/03, Ma=EDra Canal wrote:
> Add eighteen igt_subtests for the DRM_IOCTL_V3D_SUBMIT_CL, which ensures
> that improper parameters return an errno and test multisync and simple
> sync abilities. For most of the subtests, the noop job is the base of
> the submission, as it is one of the simplest jobs possible, allowing it
> to test the synchronization abilities of the V3D.
>=20
> Signed-off-by: Ma=EDra Canal <mcanal@igalia.com>
> ---
>  lib/igt_v3d.c             |   8 +
>  lib/igt_v3d.h             |   2 +
>  tests/v3d/meson.build     |   1 +
>  tests/v3d/v3d_submit_cl.c | 352 ++++++++++++++++++++++++++++++++++++++
>  tests/v3d_ci/v3d.testlist |  18 ++
>  5 files changed, 381 insertions(+)
>  create mode 100644 tests/v3d/v3d_submit_cl.c
>=20
> diff --git a/lib/igt_v3d.c b/lib/igt_v3d.c
> index 1ac55ea8..cc8f410d 100644
> --- a/lib/igt_v3d.c
> +++ b/lib/igt_v3d.c
> @@ -172,6 +172,14 @@ void igt_v3d_perfmon_destroy(int fd, uint32_t id)
>  	do_ioctl(fd, DRM_IOCTL_V3D_PERFMON_DESTROY, &destroy);
>  }
> =20
> +void igt_v3d_set_multisync(struct drm_v3d_multi_sync *ms, enum v3d_queue=
 wait_stage)
> +{
> +	ms->base.next =3D to_user_pointer(NULL);
> +	ms->base.id =3D DRM_V3D_EXT_ID_MULTI_SYNC;
> +	ms->base.flags =3D 0;
> +	ms->wait_stage =3D wait_stage;
> +}
> +
>  static void v3d_cl_init(int fd, struct v3d_cl **cl)
>  {
>  	struct v3d_bo *bo =3D igt_v3d_create_bo(fd, PAGE_SIZE);
> diff --git a/lib/igt_v3d.h b/lib/igt_v3d.h
> index af2c9c2f..2cf7fbd8 100644
> --- a/lib/igt_v3d.h
> +++ b/lib/igt_v3d.h
> @@ -62,6 +62,8 @@ uint32_t igt_v3d_perfmon_create(int fd, uint32_t ncount=
ers, uint8_t *counters);
>  void igt_v3d_perfmon_get_values(int fd, uint32_t id);
>  void igt_v3d_perfmon_destroy(int fd, uint32_t id);
> =20
> +void igt_v3d_set_multisync(struct drm_v3d_multi_sync *ms, enum v3d_queue=
 wait_stage);
> +
>  struct v3d_cl_job *igt_v3d_noop_job(int fd);
>  void igt_v3d_free_cl_job(int fd, struct v3d_cl_job *job);
> =20
> diff --git a/tests/v3d/meson.build b/tests/v3d/meson.build
> index 7b4257f9..be92fd66 100644
> --- a/tests/v3d/meson.build
> +++ b/tests/v3d/meson.build
> @@ -3,6 +3,7 @@ v3d_progs =3D [
>  	'v3d_get_bo_offset',
>  	'v3d_get_param',
>  	'v3d_mmap',
> +	'v3d_submit_cl',
>  	'v3d_perfmon',
>  	'v3d_wait_bo',
>  ]
> diff --git a/tests/v3d/v3d_submit_cl.c b/tests/v3d/v3d_submit_cl.c
> new file mode 100644
> index 00000000..d7d2a25a
> --- /dev/null
> +++ b/tests/v3d/v3d_submit_cl.c
> @@ -0,0 +1,352 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =A9 2022 Igalia S.L.
> + */
> +
> +#include "igt.h"
> +#include "igt_v3d.h"
> +#include "igt_syncobj.h"
> +
> +/* One tenth of a second */
> +#define SHORT_TIME_NSEC 100000000ull
> +
> +#define NSECS_PER_SEC 1000000000ull
> +
> +static uint64_t
> +gettime_ns(void)
> +{
> +	struct timespec current;
> +	clock_gettime(CLOCK_MONOTONIC, &current);
> +	return (uint64_t)current.tv_sec * NSECS_PER_SEC + current.tv_nsec;
> +}
> +
> +static uint64_t
> +short_timeout(void)
> +{
> +	return gettime_ns() + SHORT_TIME_NSEC;
> +}
> +
> +igt_main
> +{
> +	int fd;
> +
> +	igt_fixture
> +		fd =3D drm_open_driver(DRIVER_V3D);
> +
> +	igt_describe("Make sure a submission cannot be accepted with a pad diff=
erent than zero.");
> +	igt_subtest("bad-pad") {
> +		struct drm_v3d_submit_cl submit =3D {
> +			.pad =3D 1
> +		};
> +		do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CL, &submit, EINVAL);
> +	}
> +
> +	igt_describe("Make sure a submission cannot be accepted with flags diff=
erent than zero.");

I think you want to say "invalid flags" not "flags different than zero",
since DRM_V3D_SUBMIT_CL_FLUSH_CACHE and DRM_V3D_SUBMIT_EXTENSION are
valid flags depends on driver caps. In addition, does adding tests
for valid flags (that depend on driver caps) make sense?

> +	igt_subtest("bad-flag") {
> +		struct drm_v3d_submit_cl submit =3D {
> +			.flags =3D 0xaa
> +		};
> +		do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CL, &submit, EINVAL);
> +	}
> +
> +	igt_describe("Make sure a submission cannot be accepted if the extensio=
ns handle is invalid.");
> +	igt_subtest("bad-extension") {
> +		struct drm_v3d_submit_cl submit =3D {
> +			.flags =3D DRM_V3D_SUBMIT_EXTENSION,
> +			.extensions =3D 0ULL
> +		};
> +		do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CL, &submit, EINVAL);
> +	}
> +
> +	igt_describe("Make sure a submission cannot be accepted if the BO handl=
e is invalid.");
> +	igt_subtest("bad-bo") {
> +		struct v3d_cl_job *job =3D igt_v3d_noop_job(fd);
> +
> +		job->submit->bo_handles =3D 0ULL;
> +		job->submit->bo_handle_count =3D 1;
> +
> +		do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit, EFAULT);
> +		igt_v3d_free_cl_job(fd, job);
> +	}
> +
> +	igt_describe("Make sure a submission cannot be accepted if the perfmon =
id is invalid.");
> +	igt_subtest("bad-perfmon") {
> +		struct v3d_cl_job *job =3D igt_v3d_noop_job(fd);
> +
> +		igt_require(igt_v3d_get_param(fd, DRM_V3D_PARAM_SUPPORTS_PERFMON));
> +
> +		job->submit->perfmon_id =3D 1;
> +
> +		do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit, ENOENT);
> +		igt_v3d_free_cl_job(fd, job);
> +	}
> +
> +	igt_describe("Make sure a submission cannot be accepted if the in-sync =
is not signaled.");
> +	igt_subtest("bad-in-sync") {
> +		struct v3d_cl_job *job =3D igt_v3d_noop_job(fd);
> +
> +		job->submit->in_sync_rcl =3D syncobj_create(fd, 0);
> +
> +		do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit, EINVAL);
> +		igt_v3d_free_cl_job(fd, job);
> +	}
> +
> +	igt_describe("Make sure that the multisync pad is zero.");
> +	igt_subtest("bad-multisync-pad") {
> +		struct drm_v3d_multi_sync ms =3D { };
> +		struct v3d_cl_job *job =3D igt_v3d_noop_job(fd);
> +
> +		igt_require(igt_v3d_get_param(fd, DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT=
));
> +
> +		ms.pad =3D 1;
> +
> +		job->submit->flags =3D DRM_V3D_SUBMIT_EXTENSION;
> +		job->submit->extensions =3D to_user_pointer(&ms);
> +
> +		do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit, EINVAL);
> +		igt_v3d_free_cl_job(fd, job);
> +	}
> +
> +	igt_describe("Make sure that the multisync extension id exists.");
> +	igt_subtest("bad-multisync-extension") {
> +		struct drm_v3d_multi_sync ms =3D { };
> +		struct v3d_cl_job *job =3D igt_v3d_noop_job(fd);
> +
> +		igt_require(igt_v3d_get_param(fd, DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT=
));
> +
> +		ms.base.id =3D 0;
> +
> +		job->submit->flags =3D DRM_V3D_SUBMIT_EXTENSION;
> +		job->submit->extensions =3D to_user_pointer(&ms);
> +
> +		do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit, EINVAL);
> +		igt_v3d_free_cl_job(fd, job);
> +	}
> +
> +	igt_describe("Make sure that the multisync out-sync is valid.");
> +	igt_subtest("bad-multisync-out-sync") {
> +		struct drm_v3d_multi_sync ms =3D { };
> +		struct v3d_cl_job *job =3D igt_v3d_noop_job(fd);
> +
> +		igt_require(igt_v3d_get_param(fd, DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT=
));
> +
> +		igt_v3d_set_multisync(&ms, V3D_RENDER);
> +
> +		ms.out_sync_count =3D 1;
> +		ms.out_syncs =3D 0ULL;
> +
> +		job->submit->flags =3D DRM_V3D_SUBMIT_EXTENSION;
> +		job->submit->extensions =3D to_user_pointer(&ms);
> +
> +		do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit, EFAULT);
> +		igt_v3d_free_cl_job(fd, job);
> +	}
> +
> +	igt_describe("Make sure that the multisync in-sync is valid.");
> +	igt_subtest("bad-multisync-in-sync") {
> +		struct drm_v3d_multi_sync ms =3D { };
> +		struct v3d_cl_job *job =3D igt_v3d_noop_job(fd);
> +
> +		igt_require(igt_v3d_get_param(fd, DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT=
));
> +
> +		igt_v3d_set_multisync(&ms, V3D_RENDER);
> +
> +		ms.in_sync_count =3D 1;
> +		ms.in_syncs =3D 0ULL;
> +
> +		job->submit->flags =3D DRM_V3D_SUBMIT_EXTENSION;
> +		job->submit->extensions =3D to_user_pointer(&ms);
> +
> +		do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit, EFAULT);
> +		igt_v3d_free_cl_job(fd, job);
> +	}
> +
> +	igt_describe("Test a valid submission without syncobj.");
> +	igt_subtest("valid-submission") {
> +		struct v3d_cl_job *job =3D igt_v3d_noop_job(fd);
> +
> +		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit);
> +		igt_v3d_free_cl_job(fd, job);
> +	}
Maybe a similar test for MULTISYNC? ^
> +
> +	igt_describe("Test a valid submission with a simple out-sync.");
Do you want to say "single" instead of "simple"?
> +	igt_subtest("simple-out-sync") {
> +		struct v3d_cl_job *job =3D igt_v3d_noop_job(fd);
> +
> +		job->submit->out_sync =3D syncobj_create(fd, DRM_SYNCOBJ_CREATE_SIGNAL=
ED);
> +
> +		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit);
> +		igt_assert(syncobj_wait(fd, &job->submit->out_sync, 1,
> +			   INT64_MAX, 0, NULL));
> +		igt_v3d_free_cl_job(fd, job);
> +	}
> +
> +	igt_describe("Test a valid submission with a simple in-sync.");
Do you want to say "single" instead of "simple"?
> +	igt_subtest("simple-in-sync") {
> +		struct v3d_cl_job *job1 =3D igt_v3d_noop_job(fd);
> +		struct v3d_cl_job *job2 =3D igt_v3d_noop_job(fd);
> +		uint32_t out_sync;
> +
> +		out_sync =3D syncobj_create(fd, 0);
> +
> +		job1->submit->in_sync_rcl =3D out_sync;
> +		do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CL, job1->submit, EINVAL);
> +
> +		job2->submit->out_sync =3D out_sync;
> +		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, job2->submit);
> +
> +		igt_assert(syncobj_wait(fd, &job2->submit->out_sync, 1,
> +					INT64_MAX, 0, NULL));
> +
> +		job1->submit->in_sync_rcl =3D out_sync;
> +		job1->submit->out_sync =3D syncobj_create(fd, DRM_SYNCOBJ_CREATE_SIGNA=
LED);
> +		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, job1->submit);
> +
> +		igt_assert(syncobj_wait(fd, &job1->submit->out_sync, 1,
> +					INT64_MAX, 0, NULL));
> +
> +		igt_v3d_free_cl_job(fd, job1);
> +		igt_v3d_free_cl_job(fd, job2);
> +	}
> +
> +	igt_describe("Test a valid submission with flush cache.");
> +	igt_subtest("simple-flush-cache") {
> +		struct v3d_cl_job *job =3D igt_v3d_noop_job(fd);
> +
> +		igt_require(igt_v3d_get_param(fd, DRM_V3D_PARAM_SUPPORTS_CACHE_FLUSH));
> +
> +		job->submit->flags =3D DRM_V3D_SUBMIT_CL_FLUSH_CACHE;
> +		job->submit->out_sync =3D syncobj_create(fd, DRM_SYNCOBJ_CREATE_SIGNAL=
ED);
> +
> +		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit);
> +		igt_assert(syncobj_wait(fd, &job->submit->out_sync, 1,
> +			   INT64_MAX, 0, NULL));
> +		igt_v3d_free_cl_job(fd, job);
> +	}
> +
> +	igt_describe("Test a valid submission with a multisync out-sync.");
Better say "multiple out-syncs"
> +	igt_subtest("multisync-out-sync") {
> +		struct drm_v3d_multi_sync ms =3D { };
> +		struct v3d_cl_job *job =3D igt_v3d_noop_job(fd);
> +		struct drm_v3d_sem *out_syncs;
> +		int i;
> +
> +		igt_require(igt_v3d_get_param(fd, DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT=
));
> +
> +		igt_v3d_set_multisync(&ms, V3D_RENDER);
> +		ms.out_sync_count =3D 4;
> +
> +		out_syncs =3D malloc(ms.out_sync_count * sizeof(*out_syncs));
> +		for (i =3D 0; i < ms.out_sync_count; i++)
> +			out_syncs[i].handle =3D syncobj_create(fd, DRM_SYNCOBJ_CREATE_SIGNALE=
D);
> +
> +		ms.out_syncs =3D to_user_pointer(out_syncs);
> +
> +		job->submit->flags =3D DRM_V3D_SUBMIT_EXTENSION;
> +		job->submit->extensions =3D to_user_pointer(&ms);
> +
> +		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit);
> +		for (i =3D 0; i < ms.out_sync_count; i++)
> +			igt_assert(syncobj_wait(fd, &out_syncs[i].handle, 1, INT64_MAX, 0, NU=
LL));
> +
> +		igt_v3d_free_cl_job(fd, job);
> +		free(out_syncs);
> +	}
> +
> +	igt_describe("Make sure that the multisync extension is preferred over =
the simple syncobjs.");
Do you want to say "single" instead of "simple"? ^
> +	igt_subtest("multi-and-simple-sync") {
> +		struct drm_v3d_multi_sync ms =3D { };
> +		struct v3d_cl_job *job =3D igt_v3d_noop_job(fd);
> +		struct drm_v3d_sem *out_syncs;
> +		int i;
> +
> +		igt_require(igt_v3d_get_param(fd, DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT=
));
> +
> +		igt_v3d_set_multisync(&ms, V3D_RENDER);
> +		ms.out_sync_count =3D 1;
> +
> +		out_syncs =3D malloc(ms.out_sync_count * sizeof(*out_syncs));
> +		for (i =3D 0; i < ms.out_sync_count; i++)
> +			out_syncs[i].handle =3D syncobj_create(fd, DRM_SYNCOBJ_CREATE_SIGNALE=
D);
> +
> +		ms.out_syncs =3D to_user_pointer(out_syncs);
> +
> +		job->submit->flags =3D DRM_V3D_SUBMIT_EXTENSION;
If we don't set this flag, the driver should follow the single-sync
path, right?
> +		job->submit->extensions =3D to_user_pointer(&ms);
> +
> +		job->submit->out_sync =3D syncobj_create(fd, 0);
> +
> +		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit);
> +		for (i =3D 0; i < ms.out_sync_count; i++)
> +			igt_assert(syncobj_wait(fd, &out_syncs[i].handle, 1, INT64_MAX, 0, NU=
LL));
> +
> +		/*
> +		 * The multisync extension should be prioritized over the simple synco=
bjs.
> +		 * So, the job->submit->out_sync should stay not signaled.
> +		 */
> +		igt_assert_eq(syncobj_wait_err(fd, &job->submit->out_sync, 1, INT64_MA=
X, 0), -EINVAL);
> +
> +		igt_v3d_free_cl_job(fd, job);
> +		free(out_syncs);
> +	}
> +
> +	igt_describe("Test the implicit order of the submission to the CL queue=
=2E");
> +	igt_subtest("multiple-job-submission") {
> +		const uint32_t num_jobs =3D 10;
> +		struct v3d_cl_job **jobs =3D NULL;
> +		int i;
> +
> +		jobs =3D malloc(num_jobs * sizeof(*jobs));
> +
> +		for (i =3D 0; i < num_jobs; i++) {
> +			jobs[i] =3D igt_v3d_noop_job(fd);
> +			jobs[i]->submit->out_sync =3D syncobj_create(fd, DRM_SYNCOBJ_CREATE_S=
IGNALED);
> +		}
> +
> +		for (i =3D 0; i < num_jobs; i++)
> +			do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, jobs[i]->submit);
> +
> +		igt_assert(syncobj_wait(fd, &jobs[num_jobs - 1]->submit->out_sync, 1, =
short_timeout(), 0, NULL));
> +
> +		/*
> +		 * If the last job is signaled, then all the previous jobs should
> +		 * already signaled, to assure the implicit synchronization.
> +		 */
> +		for (i =3D 0; i < num_jobs; i++) {
> +			igt_assert(syncobj_wait(fd, &jobs[i]->submit->out_sync, 1, 0, 0, NULL=
));
> +			igt_v3d_free_cl_job(fd, jobs[i]);
> +		}
> +
> +		free(jobs);
> +	}
> +
> +	igt_describe("Test the coherency of creation/destruction of a perfmon a=
ttached to a job.");
> +	igt_subtest("job-perfmon") {
> +		uint8_t counters[] =3D { V3D_PERFCNT_L2T_TMU_READS,
> +				       V3D_PERFCNT_L2T_CLE_READS,
> +				       V3D_PERFCNT_L2T_VCD_READS,
> +				       V3D_PERFCNT_L2T_TMUCFG_READS };
> +		struct v3d_cl_job *job =3D igt_v3d_noop_job(fd);
> +		uint32_t id;
> +
> +		igt_require(igt_v3d_get_param(fd, DRM_V3D_PARAM_SUPPORTS_PERFMON));
> +
> +		id =3D igt_v3d_perfmon_create(fd, ARRAY_SIZE(counters), counters);
> +
> +		job->submit->out_sync =3D syncobj_create(fd, DRM_SYNCOBJ_CREATE_SIGNAL=
ED);
> +		job->submit->perfmon_id =3D id;
> +
> +		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit);
> +		igt_assert(syncobj_wait(fd, &job->submit->out_sync, 1,
> +					INT64_MAX, 0, NULL));
> +		igt_v3d_perfmon_get_values(fd, job->submit->perfmon_id);
> +
> +		igt_v3d_free_cl_job(fd, job);
> +
> +		igt_v3d_perfmon_get_values(fd, id);
> +		igt_v3d_perfmon_destroy(fd, id);
> +	}
> +
> +	igt_fixture
> +		close(fd);
> +}
> diff --git a/tests/v3d_ci/v3d.testlist b/tests/v3d_ci/v3d.testlist
> index 54d28ce5..ecdea442 100644
> --- a/tests/v3d_ci/v3d.testlist
> +++ b/tests/v3d_ci/v3d.testlist
> @@ -10,6 +10,24 @@ igt@v3d/v3d_get_param@get-bad-flags
>  igt@v3d/v3d_mmap@mmap-bad-flags
>  igt@v3d/v3d_mmap@mmap-bad-handle
>  igt@v3d/v3d_mmap@mmap-bo
> +igt@v3d/v3d_submit_cl@bad-pad
> +igt@v3d/v3d_submit_cl@bad-flag
> +igt@v3d/v3d_submit_cl@bad-extension
> +igt@v3d/v3d_submit_cl@bad-bo
> +igt@v3d/v3d_submit_cl@bad-perfmon
> +igt@v3d/v3d_submit_cl@bad-in-sync
> +igt@v3d/v3d_submit_cl@bad-multisync-pad
> +igt@v3d/v3d_submit_cl@bad-multisync-extension
> +igt@v3d/v3d_submit_cl@bad-multisync-out-sync
> +igt@v3d/v3d_submit_cl@bad-multisync-in-sync
> +igt@v3d/v3d_submit_cl@valid-submission
> +igt@v3d/v3d_submit_cl@simple-out-sync
> +igt@v3d/v3d_submit_cl@simple-in-sync
> +igt@v3d/v3d_submit_cl@simple-flush-cache
> +igt@v3d/v3d_submit_cl@multiple-job-submission
> +igt@v3d/v3d_submit_cl@multisync-out-sync
> +igt@v3d/v3d_submit_cl@multi-and-simple-sync
> +igt@v3d/v3d_submit_cl@job-perfmon
>  igt@v3d/v3d_perfmon@create-perfmon-0
>  igt@v3d/v3d_perfmon@create-perfmon-exceed
>  igt@v3d/v3d_perfmon@create-perfmon-invalid-counters
> --=20
> 2.38.1
>=20

--2dife6v7f4ifnww5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmO/7PUACgkQwqF3j0dL
ehyRhw//TKstjjqine8eCFz3X0HIatLFpKZHAa8MWUJXiJV2qWo4MQG9vvcY/svr
C0EqHMVawb+PaBJl39WQGi4DnlSRKJzwEW5KWdAArVWC9tBdUBUsLSVzn3PdV9ga
Yat+fwVkjUAlqDI1PSJQ9gXvcrxOlBkyzqD0PbIuh95ab41olYOhbJg3NujIE9do
a/TJg1jD0WXdTnY5npalQeshskivXkoXBm0jPVBeceKr4KggyZq10DlGbsGYaIL9
y68Y7qk1MfL8Mg+bNjdiEY5FiSJ87y8Nq1BPEbq0h/j7pzNwARiZjXidLpWfZLNO
qpzEaXSD7VVWEI1foakAggxdFwBqfT/RchXCYdRxFdRCUGcF/MaVTEJw8Sci1eUZ
c5Ft+KDhIeM1eGZFNYwaD/A70Xa7eW37drsN+RE7nU+Hmg+/OjD6KKbvZ3cfW/MG
EGeNPLuAPFkoT1HabCMVJjQGcNj1x8emfqFea8rnkZtDIiOoraxA+BRDbdtPg7x7
0Z2ntKnrX6mADjCjn3nqjFcpt+bE74nq1gkoJ79T6TdIZEnyKnkSRUR1XoW9sdQV
7bq6tlPQR2lMsNq9CJWREiG4BcmIIhlSiO9Ms9XaEFXHrS45FLLhD2rzMnKvBFlQ
twN3N8E+qRIwqwnYRcIaIE8IfNReTMzsbU0gfLRy2AmvnMWaLHI=
=XwlE
-----END PGP SIGNATURE-----

--2dife6v7f4ifnww5--
