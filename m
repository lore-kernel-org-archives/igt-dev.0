Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 059F410E0DF
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Sep 2023 05:49:04 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 18 Sep 2023 11:19:25 +0530
Message-Id: <20230918054926.238027-5-swati2.sharma@intel.com>
In-Reply-To: <20230918054926.238027-1-swati2.sharma@intel.com>
References: <20230918054926.238027-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v10 4/5] tests/intel/kms_dsc: add test to validate
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
 tests/intel/kms_dsc.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index 29bb21514..9b137ef87 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -55,6 +55,7 @@
  * @with-output-formats:          DSC and output format
  * @with-output-formats-with-bpc: DSC and output format with certain input BPC for the connector
  * @fractional-bpp:               DSC and fractional bpp with default parameters
+ * @fractional-bpp-with-bpc:      DSC and fractional bpp with certain input BPC for the connector
  */
 
 IGT_TEST_DESCRIPTION("Test to validate display stream compression");
@@ -85,7 +86,8 @@ IGT_TEST_DESCRIPTION("Test to validate display stream compression");
  * validate output formats with different input bpc (12/10/8).
  * Lastly, fractional bpp is tested with default parameters.
  * In this, driver will ignore integer compressed bpp value and
- * will do modeset with fractional bpp only.
+ * will do modeset with fractional bpp only. Test is added to
+ * validate fractional bpp with different input bpc (12/10/8).
  */
 
 typedef struct {
@@ -431,6 +433,16 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
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
