Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AF4C3DA55
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:35:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A75510E5BF;
	Tue,  9 Jul 2024 15:35:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="dn5C5mZN";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B448E10E5A6
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:34:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 389DD20014;
 Tue,  9 Jul 2024 15:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XvwZKa7QEhwt4mA7g3ocxVRR8A4sRlGtsYK7+9fMJcE=;
 b=dn5C5mZN7kp8L/UNRvbqRL78YYovNpVks0ENCJ2miF8NaVbCHGB+d78r7eiItQ4vTTPm4t
 eJmvy5zMAWuydxz4U5SERHGQBcc03fbe8Hwei25ZXXcymmo10eGTlk+7D73/y6X5Hy1wDX
 FiVXacV9vDI12/5Ct6CMNwCu5SthP3WAJHAToMysvzgs4kPihT5b/wi7qObHkd9/b3LuwK
 74KkqG44JvqN9ZYW1JZwSZNjUm2qnS9t2BqLYP+h6HvMGeSIQ8IotdcjUAKPL1nS6IBCQw
 h8HTnemrEMjTjs/X02smcblSoV7aWPRF0fvsvRGdrwdgCi5fphCczJ1TS+A5yw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:23 +0200
Subject: [PATCH i-g-t v2 07/39] lib/monitor_edids: Add helper to get an
 EDID by its name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-7-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3094;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=LVODf8sSfHosRxzKWPKydrAnQd+E3zM/TgT6TRodAiE=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjViXJfGfUeeeqyhmz21fFnAmWm2b6EU3eEkyz
 rSCiLYwq5uJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YlwAKCRAgrS7GWxAs
 4jxoEADRpzvxiCuNN+9NSaoRjqCweeRDlfmoGRcxopNHj0rxAtbxpZVYpbDy+GoyIz01QCxV340
 rVoQCXxRHn4tnpi4EPD2Hxw71LbG0UOlqZNZc19oO4EiRtyH6lxjCUYqcoxEV3vmeL0U+ojIutQ
 imwrUqqAxzdo4r9KFLTPzPsx4AcU6bt/LX3SeGqOIqY/IeDnuTnZwnhTgPiurXpbH9Lk2JUV/F6
 XpD8oAU52Cqcl0Eyui80SkgmaWon4U2m99E398GPRH0AnildzF6W2kmiDUB9wmphEsxHa5+bcI1
 jFlBr8pa9ZpfcI6cjkoz8WYhoXXMwspowdz5Rc5238+7ElIwIgheNc0gJhcDWq6DDqTeGQKLX50
 yFJX+XFLDRefNe9DIBZCy0V4grsr5A6K4WvBxxiJAQQEtLh7Hj54rY/BfN4Tavj+Mwk8vRy2qnX
 4l2poBTMH3ip+LlUUz9Ap9mzZitFXb5D2KmH9RQb3Dsg+ANAD9HKzthOit4U0WQfLgxboF1QDq9
 tcd/Wu9v0UpJ2yEl4HjBRjrim1OAosz4JCLQfhwNpNdtHgGQrDcRaADlbg31q5So4InX9ztaT4T
 W0I/W3SS5eC6uyfvIOf4kYtKuQyeEN8WyANveSWzJwwHbncYydaSi85P3w4CBHQNrxo9VCSOo5t
 VwFW5MKXThe71XA==
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
 lib/monitor_edids/dp_edids.h             |  3 +++
 lib/monitor_edids/hdmi_edids.h           |  3 +++
 lib/monitor_edids/monitor_edids_helper.c | 21 +++++++++++++++++++++
 lib/monitor_edids/monitor_edids_helper.h |  1 +
 4 files changed, 28 insertions(+)

diff --git a/lib/monitor_edids/dp_edids.h b/lib/monitor_edids/dp_edids.h
index 144907558be1..d11a81d167fc 100644
--- a/lib/monitor_edids/dp_edids.h
+++ b/lib/monitor_edids/dp_edids.h
@@ -194,4 +194,7 @@ monitor_edid DP_EDIDS_NON_4K[] = {
 
  };
 
+const int DP_EDID_NON_4K_COUNT = ARRAY_SIZE(DP_EDIDS_NON_4K);
+const int DP_EDID_4K_COUNT = ARRAY_SIZE(DP_EDIDS_4K);
+
 #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_DP_EDIDS_H_ */
diff --git a/lib/monitor_edids/hdmi_edids.h b/lib/monitor_edids/hdmi_edids.h
index 9d75cfa989b6..573e2149d5d3 100644
--- a/lib/monitor_edids/hdmi_edids.h
+++ b/lib/monitor_edids/hdmi_edids.h
@@ -604,4 +604,7 @@ monitor_edid HDMI_EDIDS_NON_4K[] = {
 		  "1620582c2500baac4200009e0000006b" },
 };
 
+const int HDMI_EDID_4K_COUNT = ARRAY_SIZE(HDMI_EDIDS_4K);
+const int HDMI_EDID_NON_4K_COUNT = ARRAY_SIZE(HDMI_EDIDS_NON_4K);
+
 #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_HDMI_EDIDS_H_ */
diff --git a/lib/monitor_edids/monitor_edids_helper.c b/lib/monitor_edids/monitor_edids_helper.c
index 0e0c2a9badcf..0f92ced64d06 100644
--- a/lib/monitor_edids/monitor_edids_helper.c
+++ b/lib/monitor_edids/monitor_edids_helper.c
@@ -19,6 +19,16 @@
 #include "dp_edids.h"
 #include "hdmi_edids.h"
 
+struct {
+	struct monitor_edid *edid_list;
+	int list_size;
+} ALL_EDIDS[] = {
+	{DP_EDIDS_NON_4K,	DP_EDID_NON_4K_COUNT},
+	{DP_EDIDS_4K,		DP_EDID_4K_COUNT},
+	{HDMI_EDIDS_NON_4K,	HDMI_EDID_NON_4K_COUNT},
+	{HDMI_EDIDS_4K,		HDMI_EDID_4K_COUNT},
+};
+
 static uint8_t convert_hex_char_to_byte(char c)
 {
 	if (c >= '0' && c <= '9')
@@ -149,3 +159,14 @@ struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *count,
 		}
 	}
 }
+
+struct edid *get_edid_by_name(char *name)
+{
+	for (int i = 0; i < ARRAY_SIZE(ALL_EDIDS); i++) {
+		for (int j = 0; j < ALL_EDIDS[i].list_size; j++) {
+			if (strcmp(ALL_EDIDS[i].edid_list[j].name, name) == 0)
+				return edid_from_monitor_edid(&ALL_EDIDS[i].edid_list[j]);
+		}
+	}
+	return NULL;
+}
diff --git a/lib/monitor_edids/monitor_edids_helper.h b/lib/monitor_edids/monitor_edids_helper.h
index 2ec7aee5f13f..cd0e5a7b2645 100644
--- a/lib/monitor_edids/monitor_edids_helper.h
+++ b/lib/monitor_edids/monitor_edids_helper.h
@@ -34,5 +34,6 @@ void free_chamelium_edid_from_monitor_edid(struct chamelium_edid *edid);
 
 struct edid *edid_from_monitor_edid(const monitor_edid *monitor_edid);
 struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *count, bool four_k);
+struct edid *get_edid_by_name(char *name);
 
 #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_MONITOR_EDIDS_HELPER_H_ */
\ No newline at end of file

-- 
2.44.2

