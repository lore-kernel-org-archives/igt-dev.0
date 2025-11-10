Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48190CD13D2
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:39:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBDED10E3BE;
	Mon, 10 Nov 2025 13:39:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="bI4n53nm";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD9610E3BB
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id BBCEB1A19A8;
 Mon, 10 Nov 2025 13:39:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 91BBF606F5;
 Mon, 10 Nov 2025 13:39:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9057710371901; Mon, 10 Nov 2025 14:39:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762781975; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=B+C+FSHfxAT/nySCSw7V/fOHUlvdlFyQEIwDMXpD+kg=;
 b=bI4n53nmQvUm2DLk6TfD2fowx/2GLu8RmSIWF8paiQWOLEVTrMCW0kEgAB4d7C4g72g3Zr
 3ye/EGx3oNX3/3/Of4QuyPFEbpGD/2qAEJLYmETvLXZo2aAsW2MbiXinxES/bHPxUKSOgU
 EhDup2/jFC/PZo8nd9cRaADIbW8l71bYq86dSdNpdYdHZTtthDFvHWmJK4sNBC9YgXrerD
 Wm2FrN/5pleDa1TlFJWYsxz17wapK1dObxfjWEseoemDPP8usJ0qabPhoZscD99pGgXUgG
 ew7WHUqAmDxiwSH07YBHKYMfqzY5Qs3FzaF2tVvSU8zNAEn4EDcGGVzm159nNg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:04 +0000
Subject: [PATCH i-g-t v4 02/46] lib/igt_kms: Add helper to wait for a
 specific status on a connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-2-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2417;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=OdVXB07Bum9vk8dYxHt//EyKkxQttItNQ1ueCDP775s=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesMJYt34OM3OyrZwxZv9LxZK1TJQUFDfFG1z
 3nbLAZhOUKJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrDAAKCRAgrS7GWxAs
 4moyEACRqr/jNlnjx5s2eCYR8j/nzW93s/bTVw4/X9atYon5wBDz1YjDYUac6ixexCgeup1UdVA
 gI1kUcTzFLLysVglCS+09Z06PMKKK/SJoZfX82xmpOnrVg8aW3R1zMDsxnpgQ9Y6IqSmr/S24W7
 nCuCHHCdDQ/3eobnbxl3JWGgfvVucrIybAG0QZHHc6K57lpKPghXgdoue4Ryxqp7pOEW4tsDdaL
 vAtweHkJDCjYiiLDoj5f8oEcOweSOpAs5GuHBPSlzVm/jbKd5aaNZdqzrSrantg7dumKrGpUsT6
 +WgiXPfO9r+DT6HxZqPqIgVW8LdKN0ExBzinQvIW8ldzYetLQQNDvFTdK3C3spoejhIFH4BwBGS
 5ahRJDnwPPD+z5yJfPxjo2RWgK1gDerEYIUBjnMZaqQzlKHSYzTTEBuOVBzZxuQaWN9WZRNTOLD
 WJJ8cryZsx80nLgIlMXnRQK1Gf1lOeH2HXRljN7l8MCsRecnVwlawtgHwt9WTdGaPO0I6k/dkP2
 mE43cSQmAYivGWjYAnL/tiQfFVhjkwwRlkaA8jThrMeFHh6dP1IjnrR/sUZ497607LiNTVNhvFv
 IZmb6olKQrje97VgnufD/FtpKWZG7w2CGvhx9b3lGPxoqmlmNLv8e7zbr9wiQ/UD78LvKrtghdy
 aiX0wTXGApyH25A==
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
---
 lib/igt_kms.c | 39 +++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  3 +++
 2 files changed, 42 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 708cf82ae357..f5bcd6d6b573 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7620,3 +7620,42 @@ double igt_default_display_detect_timeout(void)
 
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
index 513e1ff59d22..f70a93f34fae 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1302,4 +1302,7 @@ drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output);
 
 double igt_default_display_detect_timeout(void);
 
+bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
+				   int drm_mode);
+
 #endif /* __IGT_KMS_H__ */

-- 
2.51.0

