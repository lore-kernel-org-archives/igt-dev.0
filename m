Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48F710E55A
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Nov 2022 23:58:08 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  8 Nov 2022 20:57:24 -0300
Message-Id: <20221108235724.126287-7-mcanal@igalia.com>
In-Reply-To: <20221108235724.126287-1-mcanal@igalia.com>
References: <20221108235724.126287-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 6/6] tests/v3d_perfmon: Create test for
 V3D's Perfmon IOCTLs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, Emma Anholt <emma@anholt.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add igt_subtests for the V3D's Perfmon IOCTLs:
DRM_IOCTL_V3D_PERFMON_CREATE, DRM_IOCTL_V3D_PERFMON_DESTROY and
DRM_IOCTL_V3D_PERFMON_GET_VALUES. The tests aim to make sure that the
performance monitors are being properly created and destroyed and to
ensure that improper parameters return an errno.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 lib/igt_v3d.c             |  36 +++++++++
 lib/igt_v3d.h             |   4 +
 tests/meson.build         |   1 +
 tests/v3d/v3d_perfmon.c   | 153 ++++++++++++++++++++++++++++++++++++++
 tests/v3d_ci/v3d.testlist |  11 +++
 5 files changed, 205 insertions(+)
 create mode 100644 tests/v3d/v3d_perfmon.c

diff --git a/lib/igt_v3d.c b/lib/igt_v3d.c
index bd645320..5aa583da 100644
--- a/lib/igt_v3d.c
+++ b/lib/igt_v3d.c
@@ -121,3 +121,39 @@ void igt_v3d_bo_mmap(int fd, struct v3d_bo *bo)
 				  PROT_READ | PROT_WRITE);
 	igt_assert(bo->map);
 }
+
+uint32_t igt_v3d_perfmon_create(int fd, uint32_t ncounters, uint8_t *counters)
+{
+	struct drm_v3d_perfmon_create create = {
+		.ncounters = ncounters,
+	};
+
+	memcpy(create.counters, counters, ncounters * sizeof(*counters));
+
+	do_ioctl(fd, DRM_IOCTL_V3D_PERFMON_CREATE, &create);
+	igt_assert_neq(create.id, 0);
+
+	return create.id;
+}
+
+void igt_v3d_perfmon_get_values(int fd, uint32_t id)
+{
+	uint64_t *values = calloc(DRM_V3D_MAX_PERF_COUNTERS, sizeof(*values));
+	struct drm_v3d_perfmon_get_values get = {
+		.id = id,
+		.values_ptr = to_user_pointer(values)
+	};
+
+	do_ioctl(fd, DRM_IOCTL_V3D_PERFMON_GET_VALUES, &get);
+
+	free(values);
+}
+
+void igt_v3d_perfmon_destroy(int fd, uint32_t id)
+{
+	struct drm_v3d_perfmon_destroy destroy = {
+		.id = id,
+	};
+
+	do_ioctl(fd, DRM_IOCTL_V3D_PERFMON_DESTROY, &destroy);
+}
diff --git a/lib/igt_v3d.h b/lib/igt_v3d.h
index 202c5e22..2edb0f03 100644
--- a/lib/igt_v3d.h
+++ b/lib/igt_v3d.h
@@ -45,4 +45,8 @@ void *igt_v3d_mmap_bo(int fd, uint32_t handle, uint32_t size, unsigned prot);
 
 void igt_v3d_bo_mmap(int fd, struct v3d_bo *bo);
 
+uint32_t igt_v3d_perfmon_create(int fd, uint32_t ncounters, uint8_t *counters);
+void igt_v3d_perfmon_get_values(int fd, uint32_t id);
+void igt_v3d_perfmon_destroy(int fd, uint32_t id);
+
 #endif /* IGT_V3D_H */
