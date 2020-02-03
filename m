Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D22A6E02E
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Feb 2020 13:46:47 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Mon,  3 Feb 2020 15:46:42 +0200
Message-Id: <20200203134642.19685-1-mika.kahola@intel.com>
Subject: [igt-dev] [PATCH i-g-t] lib/igt_kms: Move SDR/HDR main plane search
 to library
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Mixing SDR and HDR planes result in a CRC mismatch. SDR and HDR
planes are tested in kms_ccs. To make main plane checking more
generic the patch proposes of moving SDR/HDR plane search
routines into a library. This will remove a need for duplicate
code in the future.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 lib/igt_kms.c   | 61 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h   |  7 ++++++
 tests/kms_ccs.c | 29 ++++-------------------
 3 files changed, 72 insertions(+), 25 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index d20daaad..9610dceb 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -4474,3 +4474,64 @@ void igt_parse_connector_tile_blob(drmModePropertyBlobPtr blob,
 	tile->tile_h_size = atoi(strtok(NULL, ":"));
 	tile->tile_v_size = atoi(strtok(NULL, ":"));
 }
+
+static bool is_sdr_plane(int fd,  igt_plane_t *plane)
+{
+	if (plane == NULL)
+		return false;
+
+	if (!is_i915_device(fd))
+		return false;
+
+	if (plane->type == DRM_PLANE_TYPE_PRIMARY ||
+	    plane->type == DRM_PLANE_TYPE_CURSOR)
+		return false;
+
+	if (intel_gen(intel_get_drm_devid(fd)) < 11)
+		return false;
+
+/*
+ * Kernel registers planes in the hardware Z order:
+ * 0,1,2 HDR planes
+ * 3,4 SDR UV planes
+ * 5,6 SDR Y planes
+ */
+	return plane->index >= 3;
+}
+
+/**
+ * igt_first_sdr_plane:
+ * @output: Target output
+ * @devid: Device ID
+ *
+ * Returns first SDR plane
+ *
+ */
+igt_plane_t *igt_first_sdr_plane(igt_output_t *output, uint32_t devid)
+{
+        return igt_output_get_plane(output,
+				    intel_gen(devid) < 11 ? 0 : 3);
+}
+
+/**
+ * igt_compatible_main_plane:
+ * @plane: Plane under test
+ * @output: Target output
+ * @devid: Device ID
+ *
+ * Mixing SDR and HDR planes results in a CRC mismatch, so use the first
+ * SDR/HDR plane as the main plane matching the SDR/HDR type of the sprite
+ * plane under test.
+ *
+ */
+igt_plane_t *igt_compatible_main_plane(int fd,
+				       igt_plane_t *plane,
+				       igt_output_t *output,
+				       uint32_t format,
+				       uint32_t devid)
+{
+	if (is_sdr_plane(fd, plane) && igt_format_is_yuv(format))
+                return igt_first_sdr_plane(output, devid);
+
+        return igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 6c919e92..8e1a7801 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -847,4 +847,11 @@ void igt_parse_connector_tile_blob(drmModePropertyBlobPtr blob,
 int igt_connector_sysfs_open(int drm_fd,
 			     drmModeConnector *connector);
 
+igt_plane_t *igt_first_sdr_plane(igt_output_t *output, uint32_t devid);
+igt_plane_t *igt_compatible_main_plane(int fd,
+				       igt_plane_t *plane,
+				       igt_output_t *output,
+				       uint32_t format,
+				       uint32_t devid);
+
 #endif /* __IGT_KMS_H__ */
diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
index 2259a4f1..cbd4de8b 100644
--- a/tests/kms_ccs.c
+++ b/tests/kms_ccs.c
@@ -252,35 +252,14 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
 	fb->fb_id = f.fb_id;
 }
 
-static igt_plane_t *first_sdr_plane(data_t *data)
-{
-	return igt_output_get_plane(data->output, SDR_PLANE_BASE);
-}
-
-static bool is_sdr_plane(const igt_plane_t *plane)
-{
-	return plane->index >= SDR_PLANE_BASE;
-}
-
-/*
- * Mixing SDR and HDR planes results in a CRC mismatch, so use the first
- * SDR/HDR plane as the main plane matching the SDR/HDR type of the sprite
- * plane under test.
- */
-static igt_plane_t *compatible_main_plane(data_t *data)
-{
-	if (data->plane && is_sdr_plane(data->plane) &&
-	    igt_format_is_yuv(data->format))
-		return first_sdr_plane(data);
-
-	return igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
-}
-
 static bool try_config(data_t *data, enum test_fb_flags fb_flags,
 		       igt_crc_t *crc)
 {
 	igt_display_t *display = &data->display;
-	igt_plane_t *primary = compatible_main_plane(data);
+	uint32_t devid = intel_get_drm_devid(data->drm_fd);
+	igt_plane_t *primary = igt_compatible_main_plane(data->drm_fd, data->plane,
+							 data->output, data->format,
+							 devid);
 	drmModeModeInfo *drm_mode = igt_output_get_mode(data->output);
 	enum igt_commit_style commit;
 	struct igt_fb fb, fb_sprite;
-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
