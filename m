Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2D9CCF9E3
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:39:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5B410E3B9;
	Mon, 10 Nov 2025 13:39:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="K5g0QHu5";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E575A10E3BB
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id DB35F1A19A8
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B2CEB606F5;
 Mon, 10 Nov 2025 13:39:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E201C1037190A; Mon, 10 Nov 2025 14:39:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762781987; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=hj28k7xc4GvSgppBPx5A1QLqAy4vto/ecMFMUrjVKKc=;
 b=K5g0QHu5nYz7MmBSwxH4jSQpVf+szz4HWP6/9id8+5fVQ89ePKdQuhAPDQ1cYaSEIdFiTT
 rZBGK/K0Q7d1P2wvNPFhY5aZBq1ZNh6/GJ+afQBEp0cppLrHEv2kvxnnatfzcvGcfMNF4i
 omoc+VBfpouEiF/Kzxsjgp1oISJhxJ7PjHymlpArjxbG3rM0idJIOcrmSFBQoRNKIrxG/x
 gfrd1hAT+f8LDusFt2LI2dXOZAvQGFjsPjT9sYzaKTexEXNcCUPbHD8xfbEEPxeMOgc9cA
 y90EfJNNm+UZiVENo6FrMrlwQdo4D2wNjVzOhPknCZ0TogUcGKf6q7Dvo8MXNg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:17 +0000
Subject: [PATCH i-g-t v4 15/46] lib/monitor_edids: Add helper to get an
 EDID by its name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-15-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2353;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=nF3m23WFghrA++b/ImhwXP1TKwCZYQDbOHS/3ITIVHA=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesOVQeFACrtKKeC27/zPwgC8D1wAYebL1kA+
 Kaza845iK6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrDgAKCRAgrS7GWxAs
 4nT3D/wLkuSPDjrpLIFAoFJU7wcJWX8qXpx1pjlJIFhkjVL+661UgLbWovphduGJXv70UKTo6at
 R71VpQjckbs178PmN5Vxd6htRPHZyOidT0mQQ8+YXXB04WUx+jJy24+LMJrrew87Cnv0jcCdhBt
 0xa6Enba5QL/ERMvapsRVZoAxtHWHjvwYh3oAXYD7svr6dN2HIE+Sbl0dtG2HAhNlaA6TV2Wq2M
 BHhb15kYFCzLDGLZbL5KrbIy5tHFB6Vbho04pGuIiXRfYNGaI134UsJNF6eOCXQcRa5tTrvrErl
 lFPvcF//hIDsbsOn5v5/65cFexANF0zDHaAiIBhfmmWCFs+8OXCworIT8zeJ6yDz3A+N7IIFNgz
 DXc8q8d3apG+hQGmiHFg7kfg5Q4+sK2Sal5Qop+lJJkzoOG/4c8JsRkQu7U31ufnUhq5YUDNKQv
 v+9onUOqCaIsOVooqT8pxUvsMauwDkSq0nCmSiBkREy0kcxk07aWoHNot/vyIsfWK1PNEuNsROy
 1vQOsV/gILUCrh1LPCGdAL5Jve9U5MaNxg5eoaS05JYhZSrxzqvWfKi9TToSLwfWzwOMAQa5jKv
 18iy23sq9BD6xDMqssW0th4/cWAOkJlRLUl98hayQT0+bAl9N3zkGydzN4qwS+rEIRHnfBUa8BS
 znsrPTfSh4EQAmQ==
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
2.51.0

