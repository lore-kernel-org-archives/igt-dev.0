Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0807910EA7A
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Apr 2022 06:54:23 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 swati2.sharma@intel.com
Date: Fri,  8 Apr 2022 12:21:41 +0530
Message-Id: <20220408065143.1485069-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20220408065143.1485069-1-bhanuprakash.modem@intel.com>
References: <20220408065143.1485069-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 2/4] tests/kms_color: Used debugfs apis for
 deep-color
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

Instead of parsing the EDID, read from the debugfs to make
sure the connected monitor supports deep-color.

Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color.c        |  6 ++++--
 tests/kms_color_helper.c | 46 +++++-----------------------------------
 tests/kms_color_helper.h |  2 +-
 3 files changed, 10 insertions(+), 44 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index afff1744..08ce6ab2 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -883,20 +883,22 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 					"At least GEN 11 is required to validate Deep-color.\n");
 
 		for_each_valid_output_on_pipe(&data->display, p, output) {
-			drmModeConnector *connector = output->config.connector;
 			uint64_t max_bpc = get_max_bpc(output);
 			bool ret;
 
 			if (!max_bpc)
 				continue;
 
-			if (!panel_supports_deep_color(data->drm_fd, connector))
+			if (!panel_supports_deep_color(data->drm_fd, output->name))
 				continue;
 
 			data->color_depth = 10;
 			data->drm_format = DRM_FORMAT_XRGB2101010;
 			data->output = output;
 			igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
+			igt_display_commit(&data->display);
+
+			igt_assert_output_bpc_equal(data->drm_fd, p, output->name, 10);
 
 			igt_dynamic_f("gamma-%s", output->name) {
 				ret = test_pipe_gamma(data, primary);
diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index 3ef124cd..55f3e409 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -25,49 +25,13 @@
 #include "kms_color_helper.h"
 
 bool
-panel_supports_deep_color(int fd, drmModeConnector *connector)
+panel_supports_deep_color(int drm_fd, char *output_name)
 {
-	uint64_t edid_blob_id;
-	uint8_t bit_depth, rev;
-	const struct edid *edid;
-	bool result;
-	drmModePropertyBlobPtr edid_blob = NULL;
-
-	igt_assert(kmstest_get_property(fd, connector->connector_id,
-					DRM_MODE_OBJECT_CONNECTOR, "EDID", NULL,
-					&edid_blob_id, NULL));
-	edid_blob = drmModeGetPropertyBlob(fd, edid_blob_id);
-	igt_require_f(edid_blob, "EDID blob is NULL\n");
-
-	edid = (const struct edid *) edid_blob->data;
-	rev = edid->revision;
-
-	if (rev >= 4) {
-		bit_depth = edid_get_bit_depth_from_vid(edid);
-
-		if (bit_depth > 0 && bit_depth < 7)
-			igt_info("Max supported bit depth: %d\n", ((bit_depth << 1) + 4));
-		else
-			igt_info("Max supported bit depth: Undefined\n");
-
-		result = (bit_depth >= 3) && (bit_depth < 7);
-	} else {
-		bit_depth = edid_get_deep_color_from_vsdb(edid);
-
-		if (bit_depth &	HDMI_VSDB_DC_48BIT)
-			igt_info("Max supported bit depth: 16\n");
-		else if (bit_depth & HDMI_VSDB_DC_36BIT)
-			igt_info("Max supported bit depth: 12\n");
-		else if (bit_depth & HDMI_VSDB_DC_30BIT)
-			igt_info("Max supported bit depth: 10\n");
-		else
-			igt_info("Max supported bit depth: Undefined\n");
-
-		result = !!(bit_depth & (7 << 4));
-	}
-	drmModeFreePropertyBlob(edid_blob);
+	unsigned int maximum = igt_get_output_max_bpc(drm_fd, output_name);
+
+	igt_info("Max supported bit depth: %d\n", maximum);
 
-	return result;
+	return maximum >= 10;
 }
 
 uint64_t get_max_bpc(igt_output_t *output)
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index a6665b1f..cc07f5ee 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -67,7 +67,7 @@ typedef struct {
 	color_t coeffs[];
 } gamma_lut_t;
 
-bool panel_supports_deep_color(int fd, drmModeConnector *connector);
+bool panel_supports_deep_color(int fd, char *output_name);
 uint64_t get_max_bpc(igt_output_t *output);
 void paint_gradient_rectangles(data_t *data,
 			       drmModeModeInfo *mode,
-- 
2.35.1
