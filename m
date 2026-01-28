Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492F5D25B5E
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:14:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B8110E6D0;
	Wed, 28 Jan 2026 13:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="OpFTygOC";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BAD910E6CF
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 6052C1A2AC0
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 37E676071F;
 Wed, 28 Jan 2026 13:14:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 44CD5119A881A; Wed, 28 Jan 2026 14:14:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769606081; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=CJAuaUwLM9S/nxUrOVHdt6NItfyyyXR/gwfEI2vzlu0=;
 b=OpFTygOCxNCM/W4dYlDj4jO/L3hu5T/D61CmfdeZdfG52wJOAj1XqS+NKrhn9qO4hxXvO2
 lILOJhnXUg9lynNv+/jmH89yuTiwX808YU2N5Ep7N8bEYWZPgJmgl6jT837I0LU0jAPJlR
 L0gFFhfsmduqJ7qzjdPD8EBTMrnajbd1xWrq7N0O5T3xmEDHd8D592/Kg8xkBuMlJtPZF3
 Gj9t+0R5cDQ2EoaEQUSBApFJ1Aj49TXOR/fcQuXxcxDPYx0qOlddja0otr7Y85fC8lgQS4
 plnSuWPet5IZcmN7aHnJ981oI9nL5BSWKeoBSSGWZzy8ZUjVR7eeHGrapOwB+A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Jan 2026 14:14:46 +0100
Subject: [PATCH i-g-t v5 15/48] lib/monitor_edids: Add helper to get an
 EDID by its name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-unigraf-integration-v5-15-fbf2e997a011@bootlin.com>
References: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
In-Reply-To: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2409;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=cfmJcp7ytF+sVgoawtjHM9rCJzC03CK1TcgLersG5w4=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpegvJ1Jh0f5LsMWiQm9JREH6I5K/DEIbIFGWLZ
 vcPQluabxmJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaXoLyRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIgDg//QwWu2KlRg6+LkPnzP6QnjbKgfBd+gRz
 QqldrVV90QR+WTUqJGJLu9bJAaby+1/SXS3zxRNDdW/TtRkARRhbQFYxGuYuyM1DuSPPsEkmUdb
 ttM/JOqWWGHsyJOfdz4URHsB3pPQMsjxBksP6LihjyppNBeFrC7PtmBl5Lll7U9SSq61Hb6Q5GB
 mi8DDePNaZuoSZYYXWu9oScdXS+9NrAOTC9VzH1AO+Gan0sQmh0QRYeon6p3SJ57vwc3xDorbtU
 9+IaRvDNQA49r3whCjdwRwoHfqsIlv9Bj3smDBzyMapth57LGD6Zr53oWc7BdCn4VFMxjeq45Re
 iuyKcG1JwovXmRsYhy+P5Mcn8780IuVaUwnziHzmwRFQDVxTtmXK8ypW/Bwn9Acn5ThonaPsd2+
 2bTwa1yN0Ir6B1cEtRE70YCXPc2DHa3GT0z4F6DH1GlNtMmWUKJBhxxcJPMfcFkFpySKaxj2/e0
 i8Jx7HS5j9WzCUSCHclErhmE1cf2/Ja4WxZkZORR3R8WUBmjT6jNIp2HgbdURkA+HKXzeguglLP
 TZ1PWAezKxkKSCMNyeLH5zu/EW4HPGj0QyNXT/3phGRMuryDlhE5D423BFLnwsWCQW095P/cSR4
 0ZtfDVoLlNMrs0dVGvfOKpRf3aLEwTmjlSDxCBt0INqzfM+7CqYU=
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

For testing specific EDID, it is useful to be able to retrieve an EDID by
a verbose name.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 lib/monitor_edids/monitor_edids_helper.c | 30 ++++++++++++++++++++++++++++++
 lib/monitor_edids/monitor_edids_helper.h |  1 +
 2 files changed, 31 insertions(+)

diff --git a/lib/monitor_edids/monitor_edids_helper.c b/lib/monitor_edids/monitor_edids_helper.c
index 6043e7a084b3..01feb34a5516 100644
--- a/lib/monitor_edids/monitor_edids_helper.c
+++ b/lib/monitor_edids/monitor_edids_helper.c
@@ -20,6 +20,16 @@
 #include "drmtest.h"
 #include "hdmi_edids.h"
 
+struct {
+	struct monitor_edid *edid_list;
+	int list_size;
+} ALL_EDIDS[] = {
+	{DP_EDIDS_NON_4K,	DP_EDIDS_NON_4K_COUNT},
+	{DP_EDIDS_4K,		DP_EDIDS_4K_COUNT},
+	{HDMI_EDIDS_NON_4K,	HDMI_EDIDS_NON_4K_COUNT},
+	{HDMI_EDIDS_4K,		HDMI_EDIDS_4K_COUNT},
+};
+
 static uint8_t convert_hex_char_to_byte(char c)
 {
 	if (c >= '0' && c <= '9')
@@ -170,3 +180,23 @@ struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *count,
 		}
 	}
 }
+
+/**
+ * get_edid_by_name:
+ * @name: Name to search in available EDIDs
+ *
+ * Return the struct edid associated with a specific name. As with edid_from_monitor_edid, the
+ * caller must ensure to free the EDID after use. If no EDID with the exact name is found, returns
+ * NULL.
+ */
+struct edid *get_edid_by_name(const char *name)
+{
+	for (int i = 0; i < ARRAY_SIZE(ALL_EDIDS); i++) {
+		for (int j = 0; j < ALL_EDIDS[i].list_size; j++) {
+			if (strcmp(ALL_EDIDS[i].edid_list[j].name, name) == 0)
+				return edid_from_monitor_edid(&ALL_EDIDS[i].edid_list[j]);
+		}
+	}
+
+	return NULL;
+}
diff --git a/lib/monitor_edids/monitor_edids_helper.h b/lib/monitor_edids/monitor_edids_helper.h
index e5069868683d..6d9e3fc89592 100644
--- a/lib/monitor_edids/monitor_edids_helper.h
+++ b/lib/monitor_edids/monitor_edids_helper.h
@@ -34,5 +34,6 @@ void free_chamelium_edid_from_monitor_edid(struct chamelium_edid *edid);
 
 struct edid *edid_from_monitor_edid(const monitor_edid *monitor_edid);
 struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *count, bool four_k);
+struct edid *get_edid_by_name(const char *name);
 
 #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_MONITOR_EDIDS_HELPER_H_ */

-- 
2.52.0

