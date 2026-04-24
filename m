Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72589FED3EF
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 17:00:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ABFC10F642;
	Fri, 24 Apr 2026 17:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="pKquZcyb";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB0C890BE
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:54:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id BC407C5EF2E
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:55:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E89D9604EB;
 Fri, 24 Apr 2026 16:54:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D09E610720A14; 
 Fri, 24 Apr 2026 18:54:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1777049673; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=bHNcc0dOlqK24aSB1XVQO8Fd0bbxS2obPOePYOdPXGA=;
 b=pKquZcybgMpdcdjPbMK+++TojULp3ykQw/UDmFCqToN+fa5nsIJMyfxAx4XMYvac0EHE+0
 +PwA5Y5lfED46yT+g5mhblC+TO8w5Gw9nRh93EbWVdnj/GqpcPucTopwdNZI2pTrFA584t
 /4qxt+zLCsr/atbRRzEeWF3xKX9JONqv+V8eEt2vzWlmWVRSn0uiAhGJBBrykgmTI77Gdm
 joRRJEhdYx/fhELZKk8trs81+7b8n00X3+Jkzu6ckDnRbRZf5qkbJxIr+KIfxaqSBR3u/J
 st6mso0IDZEhpjJZioQXVvUaqMbkkSbqze/PlllQ7V5Sj6i60+SZhTzhJPXGpQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 24 Apr 2026 18:52:42 +0200
Subject: [PATCH i-g-t v11 07/49] lib/igt_kms: Add helper to get a pipe from
 a connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-unigraf-integration-v11-7-0c5f5346ae60@bootlin.com>
References: <20260424-unigraf-integration-v11-0-0c5f5346ae60@bootlin.com>
In-Reply-To: <20260424-unigraf-integration-v11-0-0c5f5346ae60@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
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
 lib/igt_kms.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  3 +++
 2 files changed, 47 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e6b9cfc61b18..31098d6bdd4c 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -8518,3 +8518,47 @@ int kms_wait_for_new_connectors(uint32_t **newly_connected,
 
 	return newly_connected_count;
 }
+
+/**
+ * igt_get_crtc_index_from_connector_id() - Get a pipe from the connector id
+ * @drm_fd: drm file descriptor to which the connector belongs
+ * @connector_id: connector to inspect
+ *
+ * Assert if:
+ * - CRTC_ID property is not found
+ * - CRTC_ID property don't have the DRM_MODE_PROP_OBJECT flag
+ * Returns: 0 if the connector is not connected to any pipe
+ */
+int igt_get_crtc_index_from_connector_id(int drm_fd, int connector_id)
+{
+	drmModeObjectPropertiesPtr proplist;
+	drmModePropertyPtr crtc_id_prop;
+	drmModePropertyPtr prop;
+	int crtc_index;
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
index 929ee04880ed..6fd3d7589e32 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1302,4 +1302,7 @@ int kms_wait_for_new_connectors(uint32_t **newly_connected,
 int
 get_array_diff(const uint32_t *array_a, int array_a_len, const uint32_t *array_b, int array_b_len,
 	       uint32_t **diff);
+
+int igt_get_crtc_index_from_connector_id(int drm_fd, int connector_id);
+
 #endif /* __IGT_KMS_H__ */

-- 
2.54.0

