Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E2E1136B8
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jun 2022 12:47:06 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Jun 2022 18:17:09 +0530
Message-Id: <20220603124710.5391-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/kms_dsc: Validate dsc with diff
 plane formats
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

Already existing subtest is modified so that dsc can be validated
using different plane modifiers. Few 8/10/16 bpc RGB and YUV formats
are added.

v2: minor fixes

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/i915/kms_dsc.c | 40 ++++++++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index c94c64c4..07835ad6 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -68,6 +68,17 @@ typedef struct {
 bool force_dsc_en_orig;
 int force_dsc_restore_fd = -1;
 
+const struct {
+	const int format;
+	const char format_str[20];
+} test_list[] = {
+	{DRM_FORMAT_XRGB8888, "XRGB8888"},
+	{DRM_FORMAT_XYUV8888, "XYUV8888"},
+	{DRM_FORMAT_XRGB2101010, "XRGB2101010"},
+	{DRM_FORMAT_XRGB16161616F, "XRGB16161616F"},
+	{DRM_FORMAT_YUYV, "YUYV"},
+};
+
 static inline void manual(const char *expected)
 {
 	igt_debug_interactive_mode_check("all", expected);
@@ -224,7 +235,7 @@ static void test_cleanup(data_t *data)
 }
 
 /* re-probe connectors and do a modeset with DSC */
-static void update_display(data_t *data, enum dsc_test_type test_type)
+static void update_display(data_t *data, enum dsc_test_type test_type, unsigned int plane_format)
 {
 	bool enabled;
 	igt_plane_t *primary;
@@ -252,10 +263,14 @@ static void update_display(data_t *data, enum dsc_test_type test_type)
 	igt_output_override_mode(output, mode);
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+	igt_skip_on(!igt_plane_has_format_mod(primary, plane_format,
+		    DRM_FORMAT_MOD_LINEAR));
+
 	igt_create_pattern_fb(data->drm_fd,
 			      mode->hdisplay,
 			      mode->vdisplay,
-			      DRM_FORMAT_XRGB8888,
+			      plane_format,
 			      DRM_FORMAT_MOD_LINEAR,
 			      &data->fb_test_pattern);
 
@@ -281,11 +296,12 @@ static void update_display(data_t *data, enum dsc_test_type test_type)
 	test_cleanup(data);
 }
 
-static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpp)
+static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpp, unsigned int plane_format)
 {
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
-	char test_name[10];
+	char name1[20];
+	char name2[20];
 	enum pipe pipe;
 
 	for_each_pipe_with_valid_output(display, pipe, output) {
@@ -305,10 +321,11 @@ static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpp)
 		if (!check_big_joiner_pipe_constraint(data))
 			continue;
 
-		snprintf(test_name, sizeof(test_name), "-%dbpp", data->compression_bpp);
+		snprintf(name1, sizeof(name1), "-%dbpp", data->compression_bpp);
+		snprintf(name2, sizeof(name2), "-%s", igt_format_str(plane_format));
 		igt_dynamic_f("pipe-%s-%s%s",  kmstest_pipe_name(data->pipe), data->output->name,
-			     (test_type == TEST_DSC_COMPRESSION_BPP) ? test_name : "")
-			update_display(data, test_type);
+			     (test_type == TEST_DSC_COMPRESSION_BPP) ? name1 : name2)
+			update_display(data, test_type, plane_format);
 	}
 }
 
@@ -332,8 +349,11 @@ igt_main
 	igt_describe("Tests basic display stream compression functionality if supported "
 		     "by a connector by forcing DSC on all connectors that support it "
 		     "with default parameters");
-	igt_subtest_with_dynamic("basic-dsc-enable")
-			test_dsc(&data, TEST_BASIC_DSC_ENABLE, 0);
+
+	igt_subtest_with_dynamic("basic-dsc-enable") {
+		for (int k = 0; k < ARRAY_SIZE(test_list); k++)
+			test_dsc(&data, TEST_BASIC_DSC_ENABLE, 0, test_list[k].format);
+	}
 
 	igt_fixture
 		igt_require(intel_display_ver(data.devid) >= 13);
@@ -350,7 +370,7 @@ igt_main
 		};
 
 		for (int j = 0; j < ARRAY_SIZE(bpp_list); j++)
-			test_dsc(&data, TEST_DSC_COMPRESSION_BPP, bpp_list[j]);
+			test_dsc(&data, TEST_DSC_COMPRESSION_BPP, bpp_list[j], DRM_FORMAT_XRGB8888);
 	}
 
 	igt_fixture {
-- 
2.25.1
