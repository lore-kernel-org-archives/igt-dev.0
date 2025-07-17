Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8B0C83F1A
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 18:46:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E879410E887;
	Thu, 17 Jul 2025 18:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="BSGMgHxg";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B5B10E15A
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 18:46:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B994F442DB;
 Thu, 17 Jul 2025 18:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752778001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cpiqMQYl+ugOuXs4AY28wGHk6BmM+4UZJeKUH9cf8/4=;
 b=BSGMgHxgnI3GWZSGzVsApWvCmA2iWjyRzxXwM1z3tQz4E/zt4MfyHC6AGhnnMMXq1dTBWT
 lYd9FBEkKq2ENnKwxdEPX+Um5W/CEvGWeAjlD2x/zhtzr3YgVsZz+/dsRTBtkmgfnDMTVN
 RTw4Q05lAG0naDIJ7wwYtruCWrZSH81ioisJqqBZknsvc4WBHIyQV/P9DIXHW1uMxUh3WA
 0O9phaSZ/logJoDHZYIUUwjwRkvhk1IfzQhL0Fb/ob8AIuDj0vRAlnbfNPLPa9jX8eO/LC
 1K+za3LHx3s/meGyQQXNbhCke7XNTJI4TIjer7+BqHSauf2zO9hnuR9z0eoiFg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 17 Jul 2025 20:46:27 +0200
Subject: [PATCH i-g-t v2 07/26] lib/monitor_edids: Add helper to get an
 EDID by its name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-unigraf-integration-v2-7-77dc329e584c@bootlin.com>
References: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
In-Reply-To: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, mark.yacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2465;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=21KV8l1eolLUWndQNIO5F86YZ/Cq7ZKnvQ4F71S/TLU=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoeUUJlAXSeQ5bs7GKW+7XmseCfeH9DB2W/Ijt0
 IXMcPg89yaJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaHlFCQAKCRAgrS7GWxAs
 4u7WEAC0COg4pyM3VjpCXi4jxRgWiNImDLrNPJQD6J9inquNz/J1OY9siy640ruRmWO0EFl/z/G
 7mPJmlb0psfrDVdExmtuSBCVz3wq57JHkqQU0IhL9ppOS00CY9QBrU5tO9iTWCIHON/6dcRp78I
 fJWxBRabxrrhGN/ySO5DYC5qweC67dXVRz6zFfBt2oBrdt0hWp1unRFRamdd7sWUH5SSad8NS7V
 T7MNqKL/IodFgwt9D7wvbJv8IbpszTDEyyYEGcWsfqPsxX9MyQT1Z/YBC5vfmEd2DYyxYWsDNjb
 RQp5AHzNvG9HWXcV4LQz32P+vHkEFu91YHplT06qqtfBX0xYr8i28UuN5bGaKDtAFx9MI9e0hgG
 GZiRxPVHcKMcGBsyrQhQr37d9t0TYYMzQznMRqVrt0k1YmoRi+hfYh0PmEVPgS/xCpwnErVDapm
 K0hnfqKcK12UwSh0QDMj4KmgBLe6j4yjXlfXrR1Zt8se+i7KtqFLokOjbQDN4LnfKcj1EvA5sZY
 erE/JZH+QtkiN/pUFOmodA4MlNGAsxfVXlYNuWwf/UmPcAaoImsbIO0Hqh3QGQsV0oujs/d7peA
 fFk8YZ3zo3BY4ZoRHyWGh7ky6Ui4WvMFQvFpSD+tHrl1OGEFzjV8qAPApLaSIHcM3qMUvaAR5u2
 cy9Cx56w5vXeYgA==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeiudefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehtdejtddtteeiiefgleejkeetteevhfdukeegleffjeehgeeivefhgeduffdvvdenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrieejngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepihhgthdquggvvheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrrhhkrdihrggtohhusgesghhoohhglhgvrdgtohhm
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
2.50.0

