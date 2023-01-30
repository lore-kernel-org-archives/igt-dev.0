Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8630A10E0D9
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jan 2023 17:59:18 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Petri Latvala <petri.latvala@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, Iago Toral Quiroga <itoral@igalia.com>
Date: Mon, 30 Jan 2023 14:57:58 -0300
Message-Id: <20230130175758.420535-7-mcanal@igalia.com>
In-Reply-To: <20230130175758.420535-1-mcanal@igalia.com>
References: <20230130175758.420535-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 6/6] tests/v3d_submit_cl: Create test for
 V3D's Submit CL IOCTL
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add eighteen igt_subtests for the DRM_IOCTL_V3D_SUBMIT_CL, which ensures
that improper parameters return an errno and test multisync and simple
sync abilities. For most of the subtests, the noop job is the base of
the submission, as it is one of the simplest jobs possible, allowing it
to test the synchronization abilities of the V3D.

Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 lib/igt_v3d.c             |   8 +
 lib/igt_v3d.h             |   2 +
 tests/v3d/meson.build     |   1 +
 tests/v3d/v3d_submit_cl.c | 380 ++++++++++++++++++++++++++++++++++++++
 tests/v3d_ci/v3d.testlist |  19 ++
 5 files changed, 410 insertions(+)
 create mode 100644 tests/v3d/v3d_submit_cl.c

diff --git a/lib/igt_v3d.c b/lib/igt_v3d.c
index 55eb3c0f..41ea32fc 100644
--- a/lib/igt_v3d.c
+++ b/lib/igt_v3d.c
@@ -185,6 +185,14 @@ void igt_v3d_perfmon_destroy(int fd, uint32_t id)
 	do_ioctl(fd, DRM_IOCTL_V3D_PERFMON_DESTROY, &destroy);
 }
 
