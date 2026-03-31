Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09360FF60F4
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:14:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFFF810ECDB;
	Tue, 31 Mar 2026 17:14:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="OqSw4vog";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61F710EC39
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:10:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id C05EE4E4288B
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:10:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9782D6029D;
 Tue, 31 Mar 2026 17:10:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A18DE1045028A; 
 Tue, 31 Mar 2026 19:10:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977056; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=6G0hl6h+B8A1nID8bGHDpW8kAHL6mLtN5t2EhgZabm4=;
 b=OqSw4vogtYgrd6iu1BVYQYFQMr5ZZck+A6RllI05hW8qsAfY7PYvo8ep1TVrDGdn0ipr5L
 Twg1lJGJfnC3M8z8KrBPB+owiU7XCPznatDzufoTfVXptGIucQ+xxlOp0AdjWm1kLWJtTV
 UgOoV8cieD4q/8yen5qaJKAXWqLtBtTTyAJxkkyUVE9EYJJfsjHbh4/7KX2E+9Jb6Ifv70
 1KHfNZrRj5a9umb983+lo3rA0CX8+sLkNzgRSqsAcMVL4pPBoTKobUFH1yu6+nf5W9J/wU
 UxnmtfiRHwmLGSl12+iIoD4onu33VCrCJN/BNVPKg7fXv/FyJPMidWISWqVa3w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:11:24 +0200
Subject: [PATCH i-g-t v10 07/49] lib/igt_kms: Add helper to get a pipe from
 a connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-unigraf-integration-v10-7-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2476;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=LeA+3GwnnZb20mZCkFv2/bbRA5R2X7Bz327/jd0fcoQ=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzAA8K06VeobcOvtPbl26zoGxNIV/rDiAn2ZYj
 EA+i+p8SLqJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAPBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOI3NxAAyA5LvFTl2yrwBf5ewxc1YH5p2fxSrWz
 0AMdb0JCfYy87fbYP3fduH76j27wqXtFXUuopttKKDN9SZE8RL15FTDf14sQ4OnuWyTK2jwkmhZ
 l9AOEQ54VNJdh+7XOBd0vS/tJcNqyxG8wS7FyWvhhw5HsT5fEfKAcrt0E+gwgGOrQf764CdE/8u
 s5sVSgQ6+Cgvne5xVsD2mh3yZoZiY5mrutju+yOhGSJu7r6PxZJHbn2K2uiPAQa8PJIA4TzFuD6
 fQ8NULmwg7rJ9PMgCfzEEbMx6gJBlIA/TFNnAOJfQLk9f+sfP8we8UuNCPPB/fLqQj8FAdrvOae
 KqUtXkFnBU2mUS3O5VpOzZOgoEtGXWHevM0rOzlFsIsryTxRtrJCM+sBno9DJV91YN3mE5XAxW1
 mu3LsoY/iTlceEEQku0MgPNd2Dht0/9JmrhyKNK2wDs3mHSc4otW3FLXoqc9pABvJuCAU9fgBEa
 1FcLOjQ2/IrkaTCe+TfsplsVDKdMC0keXPgP1Y8tEnm1SBCQYuDAoShNZ/ihfZw4M2As1xM3EMX
 2t4e944f1FP+CW8myay7gKXvM57sp7Vq+SSdziL2ATF5PXOiUnD67Aun4dZqsJfbqE1qd8YTtM3
 sI5iJmzSjirQOzREc44VGlS5x6pfk5/ySVXnB/w+pFJ9Z2JfWndE=
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
 lib/igt_kms.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  3 +++
 2 files changed, 47 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 481b556dee99..d134fd4bb80e 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -8483,3 +8483,47 @@ int kms_wait_for_new_connectors(uint32_t **newly_connected,
 
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
index 02f6f427f1f0..462e139c46af 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1306,4 +1306,7 @@ int kms_wait_for_new_connectors(uint32_t **newly_connected,
 int
 get_array_diff(const uint32_t *array_a, int array_a_len, const uint32_t *array_b, int array_b_len,
 	       uint32_t **diff);
+
+int igt_get_crtc_index_from_connector_id(int drm_fd, int connector_id);
+
 #endif /* __IGT_KMS_H__ */

-- 
2.52.0

