Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD86910E3B1
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 06:39:02 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed, 17 May 2023 12:02:13 +0530
Message-Id: <20230517063323.4146387-12-bhanuprakash.modem@intel.com>
In-Reply-To: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
References: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 11/81] tests/i915/kms_big_fb: Document each
 subtest for testplan
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
 tests/i915/kms_big_fb.c | 153 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 153 insertions(+)

diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
index a0d5ef730..d0afb9dcc 100644
--- a/tests/i915/kms_big_fb.c
+++ b/tests/i915/kms_big_fb.c
@@ -21,6 +21,12 @@
  * IN THE SOFTWARE.
  */
 
+/**
+ * TEST: kms big fb
+ * Category: Display
+ * Description: Test big framebuffers
+ */
+
 #include "igt.h"
 #include <errno.h>
 #include <stdbool.h>
@@ -579,6 +585,93 @@ max_hw_stride_async_flip_test(data_t *data)
 	return true;
 }
 
+/**
+ * SUBTEST: %s-%dbpp-rotate-%d
+ * Description: Sanity check if addfb ioctl works correctly for given combination
+ *              of %arg[1] with %arg[2]-bpp & %arg[3]-rotation
+ * Driver requirement: i915
+ * Functionality: xorg_big_displays
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @4-tiled:                  TILE-4 modifier
+ * @x-tiled:                  TILE-X modifier
+ * @y-tiled:                  TILE-Y modifier
+ * @yf-tiled:                 TILE-YF modifier
+ *
+ * arg[2].values: 8, 16, 32, 64
+ * arg[3].values: 0, 90, 180, 270
+ */
+
+/**
+ * SUBTEST: %s-max-hw-stride-%dbpp-rotate-%d
+ * Description: Test maximum hardware supported stride length for given combination
+ *              of %arg[1] modifier with max hardware stride length, %arg[2]-bpp,
+ *              and %arg[3]-rotation
+ * Driver requirement: i915
+ * Functionality: xorg_big_displays
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: %s-max-hw-stride-%dbpp-rotate-%d-%s
+ * Description: Test maximum hardware supported stride length for given combination
+ *              of %arg[1] modifier with max hardware stride length, %arg[2]-bpp,
+ *              and %arg[3]-rotation with %arg[4] mode
+ * Driver requirement: i915
+ * Functionality: xorg_big_displays
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @4-tiled:                  TILE-4 modifier
+ * @x-tiled:                  TILE-X modifier
+ * @y-tiled:                  TILE-Y modifier
+ * @yf-tiled:                 TILE-YF modifier
+ *
+ * arg[2].values: 32, 64
+ * arg[3].values: 0, 180
+ *
+ * arg[4]:
+ *
+ * @async-flip:         Async flip
+ * @hflip:              H-flip
+ * @hflip-async-flip:   Async & H-flip
+ */
+
+/**
+ * SUBTEST: linear-%dbpp-rotate-%d
+ * Description: Sanity check if addfb ioctl works correctly for given combination
+ *              of Linear modifier with %arg[1]-bpp & %arg[2]-rotation
+ * Driver requirement: any
+ * Functionality: xorg_big_displays
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1].values: 8, 16, 32, 64
+ * arg[2].values: 0, 90, 180, 270
+ */
+
+/**
+ * SUBTEST: linear-max-hw-stride-%dbpp-rotate-%d
+ * Description: Sanity check if addfb ioctl works correctly for given combination
+ *              of Linear modifier with max hardware stride length with
+ *              %arg[1]-bpp & %arg[2]-rotation
+ * Driver requirement: any
+ * Functionality: xorg_big_displays
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1].values: 32, 64
+ * arg[2].values: 0, 180
+ */
 static void test_scanout(data_t *data)
 {
 	igt_output_t *output;
@@ -624,6 +717,23 @@ static void test_scanout(data_t *data)
 	igt_skip("unsupported configuration\n");
 }
 
+/**
+ * SUBTEST: %s-addfb-size-overflow
+ * Description: Sanity check if addfb ioctl fails correctly for (%arg[1]) modifier
+ *              with small bo.
+ * Driver requirement: i915
+ * Functionality: xorg_big_displays
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @4-tiled:    TILE-4
+ * @x-tiled:    TILE-X
+ * @y-tiled:    TILE-Y
+ * @yf-tiled:   TILE-YF
+ */
 static void
 test_size_overflow(data_t *data)
 {
@@ -663,6 +773,23 @@ test_size_overflow(data_t *data)
 	gem_close(data->drm_fd, bo);
 }
 
+/**
+ * SUBTEST: %s-addfb-size-offset-overflow
+ * Description: Sanity check if addfb ioctl fails correctly for (%arg[1]) modifier
+ *              and offsets with small bo
+ * Driver requirement: i915
+ * Functionality: xorg_big_displays
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @4-tiled:    TILE-4
+ * @x-tiled:    TILE-X
+ * @y-tiled:    TILE-Y
+ * @yf-tiled:   TILE-YF
+ */
 static void
 test_size_offset_overflow(data_t *data)
 {
@@ -715,6 +842,32 @@ static int rmfb(int fd, uint32_t id)
 	return err;
 }
 
+/**
+ * SUBTEST: linear-addfb
+ * Description: Sanity check if addfb ioctl works correctly with linear modifier
+ *              for given size and strides of fb
+ * Driver requirement: any
+ * Functionality: xorg_big_displays
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: %s-tiled-addfb
+ * Description: Sanity check if addfb ioctl works correctly with %arg[1] modifier
+ *              for given size and strides of fb
+ * Driver requirement: i915
+ * Functionality: xorg_big_displays
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @4:    TILE-4
+ * @x:    TILE-X
+ * @y:    TILE-Y
+ * @yf:   TILE-YF
+ */
 static void
 test_addfb(data_t *data)
 {
-- 
2.40.0


