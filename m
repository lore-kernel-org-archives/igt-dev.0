Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362C5E7DEEE
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:32:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5FD510E445;
	Mon,  2 Feb 2026 14:32:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="dfu37rb2";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3FF810E445
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D38471A2C1B
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AA22F60767;
 Mon,  2 Feb 2026 14:32:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9067D119A88EE; Mon,  2 Feb 2026 15:32:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042749; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=FUkta9fouLv6EhPuumWvIeCW+7EYIKZbucyBWxWIvrY=;
 b=dfu37rb23UCb93lVXfJwzZJF2rwq4A0eyBKAGGRtfYy0ZlTA1VSCvbBdgb2p/yaXKvowpT
 Ljv2uB9VQNUD5pys9gpM6m69jfXhD80EQupQiiUILAF9+wPqFs4E/LnrvGxcLMRIo9TgVP
 S2RHhIaQ5mulAxeas5W2ctZxigEmy4LiJ1TqTuLGGc9RCpn6PwFu1k3q3mf81o0L0IaNNZ
 p3A/Jz1aoelQw7WEPEpqVHC7VYITze6AN/K0tDa4MgV66tON3OoReSyBXjj0cqsVD/M9YC
 Ic14iAQgKfgA/NGfhIieOUl36+7CPNVUGAKMIU0YR26WDrQroKXgsnMJ3LKIjg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:32:41 +0100
Subject: [PATCH i-g-t v6 02/48] lib/igt_kms: Add helper to wait for a
 specific status on a connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-2-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2519;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=eNEfctpwXj114r7fQLcwZ6q5n8QwLdLB6IDxZyuP8VQ=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWOF9OXx1/0ejCKlrH814bZYBzVdBWixhZ24
 Yh/9FqC94+JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1jhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKtPhAAtrDa9TmMTt/y7iq/tXWCUQ/RV3uUKW+
 5Nhj9IgE3398QYmM1toNbm9sX5UBeMbmuA3B+2bkkUUP5uikKamaYJ3pOC9NcjqNDxVTAlapPP4
 DGbOtzT50HjWwD8os35HNaTZXVUyA81iRyIqbWOQgC/nPhu/Hwa3P8tfnd1G3McBkeB4W+v+QJX
 kdWPNTeGQsx/Mf63YsC4phsS/f/qPgoe/jcfiKAhz3JIjGSAZE7PPF++FpGJ5Bm8UKJhdbaq1iq
 CdVYnYrhh+NWbIfsuXdZMhpAcUA2JktgFEYeFwhLm5mp+Wz+P7tZ3PRcliQrgw9r48LxlfuVOj2
 EjZxhh66bdJRDSOi0OSbQ2Zq4SoINwCF92gJBD1Qu85pzG4mr5VvhOyFbP/lsSWP2WUnKSvW0ZY
 1FYB871adPlw4Z/R2uuur2Z3rebgJFfgaV5ZVBFjMamn2vwuWhsbRekbTTSXrw3ZC4PLKGBtQYm
 YJUGTVZYsf2ZtfCdOLczPtWAuYAOjeLhjwybXu6HDkHrLko0R11epKotsFkhyMXiKyZmBzh6GAu
 Hvh11s/Yauk10XW/Eg0XODwDhIKKQkpewbMa42pvdNRwso0KR1MkTuUJDPFX/vd6TKqLXvs6WLu
 4aU2juAPfrQHSLstHO8So+ZBXFjK44nUJF+iY31fgr35GRI0nUC4=
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

During testing with chamelium, it is frequent to wait for a specific
connector status. This new helper is polling the DRM API to wait for this
status. This allows detecting it without notifier systems which can fail
if hot plug detection is not working properly on the device under test.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 lib/igt_kms.c | 39 +++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  3 +++
 2 files changed, 42 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 3f1e93af62b7..74178adc21b3 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -8015,3 +8015,42 @@ double igt_default_display_detect_timeout(void)
 
 	return timeout;
 }
+
+/**
+ * igt_wait_for_connector_status:
+ * @drm_fd: drm file descriptor
+ * @connector_id: connector to monitor
+ * @timeout: maximum duration to wait, in second. Use -1.0 to set the timeout
+ *           to igt_default_detect_timeout().
+ * @drm_mode: mode to wait for, see enum drmModeConnection
+ *
+ * Wait for at most @timeout that the connector @connector_id  status
+ * become @drm_mode
+ * Returns: true when the status is reached, false if there is a timeout
+ */
+bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
+				   int drm_mode)
+{
+	drmModeConnector *connector;
+	struct timespec start, end;
+
+	if (timeout == -1.0)
+		timeout = igt_default_display_detect_timeout();
+
+	clock_gettime(CLOCK_MONOTONIC, &start);
+	end = start;
+
+	while (igt_time_elapsed(&start, &end) <= timeout) {
+		connector = drmModeGetConnector(drm_fd, connector_id);
+		if (connector && connector->connection == drm_mode) {
+			drmModeFreeConnector(connector);
+			return true;
+		}
+		drmModeFreeConnector(connector);
+		clock_gettime(CLOCK_MONOTONIC, &end);
+	}
+
+	igt_debug("Timeout waiting for connection status %d on connector %d\n", drm_mode,
+		  connector_id);
+	return false;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index ca3c79f713cb..b6937d19f621 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1316,4 +1316,7 @@ void igt_get_and_wait_out_fence(igt_output_t *output);
 igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
 double igt_default_display_detect_timeout(void);
 
+bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
+				   int drm_mode);
+
 #endif /* __IGT_KMS_H__ */

-- 
2.52.0

