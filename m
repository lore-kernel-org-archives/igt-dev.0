Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D6AD2C548
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 12:53:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5735110E67E;
	Tue, 22 Oct 2024 12:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="KDRvwUoZ";
	dkim-atps=neutral
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F17CF10E67E
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 12:53:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0F3DC60006;
 Tue, 22 Oct 2024 12:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1729601606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1bNXN0zQ1l6OrV+LjVUKr2AdYVWehwdJXU2Wl7UtI3U=;
 b=KDRvwUoZShmO4WBLaTipcYi+DG+2/OqMMyDW+fZWqLjT/0kfJ6jZSYJ7LCM9KO5Tqw3i6B
 mPICgeh7ptqeuYZ4U1YeCbgmHag4dVuZxafxtUvFGbgp8zWA+jFPOxBl2NJWlFOngOOWVv
 D7kWl/eaOGjh6f9buAgSWXk6OAERtkDs+AYHX5kEdksJpbqEI2t7u5ScCi7NMla0V7n+18
 GtgO5ENv/EJtabsHHM2RqYDpZhCqpCND3PZ7MpVRvtmZ5dEi9O6bAYziWyOb1bwkHdGZUs
 7K3yqQ1bC/VMfzusUi5Fnpy/64vwjracRFIUUxDlPJGw+rXzxZ4AkO/Tlb4Sdw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 22 Oct 2024 14:53:12 +0200
Subject: [PATCH i-g-t v2 3/5] lib/monitor_edids: Add helper to print all
 available EDID names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-b4-cv3-02-monitor-edids-v2-3-7634786c21e6@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1843;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=JmWDJhaosBTLL5CSFMLzUcucFSyI7G4BJoxMe/Gl728=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnF6BCabliQ6hhFxymq1894PEbUsiBD221jP/m7
 VUc/EUsGtyJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZxegQgAKCRAgrS7GWxAs
 4iPqD/0Q+z2mGOkpykUBN3Oja14XYj2cmH6/+Br5LM5eYRQDyWV9szeFLUPMjPWcdcuDlRNT+ds
 saTx0fBbi6QSkx7V4ymSVFWdMMGxMnqWnHQVksuRFghvUHGco1X9oH77qh44u0/iXl2SI4AJunB
 dS0WMK8ZU2031N+sHlkdCIXMfouw4ywSCICYxLxruEFG0Qkf829y4y6o0LWuMx+J610pquTxyhP
 ILw17lQ/JLjRapUhZINh1SFjA+bSZ5OxeBdqkp5MmCgLE4gvDFOSODARoJdS4GRssPzfVz067af
 BWRUsptOV0hggEJhNl0BS6rzu2SrF7Tv9ZNx80OUQpGO74kXKPgS3EbVYjhCN0mn9eZsa6pHDpW
 yfv8ei0u08yJt2RhhdwD5cv+RsA5xD21sS/qyuh+FIgRMC2sLXMB2/zDS7Rmy4nar/G3gzTFGPM
 44mho6MJGfdBxB7YvUTFVl2rhga+sK/Fh1wNIJYbrKjCQ9fHGEk34FR0BoJk3K/nG+YfWJp7Iy3
 m/Do2lToHYEsH8r3QyQDW8eIXLC1FLtwFy2K/RMlo8YfsyrSiL/3IaDtSHLRxDrpeMFugzag/VX
 z5ZJUXyficyIdqcchP6qiVEll+p0/9wxvD8OcN8m0KicrZzmFEVgNUvL0zcpZqLMYuyD/qlXV0k
 /Y6uoV7U0LeWw8g==
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

During the chamelium v3 configuration, it may be required to know the list
of supported EDID names, so add an helper to print them.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/monitor_edids/monitor_edids_helper.c | 10 ++++++++++
 lib/monitor_edids/monitor_edids_helper.h |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/lib/monitor_edids/monitor_edids_helper.c b/lib/monitor_edids/monitor_edids_helper.c
index 0f92ced64d06..ca2f5006eada 100644
--- a/lib/monitor_edids/monitor_edids_helper.c
+++ b/lib/monitor_edids/monitor_edids_helper.c
@@ -170,3 +170,13 @@ struct edid *get_edid_by_name(char *name)
 	}
 	return NULL;
 }
+
+void list_edid_names(enum igt_log_level level)
+{
+	for (int i = 0; i < ARRAY_SIZE(ALL_EDIDS); i++) {
+		for (int j = 0; j < ALL_EDIDS[i].list_size; j++) {
+			igt_log(IGT_LOG_DOMAIN, level, " - \"%s\"\n",
+				ALL_EDIDS[i].edid_list[j].name);
+		}
+	}
+}
diff --git a/lib/monitor_edids/monitor_edids_helper.h b/lib/monitor_edids/monitor_edids_helper.h
index cd0e5a7b2645..50b08530826a 100644
--- a/lib/monitor_edids/monitor_edids_helper.h
+++ b/lib/monitor_edids/monitor_edids_helper.h
@@ -15,6 +15,7 @@
 #include <stddef.h>
 #include <stdbool.h>
 
+#include "igt_core.h"
 #include "igt_chamelium.h"
 
 /* Max Length can be increased as needed, when new EDIDs are added. */
@@ -35,5 +36,6 @@ void free_chamelium_edid_from_monitor_edid(struct chamelium_edid *edid);
 struct edid *edid_from_monitor_edid(const monitor_edid *monitor_edid);
 struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *count, bool four_k);
 struct edid *get_edid_by_name(char *name);
+void list_edid_names(enum igt_log_level level);
 
 #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_MONITOR_EDIDS_HELPER_H_ */
\ No newline at end of file

-- 
2.46.2

