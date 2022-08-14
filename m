Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E711397A4E
 for <igt-dev@lists.freedesktop.org>; Sun, 14 Aug 2022 18:12:06 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 14 Aug 2022 23:38:18 +0530
Message-Id: <20220814180908.2553394-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
References: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 01/51] lib/igt_kms: Add a helper for igt test
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

This patch will create a helper with super set of all test constraints.

Example:
* Pipe-D can't support mode > 5K
* To use 8K mode on a pipe then consecutive pipe must be available & free.
* MSO is supported only on PIPE_A/PIPE_B.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 22 ++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 1ba3bd2a..e1a65244 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5803,3 +5803,25 @@ bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode)
 
 	return true;
 }
+
+/*
+ * igt_test_constraint:
+ * @display: a pointer to an #igt_display_t structure
+ *
+ * Get all active pipes from connected outputs (i.e. pending_pipe != PIPE_NONE)
+ * and check those pipes supports the selected mode(s).
+ *
+ * This is a super set of all test constraints.
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
+	/* TODO: Add all possible test constraints here. */
+	return igt_check_bigjoiner_support(display);
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
