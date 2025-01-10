Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A687CE7719C
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 18:06:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF4010E50F;
	Fri, 10 Jan 2025 18:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Lum/9pOs";
	dkim-atps=neutral
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC64010E08F
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 18:06:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0CAC0FF808;
 Fri, 10 Jan 2025 18:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736532350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E3gof9lajyPY3TJSy7QCi6WTamnEqViqC3eGNBk+N6c=;
 b=Lum/9pOsJWdUsvL2xIJsH86ljsTajnDic85O6ZhoG9FpJqVi3SsmoKSg0MhL8k+tPT8nmn
 OQnBjebaSz2Hz51JkNXXJxmKGAb+cp1p32HLuameLDqqy/1DDZnBTQ9RwMzgVXeidAPykw
 Z5obiDOGkzePhpid38BN9qrhKZfEGa1HhfyeiQcxkTXg/EeOix20dms8hiexoEt3E7gmtA
 iX/t6lBqzticiCJv2Q2yWmXO4hIIdBLIYlqTLVJeF+rUZbimd6ZPhRU7Jh0O2C0j5wwX9n
 J/DVUib+n2YJhsgzpIvGTHwBCqYTffYFNAohMtH6Lz8peLvSVwOIHoSMhleF5w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 10 Jan 2025 19:05:43 +0100
Subject: [PATCH i-g-t v4 3/5] lib/monitor_edids: Add helper to print all
 available EDID names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-b4-cv3-02-monitor-edids-v4-3-aef77d3e0f50@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2071;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=UsT+gxB2fAOSWLCuV/wE0kTPDxke0bvEX2CkX9wNS4Q=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBngWF6rQ1mHclQ20G6E7117mqLzeBQx2GEUWrdb
 wDgd4aHutCJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4FhegAKCRAgrS7GWxAs
 4vaVD/9MlVbnRHOG0meS/7s9ionkj9LTcO2Mt7FKPlTarFflOGZe2XmKAY9UFn8qy7zIFrer43S
 33XoVuvfRMOsYoI1Km98FGx5s78Cn28F1BUW0S72U0xpDLJ9gdOABtC734o4FW5O+aYOC2qA2/1
 7FT1DpSTV5dyNQpq5qWKqLWgf8kUvjXgB8SY1wzA+H6vvJ5b4DnBvO/sdzFhPOmMPBVAnFZJY00
 5vTRfu+po6CQt5fwcmY6iwBpKa55inNfuDnzdbjRqmd88PcEhLAf28czksc17K2S28a3Rw5zk9h
 u8Dl+hVXqs5tlq6eAIQpHDBARkFpk6ZitupSD5CBDPUztnPXHGieNQ/nwvrvfoGeyQE2mrIji9y
 7Jl+P5JVs8G55GDlVjwlmrhL2ScXiwNmpurdimdUVLfb1mpKZjdSerqWrT9rJmow8ijtfecifmX
 tHeYyP5BxaoVFJf6YPnYdXhIIuQfzVILTtGoBvaoO/1fDxvtNRGsHb3/2qFDHvsu0w7fnHe/AQb
 8GA4xtWgzCvS6G9U+OBuu16Ezm/o0dLZZPZlfe62d/qrAXS8cBXXkseQYlNKkfGiSydlQMkGdE6
 wSH1HW5P+SVZAC6KnhJyXs8lbn+JM3cM2MoCsOm/OCS2wWj3pHWIjzzhmGyiWtfR3yzxazpCfYx
 AAajQA9JFT33xVA==
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
 lib/monitor_edids/monitor_edids_helper.c | 17 +++++++++++++++++
 lib/monitor_edids/monitor_edids_helper.h |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/lib/monitor_edids/monitor_edids_helper.c b/lib/monitor_edids/monitor_edids_helper.c
index 01feb34a5516916b615a741f773316159c38fccf..34ae6be9dd65e4e34777f9b929358eb7c86aeafc 100644
--- a/lib/monitor_edids/monitor_edids_helper.c
+++ b/lib/monitor_edids/monitor_edids_helper.c
@@ -200,3 +200,20 @@ struct edid *get_edid_by_name(const char *name)
 
 	return NULL;
 }
+
+
+/*
+ * list_edid_names:
+ * @level: Log level to write the names on
+ *
+ * Print all the EDID available in igt.
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
index 6d9e3fc89592229cac5122c9275fcf226465ab3e..7ae0fd40c041b5d37e09b3bd494c6c90cf12fe97 100644
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
 struct edid *get_edid_by_name(const char *name);
+void list_edid_names(enum igt_log_level level);
 
 #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_MONITOR_EDIDS_HELPER_H_ */

-- 
2.47.1

