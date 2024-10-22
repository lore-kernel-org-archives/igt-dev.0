Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74C7D2C548
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 12:53:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8956310E684;
	Tue, 22 Oct 2024 12:53:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="f4S/GYId";
	dkim-atps=neutral
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397D710E67E
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 12:53:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3EE7E6000E;
 Tue, 22 Oct 2024 12:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1729601605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2MvKEu1T47HWKyorTEVYpa5GVsvXgVwqTbWvvJZsgIU=;
 b=f4S/GYIdklyH12AIZ4NGV6N2Gds/lgV/72hWzQ3vJCdjJraD4CKrA+NOhdHCFcrtrmIHqS
 EDfu8anPN+Jk9JhynynqM+gRn2xYVkEoXMH3nEebSIs5tRDgIJCyoiPeViYq/7ejgeE+a0
 JUveUSLUKHrOgndgrnox7DIZPLflXHMv7vJpx+KaiW6rr4PSJVsm/BxAI9sLrs8PstpsHd
 z+MsvEjOfR/j2WyiKTdnmh7ECRpBRpNI6S7fySVy5gs/RYa+DZN2R3x+NPllDhquSqvclu
 TWpH6kFMafrkt+QCIMtednqF8YWa5P5I7NiujRtyjFRcU28gd9B6gHqa2H4Bqg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 22 Oct 2024 14:53:11 +0200
Subject: [PATCH i-g-t v2 2/5] lib/monitor_edids: Add helper to get an EDID
 by its name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-b4-cv3-02-monitor-edids-v2-2-7634786c21e6@bootlin.com>
References: <20241022-b4-cv3-02-monitor-edids-v2-0-7634786c21e6@bootlin.com>
In-Reply-To: <20241022-b4-cv3-02-monitor-edids-v2-0-7634786c21e6@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, nicolejadeyee@google.com, 
 seanpaul@google.com, jeremie.dautheribes@bootlin.com, markyacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3094;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=8t+y6J/cBrIjL3CRSoT+95sRZ1xluPyBA0YU5XsNlt4=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnF6BB840iYDnLfDRMt9amqQhv20NbHPrwWjTGH
 HqbvL/LFHWJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZxegQQAKCRAgrS7GWxAs
 4lTtD/4i/+lUiMTv3UWTDhAc3KHqqqLZpg1dTGf+yOEUztZ1onGSAcD55fFhVKfuPGz6h1C6Jjm
 Nw8iXXmZ3sR5iE236bsIOZKh90eQgQrUkTbv6jOnRxaOPbOx78hcC9nTqYM0i8FxDgYgHBiyFpx
 xW/5f0UYyENt0kSuaPXW2RB1/QX+dvURbOoSgEqGM8LwCcVfFwLHk9HQq3+doYjWNu1f/zbkRgZ
 Ax0Y/DD6HGsFX7DiuyLWzU+ZBrFaraaD+/cwpgghGhhb5inKA9YCXj08hCW1D7miMlzNfYtb4MD
 lj7WiIRI076+fgTH3eTrzDlDkEy31M/68O9lroNPXJU22KYGT4+RMsCafjoXkyGnv44S4NyvHJJ
 j363FMnEfIbwdcYyP07HxBEMJk4SzG6L3td1Z1rRpumpUcjh/oB+cleSXEqRgefNA4n+/P5W/gK
 sF0Fw6d3RHU42tFL9LgZ6DFhrNZOE8rkVl68ydM3/LubTzhvYq5vfsJtUFTiOE+FZfcuj2qdnGT
 utO9n5KyYn/5OqJroAF5YRhLm/GG9xey9oBdjqQCm7d6+dMHxjHMg+R8mnbeMKN6QGvIM7E6XKm
 UNCk0KIUcs8cCsKJ0OdYm1KPm9KJZIUFTbON7Iu/SlGqWDPmgB413HrPhIarjAskKgXCcFSade9
 sy3Wnw6NkN4mLNg==
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
2.46.2

