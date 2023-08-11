Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A17E910E6F4
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 18:56:18 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 12 Aug 2023 00:16:37 +0530
Message-Id: <20230811184655.157060-64-bhanuprakash.modem@intel.com>
In-Reply-To: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
References: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V6 63/81] tests/kms_plane_scaling: Document each
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

V2: - Fix the documentation for renamed tests
V3: - Add sacling to the functionality

Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_plane_scaling.c | 261 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 261 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 920290e4d..87332143a 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -22,6 +22,11 @@
  *
  */
 
+/**
+ * TEST: kms plane scaling
+ * Category: Display
+ * Description: Test display plane scaling
+ */
 #include "igt.h"
 #include "igt_vec.h"
 #include <math.h>
@@ -524,6 +529,52 @@ static const uint64_t modifiers[] = {
 	I915_FORMAT_MOD_4_TILED
 };
 
+/**
+ * SUBTEST: plane-scaler-with-modifiers-unity-scaling
+ * Description: Tests scaling with modifiers, unity scaling.
+ * Driver requirement: any
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: plane-scaler-with-clipping-clamping-modifiers
+ * Description: Tests scaling with clipping and clamping, modifiers.
+ * Driver requirement: any
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: plane-upscale-with-modifiers-%s
+ * Description: Tests upscaling with modifiers %arg[1].
+ * Driver requirement: any
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @20x20:          from 20x20 fb
+ * @factor-0-25:    for 0.25 scaling factor
+ */
+
+/**
+ * SUBTEST: plane-downscale-with-modifiers-factor-%s
+ * Description: Tests downscaling with modifiers for %arg[1] scaling factor.
+ * Driver requirement: any
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @0-25:   0.25
+ * @0-5:    0.5
+ * @0-75:   0.75
+ */
 static void test_scaler_with_modifier_pipe(data_t *d,
 					   int width, int height,
 					   bool is_upscale,
@@ -560,6 +611,52 @@ static void test_scaler_with_modifier_pipe(data_t *d,
 	}
 }
 
+/**
+ * SUBTEST: plane-scaler-with-rotation-unity-scaling
+ * Description: Tests scaling with rotation, unity scaling.
+ * Driver requirement: any
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: plane-scaler-with-clipping-clamping-rotation
+ * Description: Tests scaling with clipping and clamping, rotation.
+ * Driver requirement: any
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: plane-upscale-with-rotation-%s
+ * Description: Tests upscaling with rotation %arg[1].
+ * Driver requirement: any
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @20x20:          from 20x20 fb
+ * @factor-0-25:    for 0.25 scaling factor
+ */
+
+/**
+ * SUBTEST: plane-downscale-with-rotation-factor-%s
+ * Description: Tests downscaling with rotation for %arg[1] scaling factor.
+ * Driver requirement: any
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @0-25:   0.25
+ * @0-5:    0.5
+ * @0-75:   0.75
+ */
 static void test_scaler_with_rotation_pipe(data_t *d,
 					   int width, int height,
 					   bool is_upscale,
@@ -592,7 +689,52 @@ static void test_scaler_with_rotation_pipe(data_t *d,
 		}
 	}
 }
+/**
+ * SUBTEST: plane-scaler-with-pixel-format-unity-scaling
+ * Description: Tests scaling with pixel formats, unity scaling.
+ * Driver requirement: any
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: plane-scaler-with-clipping-clamping-pixel-formats
+ * Description: Tests scaling with clipping and clamping, pixel formats.
+ * Driver requirement: any
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: plane-upscale-with-pixel-format-%s
+ * Description: Tests upscaling with pixel formats %arg[1].
+ * Driver requirement: any
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @20x20:          from 20x20 fb
+ * @factor-0-25:    for 0.25 scaling factor
+ */
 
