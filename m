Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 265F510F92E0
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:13:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7D210ECBE;
	Tue, 31 Mar 2026 17:13:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="R+/fM83U";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95A610EC3A
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:10:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 8BC5E4E4288B
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:10:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 62ABE6029D;
 Tue, 31 Mar 2026 17:10:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5611D1045028A; 
 Tue, 31 Mar 2026 19:10:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977052; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=pPBgQzLRDUT0tU0f8hQz3VMH+F1haaxzU+dHF1K9njU=;
 b=R+/fM83UUn9jCUNBShIuTRDK6jEjq5LdpqKVMTgTCynh0QqdbS56cmBiZWwP/EVq4Ki50Y
 KpMfhC7utRoGXran1K4Epx7gCejOl/oNuuSJfhnqV//5pjc7xU8WMaukIW6Gs0ll5DzFGk
 HCsvcE7LjcHpSftnqWy3IKEqLsVD76SGAlyhYRZotm9qbbAAHytLpymwo5ZtmQa7MhGyqq
 urUhCcLKZiH0QORRgtZLqv1fRYX/GvXiKev5ET4TzuCOejg5BPwTGKStc1oYS7REuMv+u6
 bn4q5ter/foi/nxYJzq/5zmAglIe6HXcnXmMUZK/ArJIOtukc2xBuzin/ZctZg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:11:20 +0200
Subject: [PATCH i-g-t v10 03/49] lib/igt_kms: Add function to list
 connected connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-unigraf-integration-v10-3-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4164;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=f/mMRxXoDiCKGfiZnjH0mGI9yfHpEyO0+9rEPW38GI4=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzAA74ZKOoMWOzvF2WM4LvCrYnPiBCrXqCkk6F
 OWeLcArX+aJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAOxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKCpA//dK7F81ANVqJ0ZNsXaIhIJb2MLOi5z/9
 HZpDQfOiQfG6Kx91FPj6AazoaouhemCv+ad/1FmkY8HH+sKxrUDiZ9jnEhFzHivc6ARsBQ/TgiF
 aPkGPZW7s16fQ+MrQPIvsZo42B2WSr5kNgncFhuPaoE0lsJ6u8sXEQcyMzWTh5kD6fRbvLLvIXp
 stkQYFqoA2zN1FM/IlxYD454BjacddAZxN/jrIiZbfYuGIIvMp/GLuwREQVXwlqz4/O3yXPq/T2
 HndLD3vPQR6dJEKmhF2EtgPaCYKXTfl4N1xAwzif7Mowd6sCqdrdFjjOIgIijGEiLBhyilYiAdB
 HBniAk5tykKtNmxPzXmr9uxvTr1HSqRjpwBuDJ38xV9XmQq7G77CCf8E4Rta10TX4FlXHBbxrjq
 IYgp19lcdBo/9kIOg6YTz0qf+OakV98N3d7WNEKbM0cRrgHCrjMaOI6bj1CfnKUKQbC0hPCjVtb
 8eBa/UiYHd3RCdIWQ0nyNMM5ATClQAnVtMxZXe7+pGEOyzGSgxBLzjFP8KjF0i9BaAeHzmJTMrm
 0hJfXOeIm+LQmDe+8x0hHgU0vIDZfg9SnOHt0VLVvK5wDD/OF1B3VENJYppUMFS2TcM/kQkHzXw
 +4iQrI23T0dA3/YzYO3iCW22xc2MlBkze1O0tYNJ1P/YGTBhVX34=
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

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 85 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 86 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 5c78e0552034..c542282eca34 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -8150,6 +8150,31 @@ igt_crtc_t *igt_random_crtc(igt_display_t *display)
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
@@ -8190,3 +8215,63 @@ bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double
 
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
index f70976cf042c..b2e463f9be9d 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1295,5 +1295,6 @@ igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
 
 bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
 				   int drm_mode);
+int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.52.0

