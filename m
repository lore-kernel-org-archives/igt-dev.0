Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFC7E6916D
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 15:19:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C910A10EBD0;
	Fri, 22 Nov 2024 15:19:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="MaBSISMd";
	dkim-atps=neutral
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC2C10EBCE
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 15:19:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC1761C0009;
 Fri, 22 Nov 2024 15:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732288762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=InFYbXZE4dgAFGqnCKOLxty6ijwkVZvOImfcXT0HC8A=;
 b=MaBSISMdTZYQ4Z9dGCubNfk77rxC2ZxRt1sJRix3LqzcWdSn/2MYLR4lo4J0807bEEDZXF
 GPdcJNygau4U3QBRnlfpIGZO+EnujfSDBLhLIKdIAL0szrsEZMn2sFFGw/fn7Wiux8Vb+R
 PmDtfNRZGMOXKGNixI40xvGeI2LNtNvR9agD/wgiC9MGMkSFEURZZ43xxzAGrIVbMQSwim
 6OROJuTxx5QaRNUV3wTnZxvorqVT5ANOftvCmux/udtk7pobqGLJ5+XG8D4jPw/fHd+PP0
 ZWX9FNQetxz7TWqIx69z1uv6eVdE2/gx2xp/ZSYtC8+obBV5TejdNxf1k451nw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 16:19:08 +0100
Subject: [PATCH i-g-t v3 5/5] lib/igt_kms: Add function to get valid pipe
 for specific output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-b4-cv3-01-igt-kms-v3-5-c5ced6976e11@bootlin.com>
References: <20241122-b4-cv3-01-igt-kms-v3-0-c5ced6976e11@bootlin.com>
In-Reply-To: <20241122-b4-cv3-01-igt-kms-v3-0-c5ced6976e11@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, nicolejadeyee@google.com, 
 seanpaul@google.com, jeremie.dautheribes@bootlin.com, markyacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1768;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=ncrVn4wJMadDpZhQoJcXCWYDhTp79UDoRdnF/+jBgqY=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQKD1ze3vfns9xedyW859rCSYVPRtM4uN3b4Ue
 IIEb0aHzJqJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0Cg9QAKCRAgrS7GWxAs
 4jS+EACg+oF2nG8MLknK4CoDPT+kkwb1lfFLfT9X7ZZu3RxuQfpj1apawbcfFh0pB+RVVa+6Gzs
 RkT8uGcQn+xaEy5tE9Ynkp2V9wrt9OirI+MAuqRK3u0XDtN/avuTiLFUjbo57t3jghrUaHAzfwH
 Td6o1ARoNigrke0cZi9f0x4P3tQbBs2YHuOhlLwVLZiu21ScwqKcKUDpZGBBFkTEPb4KW3FKB+x
 YgViq507lguxI2DxnLG5C+JEDeMqPtZlAJFifuJhOjjLDgUGSlIFRujT0UcMZ8erqf5pzRYq8C0
 51AV4TG2aEWZkRfe8xEWbgEGf5SkVeWnhAeX3+ZT6ngzQJ7GVA0p6fYDFTzR31Uhm1d2jnzOi01
 qZcRuwJ3iDxDdimSvTV/8u0606zdZiNhlSH3wdYYyL7Ro3rtuQ+vNjXLnJ0Y06sBGlL90T88gGk
 6gdB3clml503iMvCR4NCzUMw5dpyCqC0Am/mHAOXYMcjEZbS/HXk8CeQyEtgn3g6iXN1AtCguXT
 UW7UrH8ciJURSsiFs1T19QaQTOlkR8W9xACRA0a/VcTT/Me+jiVJxTOa7z/X+J7G6BRBZBbYoJi
 EloqREmjFSl++Lt/PDwXHD2sz7N6the404/roy0Jf0plTH16tnxpa/l5GfTLJJoF37AhI+VXW6R
 /8xHbXVuaDnvjdQ==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

Introduces a new function igt_get_pipe_for_output in igt_kms. The function
is designed to retrieve a valid pipe for a specific output in a display.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 19 +++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 5c242a5bdec619d181c3d0d632f1ea7d94d34743..ef783f9d3aaca9e0a65156a78c0657d2c3316bcc 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7420,3 +7420,22 @@ uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path)
 	drmModeFreeResources(res);
 	return 0;
 }
+
+/**
+ * igt_get_pipe_for_output - Get a valid pipe for a specific output
+ * @display: display to fetch the pipes
+ * @output: output to use
+ */
+enum pipe igt_get_pipe_for_output(igt_display_t *display,
+				  igt_output_t *output)
+{
+	enum pipe pipe;
+
+	for_each_pipe(display, pipe) {
+		if ((igt_output_is_connected((output)) &&
+		     (output->config.valid_crtc_idx_mask & (1 << (pipe)))))
+			return pipe;
+	}
+
+	return PIPE_NONE;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index d61ddcaa0a25f1f9bc34eff7314eaa49a3de9cc2..3cf6669bcc56b4c24644091c72140ed7760ac198 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1281,5 +1281,6 @@ int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
 drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_name);
 uint32_t igt_get_connector_id_from_name(int drm_fd, const char *port_name);
 uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path);
+enum pipe igt_get_pipe_for_output(igt_display_t *display, igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.47.0

