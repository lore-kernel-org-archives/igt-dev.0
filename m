Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D8310E73F
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Nov 2022 11:56:26 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Nov 2022 17:28:04 +0530
Message-Id: <20221125115808.13394-3-swati2.sharma@intel.com>
In-Reply-To: <20221125115808.13394-1-swati2.sharma@intel.com>
References: <20221125115808.13394-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/6] tests/i915/kms_dsc: Prep work for
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
 tests/i915/kms_dsc.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index 330fc050b..6fef764de 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -61,6 +61,7 @@ typedef struct {
 	igt_output_t *output;
 	int input_bpc;
 	int n_pipes;
+	int disp_ver;
 	enum pipe pipe;
 } data_t;
 
@@ -91,7 +92,7 @@ static void force_dsc_enable(data_t *data)
 	igt_debug("Forcing DSC enable on %s\n", data->output->name);
 	ret = igt_force_dsc_enable(data->drm_fd,
 				   data->output->name);
-	igt_assert_f(ret > 0, "debugfs_write failed");
+	igt_assert_f(ret > 0, "forcing dsc enable debugfs_write failed\n");
 }
 
 static void force_dsc_enable_bpc(data_t *data)
@@ -103,7 +104,7 @@ static void force_dsc_enable_bpc(data_t *data)
 	ret = igt_force_dsc_enable_bpc(data->drm_fd,
 				       data->output->name,
 				       data->input_bpc);
-	igt_assert_f(ret > 0, "debugfs_write failed");
+	igt_assert_f(ret > 0, "forcing input dsc bpc debugfs_write failed\n");
 }
 
 static void save_force_dsc_en(data_t *data)
@@ -222,7 +223,8 @@ static void test_cleanup(data_t *data)
 }
 
 /* re-probe connectors and do a modeset with DSC */
-static void update_display(data_t *data, enum dsc_test_type test_type, unsigned int plane_format)
+static void update_display(data_t *data, enum dsc_test_type test_type,
+			   unsigned int plane_format)
 {
 	bool enabled;
 	igt_plane_t *primary;
@@ -324,6 +326,12 @@ static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpc,
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
@@ -332,11 +340,12 @@ igt_main
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
@@ -346,14 +355,14 @@ igt_main
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
@@ -361,7 +370,7 @@ igt_main
 		     "with certain input BPC for the connector");
 	igt_subtest_with_dynamic("dsc-with-bpc") {
 		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
-			test_dsc(&data, TEST_DSC_BPC, bpc_list[j], DRM_FORMAT_XRGB8888);
+			run_test(&data, TEST_DSC_BPC, bpc_list[j], DRM_FORMAT_XRGB8888);
 	}
 
 	igt_describe("Tests basic display stream compression functionality if supported "
@@ -370,7 +379,7 @@ igt_main
 	igt_subtest_with_dynamic("dsc-with-bpc-formats") {
 		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
 			for (int k = 0; k < ARRAY_SIZE(format_list); k++) {
-				test_dsc(&data, TEST_DSC_BPC, bpc_list[j], format_list[k].format);
+				run_test(&data, TEST_DSC_BPC, bpc_list[j], format_list[k].format);
 			}
 		}
 	}
-- 
2.25.1