+/**
+ * SUBTEST: plane-downscale-with-pixel-format-factor-%s
+ * Description: Tests downscaling with pixel formats for %arg[1] scaling factor.
+ * Driver requirement: any
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @0-25:   0.25
+ * @0-5:    0.5
+ * @0-75:   0.75
+ */
 static void test_scaler_with_pixel_format_pipe(data_t *d, int width, int height, bool is_upscale,
 					       enum pipe pipe, igt_output_t *output)
 {
@@ -728,6 +870,88 @@ static void setup_fb(int fd, int width, int height, struct igt_fb *fb)
 		      fb);
 }
 
+/**
+ * SUBTEST: planes-downscale-factor-%s
+ * Description: Tests downscaling of 2 planes for %arg[1] scaling factor.
+ * Driver requirement: any
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @0-25:  0.25
+ * @0-5:   0.5
+ * @0-75:  0.75
+ */
+/**
+ * SUBTEST: planes-downscale-factor-%s-%s
+ * Description: Tests downscaling (scaling factor %arg[1]) and upscaling (%arg[2])
+ *              of 2 planes.
+ * Driver requirement: any
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @0-25:  0.25
+ * @0-5:   0.5
+ * @0-75:  0.75
+ *
+ * arg[2]:
+ *
+ * @upscale-20x20:           upscale 20x20
+ * @upscale-factor-0-25:     scaling factor 0.25
+ * @unity-scaling:           Unity
+ */
+/**
+ * SUBTEST: planes-scaler-unity-scaling
+ * Description: Tests scaling of 2 planes, unity scaling.
+ * Driver requirement: any
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: planes-upscale-%s
+ * Description: Tests upscaling of 2 planes %arg[1].
+ * Driver requirement: any
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @20x20:          from 20x20 fb
+ * @factor-0-25:    for 0.25 scaling factor
+ */
+/**
+ * SUBTEST: planes-%s-downscale-factor-%s
+ * Description: Tests scaling (%arg[1]) and downscaling (scaling factor %arg[2])
+ *              of 2 planes.
+ * Driver requirement: any
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @unity-scaling:           Unity
+ * @upscale-factor-0-25:     scaling factor 0.25
+ * @upscale-20x20:           upscale 20x20
+ *
+ * arg[2]:
+ *
+ * @0-25:  0.25
+ * @0-5:   0.5
+ * @0-75:  0.75
+ */
+
 static void
 test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
 			  enum pipe pipe, igt_output_t *output,
@@ -786,6 +1010,15 @@ test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
 	cleanup_fbs(d);
 }
 
+/**
+ * SUBTEST: invalid-num-scalers
+ * Description: Negative test for number of scalers per pipe.
+ * Driver requirement: any
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 static void
 test_invalid_num_scalers(data_t *d, enum pipe pipe, igt_output_t *output)
 {
@@ -851,6 +1084,15 @@ test_invalid_num_scalers(data_t *d, enum pipe pipe, igt_output_t *output)
 	cleanup_fbs(d);
 }
 
+/**
+ * SUBTEST: 2x-scaler-multi-pipe
+ * Description: Tests scaling with multi-pipe.
+ * Driver requirement: any
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 static void test_scaler_with_multi_pipe_plane(data_t *d)
 {
 	igt_display_t *display = &d->display;
@@ -935,6 +1177,15 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
 	igt_assert_eq(ret1 && ret2, 0);
 }
 
+/**
+ * SUBTEST: invalid-parameters
+ * Description: test parameters which should not be accepted
+ * Driver requirement: any
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 static void invalid_parameter_tests(data_t *d)
 {
 	enum pipe pipe = PIPE_A;
@@ -1015,6 +1266,16 @@ static drmModeModeInfo *find_mode(data_t *data, igt_output_t *output, const uint
 	return mode;
 }
 
+/**
+ * SUBTEST: intel-max-src-size
+ * Description: Test for validating max source size.
+ * Driver requirement: any
+ * Functionality: plane, scaling
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
+
 /*
  *	Max source/destination width/height for intel driver.
  *	These numbers are coming from
-- 
2.40.0
