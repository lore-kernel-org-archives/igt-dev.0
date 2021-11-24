Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A6C6EB98
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Nov 2021 15:24:38 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Wed, 24 Nov 2021 20:37:58 +0530
Message-Id: <20211124150800.21338-2-venkata.sai.patnana@intel.com>
In-Reply-To: <20211124150800.21338-1-venkata.sai.patnana@intel.com>
References: <20211124150800.21338-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] tests/i915/kms_dsc: Add a new subtest
 to validate 10bpc format
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Patnana Venkata Sai <venkata.sai.patnana@intel.com>

Created new subtest to validate 10 bpc format.

Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
---
 tests/i915/kms_dsc.c | 36 ++++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index 25f7676a4c..967a1b8ab2 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -206,7 +206,8 @@ static bool check_dsc_on_connector(data_t *data, uint32_t drmConnector)
  * Re-probe connectors and do a modeset with DSC
  *
  */
-static void update_display(data_t *data, enum dsc_test_type test_type)
+static void update_display(data_t *data, enum dsc_test_type test_type,
+			   unsigned int drm_format)
 {
 	bool enabled;
 	igt_plane_t *primary;
@@ -231,6 +232,8 @@ static void update_display(data_t *data, enum dsc_test_type test_type)
 	igt_output_override_mode(data->output, &data->output->config.connector->modes[0]);
 	primary = igt_output_get_plane_type(data->output,
 					    DRM_PLANE_TYPE_PRIMARY);
+	igt_skip_on_f(!igt_plane_has_format_mod(primary, drm_format, DRM_FORMAT_MOD_LINEAR),
+		      "plane %s format does not have support\n", igt_format_str(drm_format));
 
 	/* Now set the output to the desired mode */
 	igt_plane_set_fb(primary, &data->fb_test_pattern);
@@ -255,7 +258,8 @@ static void update_display(data_t *data, enum dsc_test_type test_type)
 		     kmstest_pipe_name(data->pipe));
 }
 
-static void run_test(data_t *data, enum dsc_test_type test_type)
+static void run_test(data_t *data, enum dsc_test_type test_type,
+		     unsigned int drm_format)
 {
 	enum pipe pipe;
 	char test_name[10];
@@ -267,7 +271,7 @@ static void run_test(data_t *data, enum dsc_test_type test_type)
 	igt_create_pattern_fb(data->drm_fd,
 			      data->output->config.connector->modes[0].hdisplay,
 			      data->output->config.connector->modes[0].vdisplay,
-			      DRM_FORMAT_XRGB8888,
+			      drm_format,
 			      DRM_FORMAT_MOD_LINEAR,
 			      &data->fb_test_pattern);
 
@@ -293,7 +297,7 @@ static void run_test(data_t *data, enum dsc_test_type test_type)
 				      (pipe  == (data->n_pipes - 1)),
 				      "pipe-%s not supported due to bigjoiner limitation\n",
 				      kmstest_pipe_name(pipe));
-			update_display(data, test_type);
+			update_display(data, test_type, drm_format);
 
 		}
 		if (test_type == test_dsc_compression_bpp)
@@ -309,6 +313,14 @@ igt_main
 	drmModeRes *res;
 	drmModeConnector *connector = NULL;
 	int i, j;
+	struct {
+		unsigned int bpc;
+		int format;
+		char format_str[20];
+	} test_list[] = {
+		{8, DRM_FORMAT_XRGB8888, "XRGB8888"},
+		{10, DRM_FORMAT_XRGB2101010, "XRGB2101010"},
+	};
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
 		data.devid = intel_get_drm_devid(data.drm_fd);
@@ -320,11 +332,14 @@ igt_main
 		for_each_pipe(&data.display, i)
 			data.n_pipes++;
 	}
-	igt_subtest_with_dynamic("basic-dsc-enable") {
-		for (j = 0; j < res->count_connectors; j++) {
-			if (!check_dsc_on_connector(&data, res->connectors[j]))
-				continue;
-			run_test(&data, test_basic_dsc_enable);
+	for (i = 0; i < ARRAY_SIZE(test_list); i++) {
+		igt_subtest_with_dynamic("basic-dsc-enable") {
+			for (j = 0; j < res->count_connectors; j++) {
+				if (!check_dsc_on_connector(&data, res->connectors[j]))
+					continue;
+				run_test(&data, test_basic_dsc_enable,
+					 test_list[i].format);
+			}
 		}
 	}
 	/* currently we are validating compression bpp on XRGB8888 format only */
@@ -344,7 +359,8 @@ igt_main
 
 			for (i = 0; i < ARRAY_SIZE(bpp_list); i++) {
 				data.compression_bpp = bpp_list[i];
-				run_test(&data, test_dsc_compression_bpp);
+				run_test(&data, test_dsc_compression_bpp,
+					 DRM_FORMAT_XRGB8888);
 			}
 		}
 	}
-- 
2.25.1
