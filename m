Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E04F10E264
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Aug 2023 16:57:28 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Aug 2023 22:17:52 +0530
Message-Id: <20230815164815.320904-59-bhanuprakash.modem@intel.com>
In-Reply-To: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
References: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V7 58/81] tests/kms_plane: Document each subtest
 for testplan
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

Add documentation for all kms tests which is used by IGT testplan
documentation.

V2: - Driver requirement: s/any/i915, xe/

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_plane.c | 74 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 098eb0838..721d3b533 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -24,6 +24,11 @@
  *   Damien Lespiau <damien.lespiau@intel.com>
  */
 
+/**
+ * TEST: kms plane
+ * Category: Display
+ * Description: Testes for KMS Plane
+ */
 #include "igt.h"
 #include "igt_vec.h"
 #include <errno.h>
@@ -279,6 +284,29 @@ test_plane_position_with_output(data_t *data,
 	igt_remove_fb(data->drm_fd, &sprite_fb);
 }
 
+/**
+ * SUBTEST: plane-position-%s
+ * Description: Verify plane position using two planes to create a %arg[1]
+ * Driver requirement: i915, xe
+ * Functionality: plane
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: plane-position-hole-dpms
+ * Description: Verify plane position using two planes to create a partially
+ *              covered screen and check for DPMS
+ * Driver requirement: i915, xe
+ * Functionality: dpms, plane
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @covered:           fully covered screen
+ * @hole:              partially covered screen
+ */
 static void
 test_plane_position(data_t *data, enum pipe pipe)
 {
@@ -387,6 +415,29 @@ test_plane_panning_with_output(data_t *data,
 	igt_remove_fb(data->drm_fd, &primary_fb);
 }
 
+/**
+ * SUBTEST: plane-panning-%s
+ * Description: Verify plane panning at %arg[1] using primary plane
+ * Driver requirement: i915, xe
+ * Functionality: plane
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: plane-panning-bottom-right-suspend
+ * Description: Verify plane panning at bottom-right position with suspend using
+ *              primary plane
+ * Driver requirement: i915, xe
+ * Functionality: plane, suspend
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @bottom-right:               bottom-right position
+ * @top-left:                   top-left position
+ */
 static void
 test_plane_panning(data_t *data, enum pipe pipe)
 {
@@ -1116,6 +1167,20 @@ static bool skip_plane(data_t *data, igt_plane_t *plane)
 	return index != 0 && index != 3 && index != 5;
 }
 
+/**
+ * SUBTEST: pixel-%s
+ * Description: verify the pixel formats for given plane and pipe
+ * Driver requirement: i915, xe
+ * Functionality: pixel_format, plane
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @format:
+ * @format-source-clamping:          with source clamping
+ */
 static void
 test_pixel_formats(data_t *data, enum pipe pipe)
 {
@@ -1172,6 +1237,15 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 	igt_assert_f(result, "At least one CRC mismatch happened\n");
 }
 
+/**
+ * SUBTEST: invalid-pixel-format-settings
+ * Description: verify invalid settings for pixel format are not accepted
+ * Driver requirement: i915, xe
+ * Functionality: pixel_format, plane
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 static void test_invalid_settings(data_t *data)
 {
 	enum pipe pipe = PIPE_A;
-- 
2.40.0
