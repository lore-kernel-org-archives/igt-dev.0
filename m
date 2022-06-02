Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F43112AA5
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jun 2022 19:15:54 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Jun 2022 00:46:05 +0530
Message-Id: <20220602191605.16384-1-swati2.sharma@intel.com>
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

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/i915/kms_dsc.c | 44 ++++++++++++++++++++++++++++++++------------
 1 file changed, 32 insertions(+), 12 deletions(-)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index c94c64c4..39a39d94 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -60,6 +60,7 @@ typedef struct {
 	igt_display_t display;
 	struct igt_fb fb_test_pattern;
 	igt_output_t *output;
+	igt_plane_t *primary;
 	int compression_bpp;
 	int n_pipes;
 	enum pipe pipe;
@@ -68,6 +69,18 @@ typedef struct {
 bool force_dsc_en_orig;
 int force_dsc_restore_fd = -1;
 
+const struct {
+	const int format;
+	const char format_str[20];
+} test_list[] = {
+	{DRM_FORMAT_C8, "C8"},
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
@@ -224,13 +237,13 @@ static void test_cleanup(data_t *data)
 }
 
 /* re-probe connectors and do a modeset with DSC */
-static void update_display(data_t *data, enum dsc_test_type test_type)
+static void update_display(data_t *data, enum dsc_test_type test_type, unsigned int plane_format)
 {
 	bool enabled;
-	igt_plane_t *primary;
 	drmModeModeInfo *mode;
 	igt_output_t *output = data->output;
 	igt_display_t *display = &data->display;
+	igt_plane_t *primary = data->primary;
 
 	/* sanitize the state before starting the subtest */
 	igt_display_reset(display);
@@ -251,11 +264,10 @@ static void update_display(data_t *data, enum dsc_test_type test_type)
 	igt_require(mode != NULL);
 	igt_output_override_mode(output, mode);
 
-	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_create_pattern_fb(data->drm_fd,
 			      mode->hdisplay,
 			      mode->vdisplay,
-			      DRM_FORMAT_XRGB8888,
+			      plane_format,
 			      DRM_FORMAT_MOD_LINEAR,
 			      &data->fb_test_pattern);
 
@@ -281,14 +293,16 @@ static void update_display(data_t *data, enum dsc_test_type test_type)
 	test_cleanup(data);
 }
 
-static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpp)
+static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpp, unsigned int plane_format)
 {
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
-	char test_name[10];
+	char name1[10];
+	char name2[10];
 	enum pipe pipe;
 
 	for_each_pipe_with_valid_output(display, pipe, output) {
+		data->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 		data->compression_bpp = bpp;
 		data->output = output;
 		data->pipe = pipe;
@@ -305,10 +319,14 @@ static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpp)
 		if (!check_big_joiner_pipe_constraint(data))
 			continue;
 
-		snprintf(test_name, sizeof(test_name), "-%dbpp", data->compression_bpp);
+		if (!igt_plane_has_format_mod(data->primary, plane_format, DRM_FORMAT_MOD_LINEAR))
+			continue;
+
+		snprintf(name1, sizeof(name1), "-%dbpp", data->compression_bpp);
+		snprintf(name2, sizeof(name2), "-%s", igt_format_str(plane_format));
 		igt_dynamic_f("pipe-%s-%s%s",  kmstest_pipe_name(data->pipe), data->output->name,
-			     (test_type == TEST_DSC_COMPRESSION_BPP) ? test_name : "")
-			update_display(data, test_type);
+			     (test_type == TEST_DSC_COMPRESSION_BPP) ? name1 : name2)
+			update_display(data, test_type, plane_format);
 	}
 }
 
@@ -332,8 +350,10 @@ igt_main
 	igt_describe("Tests basic display stream compression functionality if supported "
 		     "by a connector by forcing DSC on all connectors that support it "
 		     "with default parameters");
-	igt_subtest_with_dynamic("basic-dsc-enable")
-			test_dsc(&data, TEST_BASIC_DSC_ENABLE, 0);
+	for (int k = 0; i < ARRAY_SIZE(test_list); k++) {
+		igt_subtest_with_dynamic("basic-dsc-enable")
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
