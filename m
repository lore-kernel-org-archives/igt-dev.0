Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D604E7719D
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 17:46:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 760E210F147;
	Fri, 10 Jan 2025 17:46:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="D2LP2WbR";
	dkim-atps=neutral
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F4F10E50C
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 17:46:12 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::222])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id BA83CC4D0A
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 17:43:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D054A40007;
 Fri, 10 Jan 2025 17:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736530978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4SacgNO8bU5J6F5ehIenkg9/5ejr/SoVnNDz4DAu764=;
 b=D2LP2WbRSnDawE6G8PwEMF/ig/KsNmwYGa9xcf1Va0yUJgj9M8jwvAUkcgxf932CbRor9q
 i5X4QApJ3bUAsF1CwMvr65wmawLckLwK8scoihsWds+wG6nOVft9o+NPGQXo4yVM0vyenE
 oovDvspib7J8bshtIswTy+j+AaJssFAJkE6HVRYVOSsou4ltx/9IeYnLLzrRxuoTUVewDw
 xAkfc4g4B88y/d879Qb/a77dq/D1RnOZ5n7cgce0WJDxUhVJGdsRqO5JCrelpsmTzGw6Or
 9JMoAACpDwx4FGZqm+GN/8s1nOrrt80ilaDZW/m8Qrd0qIc0I0VFgxtn+zflkA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 10 Jan 2025 18:42:51 +0100
Subject: [PATCH i-g-t v4 2/5] lib/igt_kms: Add helper to wait for a
 specific status on a connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-b4-cv3-01-igt-kms-v4-2-0b0474708f9f@bootlin.com>
References: <20250110-b4-cv3-01-igt-kms-v4-0-0b0474708f9f@bootlin.com>
In-Reply-To: <20250110-b4-cv3-01-igt-kms-v4-0-0b0474708f9f@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2500;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=jEKyLcVUVxAx9NXjxY/ZXiOHaSTS4NsawyuxLuqpiU4=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBngVweWBXidpWHLTEMQC2j9Bl/oFhHn9GVeC+E+
 eDGjXCV/XWJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4FcHgAKCRAgrS7GWxAs
 4jeWEADNqDxYlgelMxNFgL6WvnFxmVDL470gQNQoyK+QrizS3lEivKhfzfd6rtzFU98s1njFqTb
 9OKS/CojIa84BeluG3SZmZm7wAx6eN3BRFQFiABGWBhj88Fb8o3VVXfRrsj/DUKtOjlayL0JkRC
 PydB1R+AIKSFFA951KcQvRfaPmxqqu4q/KXixfoylYQaNAHpYlfmpiLpfKp24X4M0HMU9sGdTMd
 t/35R8HqD+ounOq1HsyHU8FJ1nZ0zVwVBA3wpzVfgzlqxQFNo+MlA+mGarTi03FYsMtIbxEIBTB
 aC2E9RdrxrtrDxvsG7NMPMnGc2+BcVM9Q89TptvfttRHO6zStktthXHJFVd1s1UhkE666jAYWfZ
 XgW2/v7GG6XGR4usYWar7ubT7MCUKQPRdtFhzXg8LLeur/0AsDz9giszvF+loBd27qj/mmm9jxk
 K0n+1i94SFSNP2kYUIPQibIX2sSiz1W8Ej4IRSDdBKd27sP3au2CXhz+YCLlG2sY6ct8vX4GW4U
 xh+/RrZ8P4rSPn2QiN1mPEr62KgtiIw0cnysFapOUxYYHjofiRDYP0gWr9fo6u1WvVDnvyY1d0H
 RDPxeSl0UASzcUslRaJ1ZS1C1kgvv8UDHO96+ADqWgSPZSEV8Lr4m42AeJhlLAwrUUogHDmOvyE
 5zA+4DU1ZZul0Lg==
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
status. This allows detecting it without notifier systems which can fail
if hot plug detection is not working properly on the device under test.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 39 +++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  3 +++
 2 files changed, 42 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index b3373435b252c9f8c5d5854f738f7f4bbc468964..d0b6c70f135754d0a413f73a0f8e5b24a208a2b3 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7245,3 +7245,42 @@ double igt_default_display_detect_timeout(void)
 
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
index 91a26f2070efd26f9d107841ae3083b281d5e4c6..6d5582290f61d1a4151dd8e8448fc26c660a1536 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1279,4 +1279,7 @@ int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *c
 
 double igt_default_display_detect_timeout(void);
 
+bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
+				   int drm_mode);
+
 #endif /* __IGT_KMS_H__ */

-- 
2.47.1

