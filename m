Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9EAFED3F3
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 17:04:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3E810F648;
	Fri, 24 Apr 2026 17:04:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="fuwT3oXo";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8542890BE
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:54:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 99AB8C5EF2B;
 Fri, 24 Apr 2026 16:55:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C5775604EB;
 Fri, 24 Apr 2026 16:54:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 784DD10720A11; 
 Fri, 24 Apr 2026 18:54:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1777049669; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=iiD8IM4u6wIxXwRByhUmesWnFv7aSs6YBQmHPbpX7CE=;
 b=fuwT3oXoa2B8nDVr++9FcH/R3N79Bo+GT8ega4M7dYiJEyWPkuQj1CAKmI/7PFq9+YZUGZ
 U8zcQWS2OMAUYuGW8b0ciDEUp+YjtZ+B8170StvS7yUqHtQ28ecybrKGWttjAQSoNv1dMo
 wvVNAdE7pjtJoCGMdjDI3bP6kbf/vZiAa/3xDZ2tdMbjzPyvf0xNBMoIRd4AkPxbs74NLj
 RoEqhqO83I1mhbPZ/7bV/iAgoizoIloTXISZdRMTrHUEx8qbW7u/qH8R4r0+k2xVspaFz3
 dRxev0/Vgabo8limIdqP5drirjZndam2xEv0xgV8OGHjWyOSb2kCnk5263mUeA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 24 Apr 2026 18:52:37 +0200
Subject: [PATCH i-g-t v11 02/49] lib/igt_kms: Add helper to wait for a
 specific status on a connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-unigraf-integration-v11-2-0c5f5346ae60@bootlin.com>
References: <20260424-unigraf-integration-v11-0-0c5f5346ae60@bootlin.com>
In-Reply-To: <20260424-unigraf-integration-v11-0-0c5f5346ae60@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
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

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  3 +++
 2 files changed, 46 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 4ae18926a454..92a2ce906b6b 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -90,6 +90,8 @@
  * library as a dependency.
  */
 
+#define WAIT_FOR_CONNECTOR_LOOP_SLEEP_US 10000
+
 /* list of connectors that need resetting on exit */
 #define MAX_CONNECTORS 32
 #define MAX_EDID 2
@@ -8182,3 +8184,44 @@ igt_crtc_t *igt_random_crtc(igt_display_t *display)
 
 	return crtcs[rand() % n];
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
+	if (timeout < 0.0)
+		timeout = igt_default_display_detect_timeout();
+
+	igt_assert_eq(igt_gettime(&start), 0);
+	end = start;
+
+	while (igt_time_elapsed(&start, &end) <= timeout) {
+		connector = drmModeGetConnector(drm_fd, connector_id);
+		if (connector && connector->connection == drm_mode) {
+			drmModeFreeConnector(connector);
+			return true;
+		}
+		drmModeFreeConnector(connector);
+		usleep(WAIT_FOR_CONNECTOR_LOOP_SLEEP_US);
+		igt_assert_eq(igt_gettime(&end), 0);
+	}
+
+	igt_debug("Timeout waiting for connection status %d on connector %d\n", drm_mode,
+		  connector_id);
+
+	return false;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index fcbb6a5ade3a..951de7de651a 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1289,4 +1289,7 @@ void igt_get_and_wait_out_fence(igt_output_t *output);
 
 igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
 
+bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
+				   int drm_mode);
+
 #endif /* __IGT_KMS_H__ */

-- 
2.54.0

