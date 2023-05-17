Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5011210E3D2
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 06:40:31 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed, 17 May 2023 12:03:11 +0530
Message-Id: <20230517063323.4146387-70-bhanuprakash.modem@intel.com>
In-Reply-To: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
References: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 69/81] tests/kms_rotation_crc: Document each
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
 tests/kms_rotation_crc.c | 130 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 28b4fd27c..8b38cbd7d 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -22,6 +22,11 @@
  *
  */
 
+/**
+ * TEST: kms rotation crc
+ * Category: Display
+ * Description: Tests different rotations with different planes & formats
+ */
 #include "igt.h"
 #include "igt_vec.h"
 #include <math.h>
@@ -474,6 +479,97 @@ static bool test_format(data_t *data,
 	return true;
 }
 
+/**
+ * SUBTEST: %s-rotation-180
+ * Description: Rotation test with 180 degree for %arg[1] planes
+ * Driver requirement: any
+ * Functionality: rotation
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @primary:    primary
+ * @sprite:     sprite
+ * @cursor:     cursor
+ */
+
+/**
+ * SUBTEST: %s-rotation-%d
+ * Description: Rotation test with %arg[2] degree for %arg[1] planes of gen9+
+ * Driver requirement: any
+ * Functionality: rotation
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @primary:    primary
+ * @sprite:     sprite
+ *
+ * arg[2].values: 90, 270
+ */
+
+/**
+ * SUBTEST: bad-%s
+ * Description: Checking unsupported %arg[1] for gen9+ with 90 degree of rotation
+ * Driver requirement: any
+ * Functionality: rotation
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @pixel-format:       pixel format
+ * @tiling:             tiling
+ */
+
+/**
+ * SUBTEST: primary-%s-tiled-reflect-x-%d
+ * Description: Test for %arg[1] & %arg[2] degree rotation on primary plane
+ * Driver requirement: i915
+ * Functionality: rotation
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @4:      4 tiling
+ * @x:      x tiling
+ * @y:      y tiling
+ * @yf:     yf tiling
+ *
+ * arg[2].values: 0, 180
+ */
+
+/**
+ * SUBTEST: primary-%s-tiled-reflect-x-%d
+ * Description: Test for %arg[1] & %arg[2] degree rotation on primary plane
+ * Driver requirement: i915
+ * Functionality: rotation
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @y:      y tiling
+ * @yf:     yf tiling
+ *
+ * arg[2].values: 90, 270
+ *
+ * SUBTEST: sprite-rotation-90-pos-100-0
+ * Description: Rotation test with 90 degree for a plane of gen9+ with given position
+ * Driver requirement: any
+ * Functionality: rotation
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_format)
 {
 	igt_display_t *display = &data->display;
@@ -779,6 +875,31 @@ static bool reusecrcfromlastround(planeinfos p[2], int lastroundp1format,
 
 	return true;
 }
+
+/**
+ * SUBTEST: multiplane-rotation
+ * Description: Rotation test on both planes by making them fully visible
+ * Driver requirement: any
+ * Functionality: rotation
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: multiplane-rotation-cropping-%s
+ * Description: Rotation test on both planes by cropping left/%arg[1] corner of
+ *              primary plane and right/%arg[1] corner of sprite plane
+ * Driver requirement: any
+ * Functionality: rotation
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @bottom:   bottom
+ * @top:      top
+ */
+
 /*
  * Here is pipe parameter which is now used only for first pipe.
  * It is left here if this test ever was wanted to be run on
@@ -980,6 +1101,15 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 	igt_require_f(found, "No valid pipe/output combo found.\n");
 }
 
+/**
+ * SUBTEST: exhaust-fences
+ * Description: This test intends to check for fence leaks exhaustively
+ * Driver requirement: i915
+ * Functionality: rotation
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 static void test_plane_rotation_exhaust_fences(data_t *data,
 					       enum pipe pipe,
 					       igt_output_t *output,
-- 
2.40.0


