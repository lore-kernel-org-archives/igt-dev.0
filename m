Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B341BEA4FAE
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:08:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED7110E36A;
	Mon, 23 Feb 2026 12:08:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="r8ONvWvM";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A6A410E36A
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:08:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 06791C143C7;
 Mon, 23 Feb 2026 12:09:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E2FFB5FD43;
 Mon, 23 Feb 2026 12:08:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D582D10368F86; Mon, 23 Feb 2026 13:08:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848525; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=3HxSL6r6sV22H587yPbLCIwQdMvbpGxxa7PN3pBVl08=;
 b=r8ONvWvMa6AsICW6e/rWQ6lnbQJuxtew7oB8i7iqFBJ5w1e2YhMRmXjMQutueCOedr2/J8
 OV5H2p9tfXQP9oNnpBtdobYxoUjfGNxy+qhtvdFYB065DK0qBLOxzcXajrKh++PEIVbsCZ
 uh1BhBjCKe4FJFshNuR6s+DVBBoaTzcRYFMBmgJn6V34IkjkTbaVyAvQgqMrGpjVJBk4/j
 oK/BZJy0nLd8Y2hii7AhnoYpQZ+NzF3GR9WBxVISCoDtt3n0rQBqRUQxCNVUxr5NfgU8a3
 Swaa9d/CPoCSJyKWLSUwCDDjlswiStgepGNhtFKyCG1ilW3ZLtqz2lB6iev0oA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 23 Feb 2026 13:09:09 +0100
Subject: [PATCH i-g-t v7 02/48] lib/igt_kms: Add helper to wait for a
 specific status on a connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-unigraf-integration-v7-2-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
In-Reply-To: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2518;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Lqv3saKmoXNAm15IyOhXqR7nfxtgosLeBMEWToT6+w4=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpnENmC44xCVWI1gwpin0hPkCqJNhcqxAQnWwg2
 cYeIya+j9CJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaZxDZhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIe2RAAkbyCmAhB3IjkpMwxxm3zg+IIHu95qqv
 wjaP5Rb0b2AqMbKl5S/HS8ItQOyKjxrQ7LcxAace8KG0vWep+XA6Pso67DsbEBExTT6VFdldy4J
 cgY/6G91xGJ4hPBE5lxVpuJSD4/SsaJEcWKzTf5KLj1rzNpDAhV/6i9+DpeMtmal8Fo687ErVUy
 MwREf6vtGToflBlhm8IGQdBrgpgWJcyJ32nBlurNZjvDHdWJo6O5c8nWYmZV01zdXV+heuB0Ghn
 urEI/Xh6tHA4tTzaUqGj8JXYssUhLhnIBzXU4X5jOUASGmzyWzpyCR1Bw6Dm/uqqM1UH2ITmhOy
 y2XZP/9PbuVFPLX8YcHGuWJNpT7SZwmwkvoeqvU1aFt2iQjAq3NjfbEMLvMMMUF0uXSv+MbMeMH
 5lOZHkUrTLHZm30nM7FiLCgwA30OSJuLnhF11ZKP1/+Ey7OkEqkGzqlybtjkFSz3P07GDtdgA3G
 mHZlYliwbbfB6uNPP7WKOxN8VPGY/217BP4DJ39ue73tU5NX/BNS8v3qWPb7OdhPntw+zANrV5g
 2GvhKDp/z/M0z3t/pn05ZWMDsE//xwF3pA4jlQ2aQNH+JQbqsKT6HWmyUev02UDVnxWe0ayy7ht
 acR9YRSFqDKzFTX5I+cSTWaQ91+mpVGHqO+/rEQKHfXC1ot081mk=
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
 lib/igt_kms.c | 40 ++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  3 +++
 2 files changed, 43 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 65e657cffda7..6435ea25db0b 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7953,3 +7953,43 @@ bool igt_has_lobf_debugfs(int drmfd, igt_output_t *output)
                                               buf, sizeof(buf));
         return res == 0;
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
+		usleep(10000);
+		clock_gettime(CLOCK_MONOTONIC, &end);
+	}
+
+	igt_debug("Timeout waiting for connection status %d on connector %d\n", drm_mode,
+		  connector_id);
+	return false;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index dedc3f88055b..27357854e442 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1319,4 +1319,7 @@ void igt_get_and_wait_out_fence(igt_output_t *output);
 
 igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
 
+bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
+				   int drm_mode);
+
 #endif /* __IGT_KMS_H__ */

-- 
2.52.0

