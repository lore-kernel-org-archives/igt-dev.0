Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F107810E201
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jun 2023 12:05:23 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 19 Jun 2023 17:28:55 +0530
Message-Id: <20230619115858.2013195-16-bhanuprakash.modem@intel.com>
In-Reply-To: <20230619115858.2013195-1-bhanuprakash.modem@intel.com>
References: <20230619115858.2013195-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 15/18] tests/i915/kms_fb_coherancy: Add XE support
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
---
 tests/i915/kms_fb_coherency.c | 43 +++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/tests/i915/kms_fb_coherency.c b/tests/i915/kms_fb_coherency.c
index b530bf5dc..2bc3bb237 100644
--- a/tests/i915/kms_fb_coherency.c
+++ b/tests/i915/kms_fb_coherency.c
@@ -15,6 +15,7 @@
 #include <string.h>
 
 #include "igt.h"
+#include "xe/xe_ioctl.h"
 
 typedef struct {
 	int drm_fd;
@@ -90,7 +91,7 @@ static struct igt_fb *prepare_fb(data_t *data)
 			0, 0, fb->width, fb->height,
 			0, 0, fb->width << 16, fb->height << 16);
 
-	if (!gem_has_lmem(data->drm_fd)) {
+	if (is_i915_device(data->drm_fd) && !gem_has_lmem(data->drm_fd)) {
 		uint32_t caching;
 
 		/* make sure caching mode has become UC/WT */
@@ -159,7 +160,10 @@ static void test_mmap_offset_wc(data_t *data)
 
 	fb = prepare_fb(data);
 
-	buf = gem_mmap_offset__wc(data->drm_fd, fb->gem_handle, 0, fb->size, PROT_WRITE);
+	if (is_i915_device(data->drm_fd))
+		buf = gem_mmap_offset__wc(data->drm_fd, fb->gem_handle, 0, fb->size, PROT_WRITE);
+	else
+		buf = xe_bo_mmap_ext(data->drm_fd, fb->gem_handle, fb->size, PROT_WRITE);
 
 	check_buf_crc(data, buf, fb);
 }
@@ -225,7 +229,7 @@ igt_main
 	data_t data;
 
 	igt_fixture {
-		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
+		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 
 		data.devid = intel_get_drm_devid(data.drm_fd);
 
@@ -245,39 +249,38 @@ igt_main
 	 *		mmapped with different mmap methods and different caching modes.
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
