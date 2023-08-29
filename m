Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FCD610E394
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Aug 2023 14:42:20 +0000 (UTC)
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 29 Aug 2023 20:08:20 +0530
Message-Id: <20230829143821.1417623-9-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20230829143821.1417623-1-chaitanya.kumar.borah@intel.com>
References: <20230829143821.1417623-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 8/9] drm-uapi/i915_drm: Add uapi headers for
 custom color operation
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

SDR planes support fixed function CSC operation. Add UAPI to
expose them to user space.

Co-developed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 include/drm-uapi/i915_drm.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
index a0876ee41..bf1290bc2 100644
--- a/include/drm-uapi/i915_drm.h
+++ b/include/drm-uapi/i915_drm.h
@@ -3616,6 +3616,31 @@ struct drm_i915_gem_create_ext_protected_content {
 /* ID of the protected content session managed by i915 when PXP is active */
 #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
 
+/* I915 specific color operation */
+#define I915_COLOR_OP_FIXED_FUNC_CSC (1 << 0)
+
+/**
+ * enum i915_csc_operation
+ *
+ * Color conversion operations which can be performed by a fixed function h/w
+ * of type I915_COLOR_OP_FIXED_FUNC_CSC
+ */
+enum i915_csc_operation {
+	I915_CSC_YUV601_TO_RGB601,
+	I915_CSC_YUV709_TO_RGB709,
+	I915_CSC_YUV2020_TO_RGB2020,
+	I915_CSC_RGB709_TO_RGB2020,
+	I915_CSC_MAX,
+};
+
+struct i915_color_op_data {
+	__u32 flag; /* to identify i915 specific color operation */
+	union {
+		enum i915_csc_operation csc_type;
+		/* Add more structures here */
+	};
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.25.1
