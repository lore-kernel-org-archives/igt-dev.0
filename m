Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332EBE7DEF7
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:33:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A63610E4ED;
	Mon,  2 Feb 2026 14:33:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Fdc8xW22";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B9B10E4FA
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:33:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E69551A2C16;
 Mon,  2 Feb 2026 14:33:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BE94760767;
 Mon,  2 Feb 2026 14:33:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 99220119A890E; Mon,  2 Feb 2026 15:32:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042780; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=a6Cc5VxLtUMeaDTxshujrImFa/LLhtiIf9bSSppEftc=;
 b=Fdc8xW22KTzSgWNP068TZaJzl2rh96aHnrUGK+Nktx6/MPsZL92ZxEq2hlWAvOmHcYmbzu
 uUlwBuzbC3hb2JH7RFv7G/jY8cs3k0dAf0D4Yn33MnZW/sKvB1fuV8wIiUJ779Q3jgzva4
 wvvO8Kg1Iwz3VCMFTk/rS0HXxPlTvqlNkflPmZORfDqWZDdCixsaTRj6Rd+cjNiuOJQz+p
 CKXYsEKUcUK/rRSoJrYKOXPeWL67wLQHj5ce+M42BqNyRBK4JyFz49NmlA+h5UXYnxayPI
 FD90GQ5nTrbsZQ2GJl2nHgd0BSERThdayqhwya/pQIhJRXRHHeVSW6Yx6T9UUQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:33:16 +0100
Subject: [PATCH i-g-t v6 37/48] lib/i915/dp: Rename functions to avoid
 confusion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-37-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=19906;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=/eV6XISPeKNf/745YmfgIlBWLKbT+5Bf8iD3iiIGr30=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWTGL6sy7MtbS1z06/6fYnnaFwsLuAQKNlcY
 85O4QTlHamJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1kxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOI/NRAAy7tZ0PgwR7nAfBtnTNQVgTXCj/WRv/+
 4Jrn5H6oi8/HYrhPLw7HgybsZTxgbujcWhNL0L2pZ28yECE9TPe0sYT7RdOYYIBULPOWBSZMQrY
 yON6jr0mDfqzPb/dGNFUkju616DQOxArkPtgih4qzU3noa856UnkIh8GbYXDzGZi3fA0KAOb8aj
 LCOOOqOIHthb/SlntOGYIAuwN95LqdXQG7cOXE2z+ZGU6qlo5k3hP0KucwycIWGiPrnAVe2hu18
 pR8bY0R0UyFucrBCoZnl/8gT9WBlmdT9tLTH/fuoCyygXWuMWq6EGfhU5B9+xk6qAt3fQ5SrhfB
 S5w8AbXJNWCYaI7jxEgKN2pTI7cJmArxXnXBKdQQMaccGTY6L2jrw7sqs6d6TcXQsqZcgS4Mhoj
 sz1DhyX7WISCLGYvBhEpmXD1VrMu6qPU2HgLhGwiGeDUky+3HJh5hLxrxkJf01yF7JGGUCd1bji
 mAnNyoneDq2osUvSUvQfpJ7P8onZ6YatAcPsXlg0ByCRCBzXmJI9MVh42yaNWYUiRGNzwEIjS/G
 P4f8tKbXlI0eeW1Yy67sWnIIf1GgbXLanS2upwr6QP4rM/ZCTRNN4G/59ETr1rQeH9E8yX79HwK
 P2fPHPYk5Tj803IkPL4AMEFBA7ouK+qMn5W0FmzD4GJDvf7NM46c=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Add the proper prefix for i915 dp-related functions.
This will avoid confusion when using them.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/i915/i915_dp.c                      | 57 +++++++++++++++++----------------
 lib/i915/i915_dp.h                      | 26 +++++++--------
 tests/intel/kms_dp_link_training.c      | 18 +++++------
 tests/intel/kms_dp_linktrain_fallback.c | 56 ++++++++++++++++----------------
 4 files changed, 79 insertions(+), 78 deletions(-)

