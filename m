Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11821E69173
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 15:51:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF74110EBEB;
	Fri, 22 Nov 2024 15:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="EsJts5oX";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B1A10EBEA
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 15:51:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4585B20007;
 Fri, 22 Nov 2024 15:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732290703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o4PM/afvPsutQtI7f19jp5TUjZxPumwpwmwAr7l9sYA=;
 b=EsJts5oXgCJmtHXnCAWwyLhDrzxD0THRpKMuOMw4yvMcmYn/9fuUUC2ZvyST0FN8tVTdlm
 /PQwaNn7zBqcYmDlULmDBZIP5izy+X2gLpp3rlvkFU6+k+f/teRbq79/i4WURe6yfpXu/J
 0Eswf/yHk79lsHH3NghEZBFFj25Lc5kD/NSyzXxkhiWKWP+9e57dbqXcszOEgKEK0cgmzb
 W7vhvfJYM3wigXVZgxzLeDL3dkCvwUiCwvs8IxLO+MeHQE5NhmOaHCchyxHr5owvpOp73C
 G0A3ewrq672/WPFUWJpoF8ogvVaePTmHCsD0yD4EUCdRgvqShoubbalPlrF5nQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 16:51:36 +0100
Subject: [PATCH i-g-t v3 3/5] lib/monitor_edids: Add helper to print all
 available EDID names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-b4-cv3-02-monitor-edids-v3-3-1798f58167ef@bootlin.com>
References: <20241122-b4-cv3-02-monitor-edids-v3-0-1798f58167ef@bootlin.com>
In-Reply-To: <20241122-b4-cv3-02-monitor-edids-v3-0-1798f58167ef@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2049;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=btPZj6EcW06WSlJLBMlVZsUlWMDgPD2cC8WNYvbQrdI=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQKiKY5WOZk8WiXCb8Np0KELnHqnoC999U0cCi
 pvYIQQ2GpyJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0CoigAKCRAgrS7GWxAs
 4hGTEADRpZrqHGRTCE6y1WSO2yfkNnrGyjDPYzWRmVU/HgMSvajER8t1IyoGiK0Izm8ssX9bWmy
 7KbFLwoc+IDbgUNSeceXT9oZ8QkOhe71Fcn85UvXRBYsdtJszVuNbTaOWCU4Hd/Eg+E2Rhngr2r
 HHVWhjRZ0paV3XM4j2Tzb7/CcrGBwyVusKifKhQ61O1FZfgqRnPfnD4XFBK5eFAqhxDBa9PI/Ft
 bOetbtEIfexdac9+I1ky22+iXqXkj0HP3EGE5CT1C+qn7o4Y64PTC3SoTOlMC+MlhnxJnbZxSpP
 mwcwcJkFlmc71w4TpE/2pukIh5mjpy0Vi7jF9EpStMZZ9IIJL6b0dKd4K9so0gE+Y8Ng68Jxs1o
 3eGVTyBVBAmiD3WuTFtror305rgu34jlnB1p/QPJgCaDpoFN0jm7YO6N3WL0/HyCFVRDvbkhFCZ
 THes6wahx2Cm9GhEJbJLev3NrNjPhaESkpp2EUvefrqMI/6Vc23TKnHmkfgK+674mmbDmZGRPE2
 kSEGstZHaqrayc9IMVHVr36QHjLQedt9Wwhwv0LXWQYxKnS39FudNVh1XCBpIpfisPi5sKXXmZB
 RShjVfobXz4dqNPtyWk2+H2Y6GWqWwv1v78NlA9qOrd9W/Kyh5TRRNoMD6tXdhY2eFt2z4ikQeg
 khSlXfrPG/nfPwQ==
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
 lib/monitor_edids/monitor_edids_helper.c | 15 +++++++++++++++
 lib/monitor_edids/monitor_edids_helper.h |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/lib/monitor_edids/monitor_edids_helper.c b/lib/monitor_edids/monitor_edids_helper.c
index 4d739937ede1e8f09eb6e8bf225f047d5c3dfd04..9de8aa06a45c164e928ae3821f841414b437eaac 100644
--- a/lib/monitor_edids/monitor_edids_helper.c
+++ b/lib/monitor_edids/monitor_edids_helper.c
@@ -195,3 +195,18 @@ struct edid *get_edid_by_name(char *name)
 
 	return NULL;
 }
+
+
+/*
+ * list_edid_names() - Print all the EDID available in igt
+ * @level: Log level to write the names on
+ */
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
index a45dca870eb20f66c9472be6643019d23bc18b9a..04a639f47b49ab176e914f6044bba6769dc84ccb 100644
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

-- 
2.47.0

