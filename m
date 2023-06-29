Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C30E710E3E8
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jun 2023 14:55:41 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 29 Jun 2023 20:17:59 +0530
Message-Id: <20230629144910.3055377-11-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V5 i-g-t 10/81] tests/i915/kms_big_fb: Document each
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
List-ID: <igt-dev@lists.freedesktop.org>

Add documentation for all kms tests which is used by IGT testplan
documentation.

V2: - Fix driver requirement

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_big_fb.c | 132 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
index 44ea117a1..84485e244 100644
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
@@ -582,6 +588,78 @@ max_hw_stride_async_flip_test(data_t *data)
 	return true;
 }
 
+/**
+ * SUBTEST: %s-%dbpp-rotate-%d
+ * Description: Sanity check if addfb ioctl works correctly for given combination
+ *              of %arg[1] with %arg[2]-bpp & %arg[3]-rotation
+ * Driver requirement: any
+ * Functionality: xorg_big_displays
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @linear:             Linear modifier
+ * @4-tiled:            TILE-4 modifier
+ * @x-tiled:            TILE-X modifier
+ * @y-tiled:            TILE-Y modifier
+ * @yf-tiled:           TILE-YF modifier
+ *
+ * arg[2].values:       8, 16, 32, 64
+ * arg[3].values:       0, 90, 180, 270
+ */
+
+/**
+ * SUBTEST: %s-max-hw-stride-%dbpp-rotate-%d
+ * Description: Test maximum hardware supported stride length for given combination
+ *              of %arg[1] modifier with max hardware stride length, %arg[2]-bpp,
+ *              and %arg[3]-rotation
+ * Driver requirement: any
+ * Functionality: xorg_big_displays
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @linear:             Linear modifier
+ * @4-tiled:            TILE-4 modifier
+ * @x-tiled:            TILE-X modifier
+ * @y-tiled:            TILE-Y modifier
+ * @yf-tiled:           TILE-YF modifier
+ *
+ * arg[2].values:       32, 64
+ * arg[3].values:       0, 180
+ */
+
+/**
+ * SUBTEST: %s-max-hw-stride-%dbpp-rotate-%d-%s
+ * Description: Test maximum hardware supported stride length for given combination
+ *              of %arg[1] modifier with max hardware stride length, %arg[2]-bpp,
+ *              and %arg[3]-rotation with %arg[4] mode
+ * Driver requirement: any
+ * Functionality: xorg_big_displays
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @4-tiled:            TILE-4 modifier
+ * @x-tiled:            TILE-X modifier
+ * @y-tiled:            TILE-Y modifier
+ * @yf-tiled:           TILE-YF modifier
+ *
+ * arg[2].values:       32, 64
+ * arg[3].values:       0, 180
+ *
+ * arg[4]:
+ *
+ * @async-flip:         Async flip
+ * @hflip:              H-flip
+ * @hflip-async-flip:   Async & H-flip
+ */
 static void test_scanout(data_t *data)
 {
 	igt_output_t *output;
@@ -627,6 +705,24 @@ static void test_scanout(data_t *data)
 	igt_skip("unsupported configuration\n");
 }
 
+/**
+ * SUBTEST: %s-addfb-size-overflow
+ * Description: Sanity check if addfb ioctl fails correctly for (%arg[1]) modifier
+ *              with small bo.
+ * Driver requirement: any
+ * Functionality: xorg_big_displays
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @linear:     Linear
+ * @4-tiled:    TILE-4
+ * @x-tiled:    TILE-X
+ * @y-tiled:    TILE-Y
+ * @yf-tiled:   TILE-YF
+ */
 static void
 test_size_overflow(data_t *data)
 {
@@ -671,6 +767,24 @@ test_size_overflow(data_t *data)
 	gem_close(data->drm_fd, bo);
 }
 
+/**
+ * SUBTEST: %s-addfb-size-offset-overflow
+ * Description: Sanity check if addfb ioctl fails correctly for (%arg[1]) modifier
+ *              and offsets with small bo
+ * Driver requirement: any
+ * Functionality: xorg_big_displays
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @linear:     Linear
+ * @4-tiled:    TILE-4
+ * @x-tiled:    TILE-X
+ * @y-tiled:    TILE-Y
+ * @yf-tiled:   TILE-YF
+ */
 static void
 test_size_offset_overflow(data_t *data)
 {
@@ -729,6 +843,24 @@ static int rmfb(int fd, uint32_t id)
 	return err;
 }
 
+/**
+ * SUBTEST: %s-addfb
+ * Description: Sanity check if addfb ioctl works correctly with %arg[1] modifier
+ *              for given size and strides of fb
+ * Driver requirement: any
+ * Functionality: xorg_big_displays
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @linear:     Linear
+ * @4-tiled:    TILE-4
+ * @x-tiled:    TILE-X
+ * @y-tiled:    TILE-Y
+ * @yf-tiled:   TILE-YF
+ */
 static void
 test_addfb(data_t *data)
 {
-- 
2.40.0
