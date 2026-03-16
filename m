Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C33C2F53D6D
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:26:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 789D810E29A;
	Mon, 16 Mar 2026 16:26:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Q5hYO452";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5408C10E5C1
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 57AFFC55045;
 Mon, 16 Mar 2026 16:24:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B207D5FC4A;
 Mon, 16 Mar 2026 16:23:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 66E6710372213; Mon, 16 Mar 2026 17:23:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678229; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=2co5GxaR8oI56uC7FpjOO9DDeO39VYTrHPkZxZsT1kg=;
 b=Q5hYO452Cydb+VooP/Bu0Fu8OLEV8mAUCCrmoR9AzY3zTFV5F8PIGm3sVMY1rGCnLPrsdM
 AbYBNi+vHM+bJVudkbnL0RtC+J05sa2RGgA55vr65Eb/Osxfqpa4IHrEfnKMB4BkkiIdQe
 W9jCz+6pGrfohdKgw+KHg2fW596nEXWruRchW1hNnxs+mXkSbZ/QzmntAvwKQJl+JeUoE9
 C76ZdwdukuF4A3YkqEVRNfSilyTo85sBc4d2Uh7wiMmvO3QLzjqoNcr94xm64O72+9Dzle
 6Ww0FvZIDF4a2+EBxBUac1Itxmr+EywPs8snBLuekdS/QVSy2x0St+RaMkMcZA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:17:59 +0100
Subject: [PATCH i-g-t v9 38/49] lib/i915/dp: Rename functions to avoid
 confusion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v9-38-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=19990;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Ja1NB7wjcKZG/fdp9fKspOkpshVFoBk5cpqwhR1Suw8=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6O/BngE0/8HttPyCAs+niya3c1evGc+AROC
 RkXfCrmLqGJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabgujhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIGIw//cnYeV4KU2eRKz6R3biyYamNIlM8Kr30
 g7B5b2mRRLyxaDbZ3Sa3UPWfROUdUAD8UbmBxW3W2NpeeRKE4vyVdhAkYnv5UHoRnPz+P2zONob
 9cRfDw0I/2LnZdFOe3ETepZCaUpAtec21VdKFhLkP/TybO/2Uxt1IbbFzCXJTtZy+2/gd5wHTpo
 ntLhKOV8vPg7iM/eDzF47lWdLtjOoQ1B3xZ3qitgtvVjmmAZYPyAJ/z4gyIqQk+1HOOn5ELGHkN
 bkAmKARDdJQtVEwnKRg68KzDVogFkte9K24Zy/yOuazzf6E0uRgupPi0f0GincUhVmfhzJDBCnU
 6p9IKLTCKfxUZVAm+grMbAK0M9xftW4ksk4wMX8q9aBmxlpbaN9GzJWxNdtcjHmGQlVhL69tYbL
 zJzGC6gDAI0N9keI0WcPFv8rPYzquRt0yLzXVDRks5xuWjWyROxhZrJmwrnojiYho2jm9Z2yHL7
 CSTiVcPfTedctQ9254Q5O7/MXXSEyHelBpBBwMyM1xjFrehBE3XPMdD0tmZQqNqF58X2yrgoxbn
 4111E6syGsW4ataYIQY8dO1bX7LqPw+wooka1Lqcg1xD6VSOOyMys+BBIV620tVzrQO6qJU/79K
 JZfosYVky0cwx+VFlXIuepcUMejodLd2uhgu3QhMOYhhp2P5Khns=
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

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/i915/i915_dp.c                      | 57 +++++++++++++++++----------------
 lib/i915/i915_dp.h                      | 26 +++++++--------
 tests/intel/kms_dp_link_training.c      | 18 +++++------
 tests/intel/kms_dp_linktrain_fallback.c | 56 ++++++++++++++++----------------
 4 files changed, 79 insertions(+), 78 deletions(-)

