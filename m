Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBF6CA0EEB
	for <igt-dev@archiver.kernel.org>; Sat, 23 Aug 2025 02:17:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 816DE10E06C;
	Sat, 23 Aug 2025 02:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="1nm7GXxO";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8BE10E187
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:17:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D895A1A0D79;
 Sat, 23 Aug 2025 02:11:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AC074606A7;
 Sat, 23 Aug 2025 02:11:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 011AC1C22D382; 
 Sat, 23 Aug 2025 04:11:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1755915102; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=tObusoRQfepLyHyfddwxF6+DFE/d8zi1WV+yjFi/Obo=;
 b=1nm7GXxOYlX5IKzPrcau/FtXxXHvUcgoNxHV7R0yrYvEMEM19hLed9mT2MOr5jYW9rDgpq
 Baz0Ruq3jkx+tjItNBA0bRZkd+IFNH17m4Me1vzVG/7CWJ0CJ40Ix8vsjpre5t1GqqEFLX
 krgBXeJ8tLxpMeSAYOYmXdUDYKZMMEN7ynyKSchRvZY+gjUmsPiGeTq/nvPy0SJjjYTn+m
 xVXnF0NVKazVXAztKh88YOS7VBKyL7+Foa6FAzdptOS7bNTVrCb8wjr3JUw/ueZI7EN71Z
 h9OrgVN72Bh9lflqUKZ8L7ojQqPrR2a1l9dNR/DaUXXbIOqcKSEDio3DRl/qog==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 23 Aug 2025 04:11:22 +0200
Subject: [PATCH i-g-t v3 02/29] lib/igt_kms: Add helper to wait for a
 specific status on a connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-unigraf-integration-v3-2-cdc36d5fab4c@bootlin.com>
References: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
In-Reply-To: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2529;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=RyxFqbFp5ePsazepYCUzL04qs9Nhc/AvR8Nu10J1fZc=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoqSNS1u5TPub2YE9aOx2xp8reNaVysY8D/D7Iz
 TdFHB1q/keJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaKkjUgAKCRAgrS7GWxAs
 4iibD/9N9oKe9YWIj6/FfXEMpKzBNawdo5+pUTZHVWB4d1LHgT2iK6fjDVUb7yQTAkaGQwdW0V+
 MP2Cp17wUkcvCyu6s1S2P+8f7h0IV6rBkqkwBN5gha1yXK6m96JyXJBT4d2QRC3HvfNZVh7pu7d
 9beazY2ch64fs1eKqw5d64EncndAIbRdCHv5WqUMq4DLhh6KgoJA6wEsuknIMYKfwweTctUA7Xi
 Bz1x4e9vcqrzjhCu2Z2ZhFRZDKo3ijVCn+I16TMNxS9/YNjx8rhwOweKylo5jXlgcpR4UoYEl3M
 TKOSxMwwpKyLEaHU0KjErC8UiC/aEdxW8VSCb2e1zSAWMxYgC3A1pgdbEWq+cj4406GsgYrq9JG
 d5IWstCbCwMRLeKfTs+9agD/5tEBl3nxQLolj6JkjKxVDioWDXVcaHgZ+6HEkZeKzvPp3n7Ds/1
 3xAI4yQppLpIoGph6/Rqxlzs9gMTmcD/XSn5aBbb4mlIRkCDx83X5oUF51k3RBqiy065t8c2mLT
 Q3D+C0OlVafU8HxF2NgBS+kvPyCTca4ctEa32V35Iz0G+S8jFTCaaOtvGWUXZDnpsiCKjcKMDf3
 P0euMsauTxIxQcUf9WvJTzj+aQvdXkP7TvQWbk8xDm+Pu4iyfHPX4rP1XXvf2IgiNnWDW8k/5L8
 Cqd4YqIwDq1ySpA==
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
index 11e957171a1000889601d56b2c12af9d3d95f754..f24fa52ae715607515c18962f30e1c45d5860303 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7572,3 +7572,42 @@ double igt_default_display_detect_timeout(void)
 
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
index 83d1ed427cdf39875a8f9db48b17eb20978ebfc2..02c68737fd68a3dfee9aeba17489a17300e0bf67 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1299,4 +1299,7 @@ drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output);
 
 double igt_default_display_detect_timeout(void);
 
+bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
+				   int drm_mode);
+
 #endif /* __IGT_KMS_H__ */

-- 
2.50.1

