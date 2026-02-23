Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED1BBEA4FB2
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:09:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0FC310E374;
	Mon, 23 Feb 2026 12:09:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ItzqFcsw";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0799210E35F
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E10D84E41030;
 Mon, 23 Feb 2026 12:09:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B7BD75FD43;
 Mon, 23 Feb 2026 12:09:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9CA3010368FB1; Mon, 23 Feb 2026 13:09:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848564; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=fB3YTsKWwDkdNJSmxfp8v2jp387qwr69w/XPL3RAiqA=;
 b=ItzqFcsw2ubehyRpPGm3dLsJVxkp8EpFM1mB361x90j34+hTzkXBl9QyRag0vFa0QH1ZGL
 Z7D34TYzqpi4YgLX4Iovm417aCGJCz9oBrgMd/1TpL0D2pKWaPdc9gjFqnKB7pPokQl8Zj
 w2XUZno6qJMKxHmXhjbWN6JzU5llFbljB8M7SpF7uSv+Vg89VuxY/aTZfQrT+L+/pY8Foa
 cUy9upjcNMa7xwCqtFsqZC9SlHU7oEFIBlAyfN8xTbAAlctqTpk9lfSWkpcK1jdRCGPjI6
 ebphvAzeTxWyMgnbzFJYj+k3pIbGbKG3MWsesWCsU79pi5anZ2/CEzJi3gpVYg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 23 Feb 2026 13:09:45 +0100
Subject: [PATCH i-g-t v7 38/48] lib/i915/dp: Add helper to get maximum
 supported rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-unigraf-integration-v7-38-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
In-Reply-To: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2225;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=LOnRbbFnG+xP4d7rvSi9sr7HqGCyiRWIcWqmZ+E8vvI=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpnENrvl0x8CxrsdNliVn09Bzso5y32XTI0sOIg
 Q9YeNmcuqGJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaZxDaxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLeFA//epSCyVPDTec91Z8GOHc2B3Q1/lsicYp
 hBZGISCSi9ssl9fnlYWtnbQjDiF0JbeNQV5ibsTZfrbXgnkX+FIrUl8fhu2JuUrDjHgu/xjW/Z6
 irlWTQQedTvQ9MjD7n2Eo9bAlP9++ObS9w6+jqz6Ol7uSECSbBakwlj5QGTgEBJi34g0Z79nCc1
 S9YvBgxJr98oyThwhe7Ct9w9abV6oHNY4dFonqrt626icLNqFrzjaQRu2ZDeM84u7Tl0VJj/9/K
 OfSLz+/xqf2H7kfxbro3S2+CYN/rfmc/J2Hgu2KydsLw9/E9LAzPSas1tngGbiR84RGAjzehRzJ
 NWMn9d/GvhqqekpmWBRbKM1B0Fzn41vKUTGRrDRc4TgLiQLFwFTlpwLAn2voRZZOl97pPVpUspA
 EMilZuWRD4xit2+A9Zty0WAxuCSwKgpJwna0cAixhfUr1SI2O3jn0LdsGbTZ+ZyySeH0l4p+b4S
 aHwLhylW5thAZCRv+OOSVfjb8b94cRB9wterUx6bVjZRCtxnuQmA6J7G66vw+Zop07qrsA+zl+D
 nknyL7P1JLBqKO2fEyb83gsWNkE+5VSXMoGYc8sG2xDzGTxEmXcInsw/DPXe7meSdKI5+Cl7pYS
 mkIbvLOjPOwnpV9AxHFT5ydyXTHuwhazjDSHX1g7bdsg+beWgijA=
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

