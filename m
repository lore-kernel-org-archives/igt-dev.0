Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1C610F92E0
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:11:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927D510EC59;
	Tue, 31 Mar 2026 17:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="d9j5o+6N";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F7C10EC39
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 22FDD4E4288A;
 Tue, 31 Mar 2026 17:11:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EC90F6029D;
 Tue, 31 Mar 2026 17:11:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E8AB21045051E; 
 Tue, 31 Mar 2026 19:11:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977064; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Kc2AT2Tx1AvlvqhFiNJ6gzqFXgZzmLX0KBGSiVvlsoI=;
 b=d9j5o+6NNFkfaN2JkhpTkej6rOTJNnTV/Sr4uSDDOKpsDry97ncnS5uDIIsd3Tz0e6DpzQ
 Fp6gw08i7SI5tjyDh4/LApsI4L8SORu6RDTI0LVruued+ChErl9nZd3/DHhoNfJRV6JEJc
 bjKkDuAGy9fK8Y+GQmMchw+UqUhqKxrVqTdCIqoMuqr+8jpVNnz764R6veSK9bEh19YMao
 Fif1kg+AdBbyMNjQJSJ5c3XtiSoyppLFxeZmNuhpKgW6ZVtf1TTXUdSxhoVz4heT3M1bJa
 7vJW4njsTgii/RhjPdhSBIsaj3bKuNwwsyaBNo6HTK4KhLFcC6cdYJvQH41KzQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:11:34 +0200
Subject: [PATCH i-g-t v10 17/49] lib/monitor_edids: Add helper to print all
 available EDID names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-unigraf-integration-v10-17-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2068;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=R1CiOr3azNJU5hRGBit/SNB6fx1S3wgXci+s+r8f5tQ=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzAA9euQb4kqYMWF8c7gjVYJKLmSoTpMxIxjKA
 E8ytx9q6zGJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAPRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJluQ//Us+K7K3kMmgV24ULQABNlJ0yVREr7rq
 P7edQVquvM7NMbpjV+8TiBUetFscdPtNMdWDMD2kajnQLVotZ3RCl2sa/+qK1TWe+nHqSIZcHkn
 S2x9q+InB8Jp9OuLLcirk88lCFO5Y4SMRUh65IiMGYeVnsPTEJWCFmtXQn+4hebkJVyOy5Gl0Zs
 +ZUsQGc/8mcb0NbrkrihmirBrYpR35Aa/k6k0+odFWLW5cEvGXtqUPie4vH0f6zrR8lRRZkziK1
 L07aGHyqHS+jRgl/dRPXS3em6hnVRE9wQ5Fo2/leSH9j0uJIHqTI65ZiLOusRlX6xp5NF+SLK9t
 l039aHsegR5KW6xLiZMIBkLW7bDbl8qba6/NZx71mnnMgvLvE7f2BnBkfd8tomKvudBulhrgYUH
 z9+Ri1y8t6VvHk1x/57tOPmQDgnaXvLtQ/1gX1UmKGluDaSiaT2SETFd6BIepspybl9+3+dSR28
 wrTnXiGEM3GFzOzfD5CzedG18KkQZ8PvDurBjuUVs6NS+0IgPwMdS3pIx/0RIaUDlJRBkEyJyAp
 h6z42hoXNcMlNN3YF2zL/2rjh+NQeBTYrd7YraJWAAO0P58RgpOiT/bG4GNZlZ4WveMqL1HoIxg
 GD5io12gJtatoU2NYCELcxZ3WdVUCFBgk7hCGIc6an/q2ebUtyro=
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
index e2ad7dbd4185..a3434e20f900 100644
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
index e76fed2cb4b9..e0c4bd55ed36 100644
--- a/lib/monitor_edids/monitor_edids_helper.h
+++ b/lib/monitor_edids/monitor_edids_helper.h
@@ -15,6 +15,7 @@
 #include <stdbool.h>
 #include <stdint.h>
 
+#include "igt_core.h"
 #include "igt_chamelium.h"
 
 /* Max Length can be increased as needed, when new EDIDs are added. */
@@ -35,5 +36,6 @@ void free_chamelium_edid_from_monitor_edid(struct chamelium_edid *edid);
 struct edid *edid_from_monitor_edid(const monitor_edid *monitor_edid);
 const struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *count, bool four_k);
 struct edid *get_edid_by_name(const char *name);
+void list_edid_names(enum igt_log_level level);
 
 #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_MONITOR_EDIDS_HELPER_H_ */

-- 
2.52.0