+void igt_v3d_set_multisync(struct drm_v3d_multi_sync *ms, enum v3d_queue wait_stage)
+{
+	ms->base.next = to_user_pointer(NULL);
+	ms->base.id = DRM_V3D_EXT_ID_MULTI_SYNC;
+	ms->base.flags = 0;
+	ms->wait_stage = wait_stage;
+}
+
 static void v3d_cl_init(int fd, struct v3d_cl **cl)
 {
 	struct v3d_bo *bo = igt_v3d_create_bo(fd, PAGE_SIZE);
diff --git a/lib/igt_v3d.h b/lib/igt_v3d.h
index af2c9c2f..2cf7fbd8 100644
--- a/lib/igt_v3d.h
+++ b/lib/igt_v3d.h
@@ -62,6 +62,8 @@ uint32_t igt_v3d_perfmon_create(int fd, uint32_t ncounters, uint8_t *counters);
 void igt_v3d_perfmon_get_values(int fd, uint32_t id);
 void igt_v3d_perfmon_destroy(int fd, uint32_t id);
 
+void igt_v3d_set_multisync(struct drm_v3d_multi_sync *ms, enum v3d_queue wait_stage);
+
 struct v3d_cl_job *igt_v3d_noop_job(int fd);
 void igt_v3d_free_cl_job(int fd, struct v3d_cl_job *job);
 
diff --git a/tests/v3d/meson.build b/tests/v3d/meson.build
index 7b4257f9..be92fd66 100644
--- a/tests/v3d/meson.build
+++ b/tests/v3d/meson.build
@@ -3,6 +3,7 @@ v3d_progs = [
 	'v3d_get_bo_offset',
 	'v3d_get_param',
 	'v3d_mmap',
+	'v3d_submit_cl',
 	'v3d_perfmon',
 	'v3d_wait_bo',
 ]
diff --git a/tests/v3d/v3d_submit_cl.c b/tests/v3d/v3d_submit_cl.c
new file mode 100644
index 00000000..725bc1df
--- /dev/null
+++ b/tests/v3d/v3d_submit_cl.c
@@ -0,0 +1,380 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Igalia S.L.
+ */
+
+#include "igt.h"
+#include "igt_v3d.h"
+#include "igt_syncobj.h"
+
+/* One tenth of a second */
+#define SHORT_TIME_NSEC 100000000ull
+
+#define NSECS_PER_SEC 1000000000ull
+
+static uint64_t
+gettime_ns(void)
+{
+	struct timespec current;
+
+	clock_gettime(CLOCK_MONOTONIC, &current);
+	return (uint64_t)current.tv_sec * NSECS_PER_SEC + current.tv_nsec;
+}
+
+static uint64_t
+short_timeout(void)
+{
+	return gettime_ns() + SHORT_TIME_NSEC;
+}
+
+igt_main
+{
+	int fd;
+
+	igt_fixture
+		fd = drm_open_driver(DRIVER_V3D);
+
+	igt_describe("Make sure a submission cannot be accepted with a pad different than zero.");
+	igt_subtest("bad-pad") {
+		struct drm_v3d_submit_cl submit = {
+			.pad = 1
+		};
+		do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CL, &submit, EINVAL);
+	}
+
+	igt_describe("Make sure a submission cannot be accepted with invalid flags.");
+	igt_subtest("bad-flag") {
+		struct drm_v3d_submit_cl submit = {
+			.flags = 0xaa
+		};
+		do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CL, &submit, EINVAL);
+	}
+
+	igt_describe("Make sure a submission cannot be accepted if the extensions "
+		     "handle is invalid.");
+	igt_subtest("bad-extension") {
+		struct drm_v3d_submit_cl submit = {
+			.flags = DRM_V3D_SUBMIT_EXTENSION,
+			.extensions = 0ULL
+		};
+		do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CL, &submit, EINVAL);
+	}
+
+	igt_describe("Make sure a submission cannot be accepted if the BO handle is invalid.");
+	igt_subtest("bad-bo") {
+		struct v3d_cl_job *job = igt_v3d_noop_job(fd);
+
+		job->submit->bo_handles = 0ULL;
+		job->submit->bo_handle_count = 1;
+
+		do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit, EFAULT);
+		igt_v3d_free_cl_job(fd, job);
+	}
+
+	igt_describe("Make sure a submission cannot be accepted if the perfmon id is invalid.");
+	igt_subtest("bad-perfmon") {
+		struct v3d_cl_job *job = igt_v3d_noop_job(fd);
+
+		igt_require(igt_v3d_get_param(fd, DRM_V3D_PARAM_SUPPORTS_PERFMON));
+
+		job->submit->perfmon_id = 1;
+
+		do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit, ENOENT);
+		igt_v3d_free_cl_job(fd, job);
+	}
+
+	igt_describe("Make sure a submission cannot be accepted if the in-sync is not signaled.");
+	igt_subtest("bad-in-sync") {
+		struct v3d_cl_job *job = igt_v3d_noop_job(fd);
+
+		job->submit->in_sync_rcl = syncobj_create(fd, 0);
+
+		do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit, EINVAL);
+		igt_v3d_free_cl_job(fd, job);
+	}
+
+	igt_describe("Make sure that the multisync pad is zero.");
+	igt_subtest("bad-multisync-pad") {
+		struct drm_v3d_multi_sync ms = { };
+		struct v3d_cl_job *job = igt_v3d_noop_job(fd);
+
+		igt_require(igt_v3d_get_param(fd, DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT));
+
+		ms.pad = 1;
+
+		job->submit->flags = DRM_V3D_SUBMIT_EXTENSION;
+		job->submit->extensions = to_user_pointer(&ms);
+
+		do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit, EINVAL);
+		igt_v3d_free_cl_job(fd, job);
+	}
+
+	igt_describe("Make sure that the multisync extension id exists.");
+	igt_subtest("bad-multisync-extension") {
+		struct drm_v3d_multi_sync ms = { };
+		struct v3d_cl_job *job = igt_v3d_noop_job(fd);
+
+		igt_require(igt_v3d_get_param(fd, DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT));
+
+		ms.base.id = 0;
+
+		job->submit->flags = DRM_V3D_SUBMIT_EXTENSION;
+		job->submit->extensions = to_user_pointer(&ms);
+
+		do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit, EINVAL);
+		igt_v3d_free_cl_job(fd, job);
+	}
+
+	igt_describe("Make sure that the multisync out-sync is valid.");
+	igt_subtest("bad-multisync-out-sync") {
+		struct drm_v3d_multi_sync ms = { };
+		struct v3d_cl_job *job = igt_v3d_noop_job(fd);
+
+		igt_require(igt_v3d_get_param(fd, DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT));
+
+		igt_v3d_set_multisync(&ms, V3D_RENDER);
+
+		ms.out_sync_count = 1;
+		ms.out_syncs = 0ULL;
+
+		job->submit->flags = DRM_V3D_SUBMIT_EXTENSION;
+		job->submit->extensions = to_user_pointer(&ms);
+
+		do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit, EFAULT);
+		igt_v3d_free_cl_job(fd, job);
+	}
+
+	igt_describe("Make sure that the multisync in-sync is valid.");
+	igt_subtest("bad-multisync-in-sync") {
+		struct drm_v3d_multi_sync ms = { };
+		struct v3d_cl_job *job = igt_v3d_noop_job(fd);
+
+		igt_require(igt_v3d_get_param(fd, DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT));
+
+		igt_v3d_set_multisync(&ms, V3D_RENDER);
+
+		ms.in_sync_count = 1;
+		ms.in_syncs = 0ULL;
+
+		job->submit->flags = DRM_V3D_SUBMIT_EXTENSION;
+		job->submit->extensions = to_user_pointer(&ms);
+
+		do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit, EFAULT);
+		igt_v3d_free_cl_job(fd, job);
+	}
+
+	igt_describe("Test a valid submission without syncobj.");
+	igt_subtest("valid-submission") {
+		struct v3d_cl_job *job = igt_v3d_noop_job(fd);
+
+		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit);
+		igt_v3d_free_cl_job(fd, job);
+	}
+
+	igt_describe("Test a valid submission with a single out-sync.");
+	igt_subtest("single-out-sync") {
+		struct v3d_cl_job *job = igt_v3d_noop_job(fd);
+
+		job->submit->out_sync = syncobj_create(fd, DRM_SYNCOBJ_CREATE_SIGNALED);
+
+		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit);
+		igt_assert(syncobj_wait(fd, &job->submit->out_sync, 1,
+					INT64_MAX, 0, NULL));
+		igt_v3d_free_cl_job(fd, job);
+	}
+
+	igt_describe("Test a valid submission with a single in-sync.");
+	igt_subtest("single-in-sync") {
+		struct v3d_cl_job *job1 = igt_v3d_noop_job(fd);
+		struct v3d_cl_job *job2 = igt_v3d_noop_job(fd);
+		uint32_t out_sync;
+
+		out_sync = syncobj_create(fd, 0);
+
+		job1->submit->in_sync_rcl = out_sync;
+		do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CL, job1->submit, EINVAL);
+
+		job2->submit->out_sync = out_sync;
+		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, job2->submit);
+
+		igt_assert(syncobj_wait(fd, &job2->submit->out_sync, 1,
+					INT64_MAX, 0, NULL));
+
+		job1->submit->in_sync_rcl = out_sync;
+		job1->submit->out_sync = syncobj_create(fd, DRM_SYNCOBJ_CREATE_SIGNALED);
+		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, job1->submit);
+
+		igt_assert(syncobj_wait(fd, &job1->submit->out_sync, 1,
+					INT64_MAX, 0, NULL));
+
+		igt_v3d_free_cl_job(fd, job1);
+		igt_v3d_free_cl_job(fd, job2);
+	}
+
+	igt_describe("Test a valid submission with flush cache.");
+	igt_subtest("simple-flush-cache") {
+		struct v3d_cl_job *job = igt_v3d_noop_job(fd);
+
+		job->submit->flags = DRM_V3D_SUBMIT_CL_FLUSH_CACHE;
+
+		if (!igt_v3d_get_param(fd, DRM_V3D_PARAM_SUPPORTS_CACHE_FLUSH)) {
+			do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CL, &job->submit, EINVAL);
+		} else {
+			job->submit->out_sync = syncobj_create(fd, DRM_SYNCOBJ_CREATE_SIGNALED);
+
+			do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit);
+			igt_assert(syncobj_wait(fd, &job->submit->out_sync, 1,
+						INT64_MAX, 0, NULL));
+		}
+
+		igt_v3d_free_cl_job(fd, job);
+	}
+
+	igt_describe("Test a valid submission with a multisync without syncobjs.");
+	igt_subtest("valid-multisync-submission") {
+		struct drm_v3d_multi_sync ms = { };
+		struct v3d_cl_job *job = igt_v3d_noop_job(fd);
+
+		job->submit->flags = DRM_V3D_SUBMIT_EXTENSION;
+
+		if (!igt_v3d_get_param(fd, DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT)) {
+			do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CL, &job->submit, EINVAL);
+		} else {
+			igt_v3d_set_multisync(&ms, V3D_RENDER);
+			job->submit->extensions = to_user_pointer(&ms);
+
+			do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit);
+		}
+
+		igt_v3d_free_cl_job(fd, job);
+	}
+
+	igt_describe("Test a valid submission with a multiple out-syncs.");
+	igt_subtest("multisync-out-syncs") {
+		struct drm_v3d_multi_sync ms = { };
+		struct v3d_cl_job *job = igt_v3d_noop_job(fd);
+		struct drm_v3d_sem *out_syncs;
+		int i;
+
+		igt_require(igt_v3d_get_param(fd, DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT));
+
+		igt_v3d_set_multisync(&ms, V3D_RENDER);
+		ms.out_sync_count = 4;
+
+		out_syncs = malloc(ms.out_sync_count * sizeof(*out_syncs));
+		for (i = 0; i < ms.out_sync_count; i++)
+			out_syncs[i].handle = syncobj_create(fd, DRM_SYNCOBJ_CREATE_SIGNALED);
+
+		ms.out_syncs = to_user_pointer(out_syncs);
+
+		job->submit->flags = DRM_V3D_SUBMIT_EXTENSION;
+		job->submit->extensions = to_user_pointer(&ms);
+
+		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit);
+		for (i = 0; i < ms.out_sync_count; i++)
+			igt_assert(syncobj_wait(fd, &out_syncs[i].handle, 1, INT64_MAX, 0, NULL));
+
+		igt_v3d_free_cl_job(fd, job);
+		free(out_syncs);
+	}
+
+	igt_describe("Make sure that the multisync extension is preferred over "
+		     "the single syncobjs.");
+	igt_subtest("multi-and-single-sync") {
+		struct drm_v3d_multi_sync ms = { };
+		struct v3d_cl_job *job = igt_v3d_noop_job(fd);
+		struct drm_v3d_sem *out_syncs;
+		int i;
+
+		igt_require(igt_v3d_get_param(fd, DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT));
+
+		igt_v3d_set_multisync(&ms, V3D_RENDER);
+		ms.out_sync_count = 1;
+
+		out_syncs = malloc(ms.out_sync_count * sizeof(*out_syncs));
+		for (i = 0; i < ms.out_sync_count; i++)
+			out_syncs[i].handle = syncobj_create(fd, DRM_SYNCOBJ_CREATE_SIGNALED);
+
+		ms.out_syncs = to_user_pointer(out_syncs);
+
+		job->submit->flags = DRM_V3D_SUBMIT_EXTENSION;
+		job->submit->extensions = to_user_pointer(&ms);
+
+		job->submit->out_sync = syncobj_create(fd, 0);
+
+		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit);
+		for (i = 0; i < ms.out_sync_count; i++)
+			igt_assert(syncobj_wait(fd, &out_syncs[i].handle, 1, INT64_MAX, 0, NULL));
+
+		/*
+		 * The multisync extension should be prioritized over the single syncobjs.
+		 * So, the job->submit->out_sync should stay not signaled.
+		 */
+		igt_assert_eq(syncobj_wait_err(fd, &job->submit->out_sync, 1, INT64_MAX, 0),
+			      -EINVAL);
+
+		igt_v3d_free_cl_job(fd, job);
+		free(out_syncs);
+	}
+
+	igt_describe("Test the implicit order of the submission to the CL queue.");
+	igt_subtest("multiple-job-submission") {
+		const uint32_t num_jobs = 10;
+		struct v3d_cl_job **jobs = NULL;
+		int i;
+
+		jobs = malloc(num_jobs * sizeof(*jobs));
+
+		for (i = 0; i < num_jobs; i++) {
+			jobs[i] = igt_v3d_noop_job(fd);
+			jobs[i]->submit->out_sync = syncobj_create(fd, DRM_SYNCOBJ_CREATE_SIGNALED);
+		}
+
+		for (i = 0; i < num_jobs; i++)
+			do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, jobs[i]->submit);
+
+		igt_assert(syncobj_wait(fd, &jobs[num_jobs - 1]->submit->out_sync, 1,
+					short_timeout(), 0, NULL));
+
+		/*
+		 * If the last job is signaled, then all the previous jobs should
+		 * already signaled, to assure the implicit synchronization.
+		 */
+		for (i = 0; i < num_jobs; i++) {
+			igt_assert(syncobj_wait(fd, &jobs[i]->submit->out_sync, 1, 0, 0, NULL));
+			igt_v3d_free_cl_job(fd, jobs[i]);
+		}
+
+		free(jobs);
+	}
+
+	igt_describe("Test the coherency of creation/destruction of a perfmon attached to a job.");
+	igt_subtest("job-perfmon") {
+		uint8_t counters[] = { V3D_PERFCNT_L2T_TMU_READS,
+				       V3D_PERFCNT_L2T_CLE_READS,
+				       V3D_PERFCNT_L2T_VCD_READS,
+				       V3D_PERFCNT_L2T_TMUCFG_READS };
+		struct v3d_cl_job *job = igt_v3d_noop_job(fd);
+		uint32_t id;
+
+		igt_require(igt_v3d_get_param(fd, DRM_V3D_PARAM_SUPPORTS_PERFMON));
+
+		id = igt_v3d_perfmon_create(fd, ARRAY_SIZE(counters), counters);
+
+		job->submit->out_sync = syncobj_create(fd, DRM_SYNCOBJ_CREATE_SIGNALED);
+		job->submit->perfmon_id = id;
+
+		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit);
+		igt_assert(syncobj_wait(fd, &job->submit->out_sync, 1,
+					INT64_MAX, 0, NULL));
+		igt_v3d_perfmon_get_values(fd, job->submit->perfmon_id);
+
+		igt_v3d_free_cl_job(fd, job);
+
+		igt_v3d_perfmon_get_values(fd, id);
+		igt_v3d_perfmon_destroy(fd, id);
+	}
+
+	igt_fixture
+		close(fd);
+}
diff --git a/tests/v3d_ci/v3d.testlist b/tests/v3d_ci/v3d.testlist
index 54d28ce5..80e99831 100644
--- a/tests/v3d_ci/v3d.testlist
+++ b/tests/v3d_ci/v3d.testlist
@@ -10,6 +10,25 @@ igt@v3d/v3d_get_param@get-bad-flags
 igt@v3d/v3d_mmap@mmap-bad-flags
 igt@v3d/v3d_mmap@mmap-bad-handle
 igt@v3d/v3d_mmap@mmap-bo
