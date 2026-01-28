Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7457ED25B5B
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:14:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2378C10E6DC;
	Wed, 28 Jan 2026 13:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Xnf8e0Ll";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408B510E6DA
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 9655CC211E9;
 Wed, 28 Jan 2026 13:14:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 199106071F;
 Wed, 28 Jan 2026 13:14:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3FA8F119A880E; Wed, 28 Jan 2026 14:14:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769606074; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=y7DUXaYh+bifrEeshfA51qhsOP6wgOs8baTh4zJF57o=;
 b=Xnf8e0LlkV2PxXrGs5kSFJGoHGbwETOvVLTM1iAGz23Yzt0cRIjPMkE7ScJPvjx6hLtQYH
 5F76OD9r61BWi2c4AIzWpukGaJKpwqs/UsPEEREWfFAE2Rg3vCa/HuQEU8vUBOoUrB3BfT
 JcX80vpSPIfWkYmMjbMDBtKW8TwfoZXvjqg42bS+q2wtSl8mKL5vysIBAkIh+dtigoc/0b
 QhRgkhUHHicoooOWO6+IerURRVbHQp2r4Ts82dAGtQEg7jBMy6YNTPvDQXQcSp7ucvgbfN
 pKoZ59ixDRV9fvFib9GGMrhg+ajUVzle/MG0Q90ptf/yc9cR8UQ9RqCxMl8q2A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Jan 2026 14:14:37 +0100
Subject: [PATCH i-g-t v5 06/48] lib/igt_kms: Add helper to get a pipe from
 a connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-unigraf-integration-v5-6-fbf2e997a011@bootlin.com>
References: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
In-Reply-To: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2297;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=NbJIhkq6HswUJ1wpO/fVea3Rne0ZAEDfLI06xkV6WoQ=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpegvI3y9yABJ/zdkd9YmABrKCyQK75EAKAIs5M
 SofK7S6H0WJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaXoLyBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIWWxAAiWOPCCL/wtTQ6xwrE0Qj8q8hfulddko
 Wky7qPgOIvuE2PDG5CNm1hZ3H56x+M3gzy+WamnCSPz2py/D7SDqFMBivobqbDV8qIUiJLQjzDJ
 xByARS9g7LBKZkhw4tFl5f4nKY54BBk9CY43x5cuP67qXbK5Vdem+SR2N+tXCY02awCh7Hz0Ivx
 PQBGbBpBRbfXFR9KfijypQA+N2wlPLu2JiWu9uNsUxj1pQ6XOv2O/FJ5n9rbdEW0LMmZLA5SQkF
 lUsqCwDNiGDYzzHSpohgI4iJwlPQuC9niluWnInkvZpiLsbSqY8t2ilphWyi3CGopAPNY94MoFb
 W54jBbvMhqToSG2WmQI1HnFygpeNQSz8LfwDVekTimffycV0CzjWvWGqaTvhWwQXTaR+mCHt36K
 5Ft8lFlocZHepmrkbcgJOTE2jsucHKWZjBlCWxSDYfl2otVGS/w2+STSfPF7U5T4c3vjtF3F4Bv
 kZKmzMnZzPEzyHB9oYHeFF+MV7raXmQMT4LBT4bfaXcLqx6u//modrAYAeVaAwXxsgkeN03Ecfe
 Yp0txp81q/4NlQ8G1Z7C3fF+jCPnxu6+6lV7G1Hk5QAFp1tGt2iIVj1OPcxIgC3wkrw0WsFbSa4
 vkUCeqXBJx0z6Gi0SpY6ZHG/8OcW8RiA+LsuR8DUofnHjTy5rTOM=
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
 lib/igt_kms.c | 41 +++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  3 +++
 2 files changed, 44 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 0574e4614e8a..65c9b71be975 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -8333,3 +8333,44 @@ int kms_wait_for_new_connectors(uint32_t **newly_connected,
 
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
+	uint32_t crtc_id;
+	enum pipe crtc_index;
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
+		crtc_index = kmstest_get_pipe_from_crtc_id(drm_fd, crtc_id);
+		return crtc_index;
+	}
+	return 0;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index b78c83856351..c1e5291af56c 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1325,4 +1325,7 @@ int kms_wait_for_new_connectors(uint32_t **newly_connected,
 int
 get_list_diff(const uint32_t *list_a, int list_a_len, const uint32_t *list_b, int list_b_len,
 	      uint32_t **diff);
+
+int igt_get_crtc_index_from_connector_id(int drm_fd, int connector_id);
+
 #endif /* __IGT_KMS_H__ */

-- 
2.52.0

