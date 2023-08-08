Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C73710E0F8
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 19:40:48 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  9 Aug 2023 01:10:34 +0530
Message-Id: <20230808194036.1045626-3-swati2.sharma@intel.com>
In-Reply-To: <20230808194036.1045626-1-swati2.sharma@intel.com>
References: <20230808194036.1045626-1-swati2.sharma@intel.com>
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Helper is added which returns dp-mst connector id.

v2: -use connector_path instead of blob (Bhanu)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_kms.c | 31 +++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 32 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index b3a9375ee..0ae952c39 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6060,3 +6060,34 @@ bool igt_check_output_is_dp_mst(int drm_fd, igt_output_t *output)
 
 	return true;
 }
+
+static int parse_path_connector(char *connector_path)
+{
+	int connector_id;
+	char *encoder;
+
+	encoder = strtok(connector_path, ":");
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
+int igt_get_dp_mst_connector_id(igt_output_t *output)
+{
+	int connector_id;
+	char *connector_path;
+
+	connector_path = output->config.connector_path;
+	connector_id = parse_path_connector(connector_path);
+
+	return connector_id;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index d8d6ccfe5..e67de4ecd 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1014,5 +1014,6 @@ bool igt_check_bigjoiner_support(igt_display_t *display);
 bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
 bool i915_pipe_output_combo_valid(igt_display_t *display);
 bool igt_check_output_is_dp_mst(int drmfd, igt_output_t *output);
+int igt_get_dp_mst_connector_id(igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.25.1
