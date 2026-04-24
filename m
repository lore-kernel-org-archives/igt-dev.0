Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C4FFED3F1
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 16:55:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE4B98961D;
	Fri, 24 Apr 2026 16:55:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="GLiRXbmb";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B81A38961D
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:54:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id A6E311A3404
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:54:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7F441604EB;
 Fri, 24 Apr 2026 16:54:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7584D10720A14; 
 Fri, 24 Apr 2026 18:54:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1777049670; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=TYU0OlLUKcUzjwkzrFMHNYaIq4VTWmCL9j54F0XpD44=;
 b=GLiRXbmb5c8tk1YuWRiPJ2k8GOjteEmHU8YKGPK0JPvzk73tw6TkG49bF4HEB6oY2rY8p4
 FsnWniNaALWCY5hF0uz9m+7GscaYlaGXNKJFtMYZ4y0eDVF0YznaB41Ma//ZGFm0lKSfuM
 XedF+klQ4xqSKStW0Y6SLK9KCzWZwrvnfnFE9d6jnEU8+s37vyPbDc4kanb12P/T7DHC/P
 Tma8XTxj1c4yjpIWzBDaioqhE3mcdlqE1zUq0p1lHjIV/Nixd6saHnuSpOhljciW8H3UJ+
 6EZV9XPkta5N+zksQR2m3w6Opx0qEDzlx5yVG35EDAWnBcQK5L8nBCZPKgPszQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 24 Apr 2026 18:52:38 +0200
Subject: [PATCH i-g-t v11 03/49] lib/igt_kms: Add function to list
 connected connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-unigraf-integration-v11-3-0c5f5346ae60@bootlin.com>
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

Introduce the igt_get_connected_connectors() function, which returns a
list of connector IDs that are currently connected according to DRM.

This function includes a timeout mechanism because connectors can be
unplugged at any time. Also, especially with MST, the connector can be
listed by drmModeGetResources() but not yet accessible with
drmModeGetConnector().

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 85 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 86 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 92a2ce906b6b..dd733c3bdac5 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -8185,6 +8185,31 @@ igt_crtc_t *igt_random_crtc(igt_display_t *display)
 	return crtcs[rand() % n];
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
+	igt_assert_eq(igt_gettime(&start), 0);
+	end = start;
+
+	while (!connector &&
+	       igt_time_elapsed(&start, &end) <= timeout) {
+		drmModeFreeConnector(connector);
+		connector = drmModeGetConnector(drm_fd, connector_id);
+		usleep(WAIT_FOR_CONNECTOR_LOOP_SLEEP_US);
+		igt_assert_eq(igt_gettime(&end), 0);
+	}
+
+	return connector;
+}
+
 /**
  * igt_wait_for_connector_status:
  * @drm_fd: drm file descriptor
@@ -8225,3 +8250,63 @@ bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double
 
 	return false;
 }
+
+/**
+ * igt_get_connected_connectors:
+ *
+ * @drm_fd: DRM file descriptor
+ * @connector_ids: Out pointer for the array of connector ids connected. The function
+ * will allocate and store the pointer in this out pointer. The caller is
+ * responsible to free the inner pointer using free(*connector_ids).
+ *
+ * This will probe all the connectors and return the list of all
+ * connected connectors.
+ *
+ * Asserts if:
+ * - drm_fd is invalid
+ * - drmModeGetResources fails
+ * - reallocarray fails
+ * Returns: The number of connectors in @connector_ids
+ */
+int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids)
+{
+	uint32_t *tmp_alloc;
+	int connected_count = 0;
+	double timeout = igt_default_display_detect_timeout();
+	drmModeResPtr resources;
+
+	igt_assert_fd(drm_fd);
+	*connector_ids = NULL;
+
+	resources = drmModeGetResources(drm_fd);
+	igt_assert_f(resources, "drmModeGetResources failed");
+	for (int j = 0; j < resources->count_connectors; j++) {
+		int status = DRM_MODE_UNKNOWNCONNECTION;
+
+		drmModeConnectorPtr connector = igt_wait_for_connector(drm_fd,
+								       resources->connectors[j],
+								       timeout);
+
+		if (connector)
+			status = connector->connection;
+		drmModeFreeConnector(connector);
+
+		if (status == DRM_MODE_CONNECTED) {
+			tmp_alloc = reallocarray(*connector_ids,
+						 connected_count + 1,
+						 sizeof(**connector_ids));
+			if (!tmp_alloc) {
+				free(*connector_ids);
+				drmModeFreeResources(resources);
+				igt_assert_f(false, "Failed to allocate connector_ids list");
+			}
+
+			*connector_ids = tmp_alloc;
+			(*connector_ids)[connected_count] = resources->connectors[j];
+			connected_count++;
+		}
+	}
+	drmModeFreeResources(resources);
+
+	return connected_count;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 951de7de651a..75398a0f6369 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1291,5 +1291,6 @@ igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
 
 bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
 				   int drm_mode);
+int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.54.0

