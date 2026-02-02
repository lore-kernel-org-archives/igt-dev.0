Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32C7E7DEF6
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:33:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B4CE10E4E7;
	Mon,  2 Feb 2026 14:33:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="oNLZVtzw";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B246910E4E7
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:33:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id A67741A2C19
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:33:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7E34D60767;
 Mon,  2 Feb 2026 14:33:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8080F119A890F; Mon,  2 Feb 2026 15:33:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042781; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=fTPXM2xODQN2M2Jm1aYFCBm4W2k/MHC6BzgNAjmOsHo=;
 b=oNLZVtzwxar7RIIAhQiZZf7KR1rGx1jbNvyRlA/egToJdzvMGMLnHgtFBRiAP859+E7Nfk
 TLQSVGN5ILGELgwkoztXFqXv0RwzKOUV9H7A/2mlpzFXD0V/7f2JD5EzMpuoQIqpKwfKEO
 m6WfW4TZAjp2CLPPqcreN0c/ZIjXHlhp23KbrRQX99mGR1FST7XLFQwq/LW+IOsKSAYHyG
 b2IA03tvUCvacMKcXAqAnPwOHPbj23AtVnJVCcCvr0uie4Uwzbq2NL8TIqjOPYS+X1HhFG
 oAn2QzCrpnNSbAE4XbRVrXScZ1P93Qp5c+Nrgo2p/Qdrx/SXk6vQKUkrCxgCXA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:33:17 +0100
Subject: [PATCH i-g-t v6 38/48] lib/i915/dp: Add helper to get maximum
 supported rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-38-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2254;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=cM3EA5HZjKLICLqwEK7qyqvoW0wiG8Nv4uxOkkAGUrM=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWTw8jpdkF1QYT+H+VqkPKDPqp7xBrS95Wk/
 98saJuHE4CJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1kxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLVsA/+PWMGqeDy7XuzKhoA5Fr3+Q4v/Tndk4e
 Z13RfNpMD8vk+zDy4QSaANeQg8DHXIDW7I8daQkTHDRnVHZaQyi61sLSCqyLW25qknkrskk1GvM
 4om0FY5cIOyOdlax/w8wxBH0s1Fp4kk6VUS54btnuO7PyAOwdursjO2Fvajc7HVecbUBc9NTSf/
 jBbLM47X20KiDFrgX1EQaEd9W5qXI9UwWybqfytl8IEIqY56+uhx9f6Szg5LT+qH5wkpNYXwxsX
 9xGUt0cvPXblo8WiCjBxrVHdifynLhW83qW48JsL3owfKf/s/NbsbtPts5so6fkYvto9tBgc63o
 CmmuUhAeyhG1G47bwBb6ZLMunoPAsoqYOqZNDt0XMK4NpuxUkdWR10jLijqlh8+mVdGuoVOyMDR
 EPp5l+8VJtYInAuyvIigfPIQqoBF4JZk9CoM/SdY2E1XxIXLvxvCwOrrt9i5k+pyxgEO/3uGPTC
 HKTj+GkjBcjiMzLqqwnIPRsMbSfkM1ItCtedO1oZ0JySidoAqBqwjoFu1xiMb5NXz1xY/M4JbAC
 0gOXj50HB+oYChjg8WTkjHlyIBStADO+dntJxJwhl/DXdzmaLc019ObWMVGMoAm+2S3hXuQO7tx
 +gVObflXzJk91QkniEWQ+exobbyegzgds23DutXVG74tEHBqR+qU=
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

