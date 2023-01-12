Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32AA210E88D
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jan 2023 07:33:37 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 12 Jan 2023 13:05:33 +0530
Message-Id: <20230112073537.27890-5-swati2.sharma@intel.com>
In-Reply-To: <20230112073537.27890-1-swati2.sharma@intel.com>
References: <20230112073537.27890-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 4/8] tests/i915/kms_dsc: Prep work for
 extending val support for VDSC YCbCr420
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

Functions are modified to accommodate changes for VDSC YCbCr420.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/i915/kms_dsc.c        | 21 +++++++++++++++------
 tests/i915/kms_dsc_helper.c |  4 ++--
 2 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index 22239122c..0bac9d26b 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -47,6 +47,7 @@ typedef struct {
 	igt_output_t *output;
 	int input_bpc;
 	int n_pipes;
+	int disp_ver;
 	enum pipe pipe;
 } data_t;
 
@@ -107,7 +108,8 @@ static void test_cleanup(data_t *data)
 }
 
 /* re-probe connectors and do a modeset with DSC */
-static void update_display(data_t *data, enum dsc_test_type test_type, unsigned int plane_format)
+static void update_display(data_t *data, enum dsc_test_type test_type,
+			   unsigned int plane_format)
 {
 	bool enabled;
 	igt_plane_t *primary;
@@ -209,6 +211,12 @@ static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpc,
 	}
 }
 
+static void run_test(data_t *data, enum dsc_test_type test_type, int bpc,
+		     unsigned int plane_format)
+{
+	test_dsc(data, test_type, bpc, plane_format);
+}
+
 igt_main
 {
 	data_t data = {};
@@ -217,11 +225,12 @@ igt_main
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
 		data.devid = intel_get_drm_devid(data.drm_fd);
+		data.disp_ver = intel_display_ver(data.devid);
 		kmstest_set_vt_graphics_mode();
 		igt_install_exit_handler(kms_dsc_exit_handler);
 		igt_display_require(&data.display, data.drm_fd);
 		igt_display_require_output(&data.display);
-		igt_require(intel_display_ver(data.devid) >= 11);
+		igt_require(data.disp_ver >= 11);
 		data.n_pipes = 0;
 		for_each_pipe(&data.display, i)
 			data.n_pipes++;
@@ -231,14 +240,14 @@ igt_main
 		     "by a connector by forcing DSC on all connectors that support it "
 		     "with default parameters");
 	igt_subtest_with_dynamic("basic-dsc")
-			test_dsc(&data, TEST_DSC_BASIC, 0, DRM_FORMAT_XRGB8888);
+			run_test(&data, TEST_DSC_BASIC, 0, DRM_FORMAT_XRGB8888);
 
 	igt_describe("Tests basic display stream compression functionality if supported "
 		     "by a connector by forcing DSC on all connectors that support it "
 		     "with default parameters and creating fb with diff formats");
 	igt_subtest_with_dynamic("dsc-with-formats") {
 		for (int k = 0; k < ARRAY_SIZE(format_list); k++)
-			test_dsc(&data, TEST_DSC_BASIC, 0, format_list[k].format);
+			run_test(&data, TEST_DSC_BASIC, 0, format_list[k].format);
 	}
 
 	igt_describe("Tests basic display stream compression functionality if supported "
@@ -246,7 +255,7 @@ igt_main
 		     "with certain input BPC for the connector");
 	igt_subtest_with_dynamic("dsc-with-bpc") {
 		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
-			test_dsc(&data, TEST_DSC_BPC, bpc_list[j], DRM_FORMAT_XRGB8888);
+			run_test(&data, TEST_DSC_BPC, bpc_list[j], DRM_FORMAT_XRGB8888);
 	}
 
 	igt_describe("Tests basic display stream compression functionality if supported "
@@ -255,7 +264,7 @@ igt_main
 	igt_subtest_with_dynamic("dsc-with-bpc-formats") {
 		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
 			for (int k = 0; k < ARRAY_SIZE(format_list); k++) {
-				test_dsc(&data, TEST_DSC_BPC, bpc_list[j], format_list[k].format);
+				run_test(&data, TEST_DSC_BPC, bpc_list[j], format_list[k].format);
 			}
 		}
 	}
diff --git a/tests/i915/kms_dsc_helper.c b/tests/i915/kms_dsc_helper.c
index 3734b3444..1a11f84ef 100644
--- a/tests/i915/kms_dsc_helper.c
+++ b/tests/i915/kms_dsc_helper.c
@@ -14,7 +14,7 @@ void force_dsc_enable(int drmfd, igt_output_t *output)
 
 	igt_debug("Forcing DSC enable on %s\n", output->name);
 	ret = igt_force_dsc_enable(drmfd, output->name);
-	igt_assert_f(ret > 0, "debugfs_write failed");
+	igt_assert_f(ret > 0, "forcing dsc enable debugfs_write failed\n");
 }
 
 void force_dsc_enable_bpc(int drmfd, igt_output_t *output, int input_bpc)
@@ -24,7 +24,7 @@ void force_dsc_enable_bpc(int drmfd, igt_output_t *output, int input_bpc)
 	igt_debug("Forcing input DSC BPC to %d on %s\n",
 		  input_bpc, output->name);
 	ret = igt_force_dsc_enable_bpc(drmfd, output->name, input_bpc);
-	igt_assert_f(ret > 0, "debugfs_write failed");
+	igt_assert_f(ret > 0, "forcing input dsc bpc debugfs_write failed\n");
 }
 
 void save_force_dsc_en(int drmfd, igt_output_t *output)
-- 
2.25.1
