Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3BDE7719C
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 17:46:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7418F10E513;
	Fri, 10 Jan 2025 17:46:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="mKNoKSgS";
	dkim-atps=neutral
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 020E710F14C
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 17:46:12 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id CD683C4D0B
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 17:43:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1E88B4000D;
 Fri, 10 Jan 2025 17:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736530979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z1NFwOjDZTjl3Lk5ldvZDh55cLm38T/1h3iTNn4wS+Y=;
 b=mKNoKSgSKRcj3xlCeu5ePZ3SbRUChdjC8wHbL1v+Z+oKz3CNgQQTDwEp9FYjGiNYYnD4Mk
 V9jjhqK7gMasc4Wve4sgHfrfA5HTGUe0eZ3iBGcujQMIxzJx5z9fB8w5svwJJh6MaAd9WG
 J/Wa7Owlv7QXcLjjcFy/QRphCuM2lIR3IxBYqwqx96ezs2RCv9o7PX29PL50F0bsFlUO3l
 jG5j2rFNZRn162BrUA4OkNENfjsfoPR/cyEj73yLLExVfmI9sAW/mYnesV57htPj3sOSTI
 SrcVN+4ZFrLHOii6QNlsM7/g0HJgIEHGfgmxvxuRrcLFzrNozLrjaH7zeOJGvA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 10 Jan 2025 18:42:53 +0100
Subject: [PATCH i-g-t v4 4/5] lib/igt_kms: Add helper to obtain a connector
 by its name or MST path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-b4-cv3-01-igt-kms-v4-4-0b0474708f9f@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4826;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=o/USxG7+q1Heuns54Yc/q+v06q3NRb4PJL1iM2Xxv0Y=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBngVwfqmK5XxNhSj9LAzoVawNZM4yv01zSvY46a
 DYpL8DMJkiJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4FcHwAKCRAgrS7GWxAs
 4qQ3D/9zX/EaWw62EG4cSdBgYVmdQv/G4Te9cGefmD4HERXCdTGCtXJTBo+qqzzuZ0vZHCuesfV
 5n1UeLQqgZxL7OGh2gk6dNGZRovEOO6j+o5Hmws4AMuM+Yis62o4sEUxU6DNmxXpmeworh3aFJo
 21zbjLpv+sZ1LyX6C4VHc/jXkurPzUdElNkkMrVwOazAQBkpwn5VvI0RlNtGZyXc4mZwKP5ghaR
 6XxYEvxGBAW78WMnmmSdXBCajmmuLh4GoffUhWBieP/4Q6QxT0Qt920GCfN5n5BoO9GSar5RJcV
 59hU04qF1hJwDXtMc3jIBZvoG5ypJNA7Vy4Z6VNrqM2MS33+JXsBB6sE8G4JugOZU6oJWIshOeP
 X2q30BLjJtlOwY3l4HIcWVyDHZrdSAmupe0vvW6rPkkM2IhoddJjvKbMD8gtv21HTBIT6fKasaH
 M7TbJc0d5CauY+QkTiXeQ4VfXBVlZfwi8WkSiuyaHav3iohkQESHq4BUjCg+SQMX82KjJJuV6ci
 055CaEAM4Ku/eYxDsSrNl49g99/YMdexTVsW1CPgRjDNlH62o4Shcu8rVz4W47n6SxXKi/QS9tq
 JggGtyQGGAmWvYP67Vh6IfOQIZNJi3Lv2fBoXWb9f/H51VmKvg6tNIQKjEXH/3z6ZJ78IrUPVPX
 LNxsstLGEbR8w4Q==
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
 lib/igt_kms.c | 109 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |   3 ++
 2 files changed, 112 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 93d5a0d64df9954f7da8254ee35a0fd887d31d78..f6d9341b75b4fc8dfa614478cd3bf35510f9ecea 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -93,6 +93,10 @@
 #define MAX_CONNECTORS 32
 #define MAX_EDID 2
 #define DISPLAY_TILE_BLOCK 0x12
+/**
+ * define IGT_KMS_CONNECTOR_NAME_SIZE - Size used when a connector name is needed
+ */
+#define IGT_KMS_CONNECTOR_NAME_SIZE 50
 
 typedef bool (*igt_connector_attr_set)(int dir, const char *attr, const char *value);
 
@@ -7349,3 +7353,108 @@ int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids)
 
 	return connected_count;
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
+	double timeout = igt_default_display_detect_timeout();
+	int i, len;
+
+	if (!res)
+		return NULL;
+
+	for (i = 0; i < res->count_connectors; i++) {
+		char name[IGT_KMS_CONNECTOR_NAME_SIZE];
+
+		drmModeConnectorPtr connector = igt_wait_for_connector(drm_fd, res->connectors[i],
+								       timeout);
+
+		if (connector) {
+			/* We have to generate the connector name on our own */
+			len = snprintf(name, ARRAY_SIZE(name), "%s-%u",
+				 kmstest_connector_type_str(connector->connector_type),
+				 connector->connector_type_id);
+			name[len] = 0;
+
+
+			if (strcmp(port_name, name) == 0) {
+				drmModeFreeResources(res);
+
+				return connector;
+			}
+
+			drmModeFreeConnector(connector);
+		}
+	}
+
+	drmModeFreeResources(res);
+
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
+		uint32_t connector_id = connector->connector_id;
+
+		drmModeFreeConnector(connector);
+
+		return connector_id;
+	}
+
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
+			if (memcmp(path_blob->data, mst_path, path_blob->length) == 0) {
+				drmModeFreePropertyBlob(path_blob);
+				drmModeFreeResources(res);
+				return connector_id;
+			}
+
+			drmModeFreePropertyBlob(path_blob);
+		}
+	}
+
+	drmModeFreeResources(res);
+
+	return 0;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 520d1b2f2056a21bcf25be36da32a63a17bfe364..3be9068384aa118461dd090224d15aa5c979ac06 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1282,5 +1282,8 @@ double igt_default_display_detect_timeout(void);
 bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
 				   int drm_mode);
 int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
+drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_name);
+uint32_t igt_get_connector_id_from_name(int drm_fd, const char *port_name);
+uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.47.1

