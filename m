Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABAA10E4A6
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Aug 2023 08:13:09 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 24 Aug 2023 13:42:54 +0530
Message-Id: <20230824081256.1164530-3-swati2.sharma@intel.com>
In-Reply-To: <20230824081256.1164530-1-swati2.sharma@intel.com>
References: <20230824081256.1164530-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v3 2/4] lib/igt_kms: add helper for dp-mst connector id
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
    -rewrite helper (Bhanu/Ankit)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_kms.c | 33 +++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 34 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 3af10946c..c2f3728a6 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6050,3 +6050,36 @@ bool igt_check_output_is_dp_mst(igt_output_t *output)
 {
 	return !!output->config.connector_path;
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
+ * @output: Target output
+ *
+ * Returns: connector id if output is dp-mst, else -EINVAL.
+ */
+int igt_get_dp_mst_connector_id(igt_output_t *output)
+{
+	int connector_id;
+	char *connector_path;
+
+	if (!igt_check_output_is_dp_mst(output))
+		return -EINVAL;
+
+	connector_path = output->config.connector_path;
+	connector_id = parse_path_connector(connector_path);
+
+	return connector_id;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 35826d4bd..f2c3741fc 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1014,5 +1014,6 @@ bool igt_check_bigjoiner_support(igt_display_t *display);
 bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
 bool i915_pipe_output_combo_valid(igt_display_t *display);
 bool igt_check_output_is_dp_mst(igt_output_t *output);
+int igt_get_dp_mst_connector_id(igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.25.1
