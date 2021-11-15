Return-Path: <dri-devel-bounces@lists.freedesktop.org>
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t 01/14] HAX: Get uapi headers to compile the IGT
Date: Mon, 15 Nov 2021 15:17:46 +0530
Message-Id: <20211115094759.520955-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
References: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 include/drm-uapi/drm.h      | 10 ++++++++++
 include/drm-uapi/drm_mode.h | 28 ++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
index 5e54c3aa4c..9ca3dbe8e5 100644
--- a/include/drm-uapi/drm.h
+++ b/include/drm-uapi/drm.h
@@ -830,6 +830,16 @@ struct drm_get_cap {
  */
 #define DRM_CLIENT_CAP_WRITEBACK_CONNECTORS	5
 
+/**
+ * DRM_CLIENT_CAP_ADVANCE_GAMMA_MODES
+ *
+ * Add support for advance gamma mode UAPI
+ * If set to 1, DRM will enable advance gamma mode
+ * UAPI to process the gamma mode based on extended
+ * range and segments.
+ */
+#define DRM_CLIENT_CAP_ADVANCE_GAMMA_MODES     6
+
 /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
 struct drm_set_client_cap {
 	__u64 capability;
diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index e4a2570a60..97198609a5 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -817,6 +817,34 @@ struct drm_color_lut {
 	__u16 reserved;
 };
 
+/*
+ * Creating 64 bit palette entries for better data
+ * precision. This will be required for HDR and
+ * similar color processing usecases.
+ */
+struct drm_color_lut_ext {
+    /*
+     * Data is U32.32 fixed point format.
+     */
+    __u64 red;
+    __u64 green;
+    __u64 blue;
+    __u64 reserved;
+};
+
+struct drm_color_lut_range {
+    /* DRM_MODE_LUT_* */
+    __u32 flags;
+    /* number of points on the curve */
+    __u16 count;
+    /* input/output bits per component */
+    __u8 input_bpc, output_bpc;
+    /* input start/end values */
+    __s32 start, end;
+    /* output min/max values */
+    __s32 min, max;
+};
+
 /**
  * struct hdr_metadata_infoframe - HDR Metadata Infoframe Data.
  *
-- 
2.32.0
