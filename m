Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1570510E36F
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Aug 2023 14:42:09 +0000 (UTC)
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 29 Aug 2023 20:08:13 +0530
Message-Id: <20230829143821.1417623-2-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20230829143821.1417623-1-chaitanya.kumar.borah@intel.com>
References: <20230829143821.1417623-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/9] drm-uapi: Add color pipeline uapi
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chaitanya.kumar.borah@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add new uapi to support plane color pipeline.

Note: This should be updated more cleanly through kernel headers,
added here to unblock compilation issues.

Co-developed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 include/drm-uapi/drm_mode.h | 184 ++++++++++++++++++++++++++++++++++++
 1 file changed, 184 insertions(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index e4a2570a6..e4761c012 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -903,6 +903,190 @@ struct hdr_output_metadata {
 	};
 };
 
+/**
+ * DRM_MODE_LUT_POST_CSC
+ *
+ * LUT is for post csc (after CTM)
+ */
+#define DRM_MODE_LUT_POST_CSC BIT(0)
+
+/**
+ * DRM_MODE_LUT_PRE_CSC
+ *
+ * LUT is for pre csc (before CTM)
+ */
+#define DRM_MODE_LUT_PRE_CSC BIT(1)
+
+/**
+ * DRM_MODE_LUT_INTERPOLATE
+ *
+ * linearly interpolate between the points
+ */
+#define DRM_MODE_LUT_INTERPOLATE BIT(2)
+
+/**
+ * DRM_MODE_LUT_REUSE_LAST
+ *
+ * the last value of the previous range is the
+ * first value of the current range.
+ */
+#define DRM_MODE_LUT_REUSE_LAST BIT(3)
+
+/**
+ * DRM_MODE_LUT_NON_DECREASING
+ *
+ * the curve must be non-decreasing
+ */
+#define DRM_MODE_LUT_NON_DECREASING BIT(4)
+
+/**
+ * DRM_MODE_LUT_REFLECT_NEGATIVE
+ *
+ *  the curve is reflected across origin for negative inputs
+ */
+#define DRM_MODE_LUT_REFLECT_NEGATIVE BIT(5)
+
+/**
+ * DRM_MODE_LUT_SINGLE_CHANNEL
+ *
+ * the same curve (red) is used for blue and green channels as well
+ */
+#define DRM_MODE_LUT_SINGLE_CHANNEL BIT(6)
+
+/**
+ * struct drm_color_lut_range
+ *
+ * structure to advertise capability of a color hardware
+ * block that accepts LUT values.  It can represent LUTs with
+ * varied number of entries and distributions
+ * (Multi segmented, Logarithmic etc).
+ */
+
+struct drm_color_lut_range {
+	/* DRM_MODE_LUT_* */
+	__u32 flags;
+	/* number of points on the curve */
+	__u16 count;
+	/* input/output bits per component */
+	__u8 input_bpc, output_bpc;
+	/* input start/end values */
+	__s32 start, end;
+	/* output min/max values */
+	__s32 min, max;
+};
+
+enum lut_type {
+	LUT_TYPE_PRE_CSC = 0,
+	LUT_TYPE_POST_CSC = 1,
+};
+
+/*
+ * Creating 64 bit palette entries for better data
+ * precision. This will be required for HDR and
+ * similar color processing usecases.
+ */
+struct drm_color_lut_ext {
+	/*
+	 * Data is U32.32 fixed point format.
+	 */
+	__u64 red;
+	__u64 green;
+	__u64 blue;
+	__u64 reserved;
+};
+
+/**
+ * enum color_op_block
+ *
+ * Enums to identify hardware color blocks.
+ *
+ * @DRM_CB_PRE_CSC: LUT before the CTM unit
+ * @DRM_CB_CSC: CTM hardware supporting 3x3 matrix
+ * @DRM_CB_POST_CSC: LUT after the CTM unit
+ * @DRM_CB_3D_LUT: LUT hardware with coefficients for all
+ *                 color components
+ * @DRM_CB_PRIVATE: Vendor specific hardware unit. Vendor
+ *                  can expose a custom hardware by defining a
+ *                  color operation block with this name as
+ *                  identifier
+ */
+enum color_op_block {
+	DRM_CB_INVAL = -1,
+
+	DRM_CB_PRE_CSC = 0,
+	DRM_CB_CSC,
+	DRM_CB_POST_CSC,
+	DRM_CB_3D_LUT,
+
+	DRM_CB_PRIVATE = 255,
+	DRM_CB_MAX = DRM_CB_PRIVATE,
+};
+
+/**
+ * enum color_op_type
+ *
+ * These enums are to identify the mathematical opeartion that
+ * a hardware block is capable of.
+ */
+enum color_op_type {
+	CURVE_1D,
+	CURVE_3D,
+	MATRIX,
+	FIXED_FUNCTION,
+};
+
+/**
+ * @struct drm_color_op
+ *
+ * This structure is used to represent the capability of
+ * indivisual color hardware blocks.
+ *
+ * @name: a standardized enum to identify the color hardware block
+ * @type: The type of mathematical operation it can perform
+ * @blob_id: Id pointing to a blob containing information about
+ *          the hardware block which advertises its capabilities
+ *          to the userspace. It can be an optional field depending
+ *          on the members "name" and "type".
+ * @private_flags: This can be used to provide vendor specific hints
+ *                 to user space
+ */
+struct drm_color_op {
+	enum color_op_block name;
+	enum color_op_type type;
+	__u32 blob_id;
+	__u32 private_flags;
+};
+
+/**
+ * struct drm_color_op_data
+ *
+ * Structure for userspace to send data to a particular color operation
+ * block.
+ *
+ * @name: Name of the color block for which the data is being sent
+ * @blob_id: Id pointing to blob with data for the color operation block
+ */
+struct drm_color_op_data {
+	enum color_op_block name;
+	__u32 blob_id;
+};
+
+/**
+ * struct drm_color_pipeline
+ *
+ * This structure represents the aggregate pipeline to be set
+ *
+ * @num: pipeline number to be selected
+ * @size: size of the data to be passed onto the driver
+ * @data: array of struct drm_color_op_data with data for the
+ *       hardware block/s that user space wants to set values for
+ */
+struct drm_color_pipeline {
+	int num;
+	int size;
+	struct drm_color_op_data *data;
+};
+
 #define DRM_MODE_PAGE_FLIP_EVENT 0x01
 #define DRM_MODE_PAGE_FLIP_ASYNC 0x02
 #define DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE 0x4
-- 
2.25.1
