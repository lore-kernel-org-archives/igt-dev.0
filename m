Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09CDB10EB84
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Apr 2023 16:32:14 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 13 Apr 2023 21:57:31 +0530
Message-Id: <20230413162732.1155058-7-bhanuprakash.modem@intel.com>
In-Reply-To: <20230413162732.1155058-1-bhanuprakash.modem@intel.com>
References: <20230413162732.1155058-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 6/7] tests/i915/kms_psr: Add XE support
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_psr.c             | 39 +++++++++++++++++++++++++++-----
 tests/i915/kms_psr2_sf.c         |  2 +-
 tests/i915/kms_psr2_su.c         |  2 +-
 tests/i915/kms_psr_stress_test.c |  2 +-
 4 files changed, 36 insertions(+), 9 deletions(-)

diff --git a/tests/i915/kms_psr.c b/tests/i915/kms_psr.c
index 3efe1faec8e..7d49377e95a 100644
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
 
@@ -388,7 +405,8 @@ static void setup_test_plane(data_t *data, int test_plane)
 	igt_create_color_fb(data->drm_fd,
 			    data->mode->hdisplay, data->mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    I915_FORMAT_MOD_X_TILED,
+			    is_i915_device(data->drm_fd) ?
+				I915_FORMAT_MOD_X_TILED : DRM_FORMAT_MOD_LINEAR,
 			    0.0, 1.0, 0.0,
 			    &data->fb_green);
 
@@ -416,7 +434,8 @@ static void setup_test_plane(data_t *data, int test_plane)
 		igt_create_color_fb(data->drm_fd,
 				    white_h, white_v,
 				    DRM_FORMAT_XRGB8888,
-				    I915_FORMAT_MOD_X_TILED,
+				    is_i915_device(data->drm_fd) ?
+					I915_FORMAT_MOD_X_TILED : DRM_FORMAT_MOD_LINEAR,
 				    1.0, 1.0, 1.0,
 				    &data->fb_white);
 		break;
@@ -510,7 +529,7 @@ igt_main_args("", long_options, help_str, opt_handler, &data)
 	};
 
 	igt_fixture {
-		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
+		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
 		kmstest_set_vt_graphics_mode();
 		data.devid = intel_get_drm_devid(data.drm_fd);
@@ -542,6 +561,10 @@ igt_main_args("", long_options, help_str, opt_handler, &data)
 		}
 
 		for (op = PAGE_FLIP; op <= RENDER; op++) {
+			if (is_xe_device(data.drm_fd) &&
+			    (op == MMAP_CPU || op == MMAP_GTT))
+				continue;
+
 			igt_describe("Check if psr is detecting page-flipping,memory mapping and "
 					"rendering operations performed on primary planes");
 			igt_subtest_f("%sprimary_%s",
@@ -556,6 +579,10 @@ igt_main_args("", long_options, help_str, opt_handler, &data)
 		}
 
 		for (op = MMAP_GTT; op <= PLANE_ONOFF; op++) {
+			if (is_xe_device(data.drm_fd) &&
+			    (op == MMAP_CPU || op == MMAP_GTT))
+				continue;
+
 			igt_describe("Check if psr is detecting memory mapping,rendering "
 					"and plane operations performed on sprite planes");
 			igt_subtest_f("%ssprite_%s",
diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
index ffaae68b3e6..4cf9864409c 100644
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
index 3e0a78f24b2..65e67b8c9be 100644
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
index 26e222a27b6..a4cb3194ebe 100644
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