diff --git a/lib/i915/i915_dp.c b/lib/i915/i915_dp.c
index 024fe3b00210..48a69e9ff283 100644
--- a/lib/i915/i915_dp.c
+++ b/lib/i915/i915_dp.c
@@ -35,7 +35,7 @@
 #include "igt_core.h"
 
 /**
- * igt_parse_marked_value:
+ * i915_dp_parse_marked_value:
  * @buf: Buffer containing the content to parse
  * @marked_char: The character marking the value to parse
  * @result: Pointer to store the parsed value
@@ -44,7 +44,7 @@
  *
  * Returns: 0 on success, -1 on failure
  */
-static int igt_parse_marked_value(const char *buf, char marked_char, int *result)
+static int i915_dp_parse_marked_value(const char *buf, char marked_char, int *result)
 {
 	char *marked_ptr, *val_ptr;
 
@@ -65,13 +65,13 @@ static int igt_parse_marked_value(const char *buf, char marked_char, int *result
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
@@ -81,19 +81,19 @@ int igt_get_current_link_rate(int drm_fd, igt_output_t *output)
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
@@ -103,19 +103,19 @@ int igt_get_current_lane_count(int drm_fd, igt_output_t *output)
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
@@ -131,13 +131,13 @@ int igt_get_max_link_rate(int drm_fd, igt_output_t *output)
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
@@ -153,14 +153,14 @@ int igt_get_max_lane_count(int drm_fd, igt_output_t *output)
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
@@ -174,7 +174,7 @@ void igt_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count)
 }
 
 /**
- * igt_force_lt_failure:
+ * i915_dp_force_lt_failure:
  * @drm_fd: A drm file descriptor
  * @output: Target output
  * @failure_count: 1 for same link param and
@@ -184,7 +184,7 @@ void igt_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count)
  * @failure_count: 1 for retraining with same link params
  *		   2 for retraining with reduced link params
  */
-void igt_force_lt_failure(int drm_fd, igt_output_t *output, int failure_count)
+void i915_dp_force_lt_failure(int drm_fd, igt_output_t *output, int failure_count)
 {
 	char value[2];
 	int res;
@@ -198,13 +198,13 @@ void igt_force_lt_failure(int drm_fd, igt_output_t *output, int failure_count)
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
@@ -218,6 +218,7 @@ bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output)
 }
 
 /**
+ * i915_dp_has_force_link_training_failure_debugfs:
  * Checks if the force link training failure debugfs
  * is available for a specific output.
  *
@@ -226,7 +227,7 @@ bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output)
  * Returns:
  *  true if the debugfs is available, false otherwise.
  */
-bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output)
+bool i915_dp_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output)
 {
 	char buf[512];
 	int res;
@@ -238,13 +239,13 @@ bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output
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
@@ -259,13 +260,13 @@ int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output)
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
@@ -280,14 +281,14 @@ int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output)
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
@@ -312,15 +313,15 @@ void igt_reset_link_params(int drm_fd, igt_output_t *output)
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
index 57d31934a7ac..2e4bed9c4626 100644
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
index bb779b52564b..68a79b117cd2 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -242,12 +242,12 @@ static bool force_failure_and_wait(data_t *data,
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
@@ -255,7 +255,7 @@ static bool force_failure_and_wait(data_t *data,
 
 	/* Wait until there's no pending LT failures */
 	if (check_condition_with_timeout(data->drm_fd, output,
-					 igt_get_dp_pending_lt_failures,
+					 i915_dp_get_pending_lt_failures,
 					 interval, timeout)) {
 		igt_info("Timed out waiting for pending LT failures\n");
 		return false;
@@ -355,7 +355,7 @@ static void test_fallback(data_t *data, bool is_mst)
 	retries = SPURIOUS_HPD_RETRY;
 
 	igt_display_reset(&data->display);
-	igt_reset_link_params(data->drm_fd, data->output);
+	i915_dp_reset_link_params(data->drm_fd, data->output);
 	if (!setup_outputs(data, is_mst, outputs,
 			   &output_count, modes, fbs,
 			   primaries))
@@ -363,13 +363,13 @@ static void test_fallback(data_t *data, bool is_mst)
 
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
@@ -381,8 +381,8 @@ static void test_fallback(data_t *data, bool is_mst)
 						    1.0, 20.0),
 						    "Link training failure steps timed out\n");
 
-		if (igt_get_dp_link_retrain_disabled(data->drm_fd,
-						     data->output)) {
+		if (i915_dp_get_link_retrain_disabled(data->drm_fd,
+						      data->output)) {
 			igt_reset_connectors();
 			return;
 		}
@@ -402,8 +402,8 @@ static void test_fallback(data_t *data, bool is_mst)
 							  fbs,
 							  primaries), "modeset failed\n");
 		igt_assert_eq(data->output->values[IGT_CONNECTOR_LINK_STATUS], DRM_MODE_LINK_STATUS_GOOD);
