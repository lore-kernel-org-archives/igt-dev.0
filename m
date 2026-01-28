Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7192D25B5A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:14:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC7F10E6DB;
	Wed, 28 Jan 2026 13:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="kiAdbBmr";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B05FC10E6D2
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:34 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 542D5C211E5;
 Wed, 28 Jan 2026 13:14:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CE4DF6071F;
 Wed, 28 Jan 2026 13:14:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 850AF119A8814; Wed, 28 Jan 2026 14:14:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769606071; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Oq0QpkMDQVCdffFpsSyfuiomXM6WNhZNuTL4tUzW4BA=;
 b=kiAdbBmr42BhFF35MHlnwP6+W2sLtDMvtgpHmhKWBGvfEIkYXUjw5jETE/QKqES2INvUwB
 TUjbg9UaIhpMCmusAdqIleGMzdO81qa3qE7UVV97bqlO28liybpKY9idPZV1sniI0uMUDH
 g1pNaBmh8q4mzdkuV8GvHKosB/kMLQP2B+kDNAFliNehIpMOYMugY1BAIUCEXL0sizD90C
 oSLc6aiy+nJH5ewLpPitanUqNqQhgo5nccXkCH/G8qby5+oGl+I4f2T9H56G3B3U+q7T4O
 aDmdb3l2DEBXFUE7OCq+y+al262MxX1HGNCVfIetUluCrS/FahNAKu/ZdGPWig==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Jan 2026 14:14:34 +0100
Subject: [PATCH i-g-t v5 03/48] lib/igt_kms: Add function to list connected
 connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-unigraf-integration-v5-3-fbf2e997a011@bootlin.com>
References: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
In-Reply-To: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3512;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=E2xt3RKlLkLpdePOf60obJZb3mHpqSNJUOZ4vTnjWBs=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpegvHbiCI0PUk7iSDf5trGEp/8Oe63j4cvNH2M
 OZdZBP1RAuJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaXoLxxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKLFg/+KMT+TFa/mM45k6KxS5nqKGb0rcNCK4E
 a+2QBqNK7JF9f6FqY0Ofq5KiCQ9PN7K3JSSh7LXLp0odx/zaAkeDlPh1hKDdEFvwJ77PerrPkyl
 gxWINzPPjAxNxEbnbORMbLIPT9lxJXao9QagaQItXJ/8NETAbaBUXD3aIXj56rYYWaaFGN1fNQU
 /90GdS0v7mjAy19u/wCuo404b9rm0qfSHGjnAy74iOXcywmmys9JBkhvTxJO4Ai9O5t/yJF+agp
 IQZy58dhK2XSK3z0Vvv8pFMVQW7Tkd260/C5Dktz6WsShSleB8Ro/AK18bCVl38HOrEd8/kK7q2
 uxbtyZzIpZvmAjH08owFoLJ4ISSeKSzU31MvETiFcPIVtT7StqGjwdIMbfKS+bgljkjM7p1Aiv/
 7Lnko/npv5oA7A/nkFUQWxeFr/d0qN91ZLb+uzxF7ci/JM9ZARowGNc91K2iubBzMP8zfeSHg0P
 FxkP0qWLkuO6ePza3N5HJUpQIwclCxz/GZ/+Cen51XxHyfxQA8wW/J/Bjh5xzhbmXPnrwaUVBLm
 +0k8N5uNoxBqesLEcAT9rrysCRdGislgmGiDxl6nC56emoDtpsVtObDVjWJzRP++JU3Om+M8Oq2
 dHz2ep0r5vltyaR4EVDlkcN+cALEqONrnAw62f+NWsSq4/egNBT8=
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
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 lib/igt_kms.c | 67 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 68 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 4082c49eb46f..c0cdcebf9469 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -8024,6 +8024,29 @@ double igt_default_display_detect_timeout(void)
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
@@ -8062,3 +8085,47 @@ bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double
 		  connector_id);
 	return false;
 }
+
+/**
+ * igt_get_connected_connectors:
+ *
+ * @drm_fd: DRM file descriptor
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
index 691530db88fa..d82ea9f9fc10 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1314,5 +1314,6 @@ double igt_default_display_detect_timeout(void);
 
 bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
 				   int drm_mode);
+int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.52.0

