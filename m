Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56B310E1C4
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Nov 2022 20:21:40 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Nov 2022 17:21:00 -0300
Message-Id: <20221115202101.278995-5-mcanal@igalia.com>
In-Reply-To: <20221115202101.278995-1-mcanal@igalia.com>
References: <20221115202101.278995-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/5] tests/vc4_perfmon: Create test for
 VC4's Perfmon IOCTLs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add igt_subtests for the VC4's Perfmon IOCTLs:
DRM_IOCTL_VC4_PERFMON_CREATE, DRM_IOCTL_VC4_PERFMON_DESTROY and
DRM_IOCTL_VC4_PERFMON_GET_VALUES. The tests aim to make sure that the
performance monitors are being properly created and destroyed and to
ensure that improper parameters return an errno.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 lib/igt_vc4.c             |  34 ++++++++++
 lib/igt_vc4.h             |   4 ++
 tests/meson.build         |   1 +
 tests/vc4/vc4_perfmon.c   | 136 ++++++++++++++++++++++++++++++++++++++
 tests/vc4_ci/vc4.testlist |  10 +++
 5 files changed, 185 insertions(+)
 create mode 100644 tests/vc4/vc4_perfmon.c

diff --git a/lib/igt_vc4.c b/lib/igt_vc4.c
index 54718cee..f73f8a86 100644
--- a/lib/igt_vc4.c
+++ b/lib/igt_vc4.c
@@ -181,6 +181,40 @@ bool igt_vc4_purgeable_bo(int fd, int handle, bool purgeable)
 	return arg.retained;
 }
 
+uint32_t igt_vc4_perfmon_create(int fd, uint32_t ncounters, uint8_t *events)
+{
+	struct drm_vc4_perfmon_create create = {
+		.ncounters = ncounters,
+	};
+
+	memcpy(create.events, events, ncounters * sizeof(*events));
+
+	do_ioctl(fd, DRM_IOCTL_VC4_PERFMON_CREATE, &create);
+	igt_assert_neq(create.id, 0);
+
+	return create.id;
+}
+
+void igt_vc4_perfmon_get_values(int fd, uint32_t id)
+{
+	uint64_t *values = calloc(DRM_VC4_MAX_PERF_COUNTERS, sizeof(*values));
+	struct drm_vc4_perfmon_get_values get = {
+		.id = id,
+		.values_ptr = to_user_pointer(values),
+	};
+
+	do_ioctl(fd, DRM_IOCTL_VC4_PERFMON_GET_VALUES, &get);
+	free(values);
+}
+
+void igt_vc4_perfmon_destroy(int fd, uint32_t id)
+{
+	struct drm_vc4_perfmon_destroy destroy = {
+		.id = id,
+	};
+
+	do_ioctl(fd, DRM_IOCTL_VC4_PERFMON_DESTROY, &destroy);
+}
 
 /* Calculate the t-tile width so that size = width * height * bpp / 8. */
 #define VC4_T_TILE_W(size, height, bpp) ((size) / (height) / ((bpp) / 8))
diff --git a/lib/igt_vc4.h b/lib/igt_vc4.h
index ddce90da..71f213e6 100644
--- a/lib/igt_vc4.h
+++ b/lib/igt_vc4.h
@@ -35,6 +35,10 @@ int igt_vc4_get_param(int fd, uint32_t param, uint64_t *val);
 bool igt_vc4_purgeable_bo(int fd, int handle, bool purgeable);
 bool igt_vc4_is_tiled(uint64_t modifier);
 
+uint32_t igt_vc4_perfmon_create(int fd, uint32_t ncounters, uint8_t *events);
+void igt_vc4_perfmon_get_values(int fd, uint32_t id);
+void igt_vc4_perfmon_destroy(int fd, uint32_t id);
+
 void igt_vc4_set_tiling(int fd, uint32_t handle, uint64_t modifier);
 uint64_t igt_vc4_get_tiling(int fd, uint32_t handle);
 
