Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C12F53D6F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:23:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 169F610E31F;
	Mon, 16 Mar 2026 16:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="T0noni8q";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7D510E292
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 47D5DC55043
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A366A5FC4A;
 Mon, 16 Mar 2026 16:23:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 832B1103721FE; Mon, 16 Mar 2026 17:23:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678194; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ISpC/ef7Vmz4bxycXyHHMxXZ93vAcejQOKNgWvZm9Wc=;
 b=T0noni8qkWWW4BPARCuqnl5LMsqGoLrzXNL2EeIvYZQqE9uJ6MxdMJ56h9XFGk9D1wBVc4
 ccust0fFRF40Q3vQrdDtHnsBEyp94R17tb9DFhLmQoGd9SW5a84C690sk92jF4LA5kxma/
 XCpWPu5/peRGeAcmoiZvLjiQmK1w0wjy6H+8a4rQdI7MoOONNTmVkypKg+mZgtQZGLx5FF
 WCpyKcRZqyFW8UffTYaN0CKKQxoyAxA5Wg+BWlobwkrGPZnXnnsgpW7qiEyaq7UgUpe0Lv
 MDnkosCJyx1aBhbaR939zAnQAruL45MBL+YVYlx5T2IL1fc9FfJhZS7diQk1Uw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:17:28 +0100
Subject: [PATCH i-g-t v9 07/49] lib/igt_kms: Add helper to get a pipe from
 a connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v9-7-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2360;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=C/VYlbtfDZABuEOma4GMBbWUkuJaFoUmUERoucxTBtg=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6KLtEQ2wP2J2NdB6GBkcPRKg0AZOIRYLTK5
 sKsmBBBqvCJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabguihsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLRAQ//cL1y5UMo1B4NiCQXgcvytaNQmjHuFns
 I1C14n2Qh3rzqorlN2ZHnfkmfwP9kA5T1uyFA8v2faXesNBzbav4xOulhNJVBJxkBtR9R+88a1q
 5K2KElz3K3YGeiDmfPpbQrFWU4Ag07mmWLXhzHpvF2RS7ToQ5ah2hNlJWKjr28mJuuz7F8n6su/
 Uclxtem9qyOUBkTDt8n64lCrMSEIJTNiu84Xtu4JI4atFAdCTmDMh4BgFCE494zpXdyLwpNyMeR
 17RMY8tuck1xqfdWDRYVzRkBLPHaqEskiW3/WD91/+whZhmMgUT/m8c5rLhnxLCtOMB0plRrAUy
 ge8FlShtDIAk4CtHt04vVuPLNHCVoq5XpSmjSkMyfGPUebBSJAr39GH8OkZXntohRbGNdTL9vDa
 zELy19Odvp+wYfwf8ItbA3yceVzSl7UG8afj8fXdvSXZlRsLLFDK7XThmwhvQ2BXNZZZh7/bK8m
 TRxdp39BtjswYhu0EJ7zay27XcHLF4lGsbCWhQ9b3IaAa20P/dGJQYttGHWAyB0pPOF5So5+LN3
 +cuOG1qXKZZLCqzZ5hNUYM3+HK4pjym04Ca6znYY7H2Y+dBPan0wUzL19sytRzpmd1D+vodmNVH
 LPBS7ynW2/UKO030S74l/HM92xTii/rq+9DfzeAzgKYSosOsWVbk=
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

