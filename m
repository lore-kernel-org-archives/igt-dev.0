Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0066F53D6F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:24:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6323610E29A;
	Mon, 16 Mar 2026 16:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="MFJLXa+7";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF2210E2A4
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 11DDA1A2CD4
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DD2D35FC4A;
 Mon, 16 Mar 2026 16:23:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8D73C10372218; Mon, 16 Mar 2026 17:23:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678204; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=pO971DaVhDs+Fipu7ZLFEPhFFKJOpl6TVM/9HJeLTXo=;
 b=MFJLXa+7BTPwCrgCd7hSX//hzgApcMU4rFm73+B3FIToxjnYHnhgVGE4rr4MZDfPm83M5j
 6a7tZkLp9OxcuhRc0sP3Tz7x4Qzl3kBee8lOl90xHpQyRFJ+AgKZblHI3LYjV6q2zNLnNQ
 0eZSVYs6HjPBZxY1FPxVv7gViSmHR5ikR/SlKIRO42XiMTXiAVbsdqpJfUHV8FwLcuaGev
 +h/McPtsGTAA5gyvEh8Fa08o7hzhx6Pz7SxZeMFdpg33ILx6ReS2CIYmmDH/gaZvJa2lFk
 gPPsAZo2m4RSvW0Av39qpTmafPpZNVpgJrXalWV0xsco2S7ZJG1cfK3W5XszRA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:17:38 +0100
Subject: [PATCH i-g-t v9 17/49] lib/monitor_edids: Add helper to print all
 available EDID names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v9-17-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2062;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=WjIDlHnpIeb68LdX4dVZXkbg86NnVBBDd4jH8I3l/rk=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6Ll17/rTCVnaFCSeEzDo92k7v4ukjKk4fss
 Kbbun1tYauJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabguixsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJmzRAA0KfCsvw8jf3gHcWigaqCSQ8wZ5XniJP
 gk1ZXuAimZfPgnIC7ULAj3nl7/nEMbYmPhgtEGpGJwATN0ESwfiMVK7SPvG6oUTvIsh+TrBV7C+
 Pnlh9BrgE6hqSa4No6DjJc6d6P5c/41aSVHBeh38L+zL3NitxGU4dW4EKbihmk26iWIzFVpMs28
 y9onhrKQlNkFgpS4ih0zQaF8By7xT/koX16p5ZZR4P9K5WXqWX6u5bWgSUQuDPvEjn5z3cZnT5B
 GvU5cnnY8eFm0dAIcpUP2N4Md/ObSQZgSHK6WejiEjiUmjjeHccIKl6Bi7A9VJa07SRi4B9oU+N
 QXCSHOUGZK0jcxOPBpzm/JzbBUFpdQnDNWyQOASv4reKxJHm5ajdtp2+M9FdJnYH3jIHHddDJzq
 VosrKZjlJQROYAkNSStE+Hw3tLYlKghBzErXjkWW5mwdIdpsTCo8sZb9Jmd/Ji4jkHwgCLgOwku
 a/PwvVJZT2hynZVULpornU8xb4sNhYRkjYWcBIqRIMHH2epxWHvXQ/GWUxmiU8+0RabViM1pKHu
 fmnVMH5W30Vg7Ky/7EyPsLOpje2AyaJuhZWP5O9T8LXmilk1BSEsJfpeHV1WC5MMElx/m73o2Tw
 5mTRJfk4A4S8r8ula5jFqD/FJh91Qv4F70G5yebYRmIwekUNNRRs=
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

