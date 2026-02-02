Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4765AE7DEF1
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:33:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E978E10E4F6;
	Mon,  2 Feb 2026 14:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="1KBomoyX";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD3F10E4F1
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:33:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 569CA4E423C3;
 Mon,  2 Feb 2026 14:33:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2F18260767;
 Mon,  2 Feb 2026 14:33:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0A8B9119A8910; Mon,  2 Feb 2026 15:33:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042782; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=oRf0T3jpJ8GxaS0LXNHl2XxRwvECgngdPUFMPO0ONnY=;
 b=1KBomoyXfLfh83K80CeiCg09Rz8fXIw7Vn1Op+Ir36sV7dOZC9BIyauUNPYLQTUNT2eNZI
 7Wdw5fJVAPFcxD3L4jXHFjWaEeuv039/kl76bs8IebLg3p39Zg6AdFIM7k6WPUUfOr+Aoi
 PMPZ75EKjpSBPwfeJTl6VbXGgbWgBwZdgStj3P0xLYtDLomSHQK9Ba6YmY+gfxcjcnbsfe
 TmkFf4s63nndvOAyVS0uPinjlgsA4fMQx/wRWlfHbi9mFEdZT+GtuI4BGByxZlB5K9x6GP
 NoMgVGCZPlToeqs2aflQAfaLMDCukqGIXDeWhoWxlYiL6KWgSRqvFptNLau8kg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:33:19 +0100
Subject: [PATCH i-g-t v6 40/48] lib/i915/dp: Use igt_output_name instead of
 private field
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-40-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6318;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Gi25dMbXdkUAfOTKSA6Ynb7fRhZiGeRZQPj7i+CptB8=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWUaim7Ftd0XubzSmDP8tg2SxmYw6017Nh/f
 f0FJ1Xw766JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1lBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJsCQ/9GCoQgEmvlKuzsvy/ObVY4DVH9nvQ1x7
 6QLo4ceSovh1DKIU9v1S3d49spWqQOUi9KFWYH6wn9KubTX8RSMBLuGgdwimz3/Adom9ek/lcxV
 QfO5i2NSTKihu01U0fW29Y6aKKxb2HR1LLdXPDUfBt1+RK/QCSZLtxX3toVHYVm4+L8RY9jgAYX
 12qHbdJvnd+jBaJHPZ44UbduPWacHeGDCJ18HIlNANJJ1qsIZA/VS6hABrOKaGhSfCeq+MmCsEr
 +Zq7iVo986ttfmA+gQbEeB4T6/qs9moBfgV4EtiAKWQFa0vJDVQgQAuD3QCKXgRDGWQpCwF3DIg
 2n/C7FNdix7n0fUEDA/bwX4naXt1Fhe47/CTVs0DktngM2J3TUHrrx/ZBuN9lrEgCLewWlHa7KP
 jpWgdAEc5Eluuzw0JIrAJQ3sgU1Cy8m70KcRey4lwj/ey8R4PJYAr7OcuB1+8zzhf/eHFcc3W0n
 S24knqFcR2SnXPMAM4T26zfbRSAy+98Ay0HcxidqPZWLZz67v3jisG5hwOBlMKpcXsCZ34kPCmC
 fX4plYOnrZho00FeFHXVYvBqAb+06GZBqfnPrldo+q+fRqeuXoQYHyYaMzKvcFs1c11WWbH/1U4
 TacdmHCqY3A4X80u9xSsGkl6jPYvSLakzL1VZSTggWyqqPcpmVNY=
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

output->name is a private field, use the common helper igt_output_name
instead of the field directly.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/i915/i915_dp.c | 43 ++++++++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/lib/i915/i915_dp.c b/lib/i915/i915_dp.c
index 53caf3fa7716..3109d55e0e37 100644
--- a/lib/i915/i915_dp.c
+++ b/lib/i915/i915_dp.c
@@ -8,6 +8,7 @@
 
 #include "i915_dp.h"
 #include "igt_core.h"
