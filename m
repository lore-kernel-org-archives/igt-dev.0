Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B334C3DA47
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:34:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0355110E599;
	Tue,  9 Jul 2024 15:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="U9RVQsJE";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA75710E5A7
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:34:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4413420007;
 Tue,  9 Jul 2024 15:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cp9KN+ph0UvbHzFYhJ7nXT8Pw9+WmbAGSVRDQomKCEI=;
 b=U9RVQsJER+ACHSZg31gMLlXvtIjjOQ1xNQA+8h3aEW7VFuXZF5h81U6MaqIgnLlGQdSOa3
 cCxAmKatBhLQ1+LTMo3pg+RG8crBQNrliF6yLjf+4xAHt1koNcX795FOxrO77tzrqRqdV6
 OWPIi4NOQRRotaMy/uSEkhsdjWraV4618u8epyTgRxUCU1QjFp4fKRVe6f1pKZmoadsTQc
 bhNt+hZzA8lar0UfhPzbNZcdqCEk/dkd42+LZiuq/htMyDZFKw1ruV8ZG36jpVlEaqEoC0
 71Rfmlzzzy9IXCtF1AfO+3oUHaT34biy2psnHEDAwZrZbZ9VG+VSIa2vqQfsIw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:18 +0200
Subject: [PATCH i-g-t v2 02/39] lib/igt_kms: Add helper to wait for a
 specific status on a connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-2-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2286;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=ScAMIwFiMzNbIH8QJW3RAmR9a6BRZTet8OAqzadB7mk=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjViW6u+b+6Erkr54EiNrlztpd2wbeVo7b18fK
 7X+mbPu4K2JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YlgAKCRAgrS7GWxAs
 4ilQD/9p2LmXjzof6FZ9k/kLi8el4XAipDBXHTn4H4ePYlR3qMIt2Y6YUHK863qUJyYRyR2Yd9n
 LqSc0/mtYybehAhjLbig8yrKVNrN97VIi79ALHHiYBewKIrTUFyQKyxhG05tcFMzvsY/Ju5qn2Z
 mstQ84X8inOsxGa1xEhuE6eq7qCMoag5EWFbSQThv1LaYqP4/Rq5D89yYk4CzmftLOENRucMUjT
 rNOETUeCPzrqoKdywVu2BJMxWg75aBQDxZQlYGYq1ZVzF2ScrmzFe0FXJs/z+Oq2vuO7mTYpO4P
 MPf2pzWUVpcq4jzIUz6kYq9kBlOC+ZHmz7Qi5Gywb/xGadURpDCEOARepmgosZECml6UXSEcfMq
 6LyvyuDsLfYc5bQ8gbEY83JfdF3ZXKF7HyQQweTxK3Vg03+++nghP9H5JypTS+/aNEhbu7fnPwL
 o3clTUoVkL6YjXmQ4dXp4vSsYWjLVcrR9BXDIOvYGR/jQm3HN2NHjQ1wkO/7Ix3pthZSg+aIou/
 GDCVrBr1lO3v97ndm1zxmdBZMbaYdIR0TIz6pErJ4kD3g6iPg7FexXEyvsgZiMbFHGGT3URFaNm
 mmck1YHWOd5ZHfUwhad+O1+ZPjSIYnzZnR6CaFSCfu6rC6oBWhiBa3ViwPAgRxZX6dLDTMEbRfz
 F3b3zN1A4uzBA1g==
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
 lib/igt_kms.c | 38 ++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  3 +++
 2 files changed, 41 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 4877da4c6c9d..bb4c065ab4ed 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6686,3 +6686,41 @@ float igt_default_detect_timeout(void)
 
 	return timeout;
 }
+
+/**
+ * igt_wait_for_connector_status - Wait for at most @timeout that the connector @connector_id
+ * status become @drm_mode
+ *
+ * @drm_fd: drm file descriptor
+ * @connector_id: connector to monitor
+ * @timeout: maximum duration to wait, in second
+ * @drm_mode: mode to wait for, see enum drmModeConnection
+ *
+ * Returns: true when the status is reached, false if there is a timeout
+ */
+bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
+				   int drm_mode)
+{
+	drmModeConnector *connector;
+	struct timespec start, end;
+
+	if (timeout == 0.0)
+		timeout = igt_default_detect_timeout();
+
+	clock_gettime(CLOCK_MONOTONIC, &start);
+	clock_gettime(CLOCK_MONOTONIC, &end);
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
index f89e1be86b30..ba8658ce45e5 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1233,4 +1233,7 @@ int get_num_scalers(int drm_fd, enum pipe pipe);
 
 float igt_default_detect_timeout(void);
 
+bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
+				   int drm_mode);
+
 #endif /* __IGT_KMS_H__ */

-- 
2.44.2