+igt@v3d/v3d_submit_cl@bad-pad
+igt@v3d/v3d_submit_cl@bad-flag
+igt@v3d/v3d_submit_cl@bad-extension
+igt@v3d/v3d_submit_cl@bad-bo
+igt@v3d/v3d_submit_cl@bad-perfmon
+igt@v3d/v3d_submit_cl@bad-in-sync
+igt@v3d/v3d_submit_cl@bad-multisync-pad
+igt@v3d/v3d_submit_cl@bad-multisync-extension
+igt@v3d/v3d_submit_cl@bad-multisync-out-sync
+igt@v3d/v3d_submit_cl@bad-multisync-in-sync
+igt@v3d/v3d_submit_cl@valid-submission
+igt@v3d/v3d_submit_cl@single-out-sync
+igt@v3d/v3d_submit_cl@single-in-sync
+igt@v3d/v3d_submit_cl@simple-flush-cache
+igt@v3d/v3d_submit_cl@valid-multisync-submission
+igt@v3d/v3d_submit_cl@multiple-job-submission
+igt@v3d/v3d_submit_cl@multisync-out-syncs
+igt@v3d/v3d_submit_cl@multi-and-single-sync
+igt@v3d/v3d_submit_cl@job-perfmon
 igt@v3d/v3d_perfmon@create-perfmon-0
 igt@v3d/v3d_perfmon@create-perfmon-exceed
 igt@v3d/v3d_perfmon@create-perfmon-invalid-counters
-- 
2.39.1
