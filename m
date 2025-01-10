Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D14E77188
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 17:46:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DADA10E50C;
	Fri, 10 Jan 2025 17:46:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Qh9GpT17";
	dkim-atps=neutral
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F8F10E513
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 17:46:12 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 248C3C4A48
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 17:43:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76B354000A;
 Fri, 10 Jan 2025 17:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736530979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HCQ+wGYu3lnuUyBoVf2LH6uUyXMptJ4djIjHBRM7LQg=;
 b=Qh9GpT17QTFvhHrYr7MLHs+P9hcJceVK08jpjSb1qR13Va1mcnSOLVfW14U8iG52IeVFqR
 N99qVWbbAvW/IZigYRnc6z3HUuVZQMgXM1eCdupck8VKTco86sIEmee9+udAnF99lwws57
 eL/8OKKHanC/U22SB3bH9260ErVrIlnJ/O3LFH7Lbfbvx+8cSepbvKrVZ4rTpI6IPCvOTI
 oIQm5vqCVS0vU1rhgZolk8ViMgO/oK8g6z1lOuw07GBktqJ8oR6MfZlIUqL8Ivcp42Cb9V
 33pD5Am4TrNOLUf1q7ON04WJ5QPgRBqs2RaTR+fayoatUB/IZnKnq2nBkjyZBA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 10 Jan 2025 18:42:52 +0100
Subject: [PATCH i-g-t v4 3/5] lib/igt_kms: Add function to list connected
 connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-b4-cv3-01-igt-kms-v4-3-0b0474708f9f@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3520;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=rJcLX88dr/F3AVsrhayvRbzBZdxAdnBK5kIQ2s3ZxP0=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBngVweCHJQbb3JYIZqxCtEECiKeJbVZmWZrO8O9
 cGArP4HHKGJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4FcHgAKCRAgrS7GWxAs
 4uqyD/9PgTW5Wokl/JwMjgF49WLkXnl4eigk4AEeIf7vO1+lWZz4MHvvyoaa9pQsVKfMHfgGYek
 xt41yU7JjqK1FIN0ia8N06u3ymf79gXCm7tE97r1N7BykfZCpaP7qjYYRQRH3B3CSZHFa8Rm/Gm
 UC76wpfC+mnRrXsUQegXSpth6moQKne7tMaQi7mfDCe1W5qA4+Y3JsKivieaNyXPVaz3MPQs/PH
 FNw0W1UaNbvOyZVQemJ3Qs5xrvQU1xKNrRhrZ2obkmHVE+f4m8NMYv9u+BKxXAR30wG4RNgBVLx
 JJA+yJAyi9pi++k1zPLW1bUhE2KXQBPRmpxhV2CTg14yj8oswarklYYpBMjNxeR2A3YbDdDNSdN
 FZl1rivmfyDB6yfRPYQW02DWogI/8ILbFKcsa2oTvSfazJDVcsD64V4ApucaWWn9cyg3QuqVEuT
 901q9njeBH8I023Ns1YRWlzjZqCnKJd6+iwkPckr3eeepSlrQecpXnqGF7GkH20N8quQ860EpFV
 sJyRXB4OSQFXCoNeh7OoUqOqeDdkP7SDlL/CR4wSrE10/Tg1QHsvSbv4czxs+9qnzAbQTW0WqRY
 3KUgR6RsIxF1LvY00QT8nTvbik2ReEvG9Z2d7wGwGW7OT7IzJ5hFiiuQXGoijBnN1I626QvlDQy
 3Av7iIjsQfRbhPg==
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

Introduce the igt_get_connected_connectors() function, which returns a
list of connector IDs that are currently connected according to DRM.

This function includes a timeout mechanism because connectors can be
unplugged at any time. Also, especially with MST, the connector can be
listed by drmModeGetResources() but not yet accessible with
drmModeGetConnector().

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 65 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 66 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index d0b6c70f135754d0a413f73a0f8e5b24a208a2b3..93d5a0d64df9954f7da8254ee35a0fd887d31d78 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7246,6 +7246,29 @@ double igt_default_display_detect_timeout(void)
 	return timeout;
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
+		clock_gettime(CLOCK_MONOTONIC, &end);
+	}
+
+	return connector;
+}
+
 /**
  * igt_wait_for_connector_status:
  * @drm_fd: drm file descriptor
@@ -7284,3 +7307,45 @@ bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double
 		  connector_id);
 	return false;
 }
+
+/**
+ * igt_get_connected_connectors:
+ *
+ * @drm_fd: DRM file description
+ * @connector_ids: Out pointer for the list of connector ids connected. It must be freed by the
+ * caller.
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
+	*connector_ids = NULL;
+
+	resources = drmModeGetResources(drm_fd);
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
index 6d5582290f61d1a4151dd8e8448fc26c660a1536..520d1b2f2056a21bcf25be36da32a63a17bfe364 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1281,5 +1281,6 @@ double igt_default_display_detect_timeout(void);
 
 bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
 				   int drm_mode);
+int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.47.1

