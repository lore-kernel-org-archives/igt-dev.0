Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A0710E931
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Apr 2023 11:27:49 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 19 Apr 2023 16:52:42 +0530
Message-Id: <20230419112243.1719789-6-bhanuprakash.modem@intel.com>
In-Reply-To: <20230419112243.1719789-1-bhanuprakash.modem@intel.com>
References: <20230419112243.1719789-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 5/6] tests/i915/kms_psr*: Add XE support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add XE driver support for kms tests.

V2: - Fix unknown subtest error on CI
V3: - Rebase

Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_psr.c             | 34 ++++++++++++++++++++++++++++----
 tests/i915/kms_psr2_sf.c         |  2 +-
 tests/i915/kms_psr2_su.c         |  2 +-
 tests/i915/kms_psr_stress_test.c |  2 +-
 4 files changed, 33 insertions(+), 7 deletions(-)

diff --git a/tests/i915/kms_psr.c b/tests/i915/kms_psr.c
index dfc2fbb65..0e8d7f4f0 100644
--- a/tests/i915/kms_psr.c
+++ b/tests/i915/kms_psr.c
@@ -29,6 +29,7 @@
 #include <stdbool.h>
 #include <stdio.h>
 #include <string.h>
+#include "xe/xe_ioctl.h"
 
 enum operations {
 	PAGE_FLIP,
@@ -181,7 +182,8 @@ static void fill_blt(data_t *data, const struct igt_fb *fb, unsigned char color)
 	intel_bb_destroy(ibb);
 	intel_buf_destroy(dst);
 
-	gem_bo_busy(data->drm_fd, fb->gem_handle);
+	if (is_i915_device(data->drm_fd))
+		gem_bo_busy(data->drm_fd, fb->gem_handle);
 }
 
 static void fill_render(data_t *data, const struct igt_fb *fb,
@@ -204,7 +206,16 @@ static void fill_render(data_t *data, const struct igt_fb *fb,
 
 	src = intel_buf_create(data->bops, width, height, fb->plane_bpp[0],
 			       0, tiling, 0);
-	gem_write(data->drm_fd, src->handle, 0, buf, 4);
+
+	if (is_i915_device(data->drm_fd)) {
+		gem_write(data->drm_fd, src->handle, 0, buf, 4);
+	} else {
+		void *map = xe_bo_mmap_ext(data->drm_fd, src->handle, 4,
+					   PROT_READ | PROT_WRITE);
+
+		memcpy(map, buf, 4);
+		gem_munmap(map, 4);
+	}
 
 	rendercopy(ibb,
 		   src, 0, 0, 0xff, 0xff,
@@ -214,7 +225,8 @@ static void fill_render(data_t *data, const struct igt_fb *fb,
 	intel_buf_destroy(src);
 	intel_buf_destroy(dst);
 
-	gem_bo_busy(data->drm_fd, fb->gem_handle);
+	if (is_i915_device(data->drm_fd))
+		gem_bo_busy(data->drm_fd, fb->gem_handle);
 }
 
 static bool sink_support(data_t *data, enum psr_mode mode)
@@ -256,6 +268,11 @@ static bool drrs_disabled(data_t *data)
 {
 	char buf[512];
 
+	/*
+	 * FIXME: As of now, XE's debugfs is using i915 namespace, once Kernel
+	 * changes got landed, please update this logic to use XE specific
+	 * debugfs.
+	 */
 	igt_debugfs_simple_read(data->debugfs_fd, "i915_drrs_status",
 			 buf, sizeof(buf));
 
@@ -510,7 +527,7 @@ igt_main_args("", long_options, help_str, opt_handler, &data)
 	};
 
 	igt_fixture {
-		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
+		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
 		kmstest_set_vt_graphics_mode();
 		data.devid = intel_get_drm_devid(data.drm_fd);
@@ -547,6 +564,9 @@ igt_main_args("", long_options, help_str, opt_handler, &data)
 			igt_subtest_f("%sprimary_%s",
 				      append_subtest_name[data.op_psr_mode],
 				      op_str(op)) {
+				igt_skip_on(is_xe_device(data.drm_fd) &&
+					    (op == MMAP_CPU || op == MMAP_GTT));
+
 				data.op = op;
 				data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
 				test_setup(&data);
@@ -561,6 +581,9 @@ igt_main_args("", long_options, help_str, opt_handler, &data)
 			igt_subtest_f("%ssprite_%s",
 				      append_subtest_name[data.op_psr_mode],
 				      op_str(op)) {
+				igt_skip_on(is_xe_device(data.drm_fd) &&
+					    (op == MMAP_CPU || op == MMAP_GTT));
+
 				data.op = op;
 				data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
 				test_setup(&data);
@@ -573,6 +596,9 @@ igt_main_args("", long_options, help_str, opt_handler, &data)
 			igt_subtest_f("%scursor_%s",
 				      append_subtest_name[data.op_psr_mode],
 				      op_str(op)) {
+				igt_skip_on(is_xe_device(data.drm_fd) &&
+					    (op == MMAP_CPU || op == MMAP_GTT));
+
 				data.op = op;
 				data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
 				test_setup(&data);
diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
index ffaae68b3..4cf986440 100644
--- a/tests/i915/kms_psr2_sf.c
+++ b/tests/i915/kms_psr2_sf.c
@@ -898,7 +898,7 @@ igt_main
 	igt_fixture {
 		drmModeResPtr res;
 
-		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
+		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
 		kmstest_set_vt_graphics_mode();
 
diff --git a/tests/i915/kms_psr2_su.c b/tests/i915/kms_psr2_su.c
index 3e0a78f24..65e67b8c9 100644
--- a/tests/i915/kms_psr2_su.c
+++ b/tests/i915/kms_psr2_su.c
@@ -297,7 +297,7 @@ igt_main
 	igt_fixture {
 		struct itimerspec interval;
 
-		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
+		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
 		kmstest_set_vt_graphics_mode();
 
diff --git a/tests/i915/kms_psr_stress_test.c b/tests/i915/kms_psr_stress_test.c
index 26e222a27..a4cb3194e 100644
--- a/tests/i915/kms_psr_stress_test.c
+++ b/tests/i915/kms_psr_stress_test.c
@@ -331,7 +331,7 @@ igt_main
 	data_t data = {};
 
 	igt_fixture {
-		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
+		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
 		data.bops = buf_ops_create(data.drm_fd);
 		kmstest_set_vt_graphics_mode();
-- 
2.40.0
