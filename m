Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A1B10E22A
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Nov 2022 18:41:28 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 29 Nov 2022 15:40:38 -0300
Message-Id: <20221129184038.72946-8-mcanal@igalia.com>
In-Reply-To: <20221129184038.72946-1-mcanal@igalia.com>
References: <20221129184038.72946-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 7/7] tests/v3d_perfmon: Create test for
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

Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 lib/igt_v3d.c             |  36 ++++++++++
 lib/igt_v3d.h             |   4 ++
 tests/v3d/meson.build     |   1 +
 tests/v3d/v3d_perfmon.c   | 144 ++++++++++++++++++++++++++++++++++++++
 tests/v3d_ci/v3d.testlist |  11 +++
 5 files changed, 196 insertions(+)
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
diff --git a/tests/v3d/meson.build b/tests/v3d/meson.build
index 66d5290e..07badc49 100644
--- a/tests/v3d/meson.build
+++ b/tests/v3d/meson.build
@@ -3,6 +3,7 @@ v3d_progs = [
 	'v3d_get_bo_offset',
 	'v3d_get_param',
 	'v3d_mmap',
+	'v3d_perfmon',
 ]
 
 foreach prog : v3d_progs
diff --git a/tests/v3d/v3d_perfmon.c b/tests/v3d/v3d_perfmon.c
new file mode 100644
index 00000000..bf983dbf
--- /dev/null
+++ b/tests/v3d/v3d_perfmon.c
@@ -0,0 +1,144 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Igalia S.L.
+ */
+
+#include "igt.h"
+#include "igt_v3d.h"
+
+IGT_TEST_DESCRIPTION("Tests for the V3D's performance monitors");
+
+igt_main
+{
+	int fd;
+
+	igt_fixture
+		fd = drm_open_driver(DRIVER_V3D);
+
+	igt_describe("Make sure a perfmon cannot be created with zero counters.");
+	igt_subtest("create-perfmon-0") {
+		struct drm_v3d_perfmon_create create = {
+			.ncounters = 0,
+		};
+		do_ioctl_err(fd, DRM_IOCTL_V3D_PERFMON_CREATE, &create, EINVAL);
+	}
+
+	igt_describe("Make sure a perfmon cannot be created with more counters than the maximum allowed.");
+	igt_subtest("create-perfmon-exceed") {
+		struct drm_v3d_perfmon_create create = {
+			.ncounters = DRM_V3D_MAX_PERF_COUNTERS + 1,
+		};
+		do_ioctl_err(fd, DRM_IOCTL_V3D_PERFMON_CREATE, &create, EINVAL);
+	}
+
+	igt_describe("Make sure a perfmon cannot be created with invalid counters identifiers.");
+	igt_subtest("create-perfmon-invalid-counters") {
+		struct drm_v3d_perfmon_create create = {
+			.ncounters = 1,
+			.counters = { V3D_PERFCNT_NUM },
+		};
+		do_ioctl_err(fd, DRM_IOCTL_V3D_PERFMON_CREATE, &create, EINVAL);
+	}
+
+	igt_describe("Make sure a perfmon with 1 counter can be created.");
+	igt_subtest("create-single-perfmon") {
+		uint8_t counters[] = { V3D_PERFCNT_FEP_VALID_PRIMTS_NO_PIXELS };
+		uint32_t id = igt_v3d_perfmon_create(fd, 1, counters);
+
+		igt_v3d_perfmon_destroy(fd, id);
+	}
+
+	igt_describe("Make sure that two perfmons can be created simultaneously.");
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
+	igt_describe("Make sure that getting the values from perfmon fails for non-zero pad.");
+	igt_subtest("get-values-invalid-pad") {
+		struct drm_v3d_perfmon_get_values get = {
+			.pad = 1,
+		};
+		do_ioctl_err(fd, DRM_IOCTL_V3D_PERFMON_GET_VALUES, &get, EINVAL);
+	}
+
+	igt_describe("Make sure that getting the values from perfmon fails for invalid identifier.");
+	igt_subtest("get-values-invalid-perfmon") {
+		struct drm_v3d_perfmon_get_values get = {
+			.id = 1,
+		};
+		do_ioctl_err(fd, DRM_IOCTL_V3D_PERFMON_GET_VALUES, &get, EINVAL);
+	}
+
+	igt_describe("Make sure that getting the values from perfmon fails for invalid memory pointer.");
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
+	igt_describe("Sanity check for getting the values from a valid perfmon.");
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
+	igt_describe("Make sure that destroying a non-existent perfmon fails.");
+	igt_subtest("destroy-invalid-perfmon") {
+		struct drm_v3d_perfmon_destroy destroy = {
+			.id = 1,
+		};
+		do_ioctl_err(fd, DRM_IOCTL_V3D_PERFMON_DESTROY, &destroy, EINVAL);
+	}
+
+	igt_describe("Make sure that a perfmon is not accessible after being destroyed.");
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
index 53898aa5..64359fb7 100644
--- a/tests/v3d_ci/v3d.testlist
+++ b/tests/v3d_ci/v3d.testlist
@@ -8,3 +8,14 @@ igt@v3d/v3d_get_param@base-params
 igt@v3d/v3d_get_param@get-bad-param
 igt@v3d/v3d_get_param@get-bad-flags
 igt@v3d/v3d_mmap@mmap-bad-handle
+igt@v3d/v3d_perfmon@create-perfmon-0
+igt@v3d/v3d_perfmon@create-perfmon-exceed
+igt@v3d/v3d_perfmon@create-perfmon-invalid-counters
+igt@v3d/v3d_perfmon@create-single-perfmon
+igt@v3d/v3d_perfmon@create-two-perfmon
+igt@v3d/v3d_perfmon@get-values-invalid-pad
+igt@v3d/v3d_perfmon@get-values-invalid-perfmon
+igt@v3d/v3d_perfmon@get-values-invalid-pointer
+igt@v3d/v3d_perfmon@get-values-valid-perfmon
+igt@v3d/v3d_perfmon@destroy-invalid-perfmon
+igt@v3d/v3d_perfmon@destroy-valid-perfmon
-- 
2.38.1
