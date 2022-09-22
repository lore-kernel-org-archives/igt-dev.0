Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6256810EA7C
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 16:03:43 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Sep 2022 21:29:13 +0530
Message-Id: <20220922160004.2041598-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20220922160004.2041598-1-bhanuprakash.modem@intel.com>
References: <20220922160004.2041598-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 01/52] lib/igt_kms: Add a helper for valid
 pipe/output constraint
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

Add an IGT helper to check the given pipe/output combo is valid to decide
whether to run/skip the subtest.

Example:
* Pipe-D can't support mode > 5K
* To use 8K mode on a pipe then consecutive pipe must be available & free.
* MSO is supported only on PIPE_A/PIPE_B.

This helper is supposed to be a superset of all constraints of pipe/output
combo. But as of now, this helper supports only Bigjoiner.

V2:
- Rename the helper
- Add is_i915 constraint
- Add pre-condition check (igt_output_set_pipe called)
- Update documentaion
- Minor cleanup in Bigjoiner helper

Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Petri Latvala <petri.latvala@intel.com>
---
 lib/igt_kms.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++---
 lib/igt_kms.h |  1 +
 2 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 665594aa..5fdb67fc 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5743,6 +5743,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 {
 	uint8_t i, total_pipes = 0, pipes_in_use = 0;
 	enum pipe p;
+	igt_output_t *output;
 	struct {
 		enum pipe idx;
 		drmModeModeInfo *mode;
@@ -5756,9 +5757,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 	 * Get list of pipes in use those were set by igt_output_set_pipe()
 	 * just before calling this function.
 	 */
-	for (i = 0 ; i < display->n_outputs; i++) {
-		igt_output_t *output = &display->outputs[i];
-
+	for_each_connected_output(display, output) {
 		if (output->pending_pipe == PIPE_NONE)
 			continue;
 
@@ -5824,3 +5823,47 @@ bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode)
 
 	return true;
 }
+
+/*
+ * i915_pipe_output_combo_valid:
+ * @display: a pointer to an #igt_display_t structure
+ *
+ * Every individual test must use igt_output_set_pipe() before calling this
+ * helper, so that this function will get all active pipes from connected
+ * outputs (i.e. pending_pipe != PIPE_NONE) and check the selected combo is
+ * valid or not.
+ *
+ * This helper is supposed to be a superset of all constraints of pipe/output
+ * combo.
+ *
+ * Example:
+ *  * Pipe-D can't support mode > 5K
+ *  * To use 8K mode on a pipe then consecutive pipe must be free.
+ *  * MSO is supported only on PIPE_A/PIPE_B.
+ *
+ * Returns: true if a valid pipe/output mode combo found, else false
+ */
+bool i915_pipe_output_combo_valid(igt_display_t *display)
+{
+	int combo = 0;
+	igt_output_t *output;
+
+	if (!is_i915_device(display->drm_fd))
+		return true;
+
+	for_each_connected_output(display, output) {
+		if (output->pending_pipe == PIPE_NONE)
+			continue;
+
+		combo++;
+	}
+
+	igt_assert_f(combo, "At least one pipe/output combo needed.\n");
+
+	/*
+	 * Check the given pipe/output combo is valid for Bigjoiner.
+	 *
+	 * TODO: Update this helper to support other features like MSO.
+	 */
+	return igt_check_bigjoiner_support(display);
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 3d78c37f..1c424984 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -975,5 +975,6 @@ bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
 		igt_output_t *output, int bpc);
 bool igt_check_bigjoiner_support(igt_display_t *display);
 bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
+bool i915_pipe_output_combo_valid(igt_display_t *display);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.37.3
