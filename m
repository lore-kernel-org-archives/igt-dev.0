Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F97F46449
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 10:24:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5610A10E258;
	Mon, 16 Mar 2026 10:24:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="gYUWQGeB";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86DFE10E252
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:23:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 69EC04E426C1;
 Mon, 16 Mar 2026 10:23:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 40BB55FC4A;
 Mon, 16 Mar 2026 10:23:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4022610369C02; Mon, 16 Mar 2026 11:23:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773656631; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ISpC/ef7Vmz4bxycXyHHMxXZ93vAcejQOKNgWvZm9Wc=;
 b=gYUWQGeBD7oqwFi5kkLL0wiLKQdi14nACxLNROgH2xLUN2hcluS7akDGovadU/APPjVCOP
 rmQAqUlq0xT8Mbh7K83V0t5iDI3YC2sHF//5DCLnBRfLSC76Fe/gLUqHYsjJKpjeR1it2c
 4CuQL1HXLE0aLG8l8NG/CgB2XiY2CykyZ7p8134H+k9ps9TFDUQ+I33lyRiztd+CVMK3qz
 bOO1V7mDCwbMuFVRe5nfL9hsa6J7+PsfTvk5Up+p9wCjF44BaXAvQIyYKLUrc48xstJei3
 A6i49LpP00JKn0uEFZKCBdwKiD/nEf4AUzasB5mQug2uVNYfcFYRvHf3RweHsQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 11:24:15 +0100
Subject: [PATCH i-g-t v8 07/49] lib/igt_kms: Add helper to get a pipe from
 a connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v8-7-4489bf8572be@bootlin.com>
References: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2360;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=C/VYlbtfDZABuEOma4GMBbWUkuJaFoUmUERoucxTBtg=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpt9pPG9QmZqUDptFwSteNFJS196WyDGwnjAWYz
 ygOOQuHR/6JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabfaTxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKIDRAAyRJ4EmjXM757mnI1WciSXk9xeQiBziH
 dS/QknL0jzGpr7pCuqtUE0mNPfGfcM8dmplIoM/pm/6PRDSQFQolP2tUskBzFQ8/4pcyOJe/qZ3
 PCN8znvviaKYi29BXrx28hIiBSZ4nD25Sjm5TbcsVgYWrKYlFezYtfRlWm8WErGr3orgSFRmMx4
 t9oWO4WFlBSn9jQni+hyqBuF34DUg29QBKW5enY5nHXcyjPhpmFH6IegTu4XGlrBWJkoQA4VCSH
 E/PCs+h5KrXHBeHv75ocIzwuUdl9jVBblovOrtMdNigOnROenWBsnOp7SDrvAR/IPiEHJM+W9MJ
 EcjaYAzA39WQQNKoESFsQvM/waiwE9w3CcSFx4qpL7E4fOp7SnF9wifW8ze5No6t0tELqUfGxRm
 DCbRKb2ACnc3xb44JEHgODJrKXB/b4hkeNxJk1n9bEFGrhpW+cP/nJUz1EyJ4TAQGqNOY8gSQQM
 0Xr8GeovJSLVJqRObdGJ7WIMegXaE/45DxR1J58gk603e3QBWC6bgCE1zp7ibcuys1hC+aQapx5
 /hz53EUOz0UIyXK4/oZ8iCxQevuii/0riET0T+BBKGJLBwDhGg5ctRhfJw5qNclmEAIme68JWWc
 GXmKV4S5f123RtwkET6og8J9hSfuGPbTSomEaTPKNIIoO4OZf19U=
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
index b220de419a70..1b34f5eb7ee7 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -8419,3 +8419,44 @@ int kms_wait_for_new_connectors(uint32_t **newly_connected,
 
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
index c6aae034b5b9..d346801e7915 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1314,4 +1314,7 @@ int kms_wait_for_new_connectors(uint32_t **newly_connected,
 int
 get_array_diff(const uint32_t *array_a, int array_a_len, const uint32_t *array_b, int array_b_len,
 	       uint32_t **diff);
+
+int igt_get_crtc_index_from_connector_id(int drm_fd, int connector_id);
+
 #endif /* __IGT_KMS_H__ */

-- 
2.52.0

