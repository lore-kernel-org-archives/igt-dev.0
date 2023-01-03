Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C5D10E24A
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jan 2023 10:59:44 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Petri Latvala <petri.latvala@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Emma Anholt <emma@anholt.net>,
 Jason Ekstrand <jason.ekstrand@collabora.com>,
 Iago Toral Quiroga <itoral@igalia.com>, Rob Clark <robdclark@chromium.org>
Date: Tue,  3 Jan 2023 07:58:35 -0300
Message-Id: <20230103105835.604394-6-mcanal@igalia.com>
In-Reply-To: <20230103105835.604394-1-mcanal@igalia.com>
References: <20230103105835.604394-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 5/6] tests/v3d_wait_bo: Create test for
 V3D's Wait BO IOCTL
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

Add nine igt_subtests for the DRM_IOCTL_V3D_WAIT_BO, which ensures
that improper parameters return an errno and tests timeouts for used
and unused BOs. In order to create used BOs, it submits a noop job and
evaluates V3D's job BOs.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 lib/igt_v3d.c             |   9 +++
 lib/igt_v3d.h             |   2 +
 tests/v3d/meson.build     |   1 +
 tests/v3d/v3d_wait_bo.c   | 127 ++++++++++++++++++++++++++++++++++++++
 tests/v3d_ci/v3d.testlist |   9 +++
 5 files changed, 148 insertions(+)
 create mode 100644 tests/v3d/v3d_wait_bo.c

diff --git a/lib/igt_v3d.c b/lib/igt_v3d.c
index 0aed1af8..1ac55ea8 100644
--- a/lib/igt_v3d.c
+++ b/lib/igt_v3d.c
@@ -127,6 +127,15 @@ void igt_v3d_bo_mmap(int fd, struct v3d_bo *bo)
 	igt_assert(bo->map);
 }
 
