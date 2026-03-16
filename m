Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84123F53D70
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C36510E292;
	Mon, 16 Mar 2026 16:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="e2nk2Ju5";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA2E110E5A9
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D3FDF4E42609
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AC03D5FC4A;
 Mon, 16 Mar 2026 16:23:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7E72910372215; Mon, 16 Mar 2026 17:23:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678230; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Cop+2TXC2P4fplyZ9halK+m2khKfOSum4oQxNgNjuWo=;
 b=e2nk2Ju52wKbxs8YDay6e4obn4FhxlNmgL+47rg4L7X8OnOG5Deoi+DJJFxvFTkrX6bUt4
 LIAfHD9qx44mGrY0DL+oGlezbsTB0vSWtbu2HcDf9ZUlnGateyb1sEtNmT4QSIjdu8cuPP
 5Yn+JZ+9ahGSIy7+PPV/dBchMQ+aV+XEuLc9FIc+FVpFKZKpoGTigBO5/zxj44BTLSgHaV
 v1ay7DWjjx3PmgtqKKgrXNFgPmGnZ4EMElpFxo1g0dUB3WQdmhLTSVDDcwDgRvrBdKvTn/
 x3TbL5Vz1iljcv7F0o/U887zQqInJrpMonOyZ0+sKdudOqwsAxBX31b3PT9Uww==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:18:00 +0100
Subject: [PATCH i-g-t v9 39/49] lib/i915/dp: Add helper to get maximum
 supported rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v9-39-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2281;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=SIaFkVKPppQGNRWEns8Gv1U0lRIHnNMr+xr94/2zDVk=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6OfWeV2NyCkjHiGkwhVbj2AB8d5gOkQgz4r
 8Q1ZXKLo3+JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabgujhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJc/g/+JjfKhQugeAlJLdsI4CD4zSWOe7zAUSw
 HFNx3m56xokaGCEyHTXjVayb9fRG+rCXNOd7lkgqhNBaVEZ3RTtf2PYVFSQmMh+AwkIiLWc5mPj
 aflADRLPaRgVOXr3xjtyg+bOV7Lv4QMtos/PiEMZVRWTp/nPx8V0ncYuS7B2YJDA1KwIi6bXoIR
 Np0mWYDJT2q52gk6UprHUvSIzGHovxa1Qcs92T5//TN6me+04C5elqzxxB2s74pEtsDimP0LxyW
 t5Z3+xhsR7KqEJanoA5r7PLbv2jRronkMJfjdNYBRxqSEVyU705u90EQDSAaXupO0CenMJXPynx
 h8aNMdheZS30WZGWnfph7joAnR8B3Cj+Bgl+pXs5WWA0vpnom65pWZ4b49xNwloMXAyAkyoG10H
 yGPiA9H9inyadt9Igsrh2z50ueJ34r7fu2qPQjVQ+RrOSePM6HgKNSnOUNLNAehLXpZtg4crppc
 8QKVKCaDpCWSx3l3ScmTUFAAKdm5QJL2NdflxRrcZjE4/uTVYP6XzDqIADts9VIv83h/Hk6S4bi
 7HhktMBUwtUQvndwbvupFsR7gw91dim/DJh1a7e9B046p2FjAjYTDyVNfcashzwQUbfXsLyP3KE
 knnjcx7JyoE2tQburRSjbd+8B3h3G/ybXu96MkZ5ZY4fUsJXl4qs=
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

