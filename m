Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E6EF4644A
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 10:25:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D5F10E262;
	Mon, 16 Mar 2026 10:25:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="X4jGUcP2";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 129D010E258
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:24:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id F33324E426C0;
 Mon, 16 Mar 2026 10:24:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C48015FC4A;
 Mon, 16 Mar 2026 10:24:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D55CE10369F44; Mon, 16 Mar 2026 11:24:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773656641; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=pO971DaVhDs+Fipu7ZLFEPhFFKJOpl6TVM/9HJeLTXo=;
 b=X4jGUcP2TK4STgHi0N+yE3vIDAlcS8ovKlSQHpSF6AvafUQY47NB2ETUI2cZcQPIKfHNqq
 F6hCGeJNDN/7kOfqPhoFZ/vpizljCzL0X4eam3QPYdMzDH4a84/DRoRIqqouH1oMF7+8RZ
 tlQqjyzlFtB8AT4AJkEecCVy20Y08C8puD0vLurSGlYzxAyS5aAV997q4/M16uNgXAej3w
 RRInKR8tCJAVnrHG8AtsqjqWEXqWUP7TCqvCN4l9SeXNcAyPMVs5JLshJIO5BVDkiNqqgb
 5jY3ETHO+KNprJJBEjsEWpxb2fqGEE+Sjlr0Txy9ECAZzlYv3RFRjAjci/0thQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 11:24:25 +0100
Subject: [PATCH i-g-t v8 17/49] lib/monitor_edids: Add helper to print all
 available EDID names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v8-17-4489bf8572be@bootlin.com>
References: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2062;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=WjIDlHnpIeb68LdX4dVZXkbg86NnVBBDd4jH8I3l/rk=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpt9pQH6igFVlseIa45iBuxmh9YTjBKihA0RrDm
 CsWWgkn9qyJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabfaUBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJiIxAAmdHjgNlP5y0LlkVDJ+yXeVIyusn6h3w
 yfMzsXX7lLNyMq7Zh2yNyDjxdQBf4g6WmdAWUTtDOT/2LIz8QTxeJzUXfsj7ztWqpujrDxi5jKw
 eKjce4/GW2GesOVbR9KDnEG/gnh7ntSDGyIX7fxUkxtgsYfvdlzD1MLTb+k5jOl9qn4CiKYnfsz
 Im6oqwpCAS5Kpc/Fa8bIHcg4zzpsjEEJohcLS9wwZcT4L3tSjxi/s+Txk+PJxJlifPv121YgvVg
 VkpycFmP3+g1sEn4o+Xr3uTcT8hFtCiX8LRc4HBOWDaMxb2sz/zgvQSlsGaRfbiewq3xU65r4RV
 XL6+hIcCHTcyt3Jr54JZ/nf77PnTlnOnScWggFRIUemI9aWGDVJyE82WknIWu9nis+R+J3T46+2
 kSe6/YCRIPAWJSuuZ8M6hv6PGQpd+8uILj5JOTuGlVtU8UXyTWULEiG+VeEcYP3gKqHFk2ruJVH
 D1rGtZ2GaApRgCYv13MkVHhR/b/73f1fx/7PElcmSwAzMdMgKKY20dVwmVwHy29+ovXOFGeFMLK
 YQfoMWojnm1zewfxR6Wdsyj5+OeJwMHf+Pjm54XABl7ju/02tEuiXWcSqo4/3Phdv9BgfBTyZES
 FRvm/JPolxTgyZ5Wgj+qtO3Yw1iQc06S1mt2kfSTnt0tf0aBuB54=
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

