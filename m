Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3E3CD13D3
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:39:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42ED210E3BF;
	Mon, 10 Nov 2025 13:39:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="KyUEr3hS";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABEE410E3BB
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 9FFBA1A19A7;
 Mon, 10 Nov 2025 13:39:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7159C606F5;
 Mon, 10 Nov 2025 13:39:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8A2841037190B; Mon, 10 Nov 2025 14:39:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762781988; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=xlDa+oGks0OZZf/G4Q8DGgJ9C0vLuPutq/KiESEY1KM=;
 b=KyUEr3hSfdqzy7eemmBi3WEcLLTuwkYnw7NcmQR3FOTW7XuRfGcs9dAwyYoNDeTf9QSSzH
 AA1DsJ3malS2H3wa1g22IwYcLUAy2i/TwtS5iqO9Kq8pzrB+fngnvfht8NTIdMhNPzZp0u
 KKRDgA1Mi4TIT90xCJDhoBivv+QT97KolSf83sZQE3LHygLbN4pIhf3nt/aTadNKtyoym8
 qYyD1ePTbXp19Ct3WRSCX+gDnXpanfLObNyIs2dfKU4ErdhYa1Y9+mFHz6XJT50iubOaAy
 5tcPekWNTCYNwra6ah+GVJBTOzjmKutStExDWSghsKU+bwpMEGTn40tZdfJlFA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:18 +0000
Subject: [PATCH i-g-t v4 16/46] lib/monitor_edids: Add helper to print all
 available EDID names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-16-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1950;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=AZGQvLhIDMZnW4Zn6/qlcZ0yMOLwyhbU2WbgAgOw3BA=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesOp3hS44Z399oOhaSL2Wyd1u2Ggxi72D1wB
 U8ak8LlvgKJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrDgAKCRAgrS7GWxAs
 4jTiEACDgwrE+EzUaiqGl0uC7EWGgcd+mlSdiJWJ12cZAR0sCWynyfcPDZvaNvgB55IERxzqcXW
 GVSANq5yE0Bj+ptVHoBGC55fNMRxtgzi+usKCF/0qSkeBHpKDrqRPglVrcomHVl7c7FlZUvET0/
 rGox4o1i3X10ufIU7FCTP7ihrY3LZVngcwhWVxG2J9ypS8+1MUIsK9bydM3KQzRtrTVxopjVokR
 RmTRPtiee9dTx3GDAZMlU5iG7uwitej8n8HzXtpzuHLxXWlnpP9ucKm4JPg3tVPxHgXF66eD+P2
 jz0NjYDBDYxPuJ0gZKIgpjdXczzTbrBpSdvQal4fLNYB+6tbeWWV0otI4Vd8MEs093ao0IAQpKX
 xseg0sqjTsEhFM9ulPEZuUN4fPX2jwbuM/T58PNBnkB1K1MXZuw5l3o3+zBukTAlyaDPYAEnB3m
 5sbPCXgrhmw5CVN22p1M40aZd4VwjBxgks/VjfDWP3idUHhIq5U9NbnS+lI/ARuSAH7Jdm7ZRDZ
 7HfSHNzEQE6fNdJHwFyMD2GWkFxRWrgxRtDoXv6GxMNW9Wm054NANNL89Br04GTQkZ7v+JA9gEX
 a/0AQb7/Ii1/OStSRTyo1jJIMXGYuMCzv+SVqvI3gXyyvATyoXd9PpSERAiaowFwiPClGifAXOv
 fCGIdUtMl3W+yeg==
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

During the unigraf configuration, it may be required to know the list
of supported EDID names, so add an helper to print them.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/monitor_edids/monitor_edids_helper.c | 16 ++++++++++++++++
 lib/monitor_edids/monitor_edids_helper.h |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/lib/monitor_edids/monitor_edids_helper.c b/lib/monitor_edids/monitor_edids_helper.c
index 01feb34a5516..0f9f5269471c 100644
--- a/lib/monitor_edids/monitor_edids_helper.c
+++ b/lib/monitor_edids/monitor_edids_helper.c
@@ -200,3 +200,19 @@ struct edid *get_edid_by_name(const char *name)
 
 	return NULL;
 }
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
index 6d9e3fc89592..7ae0fd40c041 100644
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
2.51.0