diff --git a/tests/meson.build b/tests/meson.build
index f1a6a9dd..0efe5172 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -260,6 +260,7 @@ v3d_progs = [
 	'v3d_get_bo_offset',
 	'v3d_get_param',
 	'v3d_mmap',
+	'v3d_perfmon',
 ]
 
 chamelium_progs = [
diff --git a/tests/v3d/v3d_perfmon.c b/tests/v3d/v3d_perfmon.c
new file mode 100644
index 00000000..5b0a4fe2
--- /dev/null
+++ b/tests/v3d/v3d_perfmon.c
@@ -0,0 +1,153 @@
+/*
+ * Copyright © 2022 Igalia S.L.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *	Maíra Canal <mcanal@igalia.com>
+ */
+
+#include "igt.h"
+#include "igt_v3d.h"
+
+igt_main
+{
+	int fd;
+
+	igt_fixture
+		fd = drm_open_driver(DRIVER_V3D);
+
+	igt_subtest("create-perfmon-0") {
+		struct drm_v3d_perfmon_create create = {
+			.ncounters = 0,
+		};
+		do_ioctl_err(fd, DRM_IOCTL_V3D_PERFMON_CREATE, &create, EINVAL);
+	}
+
+	igt_subtest("create-perfmon-exceed") {
+		struct drm_v3d_perfmon_create create = {
+			.ncounters = DRM_V3D_MAX_PERF_COUNTERS + 1,
+		};
+		do_ioctl_err(fd, DRM_IOCTL_V3D_PERFMON_CREATE, &create, EINVAL);
+	}
+
+	igt_subtest("create-perfmon-invalid-counters") {
+		struct drm_v3d_perfmon_create create = {
+			.ncounters = 1,
+			.counters = { V3D_PERFCNT_NUM },
+		};
+		do_ioctl_err(fd, DRM_IOCTL_V3D_PERFMON_CREATE, &create, EINVAL);
+	}
+
+	igt_subtest("create-single-perfmon") {
+		uint8_t counters[] = { V3D_PERFCNT_FEP_VALID_PRIMTS_NO_PIXELS };
+		uint32_t id = igt_v3d_perfmon_create(fd, 1, counters);
+
+		igt_v3d_perfmon_destroy(fd, id);
+	}
+
+	igt_subtest("create-two-perfmon") {
+		uint8_t counters_perfmon1[] = { V3D_PERFCNT_AXI_WRITE_STALLS_WATCH_0 };
+		uint8_t counters_perfmon2[] = { V3D_PERFCNT_L2T_TMUCFG_READS, V3D_PERFCNT_CORE_MEM_WRITES };
+
+		/* Create two different performance monitors */
+		uint32_t id1 = igt_v3d_perfmon_create(fd, 1, counters_perfmon1);
+		uint32_t id2 = igt_v3d_perfmon_create(fd, 2, counters_perfmon2);
+
+		/* Make sure that the id's of the performance monitors are different */
+		igt_assert_neq(id1, id2);
+
+		igt_v3d_perfmon_destroy(fd, id1);
+
+		/* Make sure that the second perfmon it is still acessible */
+		igt_v3d_perfmon_get_values(fd, id2);
+
+		igt_v3d_perfmon_destroy(fd, id2);
+	}
+
+	igt_subtest("get-values-invalid-pad") {
+		struct drm_v3d_perfmon_get_values get = {
+			.pad = 1,
+		};
+		do_ioctl_err(fd, DRM_IOCTL_V3D_PERFMON_GET_VALUES, &get, EINVAL);
+	}
+
+	igt_subtest("get-values-invalid-perfmon") {
+		struct drm_v3d_perfmon_get_values get = {
+			.id = 1,
+		};
+		do_ioctl_err(fd, DRM_IOCTL_V3D_PERFMON_GET_VALUES, &get, EINVAL);
+	}
+
+	igt_subtest("get-values-invalid-pointer") {
+		uint8_t counters[] = { V3D_PERFCNT_TLB_QUADS_STENCIL_FAIL,
+				       V3D_PERFCNT_PTB_PRIM_VIEWPOINT_DISCARD,
+				       V3D_PERFCNT_QPU_UC_HIT };
+		uint32_t id = igt_v3d_perfmon_create(fd, 3, counters);
+
+		struct drm_v3d_perfmon_get_values get = {
+			.id = id,
+			.values_ptr = 0ULL
+		};
+
+		do_ioctl_err(fd, DRM_IOCTL_V3D_PERFMON_GET_VALUES, &get, EFAULT);
+
+		igt_v3d_perfmon_destroy(fd, id);
+	}
+
+	igt_subtest("get-values-valid-perfmon") {
+		uint8_t counters[] = { V3D_PERFCNT_COMPUTE_ACTIVE,
+				       V3D_PERFCNT_PTB_MEM_READS,
+				       V3D_PERFCNT_CLE_ACTIVE };
+		uint32_t id = igt_v3d_perfmon_create(fd, 3, counters);
+
+		igt_v3d_perfmon_get_values(fd, id);
+		igt_v3d_perfmon_destroy(fd, id);
+	}
+
+	igt_subtest("destroy-invalid-perfmon") {
+		/* Try to destroy an id that was not created */
+		struct drm_v3d_perfmon_destroy destroy = {
+			.id = 1,
+		};
+		do_ioctl_err(fd, DRM_IOCTL_V3D_PERFMON_DESTROY, &destroy, EINVAL);
+	}
+
+	igt_subtest("destroy-valid-perfmon") {
+		uint8_t counters[] = { V3D_PERFCNT_AXI_WRITE_STALLS_WATCH_1,
+				       V3D_PERFCNT_TMU_CONFIG_ACCESSES,
+				       V3D_PERFCNT_TLB_PARTIAL_QUADS,
+				       V3D_PERFCNT_L2T_SLC0_READS };
+		uint32_t id = igt_v3d_perfmon_create(fd, 4, counters);
+		struct drm_v3d_perfmon_get_values get = {
+			.id = id,
+		};
+
+		igt_v3d_perfmon_get_values(fd, id);
+
+		igt_v3d_perfmon_destroy(fd, id);
+
+		/* Make sure that the id is no longer allocate */
+		do_ioctl_err(fd, DRM_IOCTL_V3D_PERFMON_GET_VALUES, &get, EINVAL);
+	}
+
+	igt_fixture
+		close(fd);
+}
diff --git a/tests/v3d_ci/v3d.testlist b/tests/v3d_ci/v3d.testlist
index f4355285..0b05614d 100644
--- a/tests/v3d_ci/v3d.testlist
+++ b/tests/v3d_ci/v3d.testlist
@@ -7,3 +7,14 @@ igt@v3d_get_param@base-params
 igt@v3d_get_param@get-bad-param
 igt@v3d_get_param@get-bad-flags
 igt@v3d_mmap@mmap-bad-handle
+igt@v3d_perfmon@create-perfmon-0
+igt@v3d_perfmon@create-perfmon-exceed
+igt@v3d_perfmon@create-perfmon-invalid-counters
+igt@v3d_perfmon@create-single-perfmon
+igt@v3d_perfmon@create-two-perfmon
+igt@v3d_perfmon@get-values-invalid-pad
+igt@v3d_perfmon@get-values-invalid-perfmon
+igt@v3d_perfmon@get-values-invalid-pointer
+igt@v3d_perfmon@get-values-valid-perfmon
+igt@v3d_perfmon@destroy-invalid-perfmon
+igt@v3d_perfmon@destroy-valid-perfmon
-- 
2.38.1
