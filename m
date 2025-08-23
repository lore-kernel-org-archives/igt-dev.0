Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3428DCA0EFC
	for <igt-dev@archiver.kernel.org>; Sat, 23 Aug 2025 02:20:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBDE910E189;
	Sat, 23 Aug 2025 02:20:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="WCjWzxon";
	dkim-atps=neutral
X-Greylist: delayed 506 seconds by postgrey-1.36 at gabe;
 Sat, 23 Aug 2025 02:20:10 UTC
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E63710E187
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:20:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 76D444E40C24;
 Sat, 23 Aug 2025 02:11:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4B60F606A7;
 Sat, 23 Aug 2025 02:11:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7431F1C22D34F; 
 Sat, 23 Aug 2025 04:11:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1755915104; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=x1RxgEsM837ym8zmtznanaX7AzxSn77mpDNnE98RGmo=;
 b=WCjWzxon2XbnK0vDOPm3bRUFUPEVkui8qqzSjaTC+pIL8MoQI3Ux7vqgAS/103enehSHXn
 UTF6lA+/vmxcJYHXPco6qhKKal9uPrIVTjbAZXTn3eVYQ5X5RQvU6EqKVycB43kxgom2dl
 yi1bFYlnwSOSe0OOb53iCnjayg2ntfNWchskTA3c/1i2JOLo1rl1YQug7NC0aRaQzEE2fI
 h71MXUx+sxM2B+enfa4s1JnB9URNjWnpKyfSIj8UqIkGSoUdcEDHixEvbjVZnnYBCizfar
 O1rNLKBug/xscvRD8Xg2DVee/OvvBssQQW6gk+IDYlTTcJ1L9Q77YKCSiiU/Ag==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 23 Aug 2025 04:11:26 +0200
Subject: [PATCH i-g-t v3 06/29] lib/igt_kms: Add helper to get a pipe from
 a connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-unigraf-integration-v3-6-cdc36d5fab4c@bootlin.com>
References: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
In-Reply-To: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2394;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Z22Y/L5LvHQKUKCkT7CShtvdPiobxgYVAdm4PQDbRF8=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoqSNTxWqJuGuYegABMazpD1sgRXRsA6KN0383d
 UgZHygTQgCJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaKkjUwAKCRAgrS7GWxAs
 4gLPEADTK7IAJWt+cQCS3hAYeZX+7EOgpDTMUARqdlFIEQ0jVNaU7dQc3CPoFtZPcRPpQfT9PL/
 YbFVdb1cEUX1oSSqVmr1S3qM8sTLZvlx4llYyfKljvXxEVvv1ZJpe9gnNAnepP9EJfpui8X5zh3
 +aAwEkGMS+i2CztO860RI2tdhxp+hYL0YDrj/luyEIbZ7NdKPJ3FZXTWQcmCRJED2zMsA3Lu337
 ygXpNBR4Zjf9dC3++9O7wG7NUGggSyDfjgr5tRdPqEiIVIr8PMkRjpVjEUbiMtq3fGNSWJnwYgQ
 zBIJiGkzIge2DQ46eFruEsf9Be60w4Vb0BxT9SIYAWRw+ZmOW8feAVud743Rr6Wf2BeP1Ow17ua
 ztLjf/ibNj6dkKD5yDEQyTyS3PdOoBsCZ0tnke3UmfxP1PZoWbAunWW56SyKZpRcVVo0PcuzOeQ
 YgYgNaqzF/68bfEO319jKKSBWr2n7wq2hI/wspKfzkqFk0eQW/Tel/X74ZhtGmzkHb43aPChykn
 bPpz2iZx6/0htfhXqbSHDlYrzpzoXpwTtJ5tR5fz05/JNoCmVGo3/jc/IiaxRW6OstPjxueYUnW
 JLWsh2n+xJGNO4okBZrPxHiNDXu5gJGsTmeO5dJWY+ZSsbK9/q3KJqylUYVxHAjZcDj0QvBXj3O
 x5+7YDQG1lQIkpg==
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

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 34 ++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  8 ++++++++
 2 files changed, 42 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 843924e79eae1e21542b0dd916bd92627f7a8473..6929b7ea87ab04e945499ea73f014ef68c60d3aa 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7878,3 +7878,37 @@ int kms_wait_for_new_connectors(uint32_t **newly_connected,
 
 	return newly_connected_count;
 }
+
+enum pipe igt_get_pipe_from_connector(int drm_fd, int connector_id)
+{
+	drmModeObjectPropertiesPtr proplist;
+	drmModePropertyPtr crtc_id_prop;
+	drmModePropertyPtr prop;
+	uint32_t crtc_id;
+	enum pipe pipe_id;
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
+		pipe_id = kmstest_get_pipe_from_crtc_id(drm_fd, crtc_id);
+		return pipe_id;
+	}
+	return PIPE_NONE;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 94e9b4dec45603b26568c82cfa253c30e403b90c..97e91455faf0d08527c254123d3013393d981fb7 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1312,4 +1312,12 @@ int kms_wait_for_new_connectors(uint32_t **newly_connected,
 int
 get_list_diff(const uint32_t *list_a, int list_a_len, const uint32_t *list_b, int list_b_len,
 	      uint32_t **diff);
+/**
+ * igt_get_pipe_from_connector() - Get a pipe from the connector id
+ * @drm_fd: drm file descriptor to which the connector belongs
+ * @connector_id: connector to inspect
+ *
+ * Returns PIPE_NONE if the connector is not connected to any pipe
+ */
+enum pipe igt_get_pipe_from_connector(int drm_fd, int connector_id);
 #endif /* __IGT_KMS_H__ */

-- 
2.50.1

