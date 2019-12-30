Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A30089CDF
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Dec 2019 03:41:23 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Mon, 30 Dec 2019 05:40:38 +0200
Message-Id: <20191230034040.21943-9-imre.deak@intel.com>
In-Reply-To: <20191230034040.21943-1-imre.deak@intel.com>
References: <20191230034040.21943-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 08/10] tests/kms_ccs: Work around CRC
 mismatch when mixing SDR/HDR planes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

When using both an SDR and HDR plane, the CRC of the resulting image
will not match the CRC of the reference image where just an HDR plane is
used. To avoid this - most probably HW precision issue - make sure all
the planes we enable are of the same SDR/HDR type.

Cc: Mika Kahola <mika.kahola@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 tests/kms_ccs.c | 35 ++++++++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
index 60cdd70c..a86a3470 100644
--- a/tests/kms_ccs.c
+++ b/tests/kms_ccs.c
@@ -24,6 +24,8 @@
 
 #include "igt.h"
 
+#define SDR_PLANE_BASE	3
+
 IGT_TEST_DESCRIPTION("Test render compression (RC), in which the main surface "
 		     "is complemented by a color control surface (CCS) that "
 		     "the display uses to interpret the compressed data.");
@@ -195,11 +197,35 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
 	fb->fb_id = f.fb_id;
 }
 
+static igt_plane_t *first_sdr_plane(data_t *data)
+{
+	return igt_output_get_plane(data->output, SDR_PLANE_BASE);
+}
+
+static bool is_sdr_plane(const igt_plane_t *plane)
+{
+	return plane->index >= SDR_PLANE_BASE;
+}
+
+/*
+ * Mixing SDR and HDR planes results in a CRC mismatch, so use the first
+ * SDR/HDR plane as the main plane matching the SDR/HDR type of the sprite
+ * plane under test.
+ */
+static igt_plane_t *compatible_main_plane(data_t *data)
+{
+	if (data->plane && is_sdr_plane(data->plane) &&
+	    igt_format_is_yuv(data->format))
+		return first_sdr_plane(data);
+
+	return igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
+}
+
 static bool try_config(data_t *data, enum test_fb_flags fb_flags,
 		       igt_crc_t *crc)
 {
 	igt_display_t *display = &data->display;
-	igt_plane_t *primary;
+	igt_plane_t *primary = compatible_main_plane(data);
 	drmModeModeInfo *drm_mode = igt_output_get_mode(data->output);
 	enum igt_commit_style commit;
 	struct igt_fb fb, fb_sprite;
@@ -210,8 +236,9 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
 	else
 		commit = COMMIT_UNIVERSAL;
 
-	primary = igt_output_get_plane_type(data->output,
-					    DRM_PLANE_TYPE_PRIMARY);
+	if (primary == data->plane)
+		return false;
+
 	if (!igt_plane_has_format_mod(primary, data->format,
 				      data->ccs_modifier))
 		return false;
@@ -392,8 +419,6 @@ igt_main
 			igt_display_require_output_on_pipe(&data.display, data.pipe);
 
 			for_each_plane_on_pipe(&data.display, data.pipe, data.plane) {
-				if (data.plane->type == DRM_PLANE_TYPE_PRIMARY)
-					continue;
 				valid_tests += __test_output(&data);
 			}
 
-- 
2.23.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
