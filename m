Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96BC8D1CDD9
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 10:29:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5306B10E313;
	Tue, 22 Oct 2024 10:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="gR28khUT";
	dkim-atps=neutral
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B23C610E30F
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 10:29:13 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::222])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id CF94CC30D2
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 10:28:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F35240006;
 Tue, 22 Oct 2024 10:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1729592922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N3BvqlMqG3z1agXAHP6wkSitdRpaJLqMZ9VppZsRluo=;
 b=gR28khUTYNDf/Xx5e/KoBnFpvX+efi57E+z2vgrLpmdWKDgy5kyLDzrNGycKO7oPhXT3Mg
 ME1NAGluIogtcKj9DY6R1VlpV24yXk4R9yhyeQ9fqBRRpcOSenhLYJIF6/uANZnu1m0x3F
 5ADiQPWofwlI5i/x+88T7jlmR9PAE92jZs2/n95inGu2fl7WGGWOw6whFGzOV0ANkczr3y
 4urtK6+79n5X+aBXMhdfdC/VVYS+Y0FQoOSrY4HDzAtFE5sFv1Uh1c3QXT6igI38etpTEU
 Fs483cEqWqP0X409JHJQifeT9M7Ow8SWjcnDOL+cS76+yd6Gx8jUlRfy0ORICw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 22 Oct 2024 12:28:38 +0200
Subject: [PATCH i-g-t v2 4/5] lib/igt_kms: Add helper to obtain a connector
 by its name or MST path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-b4-cv3-01-igt-kms-v2-4-8f654694b513@bootlin.com>
References: <20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com>
In-Reply-To: <20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, nicolejadeyee@google.com, 
 seanpaul@google.com, jeremie.dautheribes@bootlin.com, markyacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4532;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=FNO4ZIqs/idCM22EDoxGY/6EeM2tP12bzB0lMFmlDz8=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnF35WMD3PY8K47ASdeHcCpXHiQIKzMhYZtX6O3
 HsJ1dg0ex+JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZxd+VgAKCRAgrS7GWxAs
 4vmUD/0YL1SiCiPLNZak+PH9Eh8SpA+4fLdCxoXW6dYc7zxAb2/kUKaBleNITVLK6wuY34pCr8a
 RT734JfzFtpcFsuD5Xn7OyPtZB+4rxD99IH8G8TPgOSVCaD48hZIvjU2LwOafE0ezEND5ywDBik
 b47uMZ1DJLNPXQFgMztAQvVwPLkAPyMj3UjPLFZZBpVapHsCkh08l5yo7EYw4ycOuVDn22OGrhK
 FNt4+gPz0ZOenC0Yl3HFawELhcYkd9TjKnwggUOdnkt48vMxFVXqrmZBgYQ33Gw5tM7e5QY1r8S
 rcTqolM+2CRJPP3QUKkaHsPNVHwDjnTpUM3WraiWoGFHQEaIfzkYC0CKu3+Svig+L66Qeiv0ktp
 yLBbikbTuzsgszQe3nLHiNcaK7HkehnisuvjZTbXBuotYnMke+O/DrYrQwqadQL+Bz9FygCFoZG
 XzA9nmwqYXq+SkHkUMWDS1JarVaX4J4b++Nu/EVGLrhtH9PLajmiP8nMDb+1Q60MNmXWIASRtlU
 Lf/b3OEKMRnVq8+xM/tmLtdxUbZ3F/neBJ/f8PiZlH87i+DsAaLtZgkogSz3gM0chVBsWVWD/gm
 aKDiMj7wJXQ+zocj0GzXFqbHsBhUQiVgahmYDbFi77Ajq1zWoO3qIBmablz+NKFxQ0Oa/QufLdu
 9hhBuAcnpgJw32A==
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

Introduce the functions igt_get_connector_from_name() and
igt_get_connector_id_from_mst_path(). These functions serve to retrieve
the connector object using a connector name and a connector ID from its
MST path, respectively.

