Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9DDFED3F0
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 17:00:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF2A10F642;
	Fri, 24 Apr 2026 17:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="iitZcnor";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC87B8961D
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:55:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B77AC1A3402;
 Fri, 24 Apr 2026 16:55:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 88B39604EB;
 Fri, 24 Apr 2026 16:55:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8BA1110720A38; 
 Fri, 24 Apr 2026 18:55:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1777049710; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ElbJlADapAj9DgTB0Qvmf4HksWBwp/LIVDtJq0CoPBM=;
 b=iitZcnorUCLTgxZYLDKROUCs4tD7x1NFL2Y7bMY5gVuFWRFDTG9l3mOMYKSZcZFmtpmcOp
 wWdYKJ9xYKMVz7tOld/7pkM/74Xv1b7UrJlrpicJAIT87e0+xReiV3DLBC1/H2jNHshNFC
 AsZF3OqNFx8piMC5qVESGpc+BMz6/RoacAG3ErdmuZpKpT6TO0PMX36A8zvsLR4IeXqM+B
 cPgebOZCHDEReFWQ4qS/SB3yYZvYpus44d5roM0ubq8jMthxq0D5vRLaZe69kMvtKHdBq7
 4nNNDFu2nMSmPGN82MByeTVKbk0gPKONSDM6IDFGPezftL37UK7wfEmGLGCPMA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 24 Apr 2026 18:53:16 +0200
Subject: [PATCH i-g-t v11 41/49] lib/i915/dp: Use igt_output_name instead
 of private field
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-unigraf-integration-v11-41-0c5f5346ae60@bootlin.com>
References: <20260424-unigraf-integration-v11-0-0c5f5346ae60@bootlin.com>
In-Reply-To: <20260424-unigraf-integration-v11-0-0c5f5346ae60@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
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
2.54.0

