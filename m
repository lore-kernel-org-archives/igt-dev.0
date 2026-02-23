Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17E7EA4FB4
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:09:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 821D010E380;
	Mon, 23 Feb 2026 12:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="1gZM43I1";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1F310E37D
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 5E8FD1A1170;
 Mon, 23 Feb 2026 12:09:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 360715FD43;
 Mon, 23 Feb 2026 12:09:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 10A1410368F92; Mon, 23 Feb 2026 13:08:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848539; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=pO971DaVhDs+Fipu7ZLFEPhFFKJOpl6TVM/9HJeLTXo=;
 b=1gZM43I1PaSZy/1NxVxp0C6glgL2kxZVkiKL8RtWTFNFu+YYjlxEg92Yhc9LGEDeE4iag/
 SnispyH83yLgRdfJEOhXtqZyoRJfPrdMQMbkWWp51ZsOkfntd8oF0xVLRdhpclZJbt0Y/c
 MSlrOStqRH5CfBQBV9XDkLgjyZi261ODA7bE5A8kjLnTrliUjwq6/SyyIRLg9bFGpg3YKk
 BzVdiinGrSexBzvufniFgJgc1VPTGUB5fjWp+uVEBZqkIdbw2tz8G+FmO9VsUwraRYTfo3
 jfGRwmjMO/zYYRMxAU2WaH2EzvxrFrQOiTBQhVujkMZ/A+s37lJXGOHoIeZ8ag==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 23 Feb 2026 13:09:23 +0100
Subject: [PATCH i-g-t v7 16/48] lib/monitor_edids: Add helper to print all
 available EDID names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-unigraf-integration-v7-16-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
In-Reply-To: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2062;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=WjIDlHnpIeb68LdX4dVZXkbg86NnVBBDd4jH8I3l/rk=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpnENoLLDGlAdLxrjEovRmdJwR72+Q0OGX1aYHf
 mkGTndPaEmJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaZxDaBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIgHA//Wtpnzbmd1P2uenI1OP4ZV6Frdg+yut9
 K8MMgcgy+lcrRS5pecXMU5NzGm2Zd77mk6OljaNOHidILH3EahyJOpkrOsueDIti3b29iBF9VXY
 aLZCP2VIV4lAgwYTmxhDn1rlGUF67WtE/lMAnc4E+HXSPNtSOnzPNX3XbhRH/lIrXwLTS181JoW
 kVHyuUwEn8G7MGYDQMICLHR7XX+eyfP3zAAz4iOPKXLiKNQcOwlJI2FnNzcQ/MczonMaYF0XGR+
 R0FjZ2S5MiWEWR5xmls6FbVt+l4Gtrl5wLdRRCcKbU7hmRzCEaHOYWsiU/HUsu1Q6DIUsm+t7ww
 EYJHSp+s4nbxr/ViwCBVtHTG8WlE+/mxNR+uWAuwbdDqEdx0xQismqhwvoWPhCRwm4nVwNFzUTh
 eD4hq6pWyU/AEs7lkkbdcKPIT3IZvQ+VfyMJQn01I/jym6DPMQMLjssxt0Z8475RbsWLYKXAOBM
 9EvVr6xe4yOTLTJRl0YtuoLMa+j169HFiScasEyqxHLgWTfELGUoMcAQVhXzmo5u/Ca7n0rNgEN
 bW7ChQ3aY89Q+7uBOz0uHmnS5sENuHyuMK0uSSFCB4OWxOCePxNRl/yDxlVPd9zccIZ5x4FYsyX
 S9O0FJo8QYT0iRAgklP2a4ZBAM4fKBzjZvhro7fwEkt4JErmfN9o=
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

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/monitor_edids/monitor_edids_helper.c | 16 ++++++++++++++++
 lib/monitor_edids/monitor_edids_helper.h |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/lib/monitor_edids/monitor_edids_helper.c b/lib/monitor_edids/monitor_edids_helper.c
index 34446066346e..091549ac7a49 100644
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
2.52.0

