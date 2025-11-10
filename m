Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F752CD13D3
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:40:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B8510E3BE;
	Mon, 10 Nov 2025 13:40:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="POkSOl2O";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9AD510E3BB
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:40:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 4A5A6C108F1;
 Mon, 10 Nov 2025 13:39:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B8CFD606F5;
 Mon, 10 Nov 2025 13:40:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DD41E1037191B; Mon, 10 Nov 2025 14:40:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762782006; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=KjaYhpL3yK8ttXg/mN4f638YporHdIIQABCqptfjKzY=;
 b=POkSOl2OP4JbKvNZG+sRsJoRT47FrcHpReHK5RlcyT1GijurlRGAq1nLQjHm1TNVGwSA/U
 CgxaEmMwUOWcDHP9rAh0kbGDFS6NI7n7NTgYdLhBkMHNOaf27ujtDJvkSAQnHx+dfdUR18
 HBDGCg+Db0jZ9leQWwwRYJbsiBoxHsfI2BcDvmHNxNOoS1OSyeqtyKB/Br0bS7urN06lYX
 BkzY2cXXjXWjsYBralcSWVfqxXagCV9TYCIjxs/FxUQZrSB1LAWmozYnZokxOmRVi1YMgQ
 J+R6KXwvYP06Mem9va+5Sic5uoVRpaOAD+IcBETkYw2BlFq077uMGAF8Dl0TNQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:42 +0000
Subject: [PATCH i-g-t v4 40/46] lib/i915/dp: Rename functions to avoid
 confusion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-40-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=19886;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=PyL0CiackZDKxmB4BX2qtIrC99eq26c99+OnROHmPZs=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesTjGDpjSTolx8DCF8tUFwFLmJkRvnOFRfNf
 EmgpRjGICyJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrEwAKCRAgrS7GWxAs
 4k+YD/0UwmUQTpSiwDDXRXpYUrMlHt4XzUOJH+aqjZsney+3vDgcKVr4isNBeFj8huhyMkIoj/S
 HiIBoMIDORZJHZrKhZgMdcVhoalVsweKtaF+aR8ls1XuLh76M5iqMVidmxnFmkoujNdDXxKOwg2
 lNNzEoe+1NVWWn9ZbWTg3JTkt2pOQH6VeBL6yCMIXkmPQahTg0pu5Kj3PgkW5RrK0399rcU2HEl
 pGU0zFqib6y92sra1wBoXsZSGadmAsxUDYq0POoRAXw0MJQrtWI2K45/F/qSLTJk3BDOGqcBFfF
 LdKIkWXJcG1Il49Wng23/Llr0rBOVOE4swC41Zlgh1M/+nvo/qGqd4rmgHDMJjpMDk5w7/tHi0J
 +cptZk+4A17SfrulgUEUqnY3JHgdcddrarQqTRlPu31h8T3fDqns71LoIi1ZpcI1Bqx0EqzihXe
 0PkW2G18+TAPTgAmLR0ERy2VDMTqfzX9SQqdaDbDDw2et/pzUdZTvbTIquO7P0UvuzRhKWbgPK5
 2fIXbf9tVA/yhg/f//ZNgOaeEFKVXa7AfXJjUO3Y6vtkNEldIKjlktJxp0gGyN5bb1yNnntNKBp
 C4i0EmQT0UPx/qlsB6tIj0ei4wmo1AUw69se3Qhk5FvAUoQkxENiSxRy6rcdKualGYiZ92Rr6sV
 iLvk776Bb8JrhHA==
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
index 3ca596f78e93..65057cff4ff4 100644
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
index ddc98b7f570b..dec8dcb84d9b 100644
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
index 80b113885e47..d69c1f2b606b 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -238,12 +238,12 @@ static bool force_failure_and_wait(data_t *data,
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
@@ -251,7 +251,7 @@ static bool force_failure_and_wait(data_t *data,
 
 	/* Wait until there's no pending LT failures */
 	if (check_condition_with_timeout(data->drm_fd, output,
-					 igt_get_dp_pending_lt_failures,
+					 i915_dp_get_pending_lt_failures,
 					 interval, timeout)) {
 		igt_info("Timed out waiting for pending LT failures\n");
 		return false;
@@ -351,7 +351,7 @@ static void test_fallback(data_t *data, bool is_mst)
 	retries = SPURIOUS_HPD_RETRY;
 
 	igt_display_reset(&data->display);
-	igt_reset_link_params(data->drm_fd, data->output);
+	i915_dp_reset_link_params(data->drm_fd, data->output);
 	if (!setup_outputs(data, is_mst, outputs,
 			   &output_count, modes, fbs,
 			   primaries))
@@ -359,13 +359,13 @@ static void test_fallback(data_t *data, bool is_mst)
 
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
@@ -377,8 +377,8 @@ static void test_fallback(data_t *data, bool is_mst)
 						    1.0, 20.0),
 						    "Link training failure steps timed out\n");
 
-		if (igt_get_dp_link_retrain_disabled(data->drm_fd,
-						     data->output)) {
+		if (i915_dp_get_link_retrain_disabled(data->drm_fd,
+						      data->output)) {
 			igt_reset_connectors();
 			return;
 		}
@@ -398,8 +398,8 @@ static void test_fallback(data_t *data, bool is_mst)
 							  fbs,
 							  primaries), "modeset failed\n");
 		igt_assert_eq(data->output->values[IGT_CONNECTOR_LINK_STATUS], DRM_MODE_LINK_STATUS_GOOD);
