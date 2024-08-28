Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C67C636F0
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 17:27:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D3910E3EC;
	Wed, 28 Aug 2024 17:27:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="g15SaKGO";
	dkim-atps=neutral
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6066110E384
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 17:27:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 80DAD240006;
 Wed, 28 Aug 2024 17:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724866023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XvwZKa7QEhwt4mA7g3ocxVRR8A4sRlGtsYK7+9fMJcE=;
 b=g15SaKGO4IwlLx6bgFSl2MttswDH4yEvRY20xTHTFnrASYxAm8b1t/j7QjS/atmv24obrK
 MH1e1RD4sv80d6DRxLu4FG/Hq3AOle+zYhbbKWEVjPPjw+tQU/KsjE2jZYbBLDt7PBUVJ1
 TYK4CjsATjTrVhdBEisP1iPTLDj9R4QrUOTj6xg736JLnps4v9rt1FCv3yJy3zm+5FgXVf
 DlJVs64bFG0xAnAI+OrqIx8WEZA22L2vlMep/HxZu5YQ6b3QX3AscVyEyKlyLxH6KcwM2F
 9/0nLXwymmktGEMKU95jMrqD41mpfo3W/zK5eSCGM+xPPMN7PJLU+7NzLt0UQQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Aug 2024 19:26:36 +0200
Subject: [PATCH i-g-t 2/5] lib/monitor_edids: Add helper to get an EDID by
 its name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-b4-cv3-02-monitor-edids-v1-2-29c846bcf251@bootlin.com>
References: <20240828-b4-cv3-02-monitor-edids-v1-0-29c846bcf251@bootlin.com>
In-Reply-To: <20240828-b4-cv3-02-monitor-edids-v1-0-29c846bcf251@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3094;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=LVODf8sSfHosRxzKWPKydrAnQd+E3zM/TgT6TRodAiE=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmz13jCP/p6kLsp/lXhzOtU3juUCkQdouhopJKs
 hBOBOOgwHSJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZs9d4wAKCRAgrS7GWxAs
 4tDMEADEKkjO8YOzYdmxmxZTamzbidIP22P8mDtam2+N8gIVYpw/uxiyvWlsotsOWvcJJbgj3aX
 vq/IVmSToMmgbZHsOS5gluWKPnBeEhcx2JI2aYyaHXjc5UyTT+Ckz3CH6fJCGDxUzaVKljgMiID
 rreNMqKY4oZ3CIk3JDmEsW7CrlHSXAd4TK+OD4FOt6KmwGwf8UoBnbSgmlofck6qgKVsrF3PmAm
 EkwfuxNaYEs4FTAiyjbBOqzu0moXG+PowXPRu4Oder4Jrw8YvMJiHzdC7BN+wkKTCcTib2pJ01i
 nHByDEE7UXRsnBhcCeBYOm7C5Xiavdny4Ej7TPI0dJSx6NXm4c87xcDRGOOky3hYj3Ja0MMf2Mw
 QJtWpkMycJ8dOBvdeAb6PHfbq7f7mySCaH9UUzDgniORrsWfY/dkL+ShLw5HyYeoy4sgOenrAO2
 UbUOjbqvLGsWl8+Jrd5e0ei5U1QZ4xonuVMqcTO7UvJoEOxCCY1/oCgFnPmuakO5QPYx2T9jxoQ
 0Cs1yANZY8Gi24L1cjceLFWNHZ1mqMcL+rWLwR0wBWgKyKyJOyLeYi9+RqmiQiDFaCZS9NU4gtL
 9RNhaJmjWFO9TJ8o87cskOA9JnAcCEBiaHqT7k0HfiAU0jGdbmYJwabnK3czc0McoFRnQiPkMPE
 Zf4Q+uuGzB648wQ==
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

