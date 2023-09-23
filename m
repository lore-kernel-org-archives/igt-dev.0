Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4F010E095
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Sep 2023 08:43:22 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 23 Sep 2023 14:13:55 +0530
Message-Id: <20230923084355.434574-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: rename subtests
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

Align subtests names with other tests.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 54 +++++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 299f55960..25a57e6f1 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -72,37 +72,37 @@ const struct {
 } scaler_with_pixel_format_tests[] = {
 	{
 		"Tests upscaling with pixel formats, from 20x20 fb.",
-		"plane-upscale-with-pixel-format-20x20",
+		"plane-upscale-20x20-with-pixel-format",
 		0.0,
 		true,
 	},
 	{
 		"Tests upscaling with pixel formats for 0.25 scaling factor.",
-		"plane-upscale-with-pixel-format-factor-0-25",
+		"plane-upscale-factor-0-25-with-pixel-format",
 		0.25,
 		true,
 	},
 	{
 		"Tests downscaling with pixel formats for 0.25 scaling factor.",
-		"plane-downscale-with-pixel-format-factor-0-25",
+		"plane-downscale-factor-0-25-with-pixel-format",
 		0.25,
 		false,
 	},
 	{
 		"Tests downscaling with pixel formats for 0.5 scaling factor.",
-		"plane-downscale-with-pixel-format-factor-0-5",
+		"plane-downscale-factor-0-5-with-pixel-format",
 		0.5,
 		false,
 	},
 	{
 		"Tests downscaling with pixel formats for 0.75 scaling factor.",
-		"plane-downscale-with-pixel-format-factor-0-75",
+		"plane-downscale-factor-0-75-with-pixel-format",
 		0.75,
 		false,
 	},
 	{
 		"Tests scaling with pixel formats, unity scaling.",
-		"plane-scaler-with-pixel-format-unity-scaling",
+		"plane-scaler-unity-scaling-with-pixel-format",
 		1.0,
 		true,
 	},
@@ -116,37 +116,37 @@ const struct {
 } scaler_with_rotation_tests[] = {
 	{
 		"Tests upscaling with rotation, from 20x20 fb.",
-		"plane-upscale-with-rotation-20x20",
+		"plane-upscale-20x20-with-rotation",
 		0.0,
 		true,
 	},
 	{
 		"Tests upscaling with rotation for 0.25 scaling factor.",
-		"plane-upscale-with-rotation-factor-0-25",
+		"plane-upscale-factor-0-25-with-rotation",
 		0.25,
 		true,
 	},
 	{
 		"Tests downscaling with rotation for 0.25 scaling factor.",
-		"plane-downscale-with-rotation-factor-0-25",
+		"plane-downscale-factor-0-25-with-rotation",
 		0.25,
 		false,
 	},
 	{
 		"Tests downscaling with rotation for 0.5 scaling factor.",
-		"plane-downscale-with-rotation-factor-0-5",
+		"plane-downscale-factor-0-5-with-rotation",
 		0.5,
 		false,
 	},
 	{
 		"Tests downscaling with rotation for 0.75 scaling factor.",
-		"plane-downscale-with-rotation-factor-0-75",
+		"plane-downscale-factor-0-75-with-rotation",
 		0.75,
 		false,
 	},
 	{
 		"Tests scaling with rotation, unity scaling.",
-		"plane-scaler-with-rotation-unity-scaling",
+		"plane-scaler-unity-scaling-with-rotation",
 		1.0,
 		true,
 	},
@@ -160,37 +160,37 @@ const struct {
 } scaler_with_modifiers_tests[] = {
 	{
 		"Tests upscaling with modifiers, from 20x20 fb.",
-		"plane-upscale-with-modifiers-20x20",
+		"plane-upscale-20x20-with-modifiers",
 		0.0,
 		true,
 	},
 	{
 		"Tests upscaling with modifiers for 0.25 scaling factor.",
-		"plane-upscale-with-modifiers-factor-0-25",
+		"plane-upscale-factor-0-25-with-modifiers",
 		0.25,
 		true,
 	},
 	{
 		"Tests downscaling with modifiers for 0.25 scaling factor.",
-		"plane-downscale-with-modifiers-factor-0-25",
+		"plane-downscale-factor-0-25-with-modifiers",
 		0.25,
 		false,
 	},
 	{
 		"Tests downscaling with modifiers for 0.5 scaling factor.",
-		"plane-downscale-with-modifiers-factor-0-5",
+		"plane-downscale-factor-0-5-with-modifiers",
 		0.5,
 		false,
 	},
 	{
 		"Tests downscaling with modifiers for 0.75 scaling factor.",
-		"plane-downscale-with-modifiers-factor-0-75",
+		"plane-downscale-factor-0-75-with-modifiers",
 		0.75,
 		false,
 	},
 	{
 		"Tests scaling with modifiers, unity scaling.",
-		"plane-scaler-with-modifiers-unity-scaling",
+		"plane-scaler-unity-scaling-with-modifiers",
 		1.0,
 		true,
 	},
@@ -530,7 +530,7 @@ static const uint64_t modifiers[] = {
 };
 
 /**
- * SUBTEST: plane-scaler-with-modifiers-unity-scaling
+ * SUBTEST: plane-scaler-unity-scaling-with-modifiers
  * Description: Tests scaling with modifiers, unity scaling.
  * Driver requirement: i915, xe
  * Functionality: plane, scaling
@@ -544,7 +544,7 @@ static const uint64_t modifiers[] = {
  * Mega feature: General Display Features
  * Test category: functionality test
  *
- * SUBTEST: plane-upscale-with-modifiers-%s
+ * SUBTEST: plane-upscale-%s-with-modifiers
  * Description: Tests upscaling with modifiers %arg[1].
  * Driver requirement: i915, xe
  * Functionality: plane, scaling
@@ -558,7 +558,7 @@ static const uint64_t modifiers[] = {
  */
 
 /**
- * SUBTEST: plane-downscale-with-modifiers-factor-%s
+ * SUBTEST: plane-downscale-factor-%s-with-modifiers
  * Description: Tests downscaling with modifiers for %arg[1] scaling factor.
  * Driver requirement: i915, xe
  * Functionality: plane, scaling
@@ -604,7 +604,7 @@ static void test_scaler_with_modifier_pipe(data_t *d,
 }
 
 /**
- * SUBTEST: plane-scaler-with-rotation-unity-scaling
+ * SUBTEST: plane-scaler-unity-scaling-with-rotation
  * Description: Tests scaling with rotation, unity scaling.
  * Driver requirement: i915, xe
  * Functionality: plane, scaling
@@ -618,7 +618,7 @@ static void test_scaler_with_modifier_pipe(data_t *d,
  * Mega feature: General Display Features
  * Test category: functionality test
  *
- * SUBTEST: plane-upscale-with-rotation-%s
+ * SUBTEST: plane-upscale-%s-with-rotation
  * Description: Tests upscaling with rotation %arg[1].
  * Driver requirement: i915, xe
  * Functionality: plane, scaling
@@ -632,7 +632,7 @@ static void test_scaler_with_modifier_pipe(data_t *d,
  */
 
 /**
- * SUBTEST: plane-downscale-with-rotation-factor-%s
+ * SUBTEST: plane-downscale-factor-%s-with-rotation
  * Description: Tests downscaling with rotation for %arg[1] scaling factor.
  * Driver requirement: i915, xe
  * Functionality: plane, scaling
@@ -679,7 +679,7 @@ static void test_scaler_with_rotation_pipe(data_t *d,
 }
 
 /**
- * SUBTEST: plane-scaler-with-pixel-format-unity-scaling
+ * SUBTEST: plane-scaler-unity-scaling-with-pixel-format
  * Description: Tests scaling with pixel formats, unity scaling.
  * Driver requirement: i915, xe
  * Functionality: pixel_formats, plane, scaling
@@ -693,7 +693,7 @@ static void test_scaler_with_rotation_pipe(data_t *d,
  * Mega feature: General Display Features
  * Test category: functionality test
  *
- * SUBTEST: plane-upscale-with-pixel-format-%s
+ * SUBTEST: plane-upscale-%s-with-pixel-format
  * Description: Tests upscaling with pixel formats %arg[1].
  * Driver requirement: i915, xe
  * Functionality: pixel_formats, plane, scaling
@@ -707,7 +707,7 @@ static void test_scaler_with_rotation_pipe(data_t *d,
  */
 
 /**
- * SUBTEST: plane-downscale-with-pixel-format-factor-%s
+ * SUBTEST: plane-downscale-factor-%s-with-pixel-format
  * Description: Tests downscaling with pixel formats for %arg[1] scaling factor.
  * Driver requirement: i915, xe
  * Functionality: pixel_formats, plane, scaling
-- 
2.25.1