+#include "igt_kms.h"
 
 /**
  * i915_dp_parse_marked_value:
@@ -51,13 +52,13 @@ int i915_dp_get_current_link_rate(int drm_fd, igt_output_t *output)
 	char buf[512];
 	int res, ret;
 
-	res = igt_debugfs_read_connector_file(drm_fd, output->name,
+	res = igt_debugfs_read_connector_file(drm_fd, igt_output_name(output),
 					      "i915_dp_force_link_rate",
 					      buf, sizeof(buf));
 	igt_assert_f(res == 0, "Unable to read %s/i915_dp_force_link_rate\n",
-		     output->name);
+		     igt_output_name(output));
 	res = i915_dp_parse_marked_value(buf, '*', &ret);
-	igt_assert_f(res == 0, "Output %s not enabled\n", output->name);
+	igt_assert_f(res == 0, "Output %s not enabled\n", igt_output_name(output));
 	return ret;
 }
 
@@ -73,13 +74,13 @@ int i915_dp_get_current_lane_count(int drm_fd, igt_output_t *output)
 	char buf[512];
 	int res, ret;
 
-	res = igt_debugfs_read_connector_file(drm_fd, output->name,
+	res = igt_debugfs_read_connector_file(drm_fd, igt_output_name(output),
 					      "i915_dp_force_lane_count",
 					      buf, sizeof(buf));
 	igt_assert_f(res == 0, "Unable to read %s/i915_dp_force_lane_count\n",
-		     output->name);
+		     igt_output_name(output));
 	res = i915_dp_parse_marked_value(buf, '*', &ret);
-	igt_assert_f(res == 0, "Output %s not enabled\n", output->name);
+	igt_assert_f(res == 0, "Output %s not enabled\n", igt_output_name(output));
 	return ret;
 }
 
@@ -95,11 +96,11 @@ int i915_dp_get_max_link_rate(int drm_fd, igt_output_t *output)
 	char buf[512];
 	int res, ret;
 
-	res = igt_debugfs_read_connector_file(drm_fd, output->name,
+	res = igt_debugfs_read_connector_file(drm_fd, igt_output_name(output),
 					      "i915_dp_max_link_rate",
 					      buf, sizeof(buf));
 	igt_assert_f(res == 0, "Unable to read %s/i915_dp_max_link_rate\n",
-		     output->name);
+		     igt_output_name(output));
 
 	igt_assert_f(sscanf(buf, "%d", &ret) == 1,
 		     "Failed to parse max link rate from %s\n", buf);
@@ -119,11 +120,11 @@ int i915_dp_get_max_lane_count(int drm_fd, igt_output_t *output)
 	char buf[512];
 	int res, ret;
 
-	res = igt_debugfs_read_connector_file(drm_fd, output->name,
+	res = igt_debugfs_read_connector_file(drm_fd, igt_output_name(output),
 					      "i915_dp_max_lane_count",
 					      buf, sizeof(buf));
 	igt_assert_f(res == 0, "Unable to read %s/i915_dp_max_lane_count\n",
-		     output->name);
+		     igt_output_name(output));
 
 	igt_assert_f(sscanf(buf, "%d", &ret) == 1,
 		     "Failed to parse max lane count from %s\n", buf);
@@ -145,11 +146,11 @@ void i915_dp_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_co
 	int res;
 
 	snprintf(value, sizeof(value), "%d", retrain_count);
-	res = igt_debugfs_write_connector_file(drm_fd, output->name,
+	res = igt_debugfs_write_connector_file(drm_fd, igt_output_name(output),
 					       "i915_dp_force_link_retrain",
 					       value, strlen(value));
 	igt_assert_f(res == 0, "Unable to write to %s/i915_dp_force_link_retrain\n",
-		     output->name);
+		     igt_output_name(output));
 }
 
 /**
@@ -169,11 +170,11 @@ void i915_dp_force_lt_failure(int drm_fd, igt_output_t *output, int failure_coun
 	int res;
 
 	snprintf(value, sizeof(value), "%d", failure_count);
-	res = igt_debugfs_write_connector_file(drm_fd, output->name,
+	res = igt_debugfs_write_connector_file(drm_fd, igt_output_name(output),
 					       "i915_dp_force_link_training_failure",
 					       value, strlen(value));
 	igt_assert_f(res == 0, "Unable to write to %s/i915_dp_force_link_training_failure\n",
-		     output->name);
+		     igt_output_name(output));
 }
 
 /**
@@ -188,11 +189,11 @@ bool i915_dp_get_link_retrain_disabled(int drm_fd, igt_output_t *output)
 	char buf[512];
 	int res;
 
-	res = igt_debugfs_read_connector_file(drm_fd, output->name,
+	res = igt_debugfs_read_connector_file(drm_fd, igt_output_name(output),
 					      "i915_dp_link_retrain_disabled",
 					      buf, sizeof(buf));
 	igt_assert_f(res == 0, "Unable to read %s/i915_dp_link_retrain_disabled\n",
-		     output->name);
+		     igt_output_name(output));
 	return strstr(buf, "yes");
 }
 
@@ -211,7 +212,7 @@ bool i915_dp_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *ou
 	char buf[512];
 	int res;
 
-	res = igt_debugfs_read_connector_file(drmfd, output->name,
+	res = igt_debugfs_read_connector_file(drmfd, igt_output_name(output),
 					      "i915_dp_link_retrain_disabled",
 					      buf, sizeof(buf));
 	return res == 0;
@@ -229,11 +230,11 @@ int i915_dp_get_pending_lt_failures(int drm_fd, igt_output_t *output)
 	char buf[512];
 	int res, ret;
 
-	res = igt_debugfs_read_connector_file(drm_fd, output->name,
+	res = igt_debugfs_read_connector_file(drm_fd, igt_output_name(output),
 					      "i915_dp_force_link_training_failure",
 					      buf, sizeof(buf));
 	igt_assert_f(res == 0, "Unable to read %s/i915_dp_force_link_training_failure\n",
-		     output->name);
+		     igt_output_name(output));
 
 	igt_assert_f(sscanf(buf, "%d", &ret) == 1,
 		     "Failed to parse pending link training failures from %s\n", buf);
@@ -253,11 +254,11 @@ int i915_dp_get_pending_retrain(int drm_fd, igt_output_t *output)
 	char buf[512];
 	int res, ret;
 
-	res = igt_debugfs_read_connector_file(drm_fd, output->name,
+	res = igt_debugfs_read_connector_file(drm_fd, igt_output_name(output),
 					      "i915_dp_force_link_retrain",
 					      buf, sizeof(buf));
 	igt_assert_f(res == 0, "Unable to read %s/i915_dp_force_link_retrain\n",
-		     output->name);
+		     igt_output_name(output));
 
 	igt_assert_f(sscanf(buf, "%d", &ret) == 1,
 		     "Failed to parse pending link retrains from %s\n", buf);

-- 
2.52.0

