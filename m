Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9ED210E4A6
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Aug 2023 08:13:07 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 24 Aug 2023 13:42:53 +0530
Message-Id: <20230824081256.1164530-2-swati2.sharma@intel.com>
In-Reply-To: <20230824081256.1164530-1-swati2.sharma@intel.com>
References: <20230824081256.1164530-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v3 1/4] lib/igt_kms: add helper to check if output is mst
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

v2: -use output->config.connector_path to know if
     output is dpmst (Bhanu)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_kms.c | 11 +++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e0959ccff..3af10946c 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6039,3 +6039,14 @@ bool i915_pipe_output_combo_valid(igt_display_t *display)
 	 */
 	return igt_check_bigjoiner_support(display);
 }
+
+/**
+ * igt_check_output_is_dp_mst
+ * @output: Target output
+ *
+ * Returns: true if output is dp-mst, else false.
+ */
+bool igt_check_output_is_dp_mst(igt_output_t *output)
+{
+	return !!output->config.connector_path;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 91355c910..35826d4bd 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1013,5 +1013,6 @@ bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
 bool igt_check_bigjoiner_support(igt_display_t *display);
 bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
 bool i915_pipe_output_combo_valid(igt_display_t *display);
+bool igt_check_output_is_dp_mst(igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.25.1
