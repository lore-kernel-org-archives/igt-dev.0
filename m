Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84B5CD1297
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:39:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4DA10E3BA;
	Mon, 10 Nov 2025 13:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="pmTuTnQa";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25FD510E3C0
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 066344E4160B
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D129C606F5;
 Mon, 10 Nov 2025 13:39:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BC44A103716B2; Mon, 10 Nov 2025 14:39:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762781978; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Ve8Og5ourIYWE/FvFn81g4wWQfhIDLuQPM8tWZ819Bc=;
 b=pmTuTnQa57beTyzRXX57RbkMu+CCUc8OGA6Mc3pphb/v5R2soFaNSfypcsF+Mdp/Gb7Si9
 pBlMxBBjZiOWCbJG0AEsKtEe9Nem26sUD2swtL1n00GJiCFgOh3WrmcjzcHzIzPb3+RGIZ
 wf0KS/Q11V0ZsjE7o28UESgCmYrSIO7hynxf27s0WI6ivztiV+xT2v94bxpRloDlUNw7+Q
 BWP1KNCDdkbRO9Me03VyxHhuBgpruw4R4Wv2rZxfBSCIR5iont3BdTWDQs5UUN/CLsVO/V
 Ve48EhiSDUSOdvklR3j8Kfiy4wC9tWU17ZyIKsh7T0yo+oJPSL3x6s9U/RIQ5A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:08 +0000
Subject: [PATCH i-g-t v4 06/46] lib/igt_kms: Add helper to get a pipe from
 a connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-6-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2282;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=T8jRsUglMGsF/F+v3V6/cKdsvWHWOfg0+1FMkasEU7c=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesM423K/8SUV/o8O5NG355xWR/VisdruEuVV
 0CJ9ziSUZmJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrDAAKCRAgrS7GWxAs
 4oVdD/0d0mUpkZFzwz2YDtxjKH8LoaPS6N3sB7cKKuEwoDDw4AeYjlhLkpItYqwBphZ6E8pJZk2
 TgSLDe4h9Aihd5Q6gh3E3q4//c4/lzBpPP1A0VK84QsKwlywfI+OiJuFAgFOMR2H//zY2EJ6/d+
 PQyVRpVrj9wNBLPnm/oZfh6K/GCtrXxc1IQ3Zjo2Tld3xLzzkOhT+tKx+UxOjU9BpmHhNrmSMoE
 KRaAxy7wXE+ucAmcXqG2eNANLi+blF1gXWMDjRSOR8v9W1mV0BKCPKJFpaAY8vPsp9g5yCovlcM
 QnLw007FdKEZpAjhl+5Ji7Ab0LsFRR2bEdXsVJkF5M7CFV69t94oP8buL7qKBCk/P/+SIOCy24q
 pW8N/jJCkv91vcsIafmSeTWnSmD3+BblrdieF9+OwtT+uMC8hHgc+gL9i9nlJTSeHgWzLHsJoCY
 tB8Ss4LjZ6ngBEhkSoS0L+c5PmKMY6ub6pmjTRM00XHMDFbQLuALGLhNurdmBf+UN525qTBxBGK
 G38tWrDUZi0NrEzUuw6D/KMoXvyv0anWaM6k73tZF4ZuFc3nMSzbGYFwvv6OUbd0KBjIBwx/Rh/
 l+aif0ApNnC04r1KxEb1ePHcQbkReZpaxpOaryhld++/eO3BUS1uFKEEZEMM6L2kN0N2RGiKBP+
 Fqit1jxfEadhs7A==
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
index c77c94d7c437..f8d4037a68bf 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7926,3 +7926,37 @@ int kms_wait_for_new_connectors(uint32_t **newly_connected,
 
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
index 7b1d01efebf2..4184c3930cbd 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1315,4 +1315,12 @@ int kms_wait_for_new_connectors(uint32_t **newly_connected,
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
2.51.0

