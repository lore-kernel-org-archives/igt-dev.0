Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5914EE7719C
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 18:05:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C19A10E511;
	Fri, 10 Jan 2025 18:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hFW89s4Y";
	dkim-atps=neutral
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4703010E50D
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 18:05:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4E95AFF80C;
 Fri, 10 Jan 2025 18:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736532349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mGXfJ0gQwBik9WDzOpNcFRqJ369mE/BSO0PPCEvCnr8=;
 b=hFW89s4YfspJP9YHSmmFlHdWnkEzj1U5Sa6VHUXIPW2Hy9Istlk70CRzaJdqScXEu5HuuM
 UgDyb++a0+XxTjn0J5N4aoTc8r5l+VmpZJqJzm1ZUglT0AzDoWet2kVA1xDaMaQ5ua4Q2e
 Jfu3Z4paF5iWoVQdPGCIU9svryaYiswF5rXN4E8DsoJoBiGxWW63dVYe1ByDff74uRkF/w
 HPS5ZN/1OfKX3EjTbkY/6S9nNFeUnA42bPzl10htkP0C8V+ZaREmQ3FJLJHQ6Zvbx3Zg2J
 7HcLAghvlcr4kZVjEh/zwkNyusaOAjyr2CusLQt073trQH9MVVnKMmH/ZpoeKA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 10 Jan 2025 19:05:42 +0100
Subject: [PATCH i-g-t v4 2/5] lib/monitor_edids: Add helper to get an EDID
 by its name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-b4-cv3-02-monitor-edids-v4-2-aef77d3e0f50@bootlin.com>
References: <20250110-b4-cv3-02-monitor-edids-v4-0-aef77d3e0f50@bootlin.com>
In-Reply-To: <20250110-b4-cv3-02-monitor-edids-v4-0-aef77d3e0f50@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, nicolejadeyee@google.com, 
 seanpaul@google.com, jeremie.dautheribes@bootlin.com, markyacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2465;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=r+LlJ8pqzolWL3XWqP+APCCpvJ/I8cc4WIDUjNqG9gk=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBngWF5j2US/GNVFmt9A0AaPanEx+ew4v1a1QK4T
 uZ1ITLQsWKJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4FheQAKCRAgrS7GWxAs
 4rtzEAC5tTNaVgPtkRZbsmJBMuqZDSOex90Oxb8Zw89Yf2jq6X9L48ZjGjIaz+yYGwhbAofp0vZ
 NfIE69lAEwfh7zaQSN/Tosx3FDlHZhovO10JfWbd0NPs6VB+SApcBAiYd8tDHYxi+NVoF9WDqlw
 OmYqxaWCAA4iEaEB03Bp/6poZ3yNm6/s8oVDhzgypHaUELqTEoWt+lnEz6rlvn1kMUcQRYmNE7N
 /duh53v9nirl7/bEFwtaKVQIEhTqot8yILRUNSkOIX8+kXsik4/+RKKmvQrrTibP2fX899gIR83
 W34rcMaHaUrxfGW/UmK4a2wIPEmWukFAr8Ly5AvruXpD9tJ88njiUhqJnHVzCGI6z4Fp3wbza9f
 OrtVP0uSJ9GLyQOd4Jpp72pJvK6EY0n8PMTCql0FIf0ofvddwOvhqKxQ3JUKOgkiErV1v9RgccD
 enAQp7R78UibZkWNgoJe+mhjRr6nmkNGACK/IMPcVfdbuG7+xXVVJoldjn3flhI9/4Tsx8sgWqM
 XglIojf/zuSuj9zSWmJL/+cxVwBKZ/wXJu4TMm4ZFeIyvqCUkSD8TjpcFWWP28BVvA5NmTlR5jd
 VaDpQBlTg3P1MrcXpscz0ZgPIS1FSIXiQns705BY/d+lOKojxLVshHT8/cazQcyJtgDn16E+Ua+
 dImuVDrkzjm0gmg==
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
2.47.1