-		curr_link_rate = igt_get_current_link_rate(data->drm_fd, data->output);
-		curr_lane_count = igt_get_current_lane_count(data->drm_fd, data->output);
+		curr_link_rate = i915_dp_get_current_link_rate(data->drm_fd, data->output);
+		curr_lane_count = i915_dp_get_current_lane_count(data->drm_fd, data->output);
 
 		igt_debug("Fallback state: prev %dx%d, curr %dx%d, max %dx%d, retries=%u\n",
 			  prev_link_rate, prev_lane_count,
@@ -428,8 +428,8 @@ static bool run_lt_fallback_test(data_t *data)
 	for_each_connected_output(&data->display, output) {
 		data->output = output;
 
-		if (!igt_has_force_link_training_failure_debugfs(data->drm_fd,
-								 data->output)) {
+		if (!i915_dp_has_force_link_training_failure_debugfs(data->drm_fd,
+								     data->output)) {
 			igt_info("Output %s doesn't support forcing link training failure\n",
 				 igt_output_name(data->output));
 			continue;
@@ -472,8 +472,8 @@ static void test_dsc_sst_fallback(data_t *data)
 	data->crtc = igt_first_crtc(&data->display);
 
 	igt_display_reset(&data->display);
-	igt_reset_link_params(data->drm_fd, data->output);
-	igt_force_link_retrain(data->drm_fd, data->output, RETRAIN_COUNT);
+	i915_dp_reset_link_params(data->drm_fd, data->output);
+	i915_dp_force_link_retrain(data->drm_fd, data->output, RETRAIN_COUNT);
 
 	/* Find a mode that doesn't require DSC initially */
 	for_each_connector_mode(data->output) {
@@ -509,8 +509,8 @@ static void test_dsc_sst_fallback(data_t *data)
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
@@ -520,7 +520,7 @@ static void test_dsc_sst_fallback(data_t *data)
 		      igt_output_name(data->output));
 
 	/* Repeatedly force link failure until DSC is required (or link is disabled) */
-	while (!igt_get_dp_link_retrain_disabled(data->drm_fd, data->output)) {
+	while (!i915_dp_get_link_retrain_disabled(data->drm_fd, data->output)) {
 		mon = igt_watch_uevents();
 
 		igt_assert_f(force_failure_and_wait(data, data->output,
@@ -528,8 +528,8 @@ static void test_dsc_sst_fallback(data_t *data)
 						    RETRAIN_COUNT, 1.0, 20.0),
 			     "Forcing DSC fallback timed out\n");
 
-		if (igt_get_dp_link_retrain_disabled(data->drm_fd,
-						     data->output)) {
+		if (i915_dp_get_link_retrain_disabled(data->drm_fd,
+						      data->output)) {
 			igt_reset_connectors();
 			igt_flush_uevents(mon);
 			return;
@@ -553,8 +553,8 @@ static void test_dsc_sst_fallback(data_t *data)
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
@@ -581,8 +581,8 @@ static bool run_dsc_sst_fallaback_test(data_t *data)
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

