Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62835D25B59
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:14:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3A110E6D2;
	Wed, 28 Jan 2026 13:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="G87SZQtS";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F98110E6D2
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id EC62E4E422FE;
 Wed, 28 Jan 2026 13:14:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C1A006071F;
 Wed, 28 Jan 2026 13:14:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A9559119A8812; Wed, 28 Jan 2026 14:14:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769606071; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=5kG3e14+KCvsdSEAj65JolawCFydQmQVP47SzQY7SBs=;
 b=G87SZQtS8dkmgvRxTHpU6Yeu0XKhBfGAgXBWC5J0ThH8XBE2g8HXtpINn7Q9c5w5RlsoYh
 XVEsJ/pTqp3Nu3aZuzGC1RrntFiiB1MERlZ4Pi6UOYH9D8EYp9pbF+P6tW99MEPAuZYxyv
 uNA/wxRqLROAAO00+hA3n70uP9OFDQy2xAZQKbB5oBftSxINBLIHn5SG09GvccCDiHQIh4
 oEK/m/KkxTDpMOZx00dzOi2zkBZSsnpKq9tEb8I7JcP6EnjNOPZ0LfLlM5NllwCOmIuEx3
 ZULwni8CBNl8sp0/fqbNRS4l7MM5YTSzMwp3pAt/HzbZxe804cCANmP18ety2g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Jan 2026 14:14:33 +0100
Subject: [PATCH i-g-t v5 02/48] lib/igt_kms: Add helper to wait for a
 specific status on a connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-unigraf-integration-v5-2-fbf2e997a011@bootlin.com>
References: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
In-Reply-To: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2519;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=xXAp3zo1JcCn6zWpgAAVgD+Pi3EXh4JVHpcYraSyrpw=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpegvHsUsklKd/TdbcD4FCUA1UKai2HLUACJV0Z
 iCKSQTzu96JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaXoLxxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJceBAAn41ED9IQ1LhOcrOkdTd1m9q2BvGZvXv
 W2QyrQPDMOf+C6hFDEMZgWXNYvjP9+ElJ2MeVwES579Kv5eTdx9qzj1Ki6qjtQ27/YsizoTDpGX
 Mjak5ejr2ojheXdMS1BgQUVUisAp5GZitBrbZfakgLyCt+18IdtwNJf4EkwGfs1MY2aJSdXjRYa
 EMloPujrpnJjeucFVZ+BmfTnSOqiS//PtQpIkowGPyDkU1OZFUucxOYk1sh5Z5kepEzUQl7zmE6
 m8rPEcGXXhcVPq582NFnSRslfcISFVEmG12ZeTJFRTV/204dV+UTr3y8sJ8Mge84HgyexTow+OU
 zkh7vdQiBZl1lo8x+0wd0s7y7viiXQg1EArBZxdwDwk0ZVmcnV77At2NjmFuGhODWXiDLJWLdQc
 pbUtTLCNoZp7J8uepNtEkcLJZq90c4n/8jR4VTATSOqF5btfp5rn6KuJrQYX6M0tKS5i0ra+Gat
 bdUTFkxzScBpnujABggW1ncAY9At4FDmBHc0HvRmaWWxUbZCzrSs8L1uCBFn4MLqL97B9r5jH56
 02wER+uWx/Hnmw06bmclhla23fH83PRQDN07u3tXQfvn8vJlKtdtpE59zYQKfk6kUQooi5mQPs5
 ZF0O5drTPolLvianvulZdJ00Mr5R3q3UNtZClrf9UAZYKDkkQ5kE=
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
index 897b7fc7039b..4082c49eb46f 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -8023,3 +8023,42 @@ double igt_default_display_detect_timeout(void)
 
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
index c25f0fa95cb0..691530db88fa 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1312,4 +1312,7 @@ void igt_get_and_wait_out_fence(igt_output_t *output);
 igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
 double igt_default_display_detect_timeout(void);
 
+bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
+				   int drm_mode);
+
 #endif /* __IGT_KMS_H__ */

-- 
2.52.0