diff --git a/lib/i915/i915_dp.c b/lib/i915/i915_dp.c
index 6cb212f20b1b..c5b9273ebafd 100644
--- a/lib/i915/i915_dp.c
+++ b/lib/i915/i915_dp.c
@@ -8,7 +8,7 @@
 #include "igt_core.h"
 
 /**
- * igt_parse_marked_value:
+ * i915_dp_parse_marked_value:
  * @buf: Buffer containing the content to parse
  * @marked_char: The character marking the value to parse
  * @result: Pointer to store the parsed value
@@ -17,7 +17,7 @@
  *
  * Returns: 0 on success, -1 on failure
  */
-static int igt_parse_marked_value(const char *buf, char marked_char, int *result)
+static int i915_dp_parse_marked_value(const char *buf, char marked_char, int *result)
 {
 	char *marked_ptr, *val_ptr;
 
@@ -38,13 +38,13 @@ static int igt_parse_marked_value(const char *buf, char marked_char, int *result
 }
 
  /**
-  * igt_get_current_link_rate:
+  * i915_dp_get_current_link_rate:
   * @drm_fd: A drm file descriptor
   * @output: Target output
   *
   * Returns: link_rate if set for output else -1
   */
-int igt_get_current_link_rate(int drm_fd, igt_output_t *output)
+int i915_dp_get_current_link_rate(int drm_fd, igt_output_t *output)
 {
 	char buf[512];
 	int res, ret;
@@ -54,19 +54,19 @@ int igt_get_current_link_rate(int drm_fd, igt_output_t *output)
 					      buf, sizeof(buf));
 	igt_assert_f(res == 0, "Unable to read %s/i915_dp_force_link_rate\n",
 		     output->name);
-	res = igt_parse_marked_value(buf, '*', &ret);
+	res = i915_dp_parse_marked_value(buf, '*', &ret);
 	igt_assert_f(res == 0, "Output %s not enabled\n", output->name);
 	return ret;
 }
 
 /**
- * igt_get_current_lane_count:
+ * i915_dp_get_current_lane_count:
  * @drm_fd: A drm file descriptor
  * @output: Target output
  *
  * Returns: lane_count if set for output else -1
  */
-int igt_get_current_lane_count(int drm_fd, igt_output_t *output)
+int i915_dp_get_current_lane_count(int drm_fd, igt_output_t *output)
 {
 	char buf[512];
 	int res, ret;
@@ -76,19 +76,19 @@ int igt_get_current_lane_count(int drm_fd, igt_output_t *output)
 					      buf, sizeof(buf));
 	igt_assert_f(res == 0, "Unable to read %s/i915_dp_force_lane_count\n",
 		     output->name);
-	res = igt_parse_marked_value(buf, '*', &ret);
+	res = i915_dp_parse_marked_value(buf, '*', &ret);
 	igt_assert_f(res == 0, "Output %s not enabled\n", output->name);
 	return ret;
 }
 
 /**
- * igt_get_max_link_rate:
+ * i915_dp_get_max_link_rate:
  * @drm_fd: A drm file descriptor
  * @output: Target output
  *
  * Returns: max_link_rate
  */
-int igt_get_max_link_rate(int drm_fd, igt_output_t *output)
+int i915_dp_get_max_link_rate(int drm_fd, igt_output_t *output)
 {
 	char buf[512];
 	int res, ret;
@@ -104,13 +104,13 @@ int igt_get_max_link_rate(int drm_fd, igt_output_t *output)
 }
 
 /**
- * igt_get_max_link_rate:
+ * i915_dp_get_max_lane_count:
  * @drm_fd: A drm file descriptor
  * @output: Target output
  *
  * Returns: max_link_rate
  */
-int igt_get_max_lane_count(int drm_fd, igt_output_t *output)
+int i915_dp_get_max_lane_count(int drm_fd, igt_output_t *output)
 {
 	char buf[512];
 	int res, ret;
@@ -126,14 +126,14 @@ int igt_get_max_lane_count(int drm_fd, igt_output_t *output)
 }
 
 /**
- * igt_force_link_retrain:
+ * i915_dp_force_link_retrain:
  * @drm_fd: A drm file descriptor
  * @output: Target output
  * @retrain_count: number of retraining required
  *
  * Force link retrain on the output.
  */
