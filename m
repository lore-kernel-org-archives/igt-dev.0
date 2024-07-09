Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2517C3DA4A
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:35:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4582510E5A6;
	Tue,  9 Jul 2024 15:35:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="OXzU3S3D";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFBA810E5B8
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:35:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4566220016;
 Tue,  9 Jul 2024 15:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2+74UYdB/MYQMAwiD0LNh6P5E+TxnQBRvd+ikYi10MA=;
 b=OXzU3S3D28D+qyW6IullBCOORjgAvKr8q3NRZ1jeAReslY114/Z5/QsmIUocFj34BiovvE
 5Y0s2gLkOAEzoqP1Px12O497AhWg1Mv2cHz+TLAbZMMQDPphzPGBTBMC4JZ4QWJGaGDVQx
 fjrSaA3o1F/nF3Znkrj87ElJYSoHyWD8M7osOMXiB72Xvj+QRZRyNWA7QY2ZZ3Iu1vM1qZ
 sk5U8gJ2mG5e9w1Lv3CRXLZ2Ch/6v0pET4xnHZcD97HQ6Y2ZvoyTaf5gnFfC4R8P9Gyz1X
 6sQlyD+1o8CN3hcVBFx/BBVq7zyhG99cFTp1VUwHFQYWZjIwo9ojpx26rrH6IA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:43 +0200
Subject: [PATCH i-g-t v2 27/39] lib/chamelium/v3: Implement helper function
 to retrieve connector from port mapping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-27-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3494;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=6g5DsUcDlZpfBXpyO6oGZX1po6U4psXoHVxNP+s0b4E=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjViZO5UEIrQlfukvLAY74oeLKvSiEiCJkIbru
 iiAA0txC46JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YmQAKCRAgrS7GWxAs
 4lNPEACE4ECvcosYin8+hjGN8kfNXhc1VaJ8oG4ZgnO4cKmBqdkHgHQKY3gT3MtoLrVtmVGHR38
 Gl/Ikmn2J4pJcsDWIE3QVqLO4ZTxftTi01i6quFZjIiunHB5fVWgXV9GdCZF9F2qpBWYBHRiz1D
 o/fIoSrJTHkQEnS+diaoTd3qfyjQPriG43ABIKOAYMciPQo6LPzUXO8RiKX9gCU+SbsBGjPzoXc
 5CQWb0TuYBTFOwuc6uJEFkFqlyNbAmXqN+RSg1i56osiqazJMbPdYC1xHgA9KyIuFMbhdWdtGOg
 IC/T/OWEDnlU3SG2heEoLQORtkNUU+70MHgFyC7iUF3ok+BdWdQZotsn5jd6MYvQBG75Q2HWGv9
 waMK94gX5wAIWnnUgQwQ5TGN6OCC0QASKeKgCahL01+Zfu/uPTlSm7pm35QPh+vdBwC8iukHqVs
 53X3gaE96y1Z93lkGTz0rC1U9hq3tXyycJEjzUaUh7dtmpCX3tpA2NWzzHTfy0Wro16Ft8Y0XF4
 UrX6aWfMfr5kpUwUhaqeYT8ZsAKcwbrW8hqr+5PXH6PIZpY/vNtDKNDeiMEm885+qAov89gPmi8
 9jIYjmUUfdEISnP0t2fjpp6MnFcld2gOQgXJgQxzQDrqHVhNQoKhPFOZuqcvzJuwMPD/l4qQw2a
 eXdald1l1PTSMsg==
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

This commit introduces a helper function that utilizes igt_kms helpers to
easily obtain the connector object from a given port mapping in Chamelium,
simplifying the process for users.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/chamelium/v3/igt_chamelium.c | 43 ++++++++++++++++++++++++++++++++++++++++
 lib/chamelium/v3/igt_chamelium.h |  7 +++++++
 2 files changed, 50 insertions(+)

diff --git a/lib/chamelium/v3/igt_chamelium.c b/lib/chamelium/v3/igt_chamelium.c
index fc9520466de5..51b3a610e358 100644
--- a/lib/chamelium/v3/igt_chamelium.c
+++ b/lib/chamelium/v3/igt_chamelium.c
@@ -5,6 +5,7 @@
 
 #include "igt_chamelium.h"
 #include "igt_core.h"
+#include "igt_kms.h"
 #include "igt_rc.h"
 
 #define CHAMELIUM_CONFIG_SECTION "Chameliumv3"
@@ -392,6 +393,48 @@ struct igt_list_head *chamelium_v3_get_port_mapping(struct igt_chamelium_v3 *cha
 	return &chamelium->port_mapping;
 }
 
+/**
+ * chamelium_v3_port_mapping_get_connector - Get a drm connector from a port mapping
+ *
+ * @port_mapping: Port mapping to retrieve the connector from
+ * @drm_fd: drm file descriptor to use when requesting the connector
+ *
+ * This function only works with non-MST port mapping.
+ *
+ * Returns a drm connector that must be freed with drmModeConnectorFree when not needed anymore.
+ * A null pointer means that the connector can't be found.
+ */
+drmModeConnectorPtr
+chamelium_v3_port_mapping_get_connector(const struct chamelium_v3_port_mapping *port_mapping,
+					int drm_fd)
+{
+	if (port_mapping->mst_path) {
+		igt_warn("Directly getting a connector from its MST path is not supported");
+		return NULL;
+	} else {
+		return igt_get_connector_from_name(drm_fd, port_mapping->connector_name);
+	}
+}
+
+/**
+ * chamelium_v3_port_mapping_get_connector_id - Get a drm connector id from a port mapping
+ *
+ * @port_mapping: Port mapping to retrieve the connector id from
+ * @drm_fd: drm file descriptor to use when requesting the connector id
+ *
+ * Returns a drm connector id that represent the port mapping given in parameter. A connector id of
+ * zero means that the connector is not found.
+ */
+uint32_t
+chamelium_v3_port_mapping_get_connector_id(const struct chamelium_v3_port_mapping *port_mapping,
+					   int drm_fd)
+{
+	if (port_mapping->mst_path)
+		return igt_get_connector_id_from_mst_path(drm_fd, port_mapping->mst_path);
+	else
+		return igt_get_connector_id_from_name(drm_fd, port_mapping->connector_name);
+}
+
 /**
  * __chamelium_rpc - Call a remote function on the chamelium
  *
diff --git a/lib/chamelium/v3/igt_chamelium.h b/lib/chamelium/v3/igt_chamelium.h
index 5e035bdd10bf..90d2a7473894 100644
--- a/lib/chamelium/v3/igt_chamelium.h
+++ b/lib/chamelium/v3/igt_chamelium.h
@@ -49,6 +49,13 @@ struct igt_list_head *chamelium_v3_get_port_mapping(struct igt_chamelium_v3 *cha
 struct chamelium_v3_port_mapping *
 chamelium_v3_get_port_mapping_for_chamelium_port_id(struct igt_chamelium_v3 *chamelium,
 						    chamelium_v3_port_id port_id);
+uint32_t
+chamelium_v3_port_mapping_get_connector_id(const struct chamelium_v3_port_mapping *port_mapping,
+					   int drm_fd);
+drmModeConnectorPtr
+chamelium_v3_port_mapping_get_connector(const struct chamelium_v3_port_mapping *port_mapping,
+					int drm_fd);
+
 void chamelium_v3_uninit(struct igt_chamelium_v3 *chamelium);
 
 void chamelium_v3_reset(struct igt_chamelium_v3 *chamelium);

-- 
2.44.2

