Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093456F571
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2020 14:06:06 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Wed, 29 Jan 2020 19:25:14 +0530
Message-Id: <20200129135520.20336-2-swati2.sharma@intel.com>
In-Reply-To: <20200129135520.20336-1-swati2.sharma@intel.com>
References: <20200129135520.20336-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 1/7] headers: Bump drm uapi headers
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
Cc: petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

Updating them to the latest version from drm-next for HDR static
metadata uapi structures:

 commit a09db883e5d9 ("drm: Fix docbook warnings in hdr metadata
 helper structures")

v2: Bumped to latest drm-next headers

Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Reviewed-by: Petri Latvala <petri.latvala@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 include/drm-uapi/drm_mode.h | 121 +++++++++++++++++++++++++++++++++++-
 1 file changed, 119 insertions(+), 2 deletions(-)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index a439c2e6..5ab331e5 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -33,7 +33,15 @@
 extern "C" {
 #endif
 
-#define DRM_DISPLAY_INFO_LEN	32
+/**
+ * DOC: overview
+ *
+ * DRM exposes many UAPI and structure definition to have a consistent
+ * and standardized interface with user.
+ * Userspace can refer to these structure definitions and UAPI formats
+ * to communicate to driver
+ */
+
 #define DRM_CONNECTOR_NAME_LEN	32
 #define DRM_DISPLAY_MODE_LEN	32
 #define DRM_PROP_NAME_LEN	32
@@ -622,7 +630,8 @@ struct drm_color_ctm {
 
 struct drm_color_lut {
 	/*
-	 * Data is U0.16 fixed point format.
+	 * Values are mapped linearly to 0.0 - 1.0 range, with 0x0 == 0.0 and
+	 * 0xffff == 1.0.
 	 */
 	__u16 red;
 	__u16 green;
@@ -630,6 +639,92 @@ struct drm_color_lut {
 	__u16 reserved;
 };
 
+/**
+ * struct hdr_metadata_infoframe - HDR Metadata Infoframe Data.
+ *
+ * HDR Metadata Infoframe as per CTA 861.G spec. This is expected
+ * to match exactly with the spec.
+ *
+ * Userspace is expected to pass the metadata information as per
+ * the format described in this structure.
+ */
+struct hdr_metadata_infoframe {
+	/**
+	 * @eotf: Electro-Optical Transfer Function (EOTF)
+	 * used in the stream.
+	 */
+	__u8 eotf;
+	/**
+	 * @metadata_type: Static_Metadata_Descriptor_ID.
+	 */
+	__u8 metadata_type;
+	/**
+	 * @display_primaries: Color Primaries of the Data.
+	 * These are coded as unsigned 16-bit values in units of
+	 * 0.00002, where 0x0000 represents zero and 0xC350
+	 * represents 1.0000.
+	 * @display_primaries.x: X cordinate of color primary.
+	 * @display_primaries.y: Y cordinate of color primary.
+	 */
+	struct {
+		__u16 x, y;
+		} display_primaries[3];
+	/**
+	 * @white_point: White Point of Colorspace Data.
+	 * These are coded as unsigned 16-bit values in units of
+	 * 0.00002, where 0x0000 represents zero and 0xC350
+	 * represents 1.0000.
+	 * @white_point.x: X cordinate of whitepoint of color primary.
+	 * @white_point.y: Y cordinate of whitepoint of color primary.
+	 */
+	struct {
+		__u16 x, y;
+		} white_point;
+	/**
+	 * @max_display_mastering_luminance: Max Mastering Display Luminance.
+	 * This value is coded as an unsigned 16-bit value in units of 1 cd/m2,
+	 * where 0x0001 represents 1 cd/m2 and 0xFFFF represents 65535 cd/m2.
+	 */
+	__u16 max_display_mastering_luminance;
+	/**
+	 * @min_display_mastering_luminance: Min Mastering Display Luminance.
+	 * This value is coded as an unsigned 16-bit value in units of
+	 * 0.0001 cd/m2, where 0x0001 represents 0.0001 cd/m2 and 0xFFFF
+	 * represents 6.5535 cd/m2.
+	 */
+	__u16 min_display_mastering_luminance;
+	/**
+	 * @max_cll: Max Content Light Level.
+	 * This value is coded as an unsigned 16-bit value in units of 1 cd/m2,
+	 * where 0x0001 represents 1 cd/m2 and 0xFFFF represents 65535 cd/m2.
+	 */
+	__u16 max_cll;
+	/**
+	 * @max_fall: Max Frame Average Light Level.
+	 * This value is coded as an unsigned 16-bit value in units of 1 cd/m2,
+	 * where 0x0001 represents 1 cd/m2 and 0xFFFF represents 65535 cd/m2.
+	 */
+	__u16 max_fall;
+};
+
+/**
+ * struct hdr_output_metadata - HDR output metadata
+ *
+ * Metadata Information to be passed from userspace
+ */
+struct hdr_output_metadata {
+	/**
+	 * @metadata_type: Static_Metadata_Descriptor_ID.
+	 */
+	__u32 metadata_type;
+	/**
+	 * @hdmi_metadata_type1: HDR Metadata Infoframe.
+	 */
+	union {
+		struct hdr_metadata_infoframe hdmi_metadata_type1;
+	};
+};
+
 #define DRM_MODE_PAGE_FLIP_EVENT 0x01
 #define DRM_MODE_PAGE_FLIP_ASYNC 0x02
 #define DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE 0x4
@@ -803,6 +898,10 @@ struct drm_format_modifier {
 };
 
 /**
+ * struct drm_mode_create_blob - Create New block property
+ * @data: Pointer to data to copy.
+ * @length: Length of data to copy.
+ * @blob_id: new property ID.
  * Create a new 'blob' data property, copying length bytes from data pointer,
  * and returning new blob ID.
  */
@@ -816,6 +915,8 @@ struct drm_mode_create_blob {
 };
 
 /**
+ * struct drm_mode_destroy_blob - Destroy user blob
+ * @blob_id: blob_id to destroy
  * Destroy a user-created blob property.
  */
 struct drm_mode_destroy_blob {
@@ -823,6 +924,12 @@ struct drm_mode_destroy_blob {
 };
 
 /**
+ * struct drm_mode_create_lease - Create lease
+ * @object_ids: Pointer to array of object ids.
+ * @object_count: Number of object ids.
+ * @flags: flags for new FD.
+ * @lessee_id: unique identifier for lessee.
+ * @fd: file descriptor to new drm_master file.
  * Lease mode resources, creating another drm_master.
  */
 struct drm_mode_create_lease {
@@ -840,6 +947,10 @@ struct drm_mode_create_lease {
 };
 
 /**
+ * struct drm_mode_list_lessees - List lessees
+ * @count_lessees: Number of lessees.
+ * @pad: pad.
+ * @lessees_ptr: Pointer to lessess.
  * List lesses from a drm_master
  */
 struct drm_mode_list_lessees {
@@ -860,6 +971,10 @@ struct drm_mode_list_lessees {
 };
 
 /**
+ * struct drm_mode_get_lease - Get Lease
+ * @count_objects: Number of leased objects.
+ * @pad: pad.
+ * @objects_ptr: Pointer to objects.
  * Get leased objects
  */
 struct drm_mode_get_lease {
@@ -880,6 +995,8 @@ struct drm_mode_get_lease {
 };
 
 /**
+ * struct drm_mode_revoke_lease - Revoke lease
+ * @lessee_id: Unique ID of lessee.
  * Revoke lease
  */
 struct drm_mode_revoke_lease {
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
