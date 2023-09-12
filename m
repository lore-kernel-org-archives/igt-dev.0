Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB7710E438
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Sep 2023 16:24:12 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 12 Sep 2023 21:52:19 +0530
Message-Id: <20230912162219.1316473-5-swati2.sharma@intel.com>
In-Reply-To: <20230912162219.1316473-1-swati2.sharma@intel.com>
References: <20230912162219.1316473-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v9 4/4] tests/intel/kms_dsc: add test to validate
 fractional bpp with input bpc
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

New subtest is added to validate fractional bpp with different
input bpc.

v2: -rebase
v3: -rebase

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/intel/kms_dsc.c | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index 43c1dba76..86c609f61 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -56,6 +56,7 @@
  * @with-output-formats:          DSC and output format
  * @with-output-formats-with-bpc: DSC and output format with certain input BPC for the connector
  * @fractional-bpp:               DSC and fractional bpp with default parameters
+ * @fractional-bpp-with-bpc:      DSC and fractional bpp with certain input BPC for the connector
  */
 
 IGT_TEST_DESCRIPTION("Test to validate display stream compression");
@@ -69,26 +70,6 @@ IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 #define TEST_DSC_OUTPUT_FORMAT	(1<<2)
 #define TEST_DSC_FRACTIONAL_BPP (1<<3)
 
-/*
- * Starting from gen11, intel driver supports DSC1.1. For validating
- * DSC, the first step is to verify if the sink supports DSC.
- * If the sink does support DSC, we will validate different
- * scenarios by forcing dsc. Outline of the tests is as follows:
- * (i) basic modeset (ii) input bpc (iii) pixel formats
- * (iv) output formats (v) fractional bpp
- * In the basic subtest, we perform modeset with default parameters.
- * Input bpc and pixel formats subtests, we perform modeset
- * with different input bpc (12/10/8) and pixel formats (YUV/RGB),
- * respectively. From MTL+, we can verify DSC YCBCR420 output format.
- * The tests are executed with the RGB444 output format by default.
- * However, in the output-format subtest, we verify different
- * output formats (RGB/YCBCR444/YCBCR420). Also, test is added to
- * validate output formats with different input bpc (12/10/8).
- * Lastly, fractional bpp is tested with default parameters.
- * In this, driver will ignore integer compressed bpp value and
- * will do modeset with fractional bpp only.
- */
-
 typedef struct {
 	int drm_fd;
 	uint32_t devid;
@@ -432,6 +413,16 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
 				 DEFAULT_BPC, DRM_FORMAT_XRGB8888,
 				 DSC_FORMAT_RGB);
 
+	igt_describe("Tests fractional compressed bpp functionality if supported "
+		     "by a connector by forcing fractional_bpp on all connectors that support it "
+		     "with certain input BPC for the connector.");
+	igt_subtest_with_dynamic("dsc-fractional-bpp-with-bpc") {
+		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
+			test_dsc(&data, TEST_DSC_FRACTIONAL_BPP | TEST_DSC_BPC,
+				 bpc_list[j], DRM_FORMAT_XRGB8888,
+				 DSC_FORMAT_RGB);
+	}
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
-- 
2.25.1
