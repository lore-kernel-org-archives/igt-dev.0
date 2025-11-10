Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0E2CD13D2
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:40:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96CB10E3C7;
	Mon, 10 Nov 2025 13:40:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="RGzZ59Qn";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D7110E3BE
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:40:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id CA9D71A19A8
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:40:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A078D606F5;
 Mon, 10 Nov 2025 13:40:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 93C0B1037191D; Mon, 10 Nov 2025 14:40:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762782007; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=mH02HBk1UThXLzJWtUwwJzGJcJxKGAweHqA4FO4cox4=;
 b=RGzZ59Qn8rh9uk6Zb6abBlNJacC7xIFd04x6p4D5wJ2Fe4hWTaZvdO7avI5ohlD7J6G7ER
 iNfODmO4zlQyiTXuy6a9Wx3Sp+rGjRzmjromGlbAMl/yfKyyf1Yq93DAFhKtu5ZwuTCvVZ
 9r1rbV3R+jbqt2v0CP9gPqKZpblnPlOEwsnvbndD1yFQ1NmZ5M5lq8G3pxaBgZA9K2uzbk
 HXk+NK4mnYVOOXbSoaS7BSG0wCfrMR9Dx34Wh97HNdBlVzXex/dM4MOht8vTgeuT8Qr0y0
 DJW8cZVcrpfcf4dx2rDdwc+Wq6Cro6Wxf0GZsFBmO5ck25ZpQM0DZFFRv+alaA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:43 +0000
Subject: [PATCH i-g-t v4 41/46] lib/i915/dp: Add helper to get maximum
 supported rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-41-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2254;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=LubGZXytxx3/y+tau7NYC9weVtLa9FN3QPjeZPobd1A=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesTtlZEmACxruKrfrghEQXoWl3FNtqYSkBFa
 VnK8e5zgWKJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrEwAKCRAgrS7GWxAs
 4i+mD/44kcdJMSODUGm82d08OLfeLIeLXQRS83dFgirx8FOqAyHgI9QrFE98nMlQp4N3BwZOoNu
 TQokXC+HMbxp+/fKgHKL8tUKTGVdqp3+txYKjXijXfHZRAhZHQi1MT5X1E1pOgFwh+JcXAgDZHc
 VZjOioBlB7yRKXveCbzJruZjuKwyV7sG//hRmTgO5wu6PWk6yQn86pmchgjuM7O8NWHGr8whBaA
 OmvSlBN/Rn+7zhWtXvUKBordU6x2BTAasry2N43XReffxuC3lZfgqh6rABJCPI0HmKryLQRd2wZ
 kZCKiI3mZofKBlNJdtH+79xH6j0RWKuTTdJeJHuQySwH+k9XGiOUGlkMZYMDrwO7DqdhSvXq7H6
 LXVF4m0d+QPzxp2OWKpUUBCUGLaUMLk8Nt4eQXQ5bX9/grsAfGu9l2gr7cV0Y53OO5lRKvQN6y7
 vThdJE9AW0vPMfZlWjBoVrBXdBUaZfJ9dtnL+EUTqEptAYAGbr1XZZ3h6dajIGDuijYhusEJsoI
 hjYsz2lK469ovnpxEQzMehJpIBGEQnjJZw2XNUCy3xn1gqlo6MkwOWT8f3TANTC/q6AwoVCQg4f
 BWNnUJawRu2gGUK5XZBG6ACiW8guplzGtCnKYkVsQQCx4r8zcHcK5VOSwjlD4Exnm9yAw1mxk1j
 fMq5+sPA/tmSiOA==
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
index 65057cff4ff4..709684f564f9 100644
--- a/lib/i915/i915_dp.h
+++ b/lib/i915/i915_dp.h
@@ -18,5 +18,6 @@ int i915_dp_get_pending_retrain(int drm_fd, igt_output_t *output);
 void i915_dp_reset_link_params(int drm_fd, igt_output_t *output);
 void i915_dp_set_link_params(int drm_fd, igt_output_t *output,
 			     char *link_rate, char *lane_count);
+int i915_dp_get_max_supported_rate(int drm_fd, const igt_output_t *output);
 
 #endif

-- 
2.51.0

