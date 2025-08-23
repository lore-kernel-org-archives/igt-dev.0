Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A28CA0EEB
	for <igt-dev@archiver.kernel.org>; Sat, 23 Aug 2025 02:20:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122C010E187;
	Sat, 23 Aug 2025 02:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="oLXAh4ib";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB92310E187
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:20:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 357DE4E40C48;
 Sat, 23 Aug 2025 02:11:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0FAF4606A7;
 Sat, 23 Aug 2025 02:11:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5BAF61C22D355; 
 Sat, 23 Aug 2025 04:11:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1755915106; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=eJsdEIPTcAdw+HYL2rv534XJHtcYfcmkbBW5Uo8Bg4k=;
 b=oLXAh4ib1CKzhPm0BtazK+oz3VdWlVVo8nfOIDmeSyQ3Qv1xEmVnu0shbJypOXhNFkbvjC
 egGnohwxOhmmEvX1i7e1RbpyM/5Bzlm5M35+XaTTIHD4FjHEvgCaFfQAP6xDCTlUJG7kEr
 dI3LT3aCdw6egAiNOguVbBoetJN8uY3T1vrZi+Em4NgJBS9TltQg1gY2b2qYd7yvh5BeNh
 YcNf31rsSaseWTAlmf3JMQwaQjGawi3X84v6zitFlOofzz/TvqmYKzm3QhY+WVjRcDY4J4
 l69OnxVRu1JBNiS7GX1OVUY3ksNzH31Oc6zgBuFAX49L4o8o96x7B7AwWkXM0A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 23 Aug 2025 04:11:29 +0200
Subject: [PATCH i-g-t v3 09/29] lib/monitor_edids: Add helper to print all
 available EDID names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-unigraf-integration-v3-9-cdc36d5fab4c@bootlin.com>
References: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
In-Reply-To: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2062;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=tEl+5VJE+UaONltsAl/aqNEh33hENN0zbPG7557jBJs=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoqSNTPgPcxzeviAtQOpMXtia3kNHCzxZcQO7Fu
 kl37MG9SuOJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaKkjUwAKCRAgrS7GWxAs
 4vuOD/9o0KvDj4ENYqfvQSyUXUXBNetp1smHKKi77Mtzl7sjOYETcK5qxFTPU3LoVSqtJ5ghEmn
 z1FTH02i5idBEJvBxOCgm8i7GHQ2FXkukseqEbxyBqdYyWkpzrvS3e1XJ/wfskpdb959XLIlO6m
 aPRVQ7aUR2LJxnnekWFn+d4wFZSlaIPRjNgB5oXq+ETq+Zapk7m45PC0EuLB4gzvhEyyMr05jrk
 K6CKBE62KFhMYRoaLkCKG0ERSbVsvI4kM2bLUh0Sc1IJK5Rovc1rkslcM2iGsf9+RvbAtWkV6nl
 HiL2lCxwyWeKAuRqywLzqbMcSsNoNrVFykeor2qODc1jbijwLv9WmuaAJWI+Z7nbyhDkRkfJ+0Z
 Nhq0r+PcLdMfUl3zdX7Vuz0MClRx4u9d2WcIFtH36fQuBwwUb7iVvHxB4kK6s0xY4WuJVkgPCpm
 mNsYvvhlE5a6D2OzuwgppPmNJg13s5US9kUadaD49LbQh4iOOYQyzVYMAfd+a0/GwZLOaBvPMk4
 mwnTOw4kWn4ShdStUJsvU4Z1ccKzYD+CdEHJW4C2zNVeEk+5aeAuNzLxE5yUPu6OupKP9epcjrE
 Bvlk+8x5VSldLi6dJyOU3lh7kSaUTkHysPX4lZdgMXJJldsGGWh8g0X7ra5B0GkhmrduDjkPafJ
 WcauJO4UUU4rwtQ==
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
index 01feb34a5516916b615a741f773316159c38fccf..0f9f5269471c69d48a374d94059462d690d3b844 100644
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
2.50.1

