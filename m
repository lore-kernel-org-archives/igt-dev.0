Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86135D1CDD8
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 10:29:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40EF210E30F;
	Tue, 22 Oct 2024 10:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="JF0Tbh8c";
	dkim-atps=neutral
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97A410E309
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 10:29:11 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 4D1C8C30BC
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 10:28:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 08B7E40009;
 Tue, 22 Oct 2024 10:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1729592923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZGl30w/R//yn72EOFK5d1cLDSW9M88qBmtdbDCh1Awo=;
 b=JF0Tbh8cLtyJh0fJE4IuFRShUW/e6Wcrb2QcvfEVjam8A9VjWdQofqOxSWfMTsKVm4/eQx
 XW8w5Kv56NwGR/xg5tb7Mu/2A4UWUD1agtvshkzs9CGFoWAUhaBYjvmnRRZsF6OAW7A/KD
 5vJU7K9zvBRFqmH3yWo17xfxaM9aP5abX+ISPm+Td+i6aic/dThPb6ybYMsj1pvSvzwM+S
 gxNqGu8J02RNH3AtwLBqnuqAnw8VQ25lFIzkUoklsecV/+04+0bohy9JgneBKn07VoacSB
 WKQVr8bC2DczR0G9rJmHLmqxvmyeP+PcMvOJ228vLVv7YEShlSbyl5JKMAcvYQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 22 Oct 2024 12:28:39 +0200
Subject: [PATCH i-g-t v2 5/5] lib/igt_kms: Add function to get valid pipe
 for specific output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-b4-cv3-01-igt-kms-v2-5-8f654694b513@bootlin.com>
References: <20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com>
In-Reply-To: <20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, nicolejadeyee@google.com, 
 seanpaul@google.com, jeremie.dautheribes@bootlin.com, markyacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1717;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=fXxyd0pdJ8jXI64hXULBapBt1VK5iln00SpPhsUFoVM=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnF35WE+POgn+YZVu8+a79WHsb7b/+d2GiNOovS
 5aJQPWmESiJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZxd+VgAKCRAgrS7GWxAs
 4nmdEACPnrHFNz8SlT9iksqFk1chewM8vLqNC2R29tsukdV4Tc6dqLbvZnDLENEpE6vk9teQWTS
 17ZsChtHNGDURYzD+vBdp3XTvGdFjyV1rjedBQFO+Yt1QWAug0rWeCSJGhWpHHCHoXtLfUPP5Le
 NhkjY3flkID6tjuaoagAEw6NZ7jppSiXbi/+N30N57XJIV5jZMLFJmOd1Yo4xct8oEBPNImAA/2
 qq7Y6lsQUQY7IDzDcq4cO1aVfaf87KwGdFcOZuUBmqfpU0JlAgbKQQEI7BsOdGAYHubCpB/RVe1
 yO5VUsWcwmxvhXpNfcVVhu6+bm51J3hu6fVz3niNmFxQTLLkaI45fOnX1BDfH2n31r2DCLl/gWm
 QY1K0M4HmAd+xzr29ZPQwR01qciFHtSNUY0g+zsHAgaY1WuwYbjukdoWKcIRXlO7/OwrdjIk4fT
 wz/rc7sLnEDO8gYdh7DO8FF2Fx2XG8rj/pvE8NWAVIeQLrNmQRygzImzuSCmbLCFt3E1Vp0TqpO
 60l9M9U8FW9+BamBhnzEC/SbXU/cBrUJQhuFM83ZJFG/Ne2zGqsY0a3M4QNsOtAg1XHhsRS/fRX
 qArtVrWWkjQGVPb5DRkMEeD8FsfQ9U1Tm0zttPx0OxUeICkJDhZ/PI1JJJnniZootnab3wIyvox
 VEvSC7PJUQJC0GQ==
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
index fce5666cefc6..82d63d6e6229 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7332,3 +7332,22 @@ uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path)
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
+	igt_assert_f(false, "No pipe found for output %s\n", igt_output_name(output));
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index e9732c247dea..e0d968b52033 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1269,5 +1269,6 @@ int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
 drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_name);
 uint32_t igt_get_connector_id_from_name(int drm_fd, const char *port_name);
 uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path);
+enum pipe igt_get_pipe_for_output(igt_display_t *display, igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.46.2

