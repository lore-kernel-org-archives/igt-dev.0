Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D650A10E11B
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Oct 2023 08:24:16 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 26 Oct 2023 13:44:48 +0530
Message-Id: <20231026081449.3967346-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20231026081449.3967346-1-bhanuprakash.modem@intel.com>
References: <20231026081449.3967346-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 1/2] tests/i915/kms_fb_coherency: Add XE support
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

Add XE driver support for kms tests. This patch will add a support
to call the corresponding apis based on the driver (i915/xe)

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_fb_coherency.c | 43 ++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/tests/intel/kms_fb_coherency.c b/tests/intel/kms_fb_coherency.c
index 1b532fd99..a92174bde 100644
--- a/tests/intel/kms_fb_coherency.c
+++ b/tests/intel/kms_fb_coherency.c
@@ -16,6 +16,7 @@
 #include <string.h>
 
 #include "igt.h"
+#include "xe/xe_ioctl.h"
 
 typedef struct {
 	int drm_fd;
@@ -91,7 +92,7 @@ static struct igt_fb *prepare_fb(data_t *data)
 			0, 0, fb->width, fb->height,
 			0, 0, fb->width << 16, fb->height << 16);
 
-	if (!gem_has_lmem(data->drm_fd)) {
+	if (is_i915_device(data->drm_fd) && !gem_has_lmem(data->drm_fd)) {
 		uint32_t caching;
 
 		/* make sure caching mode has become UC/WT */
@@ -160,7 +161,10 @@ static void test_mmap_offset_wc(data_t *data)
 
 	fb = prepare_fb(data);
 
-	buf = gem_mmap_offset__wc(data->drm_fd, fb->gem_handle, 0, fb->size, PROT_WRITE);
+	if (is_i915_device(data->drm_fd))
+		buf = gem_mmap_offset__wc(data->drm_fd, fb->gem_handle, 0, fb->size, PROT_WRITE);
+	else
+		buf = xe_bo_mmap_ext(data->drm_fd, fb->gem_handle, fb->size, PROT_WRITE);
 
 	check_buf_crc(data, buf, fb);
 }
@@ -226,7 +230,7 @@ igt_main
 	data_t data;
 
 	igt_fixture {
-		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
+		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 
 		data.devid = intel_get_drm_devid(data.drm_fd);
 
@@ -250,39 +254,38 @@ igt_main
 	 * Test category: functionality test
 	 */
 	igt_subtest_with_dynamic("memset-crc") {
-		if (gem_has_mappable_ggtt(data.drm_fd)) {
+		if (igt_draw_supports_method(data.drm_fd, IGT_DRAW_MMAP_GTT)) {
 			igt_dynamic("mmap-gtt")
 				test_mmap_gtt(&data);
 
 			cleanup_crtc(&data);
 		}
 
-		if (gem_mmap_offset__has_wc(data.drm_fd)) {
+		if (igt_draw_supports_method(data.drm_fd, IGT_DRAW_MMAP_WC)) {
 			igt_dynamic("mmap-offset-wc")
 				test_mmap_offset_wc(&data);
 
 			cleanup_crtc(&data);
 		}
 
-		if (gem_has_lmem(data.drm_fd)) {
-			igt_dynamic("mmap-offset-fixed")
-				test_mmap_offset_fixed(&data);
+		if (is_i915_device(data.drm_fd)) {
+			if (gem_has_lmem(data.drm_fd)) {
+				igt_dynamic("mmap-offset-fixed")
+					test_mmap_offset_fixed(&data);
+			} else if (gem_has_mmap_offset(data.drm_fd)) {
+				igt_dynamic("mmap-offset-uc")
+					test_mmap_offset_uc(&data);
+			}
 
 			cleanup_crtc(&data);
 
-		} else if (gem_has_mmap_offset(data.drm_fd)) {
-			igt_dynamic("mmap-offset-uc")
-				test_mmap_offset_uc(&data);
+			if (gem_has_legacy_mmap(data.drm_fd) &&
+			    gem_mmap__has_wc(data.drm_fd)) {
+				igt_dynamic("mmap-legacy-wc")
+					test_legacy_mmap_wc(&data);
 
-			cleanup_crtc(&data);
-		}
-
-		if (gem_has_legacy_mmap(data.drm_fd) &&
-		    gem_mmap__has_wc(data.drm_fd)) {
-			igt_dynamic("mmap-legacy-wc")
-				test_legacy_mmap_wc(&data);
-
-			cleanup_crtc(&data);
+				cleanup_crtc(&data);
+			}
 		}
 	}
 
-- 
2.40.0
