Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7323CA0EEB
	for <igt-dev@archiver.kernel.org>; Sat, 23 Aug 2025 02:20:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D0DD10E189;
	Sat, 23 Aug 2025 02:20:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="oWaMqY25";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908F310E322
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:20:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 8F1BAC8EC79
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:11:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 744BF606A7;
 Sat, 23 Aug 2025 02:11:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C10EA1C22D3AB; 
 Sat, 23 Aug 2025 04:11:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1755915106; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=O9McEQ/0g0Dox39Ncw18zApB1epQUgT/zwZw4CkkU0A=;
 b=oWaMqY25u5v8rhhfsLdmUaAsm3o+xR51ozJNaOcXEW1UsEdAKddJI8nxOqRq0UM7W99uVn
 xczi3NLlVXxyTgqL/JcsRZ/kViFeoYoRihVLm4KzHicM8NNugZrDZ1BSFiii9Ru4I+F5Xg
 rCdlp8kTP2HaWM3d1zCD/WBi1K+PZnP+H60T0Is2hGCNnHzPrQgdYpoVbFyWt4rCSCH/gr
 2KvQeS5fgwlSlJLZu5VXIxGpM9harVEeTNI59/ecGG1Y99kgplrv5Q9Bmg8eXgRtS13b4l
 gVy1BD+ctRUn/qUf4OdkrIrn3c4uFqLUtBgtkahN8ZmwWC2gJpjCCglGvjHRbg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 23 Aug 2025 04:11:28 +0200
Subject: [PATCH i-g-t v3 08/29] lib/monitor_edids: Add helper to get an
 EDID by its name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-unigraf-integration-v3-8-cdc36d5fab4c@bootlin.com>
References: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
In-Reply-To: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2465;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Bz0PEz3dP3PlrO/LtqRaCMO8gjiSXZoxXhEf27iQVrw=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoqSNTFPbQh+TO+0WgUaZl+bJ3fstSpDA8pxisx
 dWE3n6UO+aJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaKkjUwAKCRAgrS7GWxAs
 4ra6D/4vxZqZZuutXFdxZm6Do77VKaULbWim/xaACHlRKpVnG3R1HWblGeNao5FBgLrwm3+mVy7
 FMLWeOlkmzkE+g5+lm4yyAEsDGDqWm93hxouWYUR2j6dWu/WOoyQ8tKFrzrZ32y62mCEmoiTYAY
 EIOcJ+D6IOQFVWD8X4iXk1MesOpkjRqCFkw+Yv8ALZwfWaQgbWhn/Bk+uXGD8slMqwlofH0gt8R
 u5ET9tYn9+5jVZu/P2qIv9YxFoHom9ECvesYvbdh+XaiIDXedsvHY/ypXSF+K8X6c6jMOJTF06j
 d/KsIs/5i1jE5mX6Hn73MYOpgFmEz//MsL2ma5VZw8D5Y5FblA+ntPBQqbaTxIMh+hahBPXckXg
 gxzOFzs8d7w2HRnOis2I/6hkCIMOBu/AU7VHHGSTvu+6k73ki/7Kt3kozFhujeeSZOU9f0m8EG1
 c7oh81HfzG9lea/9k7uN3dfYkWGgwkx2ahpgPlGyat79EMTQgNYLSs4u9ODpeJq+DXDu+O52VnF
 I6MfKtuUO+XxRsB/H33jj07gBSuEEBBHnFfpvsWXdQaSCWbB68S7iVJEaq7C/pxyFLcfXSq1/LB
 Xq7hlLzlFUq2MmxPTtM2M469fn/4qPZRC6fN/EgYHAMNpmjWYiJILSELzY1UPmMDVSqD5BEdwRW
 111TlQrCc+IXdMA==
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
index 6043e7a084b320263f1c0525369aaa59a5d32bcc..01feb34a5516916b615a741f773316159c38fccf 100644
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
index e5069868683d97053d8e66666e83692f1b733db3..6d9e3fc89592229cac5122c9275fcf226465ab3e 100644
--- a/lib/monitor_edids/monitor_edids_helper.h
+++ b/lib/monitor_edids/monitor_edids_helper.h
@@ -34,5 +34,6 @@ void free_chamelium_edid_from_monitor_edid(struct chamelium_edid *edid);
 
 struct edid *edid_from_monitor_edid(const monitor_edid *monitor_edid);
 struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *count, bool four_k);
+struct edid *get_edid_by_name(const char *name);
 
 #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_MONITOR_EDIDS_HELPER_H_ */

-- 
2.50.1

