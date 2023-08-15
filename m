Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A2310E256
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Aug 2023 16:57:30 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Aug 2023 22:17:53 +0530
Message-Id: <20230815164815.320904-60-bhanuprakash.modem@intel.com>
In-Reply-To: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
References: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V7 59/81] tests/kms_plane_alpha_blend: Document
 each subtest for testplan
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
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_alpha_blend.c | 55 +++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index 341b85c7e..d4458ac69 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -24,6 +24,11 @@
  *   Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
  */
 
+/**
+ * TEST: kms plane alpha blend
+ * Category: Display
+ * Description: Test plane alpha and blending mode properties
+ */
 #include "igt.h"
 
 IGT_TEST_DESCRIPTION("Test plane alpha and blending mode properties");
@@ -477,6 +482,56 @@ static void coverage_premult_constant(data_t *data, enum pipe pipe, igt_plane_t
 	igt_pipe_crc_stop(data->pipe_crc);
 }
 
+/**
+ * SUBTEST: alpha-%s
+ * Description: Test to %arg[1]
+ * Driver requirement: i915, xe
+ * Functionality: plane
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @7efc:                validate alpha values 0x7e and 0xfc are swappable on
+ *                       pre-multiplied blend mode.
+ * @basic:               basic plane alpha properties.
+ * @opaque-fb:           alpha properties with opaque fb.
+ * @transparent-fb:      alpha property with transparent fb.
+ */
+
+/**
+ * SUBTEST: coverage-vs-premult-vs-constant
+ * Description: Tests pipe coverage blending properties.
+ * Driver requirement: i915, xe
+ * Functionality: plane
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: coverage-7efc
+ * Description: Uses alpha values 0x7e and 0xfc to validate fg.alpha and
+ *              plane_alpha are swappable on coverage blend mode.
+ * Driver requirement: i915, xe
+ * Functionality: plane
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: constant-alpha-%s
+ * Description: Tests plane alpha and blending properties with %arg[1].
+ * Driver requirement: i915, xe
+ * Functionality: plane
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @max:            maximum alpha value
+ * @mid:            medium  alpha value
+ * @min:            minimum alpha value
+ */
 static void run_test_on_pipe_planes(data_t *data, enum pipe pipe, igt_output_t *output,
 				    bool blend, bool must_multiply,
 				    void(*test)(data_t *, enum pipe, igt_plane_t *))
-- 
2.40.0
