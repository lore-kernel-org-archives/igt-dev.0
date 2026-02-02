Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDADAE7DEE3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:32:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B3DB10E4E3;
	Mon,  2 Feb 2026 14:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="RTtoa7ZJ";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA9D10E4DF
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 4842B4E423C9;
 Mon,  2 Feb 2026 14:32:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1F6ED60767;
 Mon,  2 Feb 2026 14:32:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 13578119A88FE; Mon,  2 Feb 2026 15:32:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042761; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=r03pxxVkv4q3UwvCJtbYZfU2HWjVJxp7YPuwqSQoNYE=;
 b=RTtoa7ZJdEBv+nGky8pxy9vXK76EfHEN179axbRNj5D9WDzJxZcAHYDC4jP2BkpMQncs0h
 oN9qAez/DoKDWoScnceLz7T580haVXqs1QNowhuezBupK6ow4hPS3sTnLuEry5jaWBLnu0
 0J+sQexwxunEVoXH8Ff4O+kKNLGZI2s1Wn3vV13nWZ1dOdjtFOM/zosn6G7v1C4u7qA3Qf
 26UP53pDXKh8DfCVnl9dkvj8MdbI0S7lBfHoPIQ9aNTz8Ceckel5k03WgciFCB8bScZE94
 jJig2M6u9YqzYKBwISFQYmKpohKxCpL2nR0Mx+rNFCrj6AwVEJWkPnRFNP/5BQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:32:55 +0100
Subject: [PATCH i-g-t v6 16/48] lib/monitor_edids: Add helper to print all
 available EDID names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-16-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2006;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=kc92gVXm4y/Cn6N0PjbQz5EtFhWUxOL+PZXn3Q9Btew=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWQL4WFjeVIvP89a07l/ftMwHkzB1/xPEw4A
 7d6gy8LlUOJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1kBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIKNw//aDVgRZMtrAGjOxyJ6u3SYgG7KQcCSwk
 mfSVhc6EE8pHrbREITF6y23dKvwj3uJfsN/egV0gnYN/jHfKp5/W7ITDzifuwOi8ct6HJmXW73E
 riHiZNH2oChs2n0YQDGcVuXqi7Nr+/g+CShbSQ7g39xm6kR+xqAl3RN+mWAnAsfZmqe+Sf3c08L
 5cAXoH4/zR/rnnvSKifKwAMZ3UK6uhqIGLlRgIAnT4gEhIg14A1u7X68mSkiy3ytsFvg80hSkoo
 s0s1KysOtVlmgR/x9msue0bApLghA6uqGlusG/rmVvWLY/OYvQMlAESueFamBG0fMj0EA6SHg97
 gyf0WUnMna6aGoOErT6I3ggucGCLIZJdZ1vz94PE02M2gHq8eHHWCkcHg88HERB7UYdW00XOAjQ
 +MARC8ilEjpgsPfEZzHFpQzWxd9QheZQ03xCTT2RmZ74LTJN3c7vhAfKKvGcOHPyUKOk828GaKk
 cSqnr6IdgRvVGcBahBPiFNwrLKZif3NhpBs2t+LI+mJ6zqZCTEk1M3O+t8WRqWFTaQSvouDJ5Wh
 gRxwWX0Bpj0lCX2ehxpHTGSwokZRi7YszwHFk/ArxhdnbsXMz1BM+2rbImjtT1S4LKIHkxH4zf+
 jf4hr1mBskaBaT2fhC5JeWl6qnHsha5es9Bir0ZaBl4defCK43LU=
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
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
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
2.52.0

