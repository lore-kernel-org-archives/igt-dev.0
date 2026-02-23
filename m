Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CAEEA4FB2
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:08:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB5010E385;
	Mon, 23 Feb 2026 12:08:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="EipQsVNW";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F8210E37D
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:08:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 2FE5DC143C8
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 13AFE5FD43;
 Mon, 23 Feb 2026 12:08:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EDA0C10368F86; Mon, 23 Feb 2026 13:08:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848529; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=pc4mYJzM1rMQFzszBPhxdJjRYnmSsJUCgPPJWOY0F2Y=;
 b=EipQsVNWeESRZcsnpHZYbmpMX4WOtrGURD0RQSvcgbTb3kbCyqa65/se+IWWgQzmHOy3Z3
 N2gngREBUzxZwzKgex2cEygvFwdlRyc1ofDWC7imEjPpfFILVqNOt4+cbRgXmbHFq9c2jQ
 D3E9ljaP2RrkAarr+G1lDcp2svx/zQsXcKH8IWYtMFSjGAcBHY1d9PNAZp8xXZzVrKc1OB
 XjE7wtmjzRxVHZBuYCXm1N+pOqxxJqd3kjoWrbPNrHegFEsz9Vh+qcYZVeolUuh5I9dTR8
 5iQT65NgNEl2QEmGBc8sjZ9h2SCi7Fip/vTzOzH2+/LEFmWN7yJ3vbPhbC22+Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 23 Feb 2026 13:09:13 +0100
Subject: [PATCH i-g-t v7 06/48] lib/igt_kms: Add helper to get a pipe from
 a connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-unigraf-integration-v7-6-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
In-Reply-To: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2354;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=/CsDVk6fxLEI0wtD7wKt3Ff6OwO6sdb7dC7ln97yRIE=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpnENn+8Um9udgXcey+1qHcCTDq7TETL7PydgTK
 uvEle+KUOOJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaZxDZxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJTChAAu7eAZATtMV/kJcdziuoCoE95sROCVFf
 +yOyi+VyQPpKEbvXz90Wl1CUCNSQ1fQLFvks+8IMGFsrdiH2n9Iy6ol+lTSw412dU+SBkewuub5
 oGbmVJZQoUsW37CJtDU5olwaxn9xqCvBTjxOKpUqdrVjQNRjvopTXn5BmzPM/ibyzK+G8OlDPDW
 q713A36LNdQov98oMqO5IO9Pf0pXFzrZNiIB1Oz8Uuq33aSJ4sTaMqF1zScfzj1jRfxA4tMMYBc
 n9xW0DMC6b3bhamB4fjYTU6TZlXtI7VA79bwKFM1TerDtPJUviKyoMhxxMo80aay30GDNC2t3ME
 +ugrM+TlgJ85p0iCUGvG9ujUd1XcNYo/Spi6DkacZAaITg/RtS+LjOTDREl3R+T1oTzh4T0AO4n
 r5b369uHMN+1/aD1CNkm6aiKuwmes84Q0+puR3wEH7PpNk9GA/srafprD1APy/XSCAOh8JNInTD
 vMtIrHhjfh/PZpoP1OZKPOYEqNoSADRI6Ze8z9vdzvydRGI3uhIj4HHTGA0KtGR7W5F88IwBmo1
 279xXlCcclI6K+bUkfkCGYy7+wruevtfizSDhPdw9XCkFVvWdY4eEBe4Y5qWhnORFmGXPLQ+HmY
 knJe9BfpUU7L/l6A+tXy2kkUdpX9qYUkIn1C6Jt/7U+smERo0nak=
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

Currently there is no way to get a pipe from the connector. Add this tiny
helper that will try to get the currently used pipe for a specific
connector.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 41 +++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  3 +++
 2 files changed, 44 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 514d905fe1fe..1c03542c87d7 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -8266,3 +8266,44 @@ int kms_wait_for_new_connectors(uint32_t **newly_connected,
 
 	return newly_connected_count;
 }
+
+/**
+ * igt_get_crtc_index_from_connector_id() - Get a pipe from the connector id
+ * @drm_fd: drm file descriptor to which the connector belongs
+ * @connector_id: connector to inspect
+ *
+ * Returns 0 if the connector is not connected to any pipe
+ */
+int igt_get_crtc_index_from_connector_id(int drm_fd, int connector_id)
+{
+	drmModeObjectPropertiesPtr proplist;
+	drmModePropertyPtr crtc_id_prop;
+	drmModePropertyPtr prop;
+	enum pipe crtc_index;
+	uint32_t crtc_id;
+	int i;
+
+	proplist = drmModeObjectGetProperties(drm_fd, connector_id, DRM_MODE_OBJECT_CONNECTOR);
+	crtc_id_prop = NULL;
+
+	for (i = 0; i < proplist->count_props; i++) {
+		prop = drmModeGetProperty(drm_fd, proplist->props[i]);
+
+		if (strcmp(prop->name, "CRTC_ID") == 0) {
+			crtc_id_prop = prop;
+			break;
+		}
+		drmModeFreeProperty(prop);
+	}
+
+	igt_assert(crtc_id_prop);
+	igt_assert((crtc_id_prop->flags & DRM_MODE_PROP_EXTENDED_TYPE) == DRM_MODE_PROP_OBJECT);
+	crtc_id = proplist->prop_values[i];
+	drmModeFreeProperty(crtc_id_prop);
+	drmModeFreeObjectProperties(proplist);
+	if (crtc_id != 0) {
+		crtc_index = kmstest_get_crtc_index_from_id(drm_fd, crtc_id);
+		return crtc_index;
+	}
+	return 0;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index a0b36efd8ebb..86bdb4d5031c 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1332,4 +1332,7 @@ int kms_wait_for_new_connectors(uint32_t **newly_connected,
 int
 get_list_diff(const uint32_t *list_a, int list_a_len, const uint32_t *list_b, int list_b_len,
 	      uint32_t **diff);
+
+int igt_get_crtc_index_from_connector_id(int drm_fd, int connector_id);
+
 #endif /* __IGT_KMS_H__ */

-- 
2.52.0

