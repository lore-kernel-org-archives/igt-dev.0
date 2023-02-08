Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1059310E825
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Feb 2023 18:22:04 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Petri Latvala <petri.latvala@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Iago Toral Quiroga <itoral@igalia.com>
Date: Wed,  8 Feb 2023 15:21:23 -0300
Message-Id: <20230208182122.187248-4-mcanal@igalia.com>
In-Reply-To: <20230208182122.187248-1-mcanal@igalia.com>
References: <20230208182122.187248-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 3/3] tests/v3d_job_submission: Create
 tests to mix CL and CSD jobs
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

Add three igt_subtests that combine CL jobs and CSD jobs, to assure the
proper synchronization of different queues, especially the
independence between them. Moreover, tests the relationship between
single syncobjs and multisync using mixed jobs as well.

Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 tests/v3d/meson.build          |   1 +
 tests/v3d/v3d_job_submission.c | 218 +++++++++++++++++++++++++++++++++
 tests/v3d_ci/v3d.testlist      |   3 +
 3 files changed, 222 insertions(+)
 create mode 100644 tests/v3d/v3d_job_submission.c

diff --git a/tests/v3d/meson.build b/tests/v3d/meson.build
index d070fdb5..03b4de61 100644
--- a/tests/v3d/meson.build
+++ b/tests/v3d/meson.build
@@ -2,6 +2,7 @@ v3d_progs = [
 	'v3d_create_bo',
 	'v3d_get_bo_offset',
 	'v3d_get_param',
+	'v3d_job_submission',
 	'v3d_mmap',
 	'v3d_submit_cl',
 	'v3d_submit_csd',
diff --git a/tests/v3d/v3d_job_submission.c b/tests/v3d/v3d_job_submission.c
new file mode 100644
index 00000000..0c36629c
--- /dev/null
+++ b/tests/v3d/v3d_job_submission.c
@@ -0,0 +1,218 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Igalia S.L.
+ */
+
+#include "igt.h"
+#include "igt_v3d.h"
+#include "igt_syncobj.h"
+
+static int fd;
+
+#define NUM_CL_JOBS  1000
+#define NUM_CSD_JOBS 250
+
+static int syncobj_wait_array(uint32_t *handles, uint32_t count)
+{
+	int i, ret = 0;
+
+	for (i = 0; i < count; i++) {
+		ret = syncobj_wait_err(fd, &handles[i], 1, INT64_MAX, 0);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
+static void *create_cl_jobs(void *args)
+{
+	struct v3d_cl_job **jobs = args;
+	int i;
+
+	for (i = 0; i < NUM_CL_JOBS; i++) {
+		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, jobs[i]->submit);
+		igt_assert(syncobj_wait(fd, &jobs[i]->submit->out_sync, 1,
+					INT64_MAX, 0, NULL));
+	}
+
+	return NULL;
+}
+
+static void *create_csd_jobs(void *args)
+{
+	struct v3d_csd_job **jobs = args;
+	int i;
+
+	for (i = 0; i < NUM_CSD_JOBS; i++) {
+		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CSD, jobs[i]->submit);
+		igt_assert(syncobj_wait(fd, &jobs[i]->submit->out_sync, 1,
+					INT64_MAX, 0, NULL));
+	}
+
+	return NULL;
+}
+
+igt_main
+{
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_V3D);
+		igt_require(igt_v3d_get_param(fd, DRM_V3D_PARAM_SUPPORTS_CSD));
+		igt_require(igt_v3d_get_param(fd, DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT));
+	}
+
+	igt_describe("Test if the out-sync of an array of mixed jobs is behaving correctly.");
+	igt_subtest("array-job-submission") {
+		uint32_t handles[4];
+		struct v3d_cl_job *cl_jobs[2];
+		struct v3d_csd_job *csd_jobs[2];
+		int i;
+
+		for (i = 0; i < ARRAY_SIZE(handles); i++)
+			handles[i] = syncobj_create(fd, 0);
+
+		for (i = 0; i < 2; i++) {
+			cl_jobs[i] = igt_v3d_noop_job(fd);
+			csd_jobs[i] = igt_v3d_empty_shader(fd);
+		}
+
+		cl_jobs[0]->submit->out_sync =  handles[0];
+		csd_jobs[0]->submit->out_sync =  handles[1];
+		cl_jobs[1]->submit->out_sync =  handles[2];
+		csd_jobs[1]->submit->out_sync =  handles[3];
+
+		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, cl_jobs[0]->submit);
+		igt_assert_eq(syncobj_wait_array(handles, ARRAY_SIZE(handles)), -EINVAL);
+
+		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CSD, csd_jobs[0]->submit);
+		igt_assert_eq(syncobj_wait_array(handles, ARRAY_SIZE(handles)), -EINVAL);
+
+		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, cl_jobs[1]->submit);
+		igt_assert_eq(syncobj_wait_array(handles, ARRAY_SIZE(handles)), -EINVAL);
+
+		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CSD, csd_jobs[1]->submit);
+		igt_assert_eq(syncobj_wait_array(handles, ARRAY_SIZE(handles)), 0);
+
+		for (i = 0; i < 2; i++) {
+			igt_v3d_free_cl_job(fd, cl_jobs[i]);
+			igt_v3d_free_csd_job(fd, csd_jobs[i]);
+		}
+	}
+
+	igt_describe("Test if multiple singlesyncs have the same behaviour as one multisync.");
+	igt_subtest("multiple-singlesync-to-multisync") {
+		struct drm_v3d_multi_sync ms = { 0 };
+		uint32_t handles[4];
+		struct v3d_cl_job *cl_jobs[2];
+		struct v3d_csd_job *csd_jobs[2];
+		struct drm_v3d_sem *in_syncs, *out_syncs;
+		int i;
+
+		for (i = 0; i < ARRAY_SIZE(handles); i++)
+			handles[i] = syncobj_create(fd, 0);
+
+		for (i = 0; i < 2; i++) {
+			cl_jobs[i] = igt_v3d_noop_job(fd);
+			csd_jobs[i] = igt_v3d_empty_shader(fd);
+		}
+
+		cl_jobs[0]->submit->out_sync =  handles[0];
+		csd_jobs[0]->submit->out_sync =  handles[1];
+		cl_jobs[1]->submit->out_sync =  handles[2];
+
+		igt_v3d_set_multisync(&ms, V3D_CSD);
+		ms.in_sync_count = 3;
+		ms.out_sync_count = 1;
+
+		in_syncs = malloc(ms.in_sync_count * sizeof(*in_syncs));
+		out_syncs = malloc(ms.out_sync_count * sizeof(*in_syncs));
+
+		for (i = 0; i < ms.in_sync_count; i++)
+			in_syncs[i].handle = handles[i];
+
+		out_syncs[0].handle = handles[3];
+
+		ms.in_syncs = to_user_pointer(in_syncs);
+		ms.out_syncs = to_user_pointer(out_syncs);
+
+		csd_jobs[1]->submit->flags = DRM_V3D_SUBMIT_EXTENSION;
+		csd_jobs[1]->submit->extensions = to_user_pointer(&ms);
+
+		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, cl_jobs[0]->submit);
+
+		do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CSD, csd_jobs[1]->submit, EINVAL);
+		igt_assert_eq(syncobj_wait_array(handles, ARRAY_SIZE(handles)), -EINVAL);
+
+		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CSD, csd_jobs[0]->submit);
+
+		do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CSD, csd_jobs[1]->submit, EINVAL);
+		igt_assert_eq(syncobj_wait_array(handles, ARRAY_SIZE(handles)), -EINVAL);
+
+		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, cl_jobs[1]->submit);
+		igt_assert_eq(syncobj_wait_array(handles, ARRAY_SIZE(handles)), -EINVAL);
+
+		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CSD, csd_jobs[1]->submit);
+		igt_assert_eq(syncobj_wait_array(handles, ARRAY_SIZE(handles)), 0);
+
+		for (i = 0; i < 2; i++) {
+			igt_v3d_free_cl_job(fd, cl_jobs[i]);
+			igt_v3d_free_csd_job(fd, csd_jobs[i]);
+		}
+	}
+
+	igt_describe("Test if all queues are progressing independently.");
+	igt_subtest("threaded-job-submission") {
+		struct v3d_cl_job **cl_jobs = NULL;
+		struct v3d_csd_job **csd_jobs = NULL;
+		pthread_t *threads[2];
+		int i, ret;
+
+		cl_jobs = malloc(NUM_CL_JOBS * sizeof(*cl_jobs));
+		csd_jobs = malloc(NUM_CSD_JOBS * sizeof(*csd_jobs));
+
+		for (i = 0; i < NUM_CL_JOBS; i++) {
+			igt_print_activity();
+
+			cl_jobs[i] = igt_v3d_noop_job(fd);
+			cl_jobs[i]->submit->out_sync = syncobj_create(fd,
+								      DRM_SYNCOBJ_CREATE_SIGNALED);
+		}
+
+		for (i = 0; i < NUM_CSD_JOBS; i++) {
+			igt_print_activity();
+
+			csd_jobs[i] = igt_v3d_empty_shader(fd);
+			csd_jobs[i]->submit->out_sync = syncobj_create(fd,
+								       DRM_SYNCOBJ_CREATE_SIGNALED);
+		}
+
+		for (i = 0; i < ARRAY_SIZE(threads); i++) {
+			threads[i] = malloc(sizeof(*threads[i]));
+			igt_assert(threads[i]);
+		}
+
+		ret = pthread_create(threads[0], NULL, &create_cl_jobs, cl_jobs);
+		igt_assert_eq(ret, 0);
+
+		ret = pthread_create(threads[1], NULL, &create_csd_jobs, csd_jobs);
+		igt_assert_eq(ret, 0);
+
+		for (i = 0; i < ARRAY_SIZE(threads); i++)
+			pthread_join(*threads[i], NULL);
+
+		for (i = 0; i < NUM_CL_JOBS; i++)
+			igt_v3d_free_cl_job(fd, cl_jobs[i]);
+
+		for (i = 0; i < NUM_CSD_JOBS; i++)
+			igt_v3d_free_csd_job(fd, csd_jobs[i]);
+
+		for (i = 0; i < ARRAY_SIZE(threads); i++)
+			free(threads[i]);
+
+		free(cl_jobs);
+		free(csd_jobs);
+	}
+
+	igt_fixture
+		close(fd);
+}
diff --git a/tests/v3d_ci/v3d.testlist b/tests/v3d_ci/v3d.testlist
index 5452fd99..106e9cf2 100644
--- a/tests/v3d_ci/v3d.testlist
+++ b/tests/v3d_ci/v3d.testlist
@@ -7,6 +7,9 @@ igt@v3d/v3d_get_bo_offset@get-bad-handle
 igt@v3d/v3d_get_param@base-params
 igt@v3d/v3d_get_param@get-bad-param
 igt@v3d/v3d_get_param@get-bad-flags
+igt@v3d/v3d_job_submission@array-job-submission
+igt@v3d/v3d_job_submission@multiple-singlesync-to-multisync
+igt@v3d/v3d_job_submission@threaded-job-submission
 igt@v3d/v3d_mmap@mmap-bad-flags
 igt@v3d/v3d_mmap@mmap-bad-handle
 igt@v3d/v3d_mmap@mmap-bo
-- 
2.39.1