Given that the connector id may not be consistent, especially with MST
connectors, these functions are essential to recognize each connector even
after system reboots and plug/unplug events.

The function igt_get_connector_id_from_name() is a convenient wrapper for
igt_get_connector_from_name() to streamline its usage when the caller only
requires the connector id.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 97 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  3 ++
 2 files changed, 100 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 44b546ae52dc..fce5666cefc6 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7235,3 +7235,100 @@ int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids)
 	return
 	    connected_count;
 }
+
+drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_name)
+{
+	drmModeResPtr res = drmModeGetResources(drm_fd);
+	struct timespec start, end;
+	int i;
+
+	if (!res)
+		return 0;
+
+	for (i = 0; i < res->count_connectors; i++) {
+		char name[50];
+
+		drmModeConnectorPtr connector = drmModeGetConnector(drm_fd, res->connectors[i]);
+		/*
+		 * This time is required as sometimes some id in the connector list are not totally
+		 * ready or can disappear
+		 */
+		clock_gettime(CLOCK_MONOTONIC, &start);
+		clock_gettime(CLOCK_MONOTONIC, &end);
+		while (!connector &&
+		       igt_time_elapsed(&start, &end) < igt_default_detect_timeout()) {
+			connector = drmModeGetConnector(drm_fd, res->connectors[i]);
+			clock_gettime(CLOCK_MONOTONIC, &end);
+		}
+
+		if (igt_time_elapsed(&start, &end) < igt_default_detect_timeout()) {
+			igt_assert(connector);
+
+			/* We have to generate the connector name on our own */
+			snprintf(name, 50, "%s-%u",
+				 kmstest_connector_type_str(connector->connector_type),
+				 connector->connector_type_id);
+
+			if (strcmp(port_name, name) == 0) {
+				drmModeFreeResources(res);
+				return connector;
+			}
+			drmModeFreeConnector(connector);
+		}
+	}
+	drmModeFreeResources(res);
+	return NULL;
+}
+
+/**
+ * igt_get_connector_id_from_name - Get a connector ID from a connector name
+ * @drm_fd: DRM file descriptor
+ * @port_name: Port name to find in the connector
+ *
+ * Returns 0 when no connector is found with the correct name
+ */
+uint32_t igt_get_connector_id_from_name(int drm_fd, const char *port_name)
+{
+	drmModeConnectorPtr connector = igt_get_connector_from_name(drm_fd, port_name);
+
+	if (connector) {
+		int connector_id = connector->connector_id;
+
+		drmModeFreeConnector(connector);
+		return connector_id;
+	}
+	return 0;
+}
+
+/**
+ * igt_get_connector_id_from_mst_path - Get a connector ID from a mst path
+ * @drm_fd: DRM file descriptor
+ * @mst_path: MST path to find in the connector
+ *
+ * Returns 0 when no connector is found with the correct mst path
+ */
+uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path)
+{
+	drmModeResPtr res = drmModeGetResources(drm_fd);
+	int i;
+
+	if (!res)
+		return 0;
+
+	for (i = 0; i < res->count_connectors; i++) {
+		uint32_t connector_id = res->connectors[i];
+
+		drmModePropertyBlobPtr path_blob = kmstest_get_path_blob(drm_fd, connector_id);
+
+		if (path_blob) {
+			if (strcmp(path_blob->data, mst_path) == 0) {
+				drmModeFreePropertyBlob(path_blob);
+				drmModeFreeResources(res);
+				return connector_id;
+			}
+			drmModeFreePropertyBlob(path_blob);
+		}
+	}
+	drmModeFreeResources(res);
+	return 0;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 4674b271638a..e9732c247dea 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1266,5 +1266,8 @@ float igt_default_detect_timeout(void);
 bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
 				   int drm_mode);
 int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
+drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_name);
+uint32_t igt_get_connector_id_from_name(int drm_fd, const char *port_name);
+uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.46.2

