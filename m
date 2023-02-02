Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A957010E2F9
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Feb 2023 07:19:12 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  2 Feb 2023 12:51:17 +0530
Message-Id: <20230202072121.26153-3-swati2.sharma@intel.com>
In-Reply-To: <20230202072121.26153-1-swati2.sharma@intel.com>
References: <20230202072121.26153-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/6] tests/i915/kms_dsc: Add plane_format
 as struct data_t member
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

plane_format is added as struct data_t member. Also, corresponding
changes are done to accommodate this change.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/i915/kms_dsc.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index 8f32ae950..af9466518 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -44,6 +44,7 @@ typedef struct {
 	uint32_t devid;
 	igt_display_t display;
 	struct igt_fb fb_test_pattern;
+	unsigned int plane_format;
 	igt_output_t *output;
 	int input_bpc;
 	int n_pipes;
@@ -108,7 +109,7 @@ static void test_cleanup(data_t *data)
 }
 
 /* re-probe connectors and do a modeset with DSC */
-static void update_display(data_t *data, enum dsc_test_type test_type, unsigned int plane_format)
+static void update_display(data_t *data, enum dsc_test_type test_type)
 {
 	bool enabled;
 	igt_plane_t *primary;
@@ -137,13 +138,13 @@ static void update_display(data_t *data, enum dsc_test_type test_type, unsigned
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
-	igt_skip_on(!igt_plane_has_format_mod(primary, plane_format,
+	igt_skip_on(!igt_plane_has_format_mod(primary, data->plane_format,
 		    DRM_FORMAT_MOD_LINEAR));
 
 	igt_create_pattern_fb(data->drm_fd,
 			      mode->hdisplay,
 			      mode->vdisplay,
-			      plane_format,
+			      data->plane_format,
 			      DRM_FORMAT_MOD_LINEAR,
 			      &data->fb_test_pattern);
 
@@ -184,6 +185,7 @@ static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpc,
 	enum pipe pipe;
 
 	for_each_pipe_with_valid_output(display, pipe, output) {
+		data->plane_format = plane_format;
 		data->input_bpc = bpc;
 		data->output = output;
 		data->pipe = pipe;
@@ -201,12 +203,12 @@ static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpc,
 			continue;
 
 		if (test_type == TEST_DSC_BPC)
-			snprintf(name, sizeof(name), "-%dbpc-%s", data->input_bpc, igt_format_str(plane_format));
+			snprintf(name, sizeof(name), "-%dbpc-%s", data->input_bpc, igt_format_str(data->plane_format));
 		else
-			snprintf(name, sizeof(name), "-%s", igt_format_str(plane_format));
+			snprintf(name, sizeof(name), "-%s", igt_format_str(data->plane_format));
 
 		igt_dynamic_f("pipe-%s-%s%s",  kmstest_pipe_name(data->pipe), data->output->name, name)
-			update_display(data, test_type, plane_format);
+			update_display(data, test_type);
 	}
 }
 
-- 
2.25.1
