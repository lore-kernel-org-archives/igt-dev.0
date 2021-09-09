Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBC06E895
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Sep 2021 15:31:29 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Thu,  9 Sep 2021 18:30:46 +0300
Message-Id: <20210909153047.16729-11-ville.syrjala@linux.intel.com>
In-Reply-To: <20210909153047.16729-1-ville.syrjala@linux.intel.com>
References: <20210909153047.16729-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 10/11] tests/kms_plane: Abstract single
 vs. multiple crsc better
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Add a single point where we decide whether to use single vs.
multiple colors, rather than just assuming planar==single colors
and packed==multiple colors.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_plane.c | 61 ++++++++++++++++++++++++++---------------------
 1 file changed, 34 insertions(+), 27 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 77b13a33ed49..760df5d7d334 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -574,7 +574,7 @@ static void capture_crc(data_t *data, unsigned int vblank, igt_crc_t *crc)
 		      crc->frame, vblank);
 }
 
-static void capture_format_crcs_packed(data_t *data, enum pipe pipe,
+static void capture_format_crcs_single(data_t *data, enum pipe pipe,
 				       igt_plane_t *plane,
 				       uint32_t format, uint64_t modifier,
 				       int width, int height,
@@ -596,13 +596,13 @@ static void capture_format_crcs_packed(data_t *data, enum pipe pipe,
 	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc[0]);
 }
 
-static void capture_format_crcs_planar(data_t *data, enum pipe pipe,
-				       igt_plane_t *plane,
-				       uint32_t format, uint64_t modifier,
-				       int width, int height,
-				       enum igt_color_encoding encoding,
-				       enum igt_color_range range,
-				       igt_crc_t crc[], struct igt_fb *fb)
+static void capture_format_crcs_multiple(data_t *data, enum pipe pipe,
+					 igt_plane_t *plane,
+					 uint32_t format, uint64_t modifier,
+					 int width, int height,
+					 enum igt_color_encoding encoding,
+					 enum igt_color_range range,
+					 igt_crc_t crc[], struct igt_fb *fb)
 {
 	unsigned int vblank[ARRAY_SIZE(colors_extended)];
 	struct drm_event_vblank ev;
@@ -719,6 +719,11 @@ restart_round:
 	capture_crc(data, vblank[i - 1], &crc[i - 1]);
 }
 
+static bool use_multiple_colors(data_t *data, uint32_t format)
+{
+	return igt_format_is_yuv_semiplanar(format);
+}
+
 static bool test_format_plane_colors(data_t *data, enum pipe pipe,
 				     igt_plane_t *plane,
 				     uint32_t format, uint64_t modifier,
@@ -733,17 +738,17 @@ static bool test_format_plane_colors(data_t *data, enum pipe pipe,
 	int crc_mismatch_count = 0;
 	bool result = true;
 	int i, total_crcs = 1;
-	bool planar = igt_format_is_yuv_semiplanar(format);
 
-	if (planar) {
-		capture_format_crcs_planar(data, pipe, plane, format, modifier,
-					   width, height, encoding, range, crc,
-					   fb);
+	if (use_multiple_colors(data, format)) {
+		capture_format_crcs_multiple(data, pipe, plane, format, modifier,
+					     width, height, encoding, range, crc,
+					     fb);
 		total_crcs = data->num_colors;
-	} else
-		capture_format_crcs_packed(data, pipe, plane, format, modifier,
+	} else {
+		capture_format_crcs_single(data, pipe, plane, format, modifier,
 					   width, height, encoding, range, crc,
 					   fb);
+	}
 
 	for (i = 0; i < total_crcs; i++) {
 		if (!igt_check_crc_equal(&crc[i], &ref_crc[i])) {
@@ -833,9 +838,11 @@ static bool test_format_plane_yuv(data_t *data, enum pipe pipe,
 	return result;
 }
 
-enum crc_set { PACKED_CRC_SET,
-	       PLANAR_CRC_SET,
-	       MAX_CRC_SET };
+enum crc_set {
+	SINGLE_CRC_SET,
+	MULTIPLE_CRC_SET,
+	MAX_CRC_SET,
+};
 
 struct format_mod {
 	uint64_t modifier;
@@ -913,22 +920,22 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 		igt_remove_fb(data->drm_fd, &test_fb);
 	}
 
-	capture_format_crcs_packed(data, pipe, plane, ref.format, ref.modifier,
+	capture_format_crcs_single(data, pipe, plane, ref.format, ref.modifier,
 				   width, height, IGT_COLOR_YCBCR_BT709,
 				   IGT_COLOR_YCBCR_LIMITED_RANGE,
-				   ref_crc[PACKED_CRC_SET], &fb);
+				   ref_crc[SINGLE_CRC_SET], &fb);
 
-	capture_format_crcs_planar(data, pipe, plane, ref.format, ref.modifier,
-				   width, height, IGT_COLOR_YCBCR_BT709,
-				   IGT_COLOR_YCBCR_LIMITED_RANGE,
-				   ref_crc[PLANAR_CRC_SET], &fb);
+	capture_format_crcs_multiple(data, pipe, plane, ref.format, ref.modifier,
+				     width, height, IGT_COLOR_YCBCR_BT709,
+				     IGT_COLOR_YCBCR_LIMITED_RANGE,
+				     ref_crc[MULTIPLE_CRC_SET], &fb);
 
 	/*
 	 * Make sure we have some difference between the colors. This
 	 * at least avoids claiming success when everything is just
 	 * black all the time (eg. if the plane is never even on).
 	 */
-	igt_require(num_unique_crcs(ref_crc[PLANAR_CRC_SET], data->num_colors) > 1);
+	igt_require(num_unique_crcs(ref_crc[MULTIPLE_CRC_SET], data->num_colors) > 1);
 
 	for (int i = 0; i < plane->format_mod_count; i++) {
 		struct format_mod f = {
@@ -965,8 +972,8 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 				continue;
 		}
 
-		crcset = ref_crc[(igt_format_is_yuv_semiplanar(f.format)
-				 ? PLANAR_CRC_SET : PACKED_CRC_SET)];
+		crcset = ref_crc[use_multiple_colors(data, f.format) ?
+				 MULTIPLE_CRC_SET : SINGLE_CRC_SET];
 
 		if (igt_format_is_yuv(f.format))
 			result &= test_format_plane_yuv(data, pipe, plane,
-- 
2.31.1
