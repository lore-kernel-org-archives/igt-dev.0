Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E623CA0FE9
	for <igt-dev@archiver.kernel.org>; Sat, 23 Aug 2025 02:20:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2FC510E2A5;
	Sat, 23 Aug 2025 02:20:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Fpbf3PLl";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A051A10E193
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:20:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6F90B4E40C10;
 Sat, 23 Aug 2025 02:11:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 48755606A7;
 Sat, 23 Aug 2025 02:11:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9805E1C22D3AB; 
 Sat, 23 Aug 2025 04:11:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1755915102; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=NWEsCQM68PF5Iyar7eVvO9GdfgUV4wCj+8gB+hcOmFQ=;
 b=Fpbf3PLl3xfONpQhJ3r14x+ZSsCq8MirQ8h3ZBV6yDpDW0VM2Fn28qohL+F0MqkJt2xR+J
 ZGLcM6M5gGLoVOgxyvXpHXBP4FDa3X2w8OgSE3u47+0g87bkA93CpkGy8R/Q8hwcKa85ok
 A7bQCj2BLcuLow71E41y40hv/f2Jami3TAL5SUYUOCqcOxG6aOieiL3Q7rUoXHUzvIrDaN
 goPe3EfjWxQ1Egk3Boze/NL7qB4EBw8ybmKlkzGEBz3/kpQvzW7d5GJOjmk5pjc3pKm/dv
 B4pClbKR5g18SOEhE6TxYjt0b8I+E1ZqgDQPee2uelzurVIAa2UPdNQessPYvA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 23 Aug 2025 04:11:23 +0200
Subject: [PATCH i-g-t v3 03/29] lib/igt_kms: Add function to list connected
 connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-unigraf-integration-v3-3-cdc36d5fab4c@bootlin.com>
References: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
In-Reply-To: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3569;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=YZtgwyjd/u/RIVJ9mvLLPfoDcHnH/Sm634D8D4P2pG8=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoqSNSqIQGkxz+2JH0kImRTjAJHtvjMSR912Frz
 Li7WqWWZbGJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaKkjUgAKCRAgrS7GWxAs
 4sJ3D/9TOYeEGsBXK/uFkoBe3ZyymliIaptidzAFzpTi9mw7Xdnaw+/ljVilV+jtJZp1eqNUIWR
 EN1+OC5VDBdSPj3t6GELYr3En/LH6S2gkKRkAqlqgGP5S07a8jjVEBLodg1JvirC2GbzRYQZM/b
 7ZQVuTwd0o2aZVBLu1fpQnZu0SU6eJLbOEqYYrtUIkqoVubqunGurdrT/Re4Wi7fl2pWAdnsr5W
 f6ssmUBCifk4l9UksQCdA6X/7IzGlXo67FC9Saiptt72zPLc++Ns2Nt98p9UVz759Mfw67pfxCp
 rwjb0lzLg/QGREydDFhP3S3O8NDkdtrrwO+sGOo0uM17tQvp/dJf6m7sEX6E29ougENmHeZE32+
 trYqYagO9ARHfAVcVgEqrfu30z7pF38O5D2j+Ek56RaMDfP9WYixQX979bOvNj1Zff/2Dd1n5+v
 SVgo3aS4cwz14JARyrnV18zBWjd6Jmayp8vD0f1S0aRWysYImD7g2X2INEhpbnIQYqAEvzzGHzX
 pIx3/QehvxFw6McqmVBnACLaMLDJSRKG8lgm9CcV1Tsz0D5s1NKh1Ak6y/sqZMesustj07T7KKn
 Mr5v7uY297m3HcMpGAJd36w2fmyzzjicghPkmssUX+DArrdjDH39rRtrkDwZ7zzhofL9s7dA9Hq
 M9fYDXOtz45G5Ww==
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
index f24fa52ae715607515c18962f30e1c45d5860303..3109882461f2b5db83286503444cf06c907fd9e3 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7573,6 +7573,29 @@ double igt_default_display_detect_timeout(void)
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
@@ -7611,3 +7634,47 @@ bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double
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
index 02c68737fd68a3dfee9aeba17489a17300e0bf67..6609b6ea2a5707e198379818ffc12de852380c07 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1301,5 +1301,6 @@ double igt_default_display_detect_timeout(void);
 
 bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
 				   int drm_mode);
+int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.50.1

