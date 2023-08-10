Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5624210E4F4
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 08:17:58 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 10 Aug 2023 13:47:40 +0530
Message-Id: <20230810081743.1065566-2-swati2.sharma@intel.com>
In-Reply-To: <20230810081743.1065566-1-swati2.sharma@intel.com>
References: <20230810081743.1065566-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v2 1/4] lib/igt_kms: add helper to check if output is mst
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

Helper is added to check if output is mst or not.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_kms.c | 21 +++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e0959ccff..b3a9375ee 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6039,3 +6039,24 @@ bool i915_pipe_output_combo_valid(igt_display_t *display)
 	 */
 	return igt_check_bigjoiner_support(display);
 }
+
+/**
+ * igt_check_output_is_dp_mst
+ * @drmfd: Handle to open drm device
+ * @output: Target output
+ *
+ * Returns: true if output is dp-mst, else false.
+ */
+bool igt_check_output_is_dp_mst(int drm_fd, igt_output_t *output)
+{
+	struct kmstest_connector_config config;
+	const char *encoder;
+
+	kmstest_get_connector_config(drm_fd, output->config.connector->connector_id, -1, &config);
+	encoder = kmstest_encoder_type_str(config.encoder->encoder_type);
+
+	if (strcmp(encoder, "DP MST"))
+		return false;
+
+	return true;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 91355c910..d8d6ccfe5 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1013,5 +1013,6 @@ bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
 bool igt_check_bigjoiner_support(igt_display_t *display);
 bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
 bool i915_pipe_output_combo_valid(igt_display_t *display);
+bool igt_check_output_is_dp_mst(int drmfd, igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.25.1
