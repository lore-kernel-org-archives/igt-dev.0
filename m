Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4001ACD1297
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:40:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E89C410E3B9;
	Mon, 10 Nov 2025 13:40:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="RmSO89OF";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E01610E3BA
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:40:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 6245B1A19AA
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:40:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 38F96606F5;
 Mon, 10 Nov 2025 13:40:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 359BD10371920; Mon, 10 Nov 2025 14:40:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762782009; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=EdwRGwaUABaygXxYiDrrtqDNXAB4uefliOf6w2MtlOc=;
 b=RmSO89OFn3zW+grIs6GtyjmyQmhJoVRSS8ZJ1HPVJeoLSpVu6jp8WUDnaTgt/LAhy5I6xw
 JSOedx6awiX6WBPJhhPSkuxyxfrboy7qx49wYYuhnIyvmSdI2dvKJKXfdTSoCClBpH6NpZ
 /xIXWpU2lb+URlIHrNVl0oCXp6MJvVFhfA/9pD+CPnzbm5uJyTMpqPUWhqReZGF+1eYg/o
 Hzq4yaDIbLq1TxdoNvFaXxP5rp2EmGp8xxvXdqMS3t3ZH5MRwvUr83/RkaxtU2HgfFKDBS
 FSfBmisH3Wh2DUBReJiK7px8MC6iOxLb0YzK2u1RPMDkfp3xrEAnOwlm0BBprQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:46 +0000
Subject: [PATCH i-g-t v4 44/46] lib/igt_kms: Add helper to get a pipe from
 an output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-44-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1566;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=uvKNeNbhgN+n31kbFaJpqESwmeiEKw3R3CtOIRkV8FM=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesU76HZTyCsUBvGj7GtcvJMaKeTe/QhVgwNn
 C6CaT5CPomJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrFAAKCRAgrS7GWxAs
 4kRgEACM5IfEjW9LuEcd613/V1y47QgbZZgSfC0lvFYHBGyCqF7Iwd9b/Ndp85pQyVvI6HUMvEv
 Iw8wHbY+AYjZZx2RrQ2sYi/PIB4qpodwd9Uyrc8Iq2IRHjRoFhbKqdYqmzjercI4Uq1LhPgFjk8
 tz/+IOew3Liq4JLUsa6bOOGLkrTPnRj3pDaco9OH6VnL6sfddl0+MlNF9gqOwiTKoC44ZtSMIjJ
 /jsjlgGBE0QdZDPFoQy5m8lvvGOgxDGAosAn7vRZOeJJO26zld1VaX+yLN6JkJEXzOt4VuPj6AD
 H3LTKgJPrUfSPgFoqzW8MnQ44Kq6iMuiYQPMQryZOp338fJgStGofltzwwCQ4mBNvMcmDbTaKaj
 R0a/gSe3c/FAtWyNprngq2mone+5L2tbYa7L8JdGbw+i1OPXvbJnyej0z1mTDYPxPwNB+RW6F0s
 MLbnwAhXSkQFTaMr9yiTO2RUsYfnCD0FODLqTMn21GISMgeXhxhECZwk2oPXc3FbiWS5WcTLb/l
 Tc3mBeUWuL5av49uL3rrUVl2h59Tl9+jvljsKMM3vwF8CNaL5pXT/7AwN/zcihTVKzzyY6w35da
 473sLvv8TFQTzHhO/zKm7khIawUMigqc5oa1nur9tCf90FSlRlA8uaJ+HBXGYCrT98UZMrwaIAJ
 LjLp6fO92W9bfog==
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

Grabbing a valid pipe from a specific output is useful when testing
the output.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 22 ++++++++++++++++++++++
 lib/igt_kms.h |  4 ++++
 2 files changed, 26 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index b3178ace4a8c..a80849d2bae7 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7564,3 +7564,25 @@ enum pipe igt_get_pipe_from_connector(int drm_fd, int connector_id)
 	}
 	return PIPE_NONE;
 }
+
+/*
+ * igt_get_pipe_for_output:
+ * @display: display to fetch the pipes
+ * @output: output to use
+ *
+ * Get a valid pipe for a specific output. The return value is the pipe first valid pipe for a
+ * specific output.
+ */
+enum pipe igt_get_pipe_for_output(igt_display_t *display,
+				  igt_output_t *output)
+{
+	enum pipe pipe;
+
+	for_each_pipe(display, pipe) {
+		if (igt_output_is_connected(output) &&
+		    (output->config.valid_crtc_idx_mask & (1 << (pipe))))
+			return pipe;
+	}
+
+	return PIPE_NONE;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 86e5b3224df3..79dd467f0252 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1318,4 +1318,8 @@ get_list_diff(const uint32_t *list_a, int list_a_len, const uint32_t *list_b, in
  * Returns PIPE_NONE if the connector is not connected to any pipe
  */
 enum pipe igt_get_pipe_from_connector(int drm_fd, int connector_id);
+
+enum pipe igt_get_pipe_for_output(igt_display_t *display,
+				  igt_output_t *output);
+
 #endif /* __IGT_KMS_H__ */

-- 
2.51.0

