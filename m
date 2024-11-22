Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BF8E69170
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 15:19:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D70C10EBD1;
	Fri, 22 Nov 2024 15:19:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="GezSuWjL";
	dkim-atps=neutral
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C1810EBBF
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 15:19:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 132D01C000F;
 Fri, 22 Nov 2024 15:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732288761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cC9CpsGFD3NPOh2BFyT57JHDkNIktIxTzxHXnLgEL34=;
 b=GezSuWjLdP+e0mo2v2fbtxb+21Quk9Jqx3JohZhCHdAV8SSU5K+K+vTbAPsBL5G+kBIfaf
 OoYF915FekyYKdCVj7AR7XvoYnH3Qg43wtOUkkQiVrlvVufUtYgoawUwX1kzuQwXWgaXGs
 E+ZC5YXzL61RIqx+QpcVEE2NamlNBqeZ6g4RDOD4QKb7JC3MX1nx6ma6VdFiB9LMYzWS5I
 5LXhJ2Z1eeMIEEqwTmags59Pp9XWtZwLlEyi1ziZqQka09bBJIwNjIL0mNOy6ClXk3d9yj
 uL1IjHSE7yAK5SBHeuazsniP2HjmF2rMoQOpCSOdb1SSEGYT2EaGTP0xAiNCaw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 16:19:07 +0100
Subject: [PATCH i-g-t v3 4/5] lib/igt_kms: Add helper to obtain a connector
 by its name or MST path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-b4-cv3-01-igt-kms-v3-4-c5ced6976e11@bootlin.com>
References: <20241122-b4-cv3-01-igt-kms-v3-0-c5ced6976e11@bootlin.com>
In-Reply-To: <20241122-b4-cv3-01-igt-kms-v3-0-c5ced6976e11@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4813;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=l1aJazS9kNz1gQiO1Me+Cu1p2FI3R7yCpFuATSduAbg=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQKD0t6q1CajK1e6aq6guI8Z4v4Kfu2xHnEbGd
 pvJZfhOyuqJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0Cg9AAKCRAgrS7GWxAs
 4uC/EACrFmthyMtm14TpI8soiS1jBhLY2mkS8HgrOpOj78Hv+tqBh0ieb1dJcye34w0WwIh/qYc
 p1pWpen6CEjI8vkrj4l5e7bXt1cmKYdv5MZGzyQp0RD1iY3+Ihgxj3t626wrbTApjlVuyvgbile
 oauhxTaeHPiaCSml9Blhzf9ZK+UweYQNCudTDc7YoYDwMX/UUpd/QzgiKj6epoGhWs671xwO2rc
 2bUwUJmh94aOOywSBGf1vlavjE/0IZkCIrM/L7zUuB2fFwlOY61vidRi/zRfoHmYG3x6HjB3T7/
 37UXrRRcq0Bczrbc91sVZkof3Ddc1Py99luh50FeDUYSu3YOt1++ulVVAQtWXxtJG4xdQXUNHV6
 qWlelrwLeinQuExKCEtY9+JDdgteEwnaT13mBTkr3h3Li1c1v9vIGKB66ug+118Ijz7OJn+0EVm
 2qJKudjWI5cQfG8qoQH+hqw29OObRFfhall+39K7+x322MGfTPFreBgs7Y7ozBBzoeFDQyEw6sW
 VIv42g48BIaCAPxbWGyeL8ow9ex0fs3jSBb12pKDE/A/WekgKckcAS5I8xYR5A07Inqv0/BmhBB
 XCiGncvJ+fXljiyOq2Jqg9biJYFNEb3dwNQI6CQSjpPywCDbw4PPBq2IxIa7csR8gjVEbIq5Fec
 LEjUComqrHGbEbw==
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
 lib/igt_kms.c | 106 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |   3 ++
 2 files changed, 109 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 5d3f609d469d741d9fd68a9a0b41ab0162d322b6..5c242a5bdec619d181c3d0d632f1ea7d94d34743 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7314,3 +7314,109 @@ int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids)
 	return
 	    connected_count;
 }
+
+
+/**
+ * igt_get_connector_from_name:
+ * @drm_fd: DRM file descriptor
+ * @port_name: Port name to search
+ *
+ * Returns: The connector if found, NULL otherwise. The pointer must
+ * be freed with drmModeFreeConnector()
+ */
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
+		end = start;
+		while (!connector &&
+		       igt_time_elapsed(&start, &end) <= igt_default_detect_timeout()) {
+			connector = drmModeGetConnector(drm_fd, res->connectors[i]);
+			clock_gettime(CLOCK_MONOTONIC, &end);
+		}
+
+		if (igt_time_elapsed(&start, &end) <= igt_default_detect_timeout()) {
+			igt_assert(connector);
+
+			/* We have to generate the connector name on our own */
+			snprintf(name, ARRAY_SIZE(name), "%s-%u",
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
+ * igt_get_connector_id_from_name:
+ * @drm_fd: DRM file descriptor
+ * @port_name: Port name to find in the connector
+ *
+ * Returns: The connector id if the port is found, 0 if the port is not found
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
+ * igt_get_connector_id_from_mst_path:
+ * @drm_fd: DRM file descriptor
+ * @mst_path: MST path to find in the connector
+ *
+ * Returns: 0 when no connector is found with the correct mst path
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
index 33079b696c070ee7b62ec1d5705b221ba4ad5a7c..d61ddcaa0a25f1f9bc34eff7314eaa49a3de9cc2 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1278,5 +1278,8 @@ float igt_default_detect_timeout(void);
 bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
 				   int drm_mode);
 int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
+drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_name);
+uint32_t igt_get_connector_id_from_name(int drm_fd, const char *port_name);
+uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.47.0