+void igt_v3d_wait_bo(int fd, struct v3d_bo *bo, uint64_t timeout_ns)
+{
+	struct drm_v3d_wait_bo arg = {
+		.handle = bo->handle,
+		.timeout_ns = timeout_ns
+	};
+	do_ioctl(fd, DRM_IOCTL_V3D_WAIT_BO, &arg);
+}
+
 uint32_t igt_v3d_perfmon_create(int fd, uint32_t ncounters, uint8_t *counters)
 {
 	struct drm_v3d_perfmon_create create = {
diff --git a/lib/igt_v3d.h b/lib/igt_v3d.h
index c3799096..af2c9c2f 100644
--- a/lib/igt_v3d.h
+++ b/lib/igt_v3d.h
@@ -56,6 +56,8 @@ void *igt_v3d_mmap_bo(int fd, uint32_t handle, uint32_t size, unsigned prot);
 
 void igt_v3d_bo_mmap(int fd, struct v3d_bo *bo);
 
+void igt_v3d_wait_bo(int fd, struct v3d_bo *bo, uint64_t timeout_ns);
+
 uint32_t igt_v3d_perfmon_create(int fd, uint32_t ncounters, uint8_t *counters);
 void igt_v3d_perfmon_get_values(int fd, uint32_t id);
 void igt_v3d_perfmon_destroy(int fd, uint32_t id);
diff --git a/tests/v3d/meson.build b/tests/v3d/meson.build
index 07badc49..7b4257f9 100644
--- a/tests/v3d/meson.build
+++ b/tests/v3d/meson.build
@@ -4,6 +4,7 @@ v3d_progs = [
 	'v3d_get_param',
 	'v3d_mmap',
 	'v3d_perfmon',
+	'v3d_wait_bo',
 ]
 
 foreach prog : v3d_progs
diff --git a/tests/v3d/v3d_wait_bo.c b/tests/v3d/v3d_wait_bo.c
new file mode 100644
index 00000000..9e51b6a0
--- /dev/null
+++ b/tests/v3d/v3d_wait_bo.c
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Igalia S.L.
+ */
+
+#include "igt.h"
+#include "igt_v3d.h"
+#include "v3d/v3d_cl.h"
+
+IGT_TEST_DESCRIPTION("Tests for the V3D's Wait BO IOCTL");
+
+static void test_used_bo(int fd, struct v3d_bo *bo, uint64_t timeout)
+{
+	struct drm_v3d_wait_bo arg = {
+		.timeout_ns = timeout,
+		.handle = bo->handle,
+	};
+	int ret;
+
+	ret = igt_ioctl(fd, DRM_IOCTL_V3D_WAIT_BO, &arg);
+
+	if (ret == -1 && errno == ETIME)
+		igt_debug("Timeout triggered\n");
+	igt_assert(ret == 0 || (ret == -1 && errno == ETIME));
+}
+
+igt_main
+{
+	int fd;
+	struct v3d_bo *bo;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_V3D);
+		bo = igt_v3d_create_bo(fd, PAGE_SIZE);
+	}
+
+	igt_describe("Make sure it cannot wait on an invalid BO.");
+	igt_subtest("bad-bo") {
+		struct drm_v3d_wait_bo arg = {
+			.handle = bo->handle + 1,
+			.timeout_ns = 0,
+		};
+		do_ioctl_err(fd, DRM_IOCTL_V3D_WAIT_BO, &arg, EINVAL);
+	}
+
+	igt_describe("Make sure the pad is zero.");
+	igt_subtest("bad-pad") {
+		struct drm_v3d_wait_bo arg = {
+			.pad = 1,
+			.handle = bo->handle,
+			.timeout_ns = 0,
+		};
+		do_ioctl_err(fd, DRM_IOCTL_V3D_WAIT_BO, &arg, EINVAL);
+	}
+
+	igt_describe("Wait on an unused BO for 0 ns.");
+	igt_subtest("unused-bo-0ns")
+		igt_v3d_wait_bo(fd, bo, 0);
+
+	igt_describe("Wait on an unused BO for 1 ns.");
+	igt_subtest("unused-bo-1ns")
+		igt_v3d_wait_bo(fd, bo, 1);
+
+	igt_describe("Wait on a newly mapped BO for 0 ns.");
+	igt_subtest("map-bo-0ns") {
+		igt_v3d_bo_mmap(fd, bo);
+		igt_v3d_wait_bo(fd, bo, 0);
+		munmap(bo->map, bo->size);
+	}
+
+	igt_describe("Wait on a newly mapped BO for 1 ns.");
+	igt_subtest("map-bo-1ns") {
+		igt_v3d_bo_mmap(fd, bo);
+		igt_v3d_wait_bo(fd, bo, 1);
+		munmap(bo->map, bo->size);
+	}
+
+	igt_describe("Wait for BOs used for a noop job for 0 ns.");
+	igt_subtest("used-bo-0ns") {
+		struct v3d_cl_job *job = igt_v3d_noop_job(fd);
+
+		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit);
+
+		test_used_bo(fd, job->tile_alloc, 0);
+		test_used_bo(fd, job->tile_state, 0);
+		test_used_bo(fd, job->bcl->bo, 0);
+		test_used_bo(fd, job->rcl->bo, 0);
+		test_used_bo(fd, job->icl->bo, 0);
+
+		igt_v3d_free_cl_job(fd, job);
+	}
+
+	igt_describe("Wait for BOs used for a noop job for 1 ns.");
+	igt_subtest("used-bo-1ns") {
+		struct v3d_cl_job *job = igt_v3d_noop_job(fd);
+
+		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit);
+
+		test_used_bo(fd, job->tile_alloc, 1);
+		test_used_bo(fd, job->tile_state, 1);
+		test_used_bo(fd, job->bcl->bo, 1);
+		test_used_bo(fd, job->rcl->bo, 1);
+		test_used_bo(fd, job->icl->bo, 1);
+
+		igt_v3d_free_cl_job(fd, job);
+	}
+
+	igt_describe("Wait for BOs used for a noop job for a long amount of time.");
+	igt_subtest("used-bo") {
+		struct v3d_cl_job *job = igt_v3d_noop_job(fd);
+
+		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit);
+
+		igt_v3d_wait_bo(fd, job->tile_alloc, INT64_MAX);
+		igt_v3d_wait_bo(fd, job->tile_state, INT64_MAX);
+		igt_v3d_wait_bo(fd, job->bcl->bo, INT64_MAX);
+		igt_v3d_wait_bo(fd, job->rcl->bo, INT64_MAX);
+		igt_v3d_wait_bo(fd, job->icl->bo, INT64_MAX);
+
+		igt_v3d_free_cl_job(fd, job);
+	}
+
+	igt_fixture {
+		igt_v3d_free_bo(fd, bo);
+		close(fd);
+	}
+}
diff --git a/tests/v3d_ci/v3d.testlist b/tests/v3d_ci/v3d.testlist
index ce8c4f6c..54d28ce5 100644
--- a/tests/v3d_ci/v3d.testlist
+++ b/tests/v3d_ci/v3d.testlist
@@ -21,3 +21,12 @@ igt@v3d/v3d_perfmon@get-values-invalid-pointer
 igt@v3d/v3d_perfmon@get-values-valid-perfmon
 igt@v3d/v3d_perfmon@destroy-invalid-perfmon
 igt@v3d/v3d_perfmon@destroy-valid-perfmon
+igt@v3d/v3d_wait_bo@bad-bo
+igt@v3d/v3d_wait_bo@bad-pad
+igt@v3d/v3d_wait_bo@unused-bo-0ns
+igt@v3d/v3d_wait_bo@unused-bo-1ns
+igt@v3d/v3d_wait_bo@map-bo-0ns
+igt@v3d/v3d_wait_bo@map-bo-1ns
+igt@v3d/v3d_wait_bo@used-bo-0ns
+igt@v3d/v3d_wait_bo@used-bo-1ns
+igt@v3d/v3d_wait_bo@used-bo
-- 
2.38.1