-void igt_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count)
+void i915_dp_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count)
 {
 	char value[2];
 	int res;
@@ -147,7 +147,7 @@ void igt_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count)
 }
 
 /**
- * igt_force_lt_failure:
+ * i915_dp_force_lt_failure:
  * @drm_fd: A drm file descriptor
  * @output: Target output
  * @failure_count: 1 for same link param and
@@ -157,7 +157,7 @@ void igt_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count)
  * @failure_count: 1 for retraining with same link params
  *		   2 for retraining with reduced link params
  */
-void igt_force_lt_failure(int drm_fd, igt_output_t *output, int failure_count)
+void i915_dp_force_lt_failure(int drm_fd, igt_output_t *output, int failure_count)
 {
 	char value[2];
 	int res;
@@ -171,13 +171,13 @@ void igt_force_lt_failure(int drm_fd, igt_output_t *output, int failure_count)
 }
 
 /**
- * igt_get_dp_link_retrain_disabled:
+ * i915_dp_get_link_retrain_disabled:
  * @drm_fd: A drm file descriptor
  * @output: Target output
  *
  * Returns: True if link retrain disabled, false otherwise
  */
-bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output)
+bool i915_dp_get_link_retrain_disabled(int drm_fd, igt_output_t *output)
 {
 	char buf[512];
 	int res;
@@ -191,6 +191,7 @@ bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output)
 }
 
 /**
+ * i915_dp_has_force_link_training_failure_debugfs:
  * Checks if the force link training failure debugfs
  * is available for a specific output.
  *
@@ -199,7 +200,7 @@ bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output)
  * Returns:
  *  true if the debugfs is available, false otherwise.
  */
-bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output)
+bool i915_dp_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output)
 {
 	char buf[512];
 	int res;
@@ -211,13 +212,13 @@ bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output
 }
 
 /**
- * igt_get_dp_pending_lt_failures:
+ * i915_dp_get_pending_lt_failures:
  * @drm_fd: A drm file descriptor
  * @output: Target output
  *
  * Returns: Number of pending link training failures.
  */
-int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output)
+int i915_dp_get_pending_lt_failures(int drm_fd, igt_output_t *output)
 {
 	char buf[512];
 	int res, ret;
@@ -232,13 +233,13 @@ int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output)
 }
 
 /**
- * igt_dp_pending_retrain:
+ * i915_dp_get_pending_retrain:
  * @drm_fd: A drm file descriptor
  * @output: Target output
  *
  * Returns: Number of pending link retrains.
  */
-int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output)
+int i915_dp_get_pending_retrain(int drm_fd, igt_output_t *output)
 {
 	char buf[512];
 	int res, ret;
@@ -253,14 +254,14 @@ int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output)
 }
 
 /**
- * igt_reset_link_params:
+ * i915_dp_reset_link_params:
  * @drm_fd: A drm file descriptor
  * @output: Target output
  *
  * Reset link rate and lane count to auto, also installs exit handler
  * to set link rate and lane count to auto on exit
  */
-void igt_reset_link_params(int drm_fd, igt_output_t *output)
+void i915_dp_reset_link_params(int drm_fd, igt_output_t *output)
 {
 	bool valid;
 	drmModeConnector *temp;
@@ -285,15 +286,15 @@ void igt_reset_link_params(int drm_fd, igt_output_t *output)
 }
 
 /**
- * igt_set_link_params:
+ * i915_dp_set_link_params:
  * @drm_fd: A drm file descriptor
  * @output: Target output
  *
  * set link rate and lane count to given value, also installs exit handler
  * to set link rate and lane count to auto on exit
  */
