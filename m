Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D55C10E07E
 for <igt-dev@lists.freedesktop.org>; Sun,  6 Aug 2023 16:48:07 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun,  6 Aug 2023 22:17:27 +0530
Message-Id: <20230806164729.1016167-3-swati2.sharma@intel.com>
In-Reply-To: <20230806164729.1016167-1-swati2.sharma@intel.com>
References: <20230806164729.1016167-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/4] lib/igt_kms: add helper for dp-mst
 connector id
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: ankit.k.nautiyal@freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Helper is added which returns dp-mst connector id.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_kms.c | 40 ++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 41 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 6034ff70c..c0bfa73fe 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6050,3 +6050,43 @@ bool igt_check_output_is_dp_mst(int drm_fd, igt_output_t *output)
 
 	return true;
 }
+
+static int parse_path_blob(char *blob_data)
+{
+	int connector_id;
+	char *encoder;
+
+	encoder = strtok(blob_data, ":");
+	igt_assert_f(!strcmp(encoder, "mst"), "PATH connector property expected to have 'mst'\n");
+
+	connector_id = atoi(strtok(NULL, "-"));
+
+	return connector_id;
+}
+
+/**
+ * igt_get_dp_mst_connector_id
+ * @drmfd: Handle to open drm device
+ * @output: Target output
+ *
+ * Returns: dp-mst connector id.
+ */
+int igt_get_dp_mst_connector_id(int drm_fd, igt_output_t *output)
+{
+	drmModePropertyBlobPtr path_blob = NULL;
+	uint64_t path_blob_id;
+	drmModeConnector *connector = output->config.connector;
+	int connector_id;
+
+	igt_assert(kmstest_get_property(drm_fd, connector->connector_id,
+		   DRM_MODE_OBJECT_CONNECTOR, "PATH", NULL,
+		   &path_blob_id, NULL));
+
+	igt_assert(path_blob = drmModeGetPropertyBlob(drm_fd, path_blob_id));
+
+	connector_id = parse_path_blob((char *) path_blob->data);
+
+	drmModeFreePropertyBlob(path_blob);
+
+	return connector_id;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 9a46e7a5c..6f978ed55 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1005,5 +1005,6 @@ bool igt_check_bigjoiner_support(igt_display_t *display);
 bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
 bool i915_pipe_output_combo_valid(igt_display_t *display);
 bool igt_check_output_is_dp_mst(int drmfd, igt_output_t *output);
+int igt_get_dp_mst_connector_id(int drm_fd, igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.25.1