diff --git a/tests/meson.build b/tests/meson.build
index c42efdef..2d272dc2 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -255,6 +255,7 @@ vc4_progs = [
 	'vc4_dmabuf_poll',
 	'vc4_label_bo',
 	'vc4_lookup_fail',
+	'vc4_perfmon',
 	'vc4_purgeable_bo',
 	'vc4_tiling',
 	'vc4_wait_bo',
diff --git a/tests/vc4/vc4_perfmon.c b/tests/vc4/vc4_perfmon.c
new file mode 100644
index 00000000..ca7567fd
--- /dev/null
+++ b/tests/vc4/vc4_perfmon.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Igalia S.L.
+ */
+
+#include "igt.h"
+#include "igt_vc4.h"
+
+IGT_TEST_DESCRIPTION("Tests for the VC4's performance monitors");
+
+igt_main
+{
+	int fd;
+
+	igt_fixture
+		fd = drm_open_driver(DRIVER_VC4);
+
+	igt_describe("Make sure a perfmon cannot be created with zero counters.");
+	igt_subtest("create-perfmon-0") {
+		struct drm_vc4_perfmon_create create = {
+			.ncounters = 0,
+		};
+		do_ioctl_err(fd, DRM_IOCTL_VC4_PERFMON_CREATE, &create, EINVAL);
+	}
+
+	igt_describe("Make sure a perfmon cannot be created with more counters than the maximum allowed.");
+	igt_subtest("create-perfmon-exceed") {
+		struct drm_vc4_perfmon_create create = {
+			.ncounters = DRM_VC4_MAX_PERF_COUNTERS + 1,
+		};
+		do_ioctl_err(fd, DRM_IOCTL_VC4_PERFMON_CREATE, &create, EINVAL);
+	}
+
+	igt_describe("Make sure a perfmon cannot be created with invalid events identifiers.");
+	igt_subtest("create-perfmon-invalid-events") {
+		struct drm_vc4_perfmon_create create = {
+			.ncounters = 1,
+			.events = { VC4_PERFCNT_NUM_EVENTS },
+		};
+		do_ioctl_err(fd, DRM_IOCTL_VC4_PERFMON_CREATE, &create, EINVAL);
+	}
+
+	igt_describe("Make sure a perfmon with 1 counter can be created.");
+	igt_subtest("create-single-perfmon") {
+		uint8_t events[] = { VC4_PERFCNT_FEP_VALID_PRIMS_NO_RENDER };
+		uint32_t id = igt_vc4_perfmon_create(fd, 1, events);
+
+		igt_vc4_perfmon_destroy(fd, id);
+	}
+
+	igt_describe("Make sure that two perfmons can be created simultaneously.");
+	igt_subtest("create-two-perfmon") {
+		uint8_t events_perfmon1[] = { VC4_PERFCNT_FEP_VALID_QUADS };
+		uint8_t events_perfmon2[] = { VC4_PERFCNT_L2C_TOTAL_L2_CACHE_HIT, VC4_PERFCNT_QPU_TOTAL_UNIFORM_CACHE_MISS };
+
+		/* Create two different performance monitors */
+		uint32_t id1 = igt_vc4_perfmon_create(fd, 1, events_perfmon1);
+		uint32_t id2 = igt_vc4_perfmon_create(fd, 2, events_perfmon2);
+
+		/* Make sure that the id's of the performance monitors are different */
+		igt_assert_neq(id1, id2);
+
+		igt_vc4_perfmon_destroy(fd, id1);
+
+		/* Make sure that the second perfmon it is still acessible */
+		igt_vc4_perfmon_get_values(fd, id2);
+
+		igt_vc4_perfmon_destroy(fd, id2);
+	}
+
+	igt_describe("Make sure that getting the values from perfmon fails for invalid identifier.");
+	igt_subtest("get-values-invalid-perfmon") {
+		struct drm_vc4_perfmon_get_values get = {
+			.id = 1,
+		};
+		do_ioctl_err(fd, DRM_IOCTL_VC4_PERFMON_GET_VALUES, &get, EINVAL);
+	}
+
+	igt_describe("Make sure that getting the values from perfmon fails for invalid memory pointer.");
+	igt_subtest("get-values-invalid-pointer") {
+		uint8_t counters[] = { VC4_PERFCNT_TLB_QUADS_ZERO_COVERAGE,
+				       VC4_PERFCNT_PLB_PRIMS_OUTSIDE_VIEWPORT,
+				       VC4_PERFCNT_QPU_TOTAL_INST_CACHE_HIT };
+		uint32_t id = igt_vc4_perfmon_create(fd, 3, counters);
+
+		struct drm_vc4_perfmon_get_values get = {
+			.id = id,
+			.values_ptr = 0ULL
+		};
+
+		do_ioctl_err(fd, DRM_IOCTL_VC4_PERFMON_GET_VALUES, &get, EFAULT);
+
+		igt_vc4_perfmon_destroy(fd, id);
+	}
+
+	igt_describe("Sanity check for getting the values from a valid perfmon.");
+	igt_subtest("get-values-valid-perfmon") {
+		uint8_t events[] = { VC4_PERFCNT_VPM_TOTAL_CLK_CYCLES_VDW_STALLED,
+				       VC4_PERFCNT_PSE_PRIMS_REVERSED,
+				       VC4_PERFCNT_QPU_TOTAL_INST_CACHE_HIT };
+		uint32_t id = igt_vc4_perfmon_create(fd, 3, events);
+
+		igt_vc4_perfmon_get_values(fd, id);
+		igt_vc4_perfmon_destroy(fd, id);
+	}
+
+	igt_describe("Make sure that destroying a non-existent perfmon fails.");
+	igt_subtest("destroy-invalid-perfmon") {
+		struct drm_vc4_perfmon_destroy destroy = {
+			.id = 1,
+		};
+		do_ioctl_err(fd, DRM_IOCTL_VC4_PERFMON_DESTROY, &destroy, EINVAL);
+	}
+
+	igt_describe("Make sure that a perfmon is not accessible after being destroyed.");
+	igt_subtest("destroy-valid-perfmon") {
+		uint8_t events[] = { VC4_PERFCNT_QPU_TOTAL_CLK_CYCLES_EXEC_VALID_INST,
+				       VC4_PERFCNT_FEP_VALID_QUADS,
+				       VC4_PERFCNT_TMU_TOTAL_TEXT_CACHE_MISS,
+				       VC4_PERFCNT_L2C_TOTAL_L2_CACHE_MISS };
+		uint32_t id = igt_vc4_perfmon_create(fd, 4, events);
+		struct drm_vc4_perfmon_get_values get = {
+			.id = id,
+		};
+
+		igt_vc4_perfmon_get_values(fd, id);
+
+		igt_vc4_perfmon_destroy(fd, id);
+
+		/* Make sure that the id is no longer allocate */
+		do_ioctl_err(fd, DRM_IOCTL_VC4_PERFMON_GET_VALUES, &get, EINVAL);
+	}
+
+	igt_fixture
+		close(fd);
+}
diff --git a/tests/vc4_ci/vc4.testlist b/tests/vc4_ci/vc4.testlist
index e86d4c81..a27ed33b 100644
--- a/tests/vc4_ci/vc4.testlist
+++ b/tests/vc4_ci/vc4.testlist
@@ -8,6 +8,16 @@ igt@vc4_label_bo@set-bad-handle
 igt@vc4_label_bo@set-bad-name
 igt@vc4_label_bo@set-kernel-name
 igt@vc4_lookup_fail@bad-color-write
+igt@vc4_perfmon@create-perfmon-0
+igt@vc4_perfmon@create-perfmon-exceed
+igt@vc4_perfmon@create-perfmon-invalid-events
+igt@vc4_perfmon@create-single-perfmon
+igt@vc4_perfmon@create-two-perfmon
+igt@vc4_perfmon@get-values-invalid-perfmon
+igt@vc4_perfmon@get-values-invalid-pointer
+igt@vc4_perfmon@get-values-valid-perfmon
+igt@vc4_perfmon@destroy-invalid-perfmon
+igt@vc4_perfmon@destroy-valid-perfmon
 igt@vc4_purgeable_bo@mark-willneed
 igt@vc4_purgeable_bo@mark-purgeable
 igt@vc4_purgeable_bo@mark-purgeable-twice
-- 
2.38.1
