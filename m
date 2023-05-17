Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D20B10E3CD
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 06:40:15 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed, 17 May 2023 12:03:01 +0530
Message-Id: <20230517063323.4146387-60-bhanuprakash.modem@intel.com>
In-Reply-To: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
References: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 59/81] tests/kms_plane: Document each subtest
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
To: igt-dev@lists.freedesktop.org, mchehab@kernel.org
List-ID: <igt-dev@lists.freedesktop.org>

Add documentation for all kms tests which is used by IGT testplan
documentation.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_plane.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 10e16b638..b93e33662 100644
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
@@ -272,6 +277,21 @@ test_plane_position_with_output(data_t *data,
 	igt_remove_fb(data->drm_fd, &sprite_fb);
 }
 
+/**
+ * SUBTEST: plane-position-%s
+ * Description: Verify plane position using two planes to create a %arg[1]
+ * Driver requirement: any
+ * Functionality: plane
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @covered:           fully covered screen
+ * @hole:              partially covered screen
+ * @hole-dpms:         partially covered screen and check for DPMS
+ */
 static void
 test_plane_position(data_t *data, enum pipe pipe)
 {
@@ -380,6 +400,21 @@ test_plane_panning_with_output(data_t *data,
 	igt_remove_fb(data->drm_fd, &primary_fb);
 }
 
+/**
+ * SUBTEST: plane-panning-%s
+ * Description: Verify plane panning at %arg[1] using primary plane
+ * Driver requirement: any
+ * Functionality: plane
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @bottom-right:               bottom-right position
+ * @bottom-right-suspend:       bottom-right position with suspend
+ * @top-left:                   top-left position
+ */
 static void
 test_plane_panning(data_t *data, enum pipe pipe)
 {
@@ -1087,6 +1122,20 @@ static bool skip_plane(data_t *data, igt_plane_t *plane)
 	return index != 0 && index != 3 && index != 5;
 }
 
+/**
+ * SUBTEST: pixel-%s
+ * Description: verify the pixel formats for given plane and pipe
+ * Driver requirement: any
+ * Functionality: plane
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
@@ -1143,6 +1192,15 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 	igt_assert_f(result, "At least one CRC mismatch happened\n");
 }
 
+/**
+ * SUBTEST: invalid-pixel-format-settings
+ * Description: verify invalid settings for pixel format are not accepted
+ * Driver requirement: any
+ * Functionality: plane
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 static void test_invalid_settings(data_t *data)
 {
 	enum pipe pipe = PIPE_A;
-- 
2.40.0


