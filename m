Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD8BCCFA13
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:39:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB97410E3BA;
	Mon, 10 Nov 2025 13:39:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="r7IGQr5w";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87BA110E3BA
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id DF183C108F1
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 514CC606F5;
 Mon, 10 Nov 2025 13:39:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6C06E10371904; Mon, 10 Nov 2025 14:39:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762781975; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=kRQnQv8JeS/kyzWYv3YmhXXz+qJvyK9czAQrlQS+HQ4=;
 b=r7IGQr5wD0ZwMzDMG7efU+b/7l+wAqQYoFjs2RjTNdCuPWljT5BzA0mBf83E/nGc7Oekj4
 3CEi+wkcpMSp8swUgA0DFuAXokduww/gMaxboz2y7nKMyCRqra5Qg/fG5PR9kbKC6KbhKw
 hv1wB0iutwdKCag80/pzHBh4eVNfgE+9go9Fvx2hPHs+iw+YRpFT48OZ/4AdCNJ4Bh1CFK
 WD0eP/4R4rKGx7L4Z3uT7ENQqMhsgOWkSkGT7c4OSvUenn/hRtafbpzQ90TLdquKfbE8n0
 hg9M9jXqNQbij49D+gno9wbJja9vrzGXIzZ08npONBQsSK8RzZhUCTNVfKg6iA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:05 +0000
Subject: [PATCH i-g-t v4 03/46] lib/igt_kms: Add function to list connected
 connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-3-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3457;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=w+uqoqsC87hrR4HTOucFHSD4+L71LrfgF+R8t1HLJOY=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesMbWcWDOgkUV0R+6dtiOKpRgEJz/j6kxLUx
 Z5gMnXMf0iJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrDAAKCRAgrS7GWxAs
 4nqIEADW+Mlq7+QCAH6CmBI6cEySKiGbBvaHbWGE0ym/nWhObsCP9i+Iv1c3W1i36iA74AVOMjw
 3HFypIopVC1ZrhtQKZwX6DJKoIncRLBe3FC/YVPXHuM5SZUPtCOqnmdo6AwnZodZcWr93Lf3vA+
 00ru/zKvYM9+57wEfG2jTcMgAxAc18Xy0NgJsOrNOrXDetsvgnAYFLzq4pNIFDuDyDXx1dKMHyi
 Iy2hkeZInw1cHzmfj/DzxSjkoq3jGRAnyP6c6bd0arF3PoUbP7AjkiVuje61N03XAL3eI0Yjng/
 /63PmJqfMSd+7RHBzdJwUHhXR6gr07lRn+T0NsS9X2MeuAzElaYmxg+ORyBpNd7F+RaVB9OYc9t
 ccyHdNMPTnU/+3A5QitXKpkw5iTGGG0wFB3RAm9QQvwFB1DBvk0wb2tDy5Ql9GJzTPr27ImvzVy
 KFKEJWLVuJ30iskKoaNCEa1dbfYY/Iv4Ej88Hwc+fT+ohxPtKRL5KS/aKqiN9GtrVEajCRUXhOp
 9p0LsgwQQumtnioLirt06PQikkwccrBjBsjCyeLSf3q9Jea4uJcltN0g6riyVJ+VZsPGGNsFh5q
 KFIBlqQWj3mwUO3DJeuERO7ZL0/bNgzCHdm5EmzxYVNcpaH9IP1nstVXr/sAjnklH/9MxHvi+Rm
 8zlyutUWzCUAJoA==
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
 lib/igt_kms.c | 67 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 68 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index f5bcd6d6b573..6392999bb341 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7621,6 +7621,29 @@ double igt_default_display_detect_timeout(void)
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
@@ -7659,3 +7682,47 @@ bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double
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
index f70a93f34fae..c520f3b80e6a 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1304,5 +1304,6 @@ double igt_default_display_detect_timeout(void);
 
 bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
 				   int drm_mode);
+int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.51.0

