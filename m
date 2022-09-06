Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693F110E60E
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Sep 2022 09:52:54 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Sep 2022 15:19:39 +0530
Message-Id: <20220906095030.486152-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20220906095030.486152-1-bhanuprakash.modem@intel.com>
References: <20220906095030.486152-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 01/52] lib/igt_kms: Add a helper for igt test
 constraint
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

Add an IGT helper to check the test constraints to decide whether to run/skip
the subtest.

Example:
* Pipe-D can't support mode > 5K
* To use 8K mode on a pipe then consecutive pipe must be available & free.
* MSO is supported only on PIPE_A/PIPE_B.

This helper is supposed to be a superset of all test constraints. But as of
now, only Intel specific hardware/configuration-related limitations like
Bigjoiner/MSO can go through this helper.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 39 +++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 40 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 7d4916a7..3a1bc391 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5824,3 +5824,42 @@ bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode)
 
 	return true;
 }
+
+/*
+ * igt_test_constraint:
+ * @display: a pointer to an #igt_display_t structure
+ *
+ * Every individual test must use igt_output_set_pipe() before calling this
+ * helper, so that this function will get all active pipes from connected
+ * outputs (i.e. pending_pipe != PIPE_NONE) and check the selected combo is
+ * valid or not.
+ *
+ * This helper is supposed to be a superset of all test constraints.
+ *
+ * Example:
+ *  * Pipe-D can't support mode > 5K
+ *  * To use 8K mode on a pipe then consecutive pipe must be free.
+ *  * MSO is supported only on PIPE_A/PIPE_B.
+ *
+ * Returns: true if a valid crtc/connector mode combo found, else false
+ */
+bool igt_test_constraint(igt_display_t *display)
+{
+	bool result = true;
+
+	/*
+	 * TODO: Add all possible test constraints here.
+	 *
+	 * Intention of this helper is that all kms tests should use this
+	 * helper to decide whether to run/skip the subtest.
+	 *
+	 * As of now, only Intel specific hardware/configuration-related
+	 * limitations like Bigjoiner/MSO are going through this helper.
+	 *
+	 * Please update this helper as per the requirement.
+	 */
+	if (is_i915_device(display->drm_fd))
+		result &= igt_check_bigjoiner_support(display);
+
+	return result;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index a2cf0937..82186cfe 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -975,5 +975,6 @@ bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
 		igt_output_t *output, int bpc);
 bool igt_check_bigjoiner_support(igt_display_t *display);
 bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
+bool igt_test_constraint(igt_display_t *display);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.35.1
