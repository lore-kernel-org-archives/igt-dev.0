Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77859F46449
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 10:26:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2951410E25E;
	Mon, 16 Mar 2026 10:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="xqAsmGdw";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6DA810E25A
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:24:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id BAF761A2E28;
 Mon, 16 Mar 2026 10:24:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 929B15FC4A;
 Mon, 16 Mar 2026 10:24:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B79D210369F2E; Mon, 16 Mar 2026 11:24:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773656662; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Cop+2TXC2P4fplyZ9halK+m2khKfOSum4oQxNgNjuWo=;
 b=xqAsmGdwPvViHWyRHQDMFtFJcxI4DfzPqO4aeDsT9X2a5dq9kDyXEY9FqUs+Jhee+jtkQz
 Chy205zxo3QxfIVcLg69RMrXl+CXCJY4bmeAmiZrALLNyXbWcaqSVdJbMgGiO25RhUMlcg
 mXtowZwGQMlwX6s8CQ1Ps++aDPN3a7FV9kq4ePGdoKuBhBOyLYWt7O+YpvvCct2YDiqSE/
 b0tzGN+K2Kb8zVLTahdL/Sif/Ta38vmZPeXGJSjsFDcDovX9qBXEtv3m6TBlqLQ/MqK00d
 Wr9nzysM+IuL0lKbZ8JzwkQpysEqtqyBO1YaxY9qTaOU7Zf+FO9StoAq3RU+Rw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 11:24:47 +0100
Subject: [PATCH i-g-t v8 39/49] lib/i915/dp: Add helper to get maximum
 supported rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v8-39-4489bf8572be@bootlin.com>
References: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2281;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=SIaFkVKPppQGNRWEns8Gv1U0lRIHnNMr+xr94/2zDVk=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpt9pTaVMft2stdlmcCePhgLlHdW1vmnlCiRlak
 Sr75tzjCimJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabfaUxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJt5BAAxqdQRTFsJQv80vm6Xd0lTfmNnOWEN1n
 fAAw3tlYoXjQW75GC5u1847u2lIZACh/mSKmbPWUq5N1J+yuNpGXJLEKnqCoklIWcbJU7WTo/vW
 BAVy2fQLavBNOLa/r5Kl51nqS94pHtE19qB4P6xpokXF7U7Qz+Z7bs5HqwFPnrCaCuy1PxPl0lR
 ROetXxSOO0mcAIIM2kR7JUd2+8TQj7RJHGgVbyXS7Y1fDLzdUDZ0k16YeTzqUQ5Myw8qCfacR9w
 IzyH6EEdgQ3v4q47XNdNJL6GIIp0rD8UmkrPJZL9X0Nb+qON+jb0xhzByBb5252uOSA7Z9bqpKJ
 X/l2buUVuA81h5mGajKcN/iM7SX3W4rpT6BHJw6j3KOGvP3yPOuyfbmzK2EWgZTqqFqQsrKRv9y
 HtdE1NY/DabcJScMXyfTKNJg2jq+t+1AC81PSCv9ZQjHQ19oURFC1Lg/j8Sj7mz/YNahhNVg4uY
 8uh8hQdp9IqbV+zZc4Ky9LfNLKyruQFab+s2VKcWOg90UjPYn06aCbgi/qNpu3KbdW9DPz+yxNB
 dI/Zuc4YiB1gQ9q1QkdAMZv34ZhLGkteySWHMLxB2HVP/uaYph32B7pPqGgqtTpNlV7IW1EbnhD
 5g3z2lrRkbLaXyyw5c8TNuRK3QghjqUTxL+KtLty9aYrKGVHM5sM=
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

