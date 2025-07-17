Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD58C83F1A
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 18:46:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B176510E324;
	Thu, 17 Jul 2025 18:46:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="P2tr9qRJ";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB60F10E324
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 18:46:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67A83442AB;
 Thu, 17 Jul 2025 18:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752778000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e38lD9vk+ysux4AbBC5reALddrCnrhs00b2pX9lIp0s=;
 b=P2tr9qRJSUajpBUA86MSVebZZRALzRAGl5ZMmjtPw8TV7vD4yeNs3FBWGA6Eot3ARh83sF
 fFi6YV7XWFSmV9h2aqoVZDmFkskWiOK8DnXc9b2D0b+FTwLDWlCjdHgg/jZZlRttpxgXBy
 MSGfp8TSk9uLDWZdo+6AwPpJjieXfPCGWHNtp/UoR9oHIeG83fvMvvPCK/bEGLGTPBEjxT
 x/X6gSfwN2DUh6vgjZNxGTq3lhqt7sRBxUSEJC8vn+D7ETd3Szm2foqASoT2mkH9PoaBwU
 uEyKmwlgRo77PsXau9U1Pqi7cMV/IXd8kfO+p8YbBxMKZpol0zFO4QAFRt9IIQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 17 Jul 2025 20:46:22 +0200
Subject: [PATCH i-g-t v2 02/26] lib/igt_kms: Add helper to wait for a
 specific status on a connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-unigraf-integration-v2-2-77dc329e584c@bootlin.com>
References: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
In-Reply-To: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, mark.yacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2532;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=EqQU69CSJoxVS/6dKD70rwDoagXW/Lunfusm945+M+o=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoeUUHse4mxqx2qIOTya5LAjTn0OleTwuV1SYf/
 JAUPPmzuPmJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaHlFBwAKCRAgrS7GWxAs
 4uEFEACG7O+RxRfWCcRDJ6bnpRxzIZsihbP0pVPjZMmrqa4cajp/3SDQolt03xHFLrfPIJUeKyt
 hfcly0hSu2HKZP9+hvnEkBziw6j9jaNCHXBEn7ZJ6kFzUmGx4x2nwWCKDV4zE4jNZVfcRFVf/R3
 5qUBEIWSww5sq2UZC2ek8zHGtn+8jh9YofzB6ZigScXVBbWY/g+EQKy9HWYc+Ztzy4m+mPiIfLI
 an7FuJk2qPk+tLuuQsBvWSnojyGXrzLwVfTZVFCtoGvPoHhH8ow1oaIOGbO99q3uuKtjJUPmnZ2
 cvvwrGzNHLSkXOh0EuCv/Qi1TiqrpRfnKOZWGMt9Ix+b6Ub5sZIh7PqiOVTd+G9ikhpbK+13++h
 QrJm7uV3/XOEYzdVtdZ55m/ZTSTmTPtW6kCO5LbuJYTSf4B9mMZ6KCC79KNnmM4rAKa95Ph0mDC
 GwYXR97iDOlLuna39T2YB5kYJ02pU8wHi2AChQVaL/ewPzc4YajV7on8Vq71EeowMZX+iz+UR+Z
 ++czlCF2FNqKVTZ8ZClLQK+9q/g2UnBuFp1E3yBKnBQwiwSDyt0HNIh5zWKqrrYb+DuIyV+AKwh
 E4kn81CNdG6o8PXAwae3MUPTFuZMh/fr/stNd0Y6jU2wT5TfQ91h0eWRuE3KbTVY3M4ttL1lY8I
 H9n48tPzQy5hvDg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeiudeffecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehtdejtddtteeiiefgleejkeetteevhfdukeegleffjeehgeeivefhgeduffdvvdenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrieejngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepihhgthdquggvvheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrrhhkrdihrggtohhusgesghhoohhglhgvrdgtohhm
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
index d0dcce5d008eb0e1953a2b60a6670c98562ba7a1..ad3a31b7a487f986083c6648e2cc1f5f14d5b4a2 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7507,3 +7507,42 @@ double igt_default_display_detect_timeout(void)
 
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
index e39745b0a68cbac4bd57c4c4ceae82a64cfab5a9..1a2ecfd154769e5fcc755f126cd1e9c8dd1bc7c2 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1291,4 +1291,7 @@ int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *c
 
 double igt_default_display_detect_timeout(void);
 
+bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
+				   int drm_mode);
+
 #endif /* __IGT_KMS_H__ */

-- 
2.50.0

