Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CFA8F53D6D
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:23:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0474F10E292;
	Mon, 16 Mar 2026 16:23:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="UPuo6fL9";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA9510E292
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 37F95C55043
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 930915FC4A;
 Mon, 16 Mar 2026 16:23:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5E3CC1037220D; Mon, 16 Mar 2026 17:23:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678190; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=sdc///30kmv38GVkzCXDsjAvbbM72PUEsmT4RcoM5nA=;
 b=UPuo6fL9pcQ/WWLML6YAvgvg7U+99741vM4P1jtw63WcTRDPbys7jN0HAAq/dq/0Galz38
 CJH21sFJ2sXBr8qNre3UBM2ijsm/FCLVRE7d/Wogy9CcQ1jknq6RREcwmH9nVshvj0iUnm
 dM5hjym+42ocUVdLjYGrgOehcSDMJ+NeYHsTiX0JIDOd9N/dihnSBiowL/MS2V5BDTjNVa
 i75/0IsPAEIVqOGDxor0uwAzWfXxJSyS7kzjfEfQbnGU6lsv/p17PmwLyptmtY8zs1KUzY
 u70aprPSF1bEw6zZ9A+aftE0dgAxhE5GJ7TntNbEMekJdMsxtebK1N4xEbIDlw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:17:24 +0100
Subject: [PATCH i-g-t v9 03/49] lib/igt_kms: Add function to list connected
 connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v9-3-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3972;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=kZNv3xquCUxQL6F80ARuo9deShpKgv2Vh0JcVhdkdkM=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6JCwq7lx4ad9NeOLSMoj7NkW1wd+1IVACfS
 xxX3Q2gJQeJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabguiRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIJMQ/+IIiWHAnJQN5iZqQrH7ARmfDxgycE7IF
 pOoYV5WAl7ZRKr3oJPn6Em/O7uvWVPCbZ217nGAm9IicL8z4rhmaiT69TFDrsPh3xnv3B9GSliU
 XO3FVP9jDb7lzHvlMrtuLQSlMqoO+ww5A+NVYNvChtwaRusHJctbh2ciGf/qzPakU5XN/BjY+N1
 TKOEHXhWl2OAie6+aYa2srBN3OOyRD8kQcp6W1s2U/MW638uRajuWiArRtWT2EG8Z0dG/Vbilrl
 t/V7gZtEy2OqVJDHm2HsWJ1NYC+L0IdzpwhEjSNuSWY4xAbPeCCBt6UNJ2UKoeOxGZlDZt0yibB
 3dxLImHQlH2octWCwKS9Se0u494T4rExy/vojYbqoEzD0+G+XR8+fk/atiA/NsZjM1FR81ZoeQs
 ebQfwChBU/ERTo1cIZLRLq+bjFs1LIlBh/ew4x8Jju/R/Qv6N96QfD+vc8IGQ/on/VKSTbuOLsg
 v1AG09SITi56JhrCIBBLP6WDHPjSBLwvAknaBaTjw/j//sVjb2FX/IULsJuhv2P7SjafAbxwn3t
 +kYpNbz6+2SpQQQxRJwoAJV/Qa0V8OCEaokQuNaQHjCQ/f+4OJSB7XOWoKUfJroniEs9Aeler5e
 UVNvpvaztDGHxOZmX/aGJnoUgQEkB+Igi52tkMeiu0SIWOHjgKEE=
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
 lib/igt_kms.c | 80 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 81 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 4a496ab256f0..72a38334f921 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -8094,6 +8094,31 @@ igt_crtc_t *igt_random_crtc(igt_display_t *display)
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
+		usleep(10000);
+		igt_assert_eq(igt_gettime(&end), 0);
+	}
+
+	return connector;
+}
+
 /**
  * igt_wait_for_connector_status:
  * @drm_fd: drm file descriptor
@@ -8134,3 +8159,58 @@ bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double
 
 	return false;
 }
+
+/**
+ * igt_get_connected_connectors:
+ *
+ * @drm_fd: DRM file descriptor
+ * @connector_ids: Out pointer for the array of connector ids connected. The function
+ * will allocate and store the pointer in this out pointer. The caller is
+ * responsible to free the inner pointer using free(*connector_ids). caller.
+ *
+ * This will probe all the connectors and return the list of all
+ * connected connectors.
+ * Returns: The number of connectors in @connector_ids
+ */
+int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids)
+{
+	uint32_t *tmp_alloc;
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
+						 connected_count
+						 + 1, sizeof(**connector_ids));
+			if (tmp_alloc) {
+				*connector_ids = tmp_alloc;
+			} else {
+				free(*connector_ids);
+				drmModeFreeResources(resources);
+				igt_assert(false);
+			}
+			(*connector_ids)[connected_count] = resources->connectors[j];
+			connected_count++;
+		}
+	}
+	drmModeFreeResources(resources);
+
+	return connected_count;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 934f24d5915b..4efd40a3ad08 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1303,5 +1303,6 @@ igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
 
 bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
 				   int drm_mode);
+int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.52.0