-		curr_link_rate = igt_get_current_link_rate(data->drm_fd, data->output);
-		curr_lane_count = igt_get_current_lane_count(data->drm_fd, data->output);
+		curr_link_rate = i915_dp_get_current_link_rate(data->drm_fd, data->output);
+		curr_lane_count = i915_dp_get_current_lane_count(data->drm_fd, data->output);
 
 		igt_assert_f((curr_link_rate < prev_link_rate ||
 			     curr_lane_count < prev_lane_count) ||
@@ -419,8 +419,8 @@ static bool run_lt_fallback_test(data_t *data)
 	for_each_connected_output(&data->display, output) {
 		data->output = output;
 
-		if (!igt_has_force_link_training_failure_debugfs(data->drm_fd,
-								 data->output)) {
+		if (!i915_dp_has_force_link_training_failure_debugfs(data->drm_fd,
+								     data->output)) {
 			igt_info("Output %s doesn't support forcing link training failure\n",
 				 igt_output_name(data->output));
 			continue;
@@ -463,8 +463,8 @@ static void test_dsc_sst_fallback(data_t *data)
 	data->pipe = PIPE_A;
 
 	igt_display_reset(&data->display);
-	igt_reset_link_params(data->drm_fd, data->output);
-	igt_force_link_retrain(data->drm_fd, data->output, RETRAIN_COUNT);
+	i915_dp_reset_link_params(data->drm_fd, data->output);
+	i915_dp_force_link_retrain(data->drm_fd, data->output, RETRAIN_COUNT);
 
 	/* Find a mode that doesn't require DSC initially */
 	for_each_connector_mode(data->output) {
@@ -499,8 +499,8 @@ static void test_dsc_sst_fallback(data_t *data)
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
@@ -510,7 +510,7 @@ static void test_dsc_sst_fallback(data_t *data)
 		      igt_output_name(data->output));
 
 	/* Repeatedly force link failure until DSC is required (or link is disabled) */
-	while (!igt_get_dp_link_retrain_disabled(data->drm_fd, data->output)) {
+	while (!i915_dp_get_link_retrain_disabled(data->drm_fd, data->output)) {
 		mon = igt_watch_uevents();
 
 		igt_assert_f(force_failure_and_wait(data, data->output,
@@ -518,8 +518,8 @@ static void test_dsc_sst_fallback(data_t *data)
 						    RETRAIN_COUNT, 1.0, 20.0),
 			     "Forcing DSC fallback timed out\n");
 
-		if (igt_get_dp_link_retrain_disabled(data->drm_fd,
-						     data->output)) {
+		if (i915_dp_get_link_retrain_disabled(data->drm_fd,
+						      data->output)) {
 			igt_reset_connectors();
 			igt_flush_uevents(mon);
 			return;
@@ -543,8 +543,8 @@ static void test_dsc_sst_fallback(data_t *data)
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
@@ -571,8 +571,8 @@ static bool run_dsc_sst_fallaback_test(data_t *data)
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
2.51.0