-void igt_set_link_params(int drm_fd, igt_output_t *output,
-			 char *link_rate, char *lane_count)
+void i915_dp_set_link_params(int drm_fd, igt_output_t *output,
+			     char *link_rate, char *lane_count)
 {
 	bool valid;
 	drmModeConnector *temp;
diff --git a/lib/i915/i915_dp.h b/lib/i915/i915_dp.h
index 2bcc9e2cb031..e4249d179543 100644
--- a/lib/i915/i915_dp.h
+++ b/lib/i915/i915_dp.h
@@ -5,18 +5,18 @@
 
 #include "igt_kms.h"
 
-int igt_get_current_link_rate(int drm_fd, igt_output_t *output);
-int igt_get_current_lane_count(int drm_fd, igt_output_t *output);
-int igt_get_max_link_rate(int drm_fd, igt_output_t *output);
-int igt_get_max_lane_count(int drm_fd, igt_output_t *output);
-void igt_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count);
-void igt_force_lt_failure(int drm_fd, igt_output_t *output, int failure_count);
-bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output);
-bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output);
-int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output);
-int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output);
-void igt_reset_link_params(int drm_fd, igt_output_t *output);
-void igt_set_link_params(int drm_fd, igt_output_t *output,
-			 char *link_rate, char *lane_count);
+int i915_dp_get_current_link_rate(int drm_fd, igt_output_t *output);
+int i915_dp_get_current_lane_count(int drm_fd, igt_output_t *output);
+int i915_dp_get_max_link_rate(int drm_fd, igt_output_t *output);
+int i915_dp_get_max_lane_count(int drm_fd, igt_output_t *output);
+void i915_dp_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count);
+void i915_dp_force_lt_failure(int drm_fd, igt_output_t *output, int failure_count);
+bool i915_dp_get_link_retrain_disabled(int drm_fd, igt_output_t *output);
+bool i915_dp_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output);
+int i915_dp_get_pending_lt_failures(int drm_fd, igt_output_t *output);
+int i915_dp_get_pending_retrain(int drm_fd, igt_output_t *output);
+void i915_dp_reset_link_params(int drm_fd, igt_output_t *output);
+void i915_dp_set_link_params(int drm_fd, igt_output_t *output,
+			     char *link_rate, char *lane_count);
 
 #endif
diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
index 70865f657562..f76b29c47a24 100644
--- a/tests/intel/kms_dp_link_training.c
+++ b/tests/intel/kms_dp_link_training.c
@@ -201,20 +201,20 @@ static bool run_link_rate_test(data_t *data, bool mst, bool uhbr)
 	char lane_str[32];
 
 	igt_display_reset(&data->display);
-	igt_reset_link_params(data->drm_fd, data->output);
+	i915_dp_reset_link_params(data->drm_fd, data->output);
 	do_modeset(data, mst);
 
 	/* Retrain at default/driver parameters */
-	igt_force_link_retrain(data->drm_fd, data->output, RETRAIN_COUNT);
+	i915_dp_force_link_retrain(data->drm_fd, data->output, RETRAIN_COUNT);
 	igt_assert_eq(check_condition_with_timeout(data->drm_fd, data->output,
-						   igt_get_dp_pending_retrain,
+						   i915_dp_get_pending_retrain,
 						   1.0, 20.0), 0);
 	assert_link_status_good(data, mst);
 
 	/* FIXME : Driver may lie max link rate or max lane count */
 	/* Read max_link_rate and max_lane_count */
-	max_link_rate = igt_get_max_link_rate(data->drm_fd, data->output);
-	max_lane_count = igt_get_max_lane_count(data->drm_fd, data->output);
+	max_link_rate = i915_dp_get_max_link_rate(data->drm_fd, data->output);
+	max_lane_count = i915_dp_get_max_lane_count(data->drm_fd, data->output);
 
 	/* Check sink supports uhbr or not */
 	is_uhbr_output = (max_link_rate >= UHBR_LINK_RATE);
@@ -233,14 +233,14 @@ static bool run_link_rate_test(data_t *data, bool mst, bool uhbr)
 		 data->output->name, rate_str, max_lane_count);
 
 	/* Force retrain at max link params */
-	igt_set_link_params(data->drm_fd, data->output, rate_str, lane_str);
-	igt_force_link_retrain(data->drm_fd, data->output, RETRAIN_COUNT);
+	i915_dp_set_link_params(data->drm_fd, data->output, rate_str, lane_str);
+	i915_dp_force_link_retrain(data->drm_fd, data->output, RETRAIN_COUNT);
 	igt_assert_eq(check_condition_with_timeout(data->drm_fd, data->output,
-						   igt_get_dp_pending_retrain,
+						   i915_dp_get_pending_retrain,
 						   1.0, 20.0), 0);
 	assert_link_status_good(data, mst);
 
-	current_link_rate = igt_get_current_link_rate(data->drm_fd, data->output);
+	current_link_rate = i915_dp_get_current_link_rate(data->drm_fd, data->output);
 	igt_info("Current link rate is %d\n", current_link_rate);
 	igt_assert_f(current_link_rate == max_link_rate,
 		     "Link training did not succeed at max link rate.\n");
diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index 9d7693dc3b7d..40bf0e668e9c 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -240,12 +240,12 @@ static bool force_failure_and_wait(data_t *data,
 				   double interval,
 				   double timeout)
 {
-	igt_force_lt_failure(data->drm_fd, output, failure_type);
-	igt_force_link_retrain(data->drm_fd, output, retrain_count);
+	i915_dp_force_lt_failure(data->drm_fd, output, failure_type);
+	i915_dp_force_link_retrain(data->drm_fd, output, retrain_count);
 
 	/* Wait until there's no pending retrain */
 	if (check_condition_with_timeout(data->drm_fd, output,
-					 igt_get_dp_pending_retrain,
+					 i915_dp_get_pending_retrain,
 					 interval, timeout)) {
 		igt_info("Timed out waiting for pending retrain\n");
 		return false;
@@ -253,7 +253,7 @@ static bool force_failure_and_wait(data_t *data,
 
 	/* Wait until there's no pending LT failures */
 	if (check_condition_with_timeout(data->drm_fd, output,
-					 igt_get_dp_pending_lt_failures,
+					 i915_dp_get_pending_lt_failures,
 					 interval, timeout)) {
 		igt_info("Timed out waiting for pending LT failures\n");
 		return false;
@@ -353,7 +353,7 @@ static void test_fallback(data_t *data, bool is_mst)
 	retries = SPURIOUS_HPD_RETRY;
 
 	igt_display_reset(&data->display);
-	igt_reset_link_params(data->drm_fd, data->output);
+	i915_dp_reset_link_params(data->drm_fd, data->output);
 	if (!setup_outputs(data, is_mst, outputs,
 			   &output_count, modes, fbs,
 			   primaries))
@@ -361,13 +361,13 @@ static void test_fallback(data_t *data, bool is_mst)
 
 	igt_info("Testing link training fallback on %s\n",
 		 igt_output_name(data->output));
-	max_link_rate = igt_get_max_link_rate(data->drm_fd, data->output);
-	max_lane_count = igt_get_max_lane_count(data->drm_fd, data->output);
-	prev_link_rate = igt_get_current_link_rate(data->drm_fd, data->output);
-	prev_lane_count = igt_get_current_lane_count(data->drm_fd, data->output);
+	max_link_rate = i915_dp_get_max_link_rate(data->drm_fd, data->output);
+	max_lane_count = i915_dp_get_max_lane_count(data->drm_fd, data->output);
+	prev_link_rate = i915_dp_get_current_link_rate(data->drm_fd, data->output);
+	prev_lane_count = i915_dp_get_current_lane_count(data->drm_fd, data->output);
 
-	while (!igt_get_dp_link_retrain_disabled(data->drm_fd,
-						 data->output)) {
+	while (!i915_dp_get_link_retrain_disabled(data->drm_fd,
+						  data->output)) {
 		igt_info("Current link rate: %d, Current lane count: %d\n",
 			 prev_link_rate,
 			 prev_lane_count);
@@ -379,8 +379,8 @@ static void test_fallback(data_t *data, bool is_mst)
 						    1.0, 20.0),
 						    "Link training failure steps timed out\n");
 
-		if (igt_get_dp_link_retrain_disabled(data->drm_fd,
-						     data->output)) {
+		if (i915_dp_get_link_retrain_disabled(data->drm_fd,
+						      data->output)) {
 			igt_reset_connectors();
 			return;
 		}
@@ -400,8 +400,8 @@ static void test_fallback(data_t *data, bool is_mst)
 							  fbs,
 							  primaries), "modeset failed\n");
 		igt_assert_eq(data->output->values[IGT_CONNECTOR_LINK_STATUS], DRM_MODE_LINK_STATUS_GOOD);
-		curr_link_rate = igt_get_current_link_rate(data->drm_fd, data->output);
-		curr_lane_count = igt_get_current_lane_count(data->drm_fd, data->output);
+		curr_link_rate = i915_dp_get_current_link_rate(data->drm_fd, data->output);
+		curr_lane_count = i915_dp_get_current_lane_count(data->drm_fd, data->output);
 
 		igt_debug("Fallback state: prev %dx%d, curr %dx%d, max %dx%d, retries=%u\n",
 			  prev_link_rate, prev_lane_count,
@@ -426,8 +426,8 @@ static bool run_lt_fallback_test(data_t *data)
 	for_each_connected_output(&data->display, output) {
 		data->output = output;
 
-		if (!igt_has_force_link_training_failure_debugfs(data->drm_fd,
-								 data->output)) {
+		if (!i915_dp_has_force_link_training_failure_debugfs(data->drm_fd,
+								     data->output)) {
 			igt_info("Output %s doesn't support forcing link training failure\n",
 				 igt_output_name(data->output));
 			continue;
@@ -470,8 +470,8 @@ static void test_dsc_sst_fallback(data_t *data)
 	data->pipe = PIPE_A;
 
 	igt_display_reset(&data->display);
-	igt_reset_link_params(data->drm_fd, data->output);
-	igt_force_link_retrain(data->drm_fd, data->output, RETRAIN_COUNT);
+	i915_dp_reset_link_params(data->drm_fd, data->output);
+	i915_dp_force_link_retrain(data->drm_fd, data->output, RETRAIN_COUNT);
 
 	/* Find a mode that doesn't require DSC initially */
 	for_each_connector_mode(data->output) {
@@ -507,8 +507,8 @@ static void test_dsc_sst_fallback(data_t *data)
 			igt_info("Found mode %dx%d@%d %s that doesn't need DSC with link rate %d and lane count %d\n",
 				 non_dsc_mode->hdisplay, non_dsc_mode->vdisplay,
 				 non_dsc_mode->vrefresh, non_dsc_mode->name,
-				 igt_get_current_link_rate(data->drm_fd, data->output),
-				 igt_get_current_lane_count(data->drm_fd, data->output));
+				 i915_dp_get_current_link_rate(data->drm_fd, data->output),
+				 i915_dp_get_current_lane_count(data->drm_fd, data->output));
 			non_dsc_mode_found = true;
 			break;
 		}
@@ -518,7 +518,7 @@ static void test_dsc_sst_fallback(data_t *data)
 		      igt_output_name(data->output));
 
 	/* Repeatedly force link failure until DSC is required (or link is disabled) */
-	while (!igt_get_dp_link_retrain_disabled(data->drm_fd, data->output)) {
+	while (!i915_dp_get_link_retrain_disabled(data->drm_fd, data->output)) {
 		mon = igt_watch_uevents();
 
 		igt_assert_f(force_failure_and_wait(data, data->output,
@@ -526,8 +526,8 @@ static void test_dsc_sst_fallback(data_t *data)
 						    RETRAIN_COUNT, 1.0, 20.0),
 			     "Forcing DSC fallback timed out\n");
 
-		if (igt_get_dp_link_retrain_disabled(data->drm_fd,
-						     data->output)) {
+		if (i915_dp_get_link_retrain_disabled(data->drm_fd,
+						      data->output)) {
 			igt_reset_connectors();
 			igt_flush_uevents(mon);
 			return;
@@ -551,8 +551,8 @@ static void test_dsc_sst_fallback(data_t *data)
 			igt_info("mode %dx%d@%d now requires DSC with link rate %d and lane count %d\n",
 				 mode_to_check->hdisplay, mode_to_check->vdisplay,
 				 mode_to_check->vrefresh,
-				 igt_get_current_link_rate(data->drm_fd, data->output),
-				 igt_get_current_lane_count(data->drm_fd, data->output));
+				 i915_dp_get_current_link_rate(data->drm_fd, data->output),
+				 i915_dp_get_current_lane_count(data->drm_fd, data->output));
 			igt_info("DSC fallback successful on %s\n",
 				 igt_output_name(data->output));
 			dsc_fallback_successful = true;
@@ -579,8 +579,8 @@ static bool run_dsc_sst_fallaback_test(data_t *data)
 	for_each_connected_output(&data->display, output) {
 		data->output = output;
 
-		if (!igt_has_force_link_training_failure_debugfs(data->drm_fd,
-								 data->output)) {
+		if (!i915_dp_has_force_link_training_failure_debugfs(data->drm_fd,
+								     data->output)) {
 			igt_info("Output %s doesn't support forcing link training.\n",
 				 igt_output_name(data->output));
 			continue;

-- 
2.52.0

