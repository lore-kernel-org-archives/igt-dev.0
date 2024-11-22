Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A536CE6916F
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 15:19:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5847310EBC3;
	Fri, 22 Nov 2024 15:19:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="EkWf+UZQ";
	dkim-atps=neutral
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74CE310EBC3
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 15:19:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A59D91C0007;
 Fri, 22 Nov 2024 15:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732288760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sHRu3St7yqiJh6t7bUF0psYFuRXr/Kal0Lq8i3x99Zw=;
 b=EkWf+UZQkIxI6WWnc7xU+UG125M2+XEVq4M3QzwynZQxnmAi3Va10qk9KfhKEfN2QT2Afv
 sTLLpQbkK+sidUAyxOZQStMzRj9iUvlAteZ8GdyU1JMgPsJBDa3Ey9vQcmLVGeuA4DfaSj
 hYVYjQdapfq7Wul24KP1JO+4EOCZ3NMKsnnmv2PqFGTsv0ef4TNrDFhNPABVHzRexGoUSl
 X4t3GgLoeFpIHAxs/wzyxQCE9h4AC2cSbgHl+h4WyYXEFCqOuf8LcCE85bhZllHERYKZeM
 lHJiklPiGMFYBm+PXCWyaC41nfZYu6x+TSlPoT8RvKQK3FuhOQbYbNOQf+jI1A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 16:19:05 +0100
Subject: [PATCH i-g-t v3 2/5] lib/igt_kms: Add helper to wait for a
 specific status on a connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-b4-cv3-01-igt-kms-v3-2-c5ced6976e11@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2484;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=jIZ+q1DleQZbmQnSm2milLqc2UsZIv1RN4+PhQ/YHUU=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQKD0tVsO+ghtygrJMX/2VIrDgfuwAdd9T11BO
 bV1x32TzuOJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0Cg9AAKCRAgrS7GWxAs
 4m/lEACkiRje3PuvAHdC4eh1f2d3refMh5S3ZTjLmn6zsFuP+Jlpne3XVBmRBWm0lTwo2Tre16r
 uSJIJLVerWXHmhMHMQqjvl1laQztL9a3wa8hjBGgZ77BRAr5el/fj9iHl6mwnp8JnzQ9nM6CMle
 EWBdsXMLq6y3YbJBmFuhjrKXpOtiqoLoq0cO1ssjk5dt0gYgNj5l8MZsIjpQg38+z5m+xZ6kAUw
 kOwZbOUb3OjnC2plTuh21kAVkwAoiWoYgFAFj/5q0RVBbr2RaXcmsu5iPzAcpVG9UTLZpnU3D5x
 dj0GNqOxgOlvNViJkAeCpUeabPn/o2lF1tkMQepDiRz34NLVd0aJpVjbolHG4IBfP7FO5ryqO24
 3/sSBKbiOkHf/3npFF2/88C3BIdA7Gxl07xA+2H02zXcaEw1RzYHSaIPEyzGvIhNrWA0O/m43+d
 5lmqF6TVCee7cyDku7rW6YyVP8KY0PEJvVdEZAC5caPK0TEaCRMToTmT26lXgYe2E6KD4NoJgOm
 TrGTS/4QLrNbJashb/2DYsw77xmLMgVv+PgtnyhBsxcd8EB5f4o06l5AuzIaGL7I1ywCt5l+BrA
 Z2e2zncBCw4s3+s6VLjzdVwqXnaANQz/xQsJH44Wki/tRnK5mQNCe1sQ2oHEsgaeNtvURBYeMqf
 HmHLN3Xtubxigyg==
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

During testing with chamelium, it is frequent to wait for a specific
connector status. This new helper is polling the DRM API to wait for this
status. This allows detecting new status without notifier systems (which
can fail if hot plug detection is not working properly on the device under
test.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 39 +++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  3 +++
 2 files changed, 42 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 0b76a47eb2135cca21881d97c2fd78e724d9a30e..626f56b8caa4bc0ba98c69aa22d0a6bf80aadedf 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7218,3 +7218,42 @@ float igt_default_detect_timeout(void)
 
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
+		timeout = igt_default_detect_timeout();
+
+	clock_gettime(CLOCK_MONOTONIC, &start);
+	end = start;
+
+	while (igt_time_elapsed(&start, &end) <= timeout) {
+		connector = drmModeGetConnector(drm_fd, connector_id);
+		if (connector && connector->connection == drm_mode) {
+			free(connector);
+			return true;
+		}
+		free(connector);
+		clock_gettime(CLOCK_MONOTONIC, &end);
+	}
+
+	igt_debug("Timeout waiting for connection status %d on connector %d\n", drm_mode,
+		  connector_id);
+	return false;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 3509283b6da5b3fdbd70ebdc9bdd241326bc5073..6c6df3f18dde72459d09b56192e108da5d951bdd 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1275,4 +1275,7 @@ int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *c
 
 float igt_default_detect_timeout(void);
 
+bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
+				   int drm_mode);
+
 #endif /* __IGT_KMS_H__ */

-- 
2.47.0

