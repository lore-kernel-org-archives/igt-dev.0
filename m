Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F860F53D6D
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:24:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F1010E205;
	Mon, 16 Mar 2026 16:24:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="zY6zybxU";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27DFA10E31F
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 48047C55045;
 Mon, 16 Mar 2026 16:24:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A35725FC4A;
 Mon, 16 Mar 2026 16:23:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 95060103721F9; Mon, 16 Mar 2026 17:23:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678232; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=bDqBksgZfMQ1zc9MvVTSkvv6+SLrJXFdAppuK5wfMig=;
 b=zY6zybxUThKOy7qTRtZJjlNp3oB1n4YoMkahdqTGq3qKLBmAIrZh9XUYN5C1cOyRDvXTer
 CMOmn9nWGxc8jtSZeFUA1YXB6p3V20N4Fb94IMjAdVpHfr3aBGfob9JvWc/3YLpBrZMsqy
 f8FtamZdKmF4gZji1B2ASDLtfXRuV86mGolv2MFVrujUIimsCvzpMWTznCNV2+8rfVkTkD
 mpeDZcGk2npLV7QxLtkQJztwPSAAfpwpc+iB2WnKu6HjKGijB23m/5YtsrsTdSJkWQSpne
 Ji3YvVo+H341kNE32ZhgyHH4VC+Hrixj3wX3m4s2pKlLBDK3vMckhLSl3JgYvQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:18:02 +0100
Subject: [PATCH i-g-t v9 41/49] lib/i915/dp: Use igt_output_name instead of
 private field
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v9-41-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6380;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=JcFrRo1jhKbM/28Ln7YoAGDYGEaSCxcLo7cMYYYhKgA=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6PguOtlHKH+9X2NjcmXbugQXOwUu09Ov7nR
 KbW+Emb/neJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabgujxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOK4RRAAhMG5VkyW3oFL3E3NwQv28MAopQMeprQ
 YDY92/uvWDOV8Ss4DQKoGdoFaTuIyYPzOTqLv5JSRnPzckHiufv+ajQp/Byw3PwndEgm7aZE7jk
 TnX0T9L6G86CiAxwEZNmVG/f5B3rQri7DWnBdwYTkuYPZwFDX+lQJ5LQO8NkKdIboCoTLVoNT6o
 VrrA8UytHptXiVY3pruj2sucKdsSdbJANS3kimTuY4gA/ybPfczYNg7eNpU1qp0jgXXjlq05XVF
 KV/2ApGVVQk1G1E2TzrMR8P1lO/I+ivMdPSNOiYdBxvsn4fNUkWhwpWL390Wusm4gvUAdSX6A0Z
 50KRepDaaGoo6S+lJdFxUN94zczLvMMQZG1gYtMGpeyTra+o7zcRI7gU0XpeWhkmQ05dC3confh
 Ulh15HnyrRpHai2SlxB5UK0fQ0xKW8ldfLJnbZAM2ut4alwc7zNgdwV/ksIYsJcRGyp8FiFFhyx
 jy/fgAyumUGnrNFY8qAzcWAlMXQ8LVGhOrKwIIC0hYYmjfkSnd33Le4hb34IoIclFA48Uc8jWJ0
 4tjCiRj1T9Im2hm0uzyb6ukuNcxI+60aOnGHvvW8y5VhBx9fTjmMXSzzXHBmIOjiVUQHvAMS6Xz
 U2xMKnm36gygLKhrJNynNCefEntRp3wwuhl9sim5tDyFTQr55BO0=
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

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/i915/i915_dp.c | 43 ++++++++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/lib/i915/i915_dp.c b/lib/i915/i915_dp.c
index c2cddb955d75..e54058580ff2 100644
--- a/lib/i915/i915_dp.c
+++ b/lib/i915/i915_dp.c
@@ -35,6 +35,7 @@
 
 #include "i915_dp.h"
 #include "igt_core.h"
+#include "igt_kms.h"
 
 /**
  * i915_dp_parse_marked_value:
@@ -78,13 +79,13 @@ int i915_dp_get_current_link_rate(int drm_fd, igt_output_t *output)
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
 
@@ -100,13 +101,13 @@ int i915_dp_get_current_lane_count(int drm_fd, igt_output_t *output)
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
 
@@ -122,11 +123,11 @@ int i915_dp_get_max_link_rate(int drm_fd, igt_output_t *output)
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
@@ -146,11 +147,11 @@ int i915_dp_get_max_lane_count(int drm_fd, igt_output_t *output)
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
@@ -172,11 +173,11 @@ void i915_dp_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_co
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
@@ -196,11 +197,11 @@ void i915_dp_force_lt_failure(int drm_fd, igt_output_t *output, int failure_coun
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
@@ -215,11 +216,11 @@ bool i915_dp_get_link_retrain_disabled(int drm_fd, igt_output_t *output)
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
 
@@ -238,7 +239,7 @@ bool i915_dp_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *ou
 	char buf[512];
 	int res;
 
-	res = igt_debugfs_read_connector_file(drmfd, output->name,
+	res = igt_debugfs_read_connector_file(drmfd, igt_output_name(output),
 					      "i915_dp_link_retrain_disabled",
 					      buf, sizeof(buf));
 	return res == 0;
@@ -256,11 +257,11 @@ int i915_dp_get_pending_lt_failures(int drm_fd, igt_output_t *output)
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
@@ -280,11 +281,11 @@ int i915_dp_get_pending_retrain(int drm_fd, igt_output_t *output)
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

