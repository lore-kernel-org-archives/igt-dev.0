Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F0610F92E0
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:13:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9920B10ECC2;
	Tue, 31 Mar 2026 17:13:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="E/Dj3AIX";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC2310EC48
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 28D984E42889
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F354B6029D;
 Tue, 31 Mar 2026 17:11:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 076AD1045043E; 
 Tue, 31 Mar 2026 19:11:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977083; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Cop+2TXC2P4fplyZ9halK+m2khKfOSum4oQxNgNjuWo=;
 b=E/Dj3AIXnxzI0O5YYDr++ueuAh78A6EIKQXNzcMJ2pvnNDpBS8OIQmq6VJ8w2zlI4vw1oI
 ZMNs50tvclEXD/pfi0jMlvW7/SICouJaViCHeRptlnBF8ZXeeQfGagOawB6rUt/TQLwT3B
 rxTLZnNCO6ON/A68bFJ+sRDtnOnYTFvZ9LkhWxv/4IF7xCHcF9yVcheFWuujWgIw81lLqa
 yjPbkAC211IMdkeP7Fb4ApCemqdneYPdWFd9J18UjuzQ/8HNJIiUwB0qLZtadS6G5HK12G
 QS3LGxUh3rnwnVLzoKkrZQs/KAi2hy2w3dIrCjvF8tjN7zn5ULz2h889r8MgAA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:11:56 +0200
Subject: [PATCH i-g-t v10 39/49] lib/i915/dp: Add helper to get maximum
 supported rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-unigraf-integration-v10-39-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2281;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=SIaFkVKPppQGNRWEns8Gv1U0lRIHnNMr+xr94/2zDVk=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzABAUWuWK9LVefrn3RVbrlrKtru9cutlhUVFE
 jrqIhZZVoaJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAQBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIQPg//RCCRxrHZspN2pKZBS13IQx32LO7ss3g
 KeBEKw76Ndu0s7JvdzO8MqezJ/QbleTCQOoS/b2bsFLGm4LcM7yWJwkdDtC+Bwb1Lsji5+ibMpf
 oKnkbUsSHgcYucL7XdTHixm4xUYilkREdcN2rCNUtqqszzLZmgPafmHOIJl9jlesO/npLuh/YwP
 6KYHjXf2hsqqcPPmOkqw3v4xGluClJDAJpPL+Vyf8XLqmCgMLRsK6KcoKd+sQB2o3c0uqOjIEzD
 5PxO2ZLioiWeIq5va12NCi5uDX1/WZSUzm/i0htHhW7Fk1WzDpCQLnFVq5oXkqJaEPYnplqkdGM
 5XP6pVbPDVasaLbsSY0OlhgYfZeALDv1fzKPTWprwfYunRdMH1oxI8g9NpSAs3YautPOlKzmyjz
 qQL4RAmWHLuUNnoBJbWIBcCyWswU7F3bRDwEG3Gm8RzxPyUHGuCRtBa5n04XSRsnOsYsSjbzI5J
 5UlnIcwE8AHsYL51NIkyhW5VFNzYn3pO+qkSMpcG7xik7m+fXuyfmODAu3XBB34cAWCHhp7IoNa
 SfD8DuGKGbqIoXe5/71hfsvYu8o30dsiIuUZOxEa5Aed3vuSY2wBm7zBDS+ToiTHaJ8tkGGeQYS
 DTyQJifb/sXPjL/nVJnnDKtTqHHhhGCvCC+aOaStj7eUjlvb3V2w=
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

Some GPU can't reach all the DP rates. To avoid false positive during
testing with unigraf, add an helper to filter tests based on the maximum
supported rate of the current GPU.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/i915/i915_dp.c | 35 +++++++++++++++++++++++++++++++++++
 lib/i915/i915_dp.h |  1 +
 2 files changed, 36 insertions(+)

diff --git a/lib/i915/i915_dp.c b/lib/i915/i915_dp.c
index 48a69e9ff283..da3dd05c3293 100644
--- a/lib/i915/i915_dp.c
+++ b/lib/i915/i915_dp.c
@@ -28,7 +28,9 @@
  */
 
 #include <ctype.h>
+#include <errno.h>
 #include <stdio.h>
+#include <stdlib.h>
 #include <string.h>
 
 #include "i915_dp.h"
@@ -344,3 +346,36 @@ void i915_dp_set_link_params(int drm_fd, igt_output_t *output,
 	temp = drmModeGetConnector(drm_fd, output->config.connector->connector_id);
 	drmModeFreeConnector(temp);
 }
+
+/**
+ * i915_dp_get_max_supported_rate:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ *
+ * Returns: Max supported link rate available for output, else -1
+ */
+int i915_dp_get_max_supported_rate(int drm_fd, const igt_output_t *output)
+{
+	char buf[512];
+	int res, max_rate = -EINVAL;
+	char *token;
+
+	res = igt_debugfs_read_connector_file(drm_fd, igt_output_name(output),
+					      "i915_dp_force_link_rate",
+					      buf, sizeof(buf));
+	igt_assert_f(!res, "Unable to read %s/i915_dp_force_link_rate\n",
+		     igt_output_name(output));
+
+	token = strtok(buf, " ");
+	while (token) {
+		int rate;
+
+		errno = 0;
+		rate = strtol(token, NULL, 0);
+		if (!errno && rate > max_rate)
+			max_rate = rate;
+		token = strtok(NULL, " ");
+	}
+
+	return max_rate;
+}
diff --git a/lib/i915/i915_dp.h b/lib/i915/i915_dp.h
index e4249d179543..b13629147804 100644
--- a/lib/i915/i915_dp.h
+++ b/lib/i915/i915_dp.h
@@ -18,5 +18,6 @@ int i915_dp_get_pending_retrain(int drm_fd, igt_output_t *output);
 void i915_dp_reset_link_params(int drm_fd, igt_output_t *output);
 void i915_dp_set_link_params(int drm_fd, igt_output_t *output,
 			     char *link_rate, char *lane_count);
+int i915_dp_get_max_supported_rate(int drm_fd, const igt_output_t *output);
 
 #endif

-- 
2.52.0

