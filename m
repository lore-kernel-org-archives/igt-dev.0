Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6EAE7DEF6
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:32:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E9F10E410;
	Mon,  2 Feb 2026 14:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="n7NvN0Tb";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B954B10E4E7
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:34 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id AAEE01A2C1C
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8226660767;
 Mon,  2 Feb 2026 14:32:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4A5DC119A88EE; Mon,  2 Feb 2026 15:32:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042752; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=VyOPrzuSZc5iiXU4ZxsNhdIajUoKYbtVhyj71MtvA44=;
 b=n7NvN0TbGGcvrufS4Y2HG0ZxKjxCFWzozeqePkOm5XyPduG1iRVQuXT7/fx3RGjZhfDX1y
 XiY1QbeuZf0cpAKcOymUmqKfFr5/0zxTkS/fJzWt6pXJKe+BrcRKMgjI8YXtx8sDTQlJ/E
 4ONAD6JPq9YT04isBxGrn1CxZ0G9dxKSWUAPXqaTAD/4SGvVyIxRi0DAPNzfuV0ZKJzTq4
 KQE1iaiHN6XSZJGaZWadnqhtnqZyQXa8HpXOhiOYacRnuPm1+WF1BcBOYkp99FIqvWr7D4
 HuBjsU9jLKwg5DPs8xGkYgxZBXeN4J0zlrCh0o2G8xtrDBdPGVm2fOdS6mmElg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:32:45 +0100
Subject: [PATCH i-g-t v6 06/48] lib/igt_kms: Add helper to get a pipe from
 a connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-6-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2297;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=H8Idt1wP/W2ur3NPCBQNotYTDwJ4B/1lxJuoSB8pdk4=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWPuNh8hYWoK1enviBKvEzXQbxdz16ArTpAe
 WLHP1GrWgOJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1jxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKSlxAAtmWS+Nq+vpNij7t7jHMv64JjDARArbz
 ub8NLoozqRlFnzI0atWve0TQtefge9tBsdVWLTM9AsT8xiWd636hH9SQgNq6xNmc2S8hxT2rwl7
 WvSsrAMypbMUCE/6EC1vTMTEKwWo2ssKfLnIuIe01FTkS80Z2Lsjbz/HGNYBP5afg502U0597Da
 cTq9HOnxgUjW4i0MuyXOJ/oNRao4JwvioSqxoTKPKpFVzwsEp9RVjOnvAx3Fm0A5tEPKFW83vA3
 RQwlYNTmZ9laPn76kqr+K1fFiKTo261jrMbkXxB9CF0m1GmNZWAKNekyR8Y6GP7VVtRxHe33nKa
 VWzJCbwWpZQ/K/w+7iEz6Y1jUeFOA9wzNOdp0iwr7u1L3xzk7RF9Q64z8mBWl8jbn9Hy0F9Om3p
 CJoP4nggo3UQXGDyqosLFdaTsm166nF5rSr5LrqA91QfBxv5jLVKUGDpuAhShqCT3I7Uer0au+M
 LAUU9wU+3d3+OuTXKah44suhY6MPcclTMY72Q+rN+NnrWE00dlZ2ajri4ON6nah9ng95D1cgWQB
 DpbCExlKiHplbHDpr8PBIgVblvJVa0CPsfNLnwSLnVHXaWNFeIkH+6VBGA+xl8G0VpQlSN2pQYz
 Lkvdyoy28IMwfck4j7wEGq4YP8RWcjfJNU1U3I6X1T7WaPCKEHl0=
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
index 6122de8d877f..e24140fc117f 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -8325,3 +8325,44 @@ int kms_wait_for_new_connectors(uint32_t **newly_connected,
 
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
index 6843b6ae2e96..f2eaad61fdf7 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1329,4 +1329,7 @@ int kms_wait_for_new_connectors(uint32_t **newly_connected,
 int
 get_list_diff(const uint32_t *list_a, int list_a_len, const uint32_t *list_b, int list_b_len,
 	      uint32_t **diff);
+
+int igt_get_crtc_index_from_connector_id(int drm_fd, int connector_id);
+
 #endif /* __IGT_KMS_H__ */

-- 
2.52.0

