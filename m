Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F979E7DEF4
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:33:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4741C10E282;
	Mon,  2 Feb 2026 14:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="xmufC5JI";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E4C10E4EC
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:33:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 8A8ECC237F3;
 Mon,  2 Feb 2026 14:33:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BDAD860767;
 Mon,  2 Feb 2026 14:33:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A63BF119A8913; Mon,  2 Feb 2026 15:33:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042785; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=lxjDEXNLOCRqNM+hGJ4AFfy6emMdDlrvpQvIF4mA6Xk=;
 b=xmufC5JIr4mNy5c8dCfZ5dHLDR654jK7OdOXILdBl849ptX4DBQzgcGiKRvV8ah+qAns+j
 mHQb+mdl+nQstjzZBS5vgWBSvMefC37viJM+lASrfCKyv0Q9Yw4KuQbvEPmUKxkTMXeNXD
 bB50LA+q77LmkYSwJzFcXw/PoYHfTBoIAiwJANfBBPVM0J0HLFujNoQfhnmG/hzJYoH1xI
 j/FQAQXOdpwMD2tRV4y5AV4I/om75v5cGvauqKqPVZWC9NgqaUjolUFR1oLKftxarl7f05
 C+gIi7BZ49Wj8lDSvWonoQEj0rn1txpZ7DONQ9dIeQrXLijXXN/OYMf0eBxUNw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:33:22 +0100
Subject: [PATCH i-g-t v6 43/48] lib/igt_kms: Add helper to get a pipe from
 an output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-43-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1514;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=czZNpM5Zi1ILSSdi04CzDUQzNkm3ca5NnMpZTMWMHnY=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWUeO8KZghBRZ1jcQUcSaC0MNnYjcEEp6A1M
 awzaj0RGbqJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1lBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIjug//fJswLPg71WW2PrD4WulPqfaC5s7YN8g
 y8W//ZDj0Yncrq7Ml2YPcOFEr/OSfonchGxRVDdEABG+J5kJH/Z0nB3aU7QIuc77YfHF8pkyabe
 Lm7/R4Zf04Xzmie3PI+AFAyYy7/12moV6PJqzkG1U9sy2ZXJqf79T47bLzHbAOF0Iy/LcArKGdP
 hr/GFHhyDYcRnOKVGHFVbXkZW7qvjy+z0nKF97N35O6gIZH06QoAWyeJJ7GChxSPyht47ctMoSZ
 aLsOCl1bi8T2+ddTkHNi2KWLwkkxaSaBrlSOlwiKcNRX0BJQlSOmBLQU1IFom8CxRiwpenhoHkH
 nR6F69QX+irjL/0CiRC0h1QoN7yzmm/IhLeWpjR7BDOWrXWxA/hOpJd5m/+EQC37gLDqztuGYsk
 cYF3bnZ1sD2iGcqnmR/XJWbdcDwXwbgyBpjpyikn4HVjSRUGPgwVFKbAZJorTeTGny1U4yUKjx3
 vKJLzhR5D2o4bEjDZtj1EyJJBWEX/toA3nVh6Zub2ccuaeFrQqDX8v3TNWOzr5G9zUMPHKCuWLD
 umoWTyCY+9ZN0yiaEuiZ0a9CiQSEJZMZUK4PY7F3bREVmLpaxqmlxFXKvGWJOxjG4l0wF4uYAhv
 ZMIGFskKNIJckzU41S3mcsMjN+s0PoGyIVEHQsVIP+wHkjlw20J8=
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
 lib/igt_kms.h |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index cab42bd4ceb0..aeb09c9f0abe 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7997,3 +7997,25 @@ int igt_get_crtc_index_from_connector_id(int drm_fd, int connector_id)
 	}
 	return 0;
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
index 7d7850ed1a8f..982f94ee2109 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1326,5 +1326,7 @@ get_list_diff(const uint32_t *list_a, int list_a_len, const uint32_t *list_b, in
 	      uint32_t **diff);
 
 int igt_get_crtc_index_from_connector_id(int drm_fd, int connector_id);
+enum pipe igt_get_pipe_for_output(igt_display_t *display,
+				  igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.52.0

