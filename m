Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C0C3EA4FAE
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:08:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC36E10E377;
	Mon, 23 Feb 2026 12:08:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="IoSIpXoN";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6643710E36B
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:08:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 56FB11A116F
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:08:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F289B5FD43;
 Mon, 23 Feb 2026 12:08:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C7BBB10368F89; Mon, 23 Feb 2026 13:08:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848526; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=KJM5AlY31tkELXkBlgsMlAQLuUtsH8Ok5cM8/t3Ztgo=;
 b=IoSIpXoNdcyHje1NfQTpr/BHUG9Z1Bgdf/gz+iu07NeVTkOsF4DBddtOUPum6UceFLoIzm
 KE9VXabYL/c8r5P+Lp7ZeSDQkaFJMMRW3FJHyJKLyY1pKaMVhDlr29/7ef0N/0F71qnC29
 TEWNaU9kJocRONIL/676nLpvQsr/0dpBB1GnST8bO0pvOXWIkoeR7hmtBuRxWPmPT9Kpts
 5f5OF6I6Qc6ufqq8Nxq453mCZdeVkQqTrCg/BENLb4SO+DdyWE8K/e6gLJgIwfWzjEJ3Uq
 HTclVofSxL0uGIz3+gfSA86MGQX1eNNIGGnheQTFGJYWqSYXkFBBU6lfOcLwkA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 23 Feb 2026 13:09:10 +0100
Subject: [PATCH i-g-t v7 03/48] lib/igt_kms: Add function to list connected
 connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-unigraf-integration-v7-3-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
In-Reply-To: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3646;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=q5aHxxCQo5/aYclFHmk12FvFX0ddDbUr+nTcIk+NsvA=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpnENmKkTakAaylvd17gM/5ajMc/zpQ3TM84AbV
 KiDtTskZhuJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaZxDZhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJMfxAAtKXEgF0hUBZO3guMEqmtyrr39pzh/mX
 Y6q6/EpClw764/99eJGzmiigxYrwUS2I3GJIme1DJIVDljuwhUm1+6t32WiVAyiFh9z1yt3rl3g
 q8nwUPxSjs6czf1RLR1RiZLukbR7bSD2fGR6zLaDyWxylsRhEFXB/JYK98MZ5RXvAyCTM0yC7gE
 k44xt1/mWTFksK9lMmR5vR+0ZJG3UsploeMgDkAQIcIwS9zR2gcfpiWiW4NdI83MvNYMgU9toUi
 FkPtTJ+rppAE5f10o9GBeOiGG722BflTxayhFB+vXTkcBahIKYZdz95EZtRnNK85UvwpO50x05X
 b1zu+PvUTp7RMaIud82VdDdbQLK6xeFCavVDtCnyZjT0gBQ+5IuJV+zDpN++1K7OhL4wcx4DyCW
 3uOzLoF6YUGCZQr7aTm0AqhDUllqHKOxC7qUXlzfImqxtFPvS5S1fzVmfIOXUo5kvfmCIQqlZDh
 A5gQCmhvsDSqGZmlUhctD6Cv/HHk5Q95I/6buX7TYJoXVe8Nt15nB+rqQL+IHPNTNGRA/LE0+0u
 qHN2jIYzRVOKb/w+bNV7OYGPm9h1mLuMFCJqedyP/9y+BfSzUna3EBbzixpy3TXl9cDCZ2ywNJ5
 iEOmRMZnRTn+d6F8KExDRmsDoM4CoAFdTp/9SPy4Y3b0BYOjsr3k=
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

Introduce the igt_get_connected_connectors() function, which returns a
list of connector IDs that are currently connected according to DRM.

This function includes a timeout mechanism because connectors can be
unplugged at any time. Also, especially with MST, the connector can be
listed by drmModeGetResources() but not yet accessible with
drmModeGetConnector().

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 69 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 70 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 6435ea25db0b..1f9f30f7d8b1 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7954,6 +7954,30 @@ bool igt_has_lobf_debugfs(int drmfd, igt_output_t *output)
         return res == 0;
 }
 
+static drmModeConnectorPtr igt_wait_for_connector(int drm_fd, unsigned int connector_id,
+						  double timeout)
+{
+	drmModeConnectorPtr connector = NULL;
+	struct timespec start, end;
+
+	connector = drmModeGetConnector(drm_fd, connector_id);
+	/*
+	 * This time is required as sometimes some id in the connector list are not totally
+	 * ready or can disappear
+	 */
+	clock_gettime(CLOCK_MONOTONIC, &start);
+	end = start;
+
+	while (!connector &&
+	       igt_time_elapsed(&start, &end) <= timeout) {
+		connector = drmModeGetConnector(drm_fd, connector_id);
+		usleep(10000);
+		clock_gettime(CLOCK_MONOTONIC, &end);
+	}
+
+	return connector;
+}
+
 /**
  * igt_wait_for_connector_status:
  * @drm_fd: drm file descriptor
@@ -7993,3 +8017,48 @@ bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double
 		  connector_id);
 	return false;
 }
+
+/**
+ * igt_get_connected_connectors:
+ *
+ * @drm_fd: DRM file descriptor
+ * @connector_ids: Out pointer for the list of connector ids connected. The function
+ * will allocate and store the pointer in this out pointer. The caller is
+ * responsible to free the inner pointer using free(*connector_ids). caller.
+ *
+ * This will probe all the connectors and return the list of all
+ * connected connectors.
+ * Returns: The number of connectors in @connector_ids
+ */
+int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids)
+{
+	int connected_count = 0;
+	double timeout = igt_default_display_detect_timeout();
+	drmModeResPtr resources;
+
+	igt_assert(drm_fd);
+	*connector_ids = NULL;
+
+	resources = drmModeGetResources(drm_fd);
+	igt_assert(resources);
+	for (int j = 0; j < resources->count_connectors; j++) {
+		drmModeConnectorPtr connector = igt_wait_for_connector(drm_fd,
+								       resources->connectors[j],
+								       timeout);
+
+		if (connector) {
+			if (connector->connection == DRM_MODE_CONNECTED) {
+				*connector_ids = reallocarray(*connector_ids,
+							      connected_count
+							      + 1, sizeof(**connector_ids));
+				igt_assert(*connector_ids);
+				(*connector_ids)[connected_count] = resources->connectors[j];
+				connected_count++;
+			}
+			drmModeFreeConnector(connector);
+		}
+	}
+	drmModeFreeResources(resources);
+
+	return connected_count;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 27357854e442..86e0235728c4 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1321,5 +1321,6 @@ igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
 
 bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
 				   int drm_mode);
+int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.52.0

