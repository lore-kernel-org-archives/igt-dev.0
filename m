Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F81D25B60
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:15:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC3E10E6DE;
	Wed, 28 Jan 2026 13:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Y1PKjpHA";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6352010E119
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:15:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 4C8044E422FD;
 Wed, 28 Jan 2026 13:14:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 245B06071F;
 Wed, 28 Jan 2026 13:14:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 46E1E119A8801; Wed, 28 Jan 2026 14:14:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769606098; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=fTPXM2xODQN2M2Jm1aYFCBm4W2k/MHC6BzgNAjmOsHo=;
 b=Y1PKjpHAjbzlbJXPVGeY2wApcMLEN75IGUMqfI0C2cGOd9gIhik/yIB7JbNGWe16hcDQO9
 rC7jdA82C5trJAPeRwFrQPBrOOYx8ycyNDBWK5KvH+Cwjsx/WtoPWKJQOiJM4T+jmj7Sxy
 f6Erlmr8NmEKDd74BJNGKgtnvxZpyuajJmm/8jCsWReiu9ZXgDPOsvm7NjrU/lA5L73eTi
 Jud11TmC2Qx8NaVA+R6trdKWqPb0g7AQ0pRwJfJzTne0Qy+lCJvl0X9p64SnKqSrLC2eNp
 Sj+X5zLEU9jKBG+FxdlF/BBjCNFoFEfzCB6BlSjttQ8ALs3RiyKM/onq6gc4fA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Jan 2026 14:15:09 +0100
Subject: [PATCH i-g-t v5 38/48] lib/i915/dp: Add helper to get maximum
 supported rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-unigraf-integration-v5-38-fbf2e997a011@bootlin.com>
References: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
In-Reply-To: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2254;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=cM3EA5HZjKLICLqwEK7qyqvoW0wiG8Nv4uxOkkAGUrM=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpegvMxJh/4oIo91w7vDHVrWvZEsfzNfhMPVXDP
 0S7Wofr+TWJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaXoLzBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIzChAAnlP/WtYuYEQUTGGuE34N01X2cHoh9DG
 9V+OGp5RCN/avgsGl0sLi34nfnhWQ9DB+FJGESPgjYoZjQdOEXhg6LuBCuLP0n/YEoLhrPHL44r
 +NG/l6Kqm+bzvEVTA5zSJAzu+sSYXNEHvLoKj+Z8u6f0lQkrh1c4z1o5tRausKREWrJM8SmbAQD
 SJzLD8vGLsI2FIshBi9EDi+/uVrP08Fu3I62sEItTFLfy0NgFlfH5Aq7jBenjf0yfIsMKQs2I2M
 3hW0j2XoBgKpypEMACTb5MCYTVC4mClMI/QHvKoJ+ZEI58bTUxEGyo4R4b05UgFpJ/aYXYCHKeD
 tL+xfXqRUH2e6PH4uOe7etiKt7NciXaBZg8e83qm791Cl0xi3VYaSdWsZFCcUBhbNaeGpzqp+/D
 whfpmzaepmwfOzp3xyUH5nD4KYVMVwp4CLsmAh9QRPYvjXzPuXj9As8y3OiKg4HdBBoC5NfWVMx
 SDr56J88xuJg2GG/cZIzr+pLbv0UPGpRnbZT8YQTblPEgTdRi7mlBPBPjuIyOaSlXiDVG3Y9D61
 38MpV75qDRIHHH5E/1WIKfcSZNGvGZv0PLRFDT3aGjuMQK01O/5COrxgvLX6DAjHQWy4C9W2A9f
 PQTZB5L4wZCHwYkjEHmF5/47oCZiazKau8j5NGsmCJCxlyi9bAAY=
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

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/i915/i915_dp.c | 35 +++++++++++++++++++++++++++++++++++
 lib/i915/i915_dp.h |  1 +
 2 files changed, 36 insertions(+)

diff --git a/lib/i915/i915_dp.c b/lib/i915/i915_dp.c
index c5b9273ebafd..219f3d29e362 100644
--- a/lib/i915/i915_dp.c
+++ b/lib/i915/i915_dp.c
@@ -1,7 +1,9 @@
 // SPDX-License-Identifier: MIT
 
 #include <ctype.h>
+#include <errno.h>
 #include <stdio.h>
+#include <stdlib.h>
 #include <string.h>
 
 #include "i915_dp.h"
@@ -317,3 +319,36 @@ void i915_dp_set_link_params(int drm_fd, igt_output_t *output,
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
+	int res, max_rate = -1;
+	char *token;
+
+	res = igt_debugfs_read_connector_file(drm_fd, igt_output_name(output),
+					      "i915_dp_force_link_rate",
+					      buf, sizeof(buf));
+	igt_assert_f(res == 0, "Unable to read %s/i915_dp_force_link_rate\n",
+		     igt_output_name(output));
+
+	token = strtok(buf, " ");
+	while (token) {
+		int rate;
+
+		errno = 0;
+		rate = strtol(token, NULL, 0);
+		if (errno == 0 && rate > max_rate)
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

