Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC4EE7DEF4
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:32:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8DA10E4E7;
	Mon,  2 Feb 2026 14:32:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ztb40tRt";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8521710E4DF
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 787261A2C19;
 Mon,  2 Feb 2026 14:32:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5041360767;
 Mon,  2 Feb 2026 14:32:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2D3AE119A88FF; Mon,  2 Feb 2026 15:32:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042760; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=CJAuaUwLM9S/nxUrOVHdt6NItfyyyXR/gwfEI2vzlu0=;
 b=ztb40tRtCG5yPKXa6mSuvg5F+W6+1uGzDYIg4DoTZP8VlVuQ8+du47b2IFaJzsLAYd2KaF
 +/6IPPO/goZwwtpAP4RKg/MFDzaXOPaN3rKAXYWyNomeV8C0m1+Ba01RkZiQgwvCCrzZRn
 xNxLk/NYLLjFIgPRJEAn/WWZkbtB4eywBNi+t0bxG9NcQvkztYvcMpQtKyjndL0ew+SK6C
 YVuzvTHthfqtoxvDa0hMBwa4OJCjFneTE4ets0MULJ10QX9m3GlZuq0VNDp/Atkzlcsilc
 e2JGk4bHB/N1+ISQjSiyrbpixVi62yRaYMniSUUOC5i7p+eJWXcdqki95nKDqw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:32:54 +0100
Subject: [PATCH i-g-t v6 15/48] lib/monitor_edids: Add helper to get an
 EDID by its name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-15-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2409;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=cfmJcp7ytF+sVgoawtjHM9rCJzC03CK1TcgLersG5w4=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWQYh1dwNScfWos97PrVfDJxlJz66v0EBglY
 puQm9fV1iSJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1kBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJJ2g//bIdV579H4XOACSwxnewQ8DdtR23Qq2L
 5tySjx89CBQsLFkD5z9qHO/KeAZwsNf5xx83lNn9UhGl5UIEi0t9FyNFH6DQeZbnaShgtOmdPpv
 9WiifDZTtZYpZOgJVFyUgdkLf9m8vf1hIXv5u8We3zRrAW4gR5kxfKKY3pLZ+t97EAYMYQvHp5K
 lcCA3bB2HGJrUDqr8CLblKSA+bo7Nf813+2d9yWiYnkjo6G32yhSxfal/gCQmtKmcIjPM8imsyN
 89wkyOLvFuSRtckrDM5ZbFFtfVnRLNN9ZRwFerYCnyINDRcx99JZSIvFuJJ0aElzvQczyO9Whi6
 TWFsiwrYx+ZOgPRoNQr/b4V4p1v2I9Q/+nwGNaTvmCZix2tECQQfX83t4FOYfS57jT8SBRO3WUT
 FB5qFml74eLkkOcltmZznd98Z0idZAEe/kv1m29zjbCnVoPyZU3iCHfAoztABFea+GuNBWCEXZW
 zHYuCo4llh8UTxKbQSzBccsLcTkU/9snRKEsuk8DjImKjeN6FYR0vVU2V+1KxV8yHpb/6ImbqYl
 dPZHeCg8Wwle1GSRwo4A64oMvzyWsaEOjx8+AjF3k0YI7Dx79kCZUoa112O8+V5Lqu34APlNZp/
 LedgRMMKBhwn4DnHtiAxnZy9nrlZk8qxwh2a/qo7meBN0op1acxc=
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

