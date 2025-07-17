Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5DBC83F3B
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 18:46:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A7510E88E;
	Thu, 17 Jul 2025 18:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="RZnQ/BQV";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6585610E883
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 18:46:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 05C78442DC;
 Thu, 17 Jul 2025 18:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752778002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xki/yQ17h0F+OFIfXXGxEObTpasegVk/fqkpwYmbjFo=;
 b=RZnQ/BQV7QfLAwg1wmjdUaaVL8cd6MJu/9c7zKc3Y5qf25dObYJmBwtrZwz/tbX81jYJC8
 G4n8Ej14Zb6ZsyhsIEg59HI19XAGkf/mKZf6a81YC3aVYi+R2CP6674CKs32t5Zm03A7Ni
 ouqgDVsOgEaXXBUV3qPE2W4bOs9z3w8PDSR638HeJC720zeRsbja6O7tD9CO6iIJYkqV+X
 fnLYEGWO0c45ayrKVKgmde9wU90yeA5r3EaSRtnZtbpy7rAY4ATaeqgoR4IpH+MWYlFt5J
 FihsmhbCM5nwuXwWWxkdXQBXbRBL163lyj65ePOP9JtGE1ylNJmnLaAmRHofmw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 17 Jul 2025 20:46:28 +0200
Subject: [PATCH i-g-t v2 08/26] lib/monitor_edids: Add helper to print all
 available EDID names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-unigraf-integration-v2-8-77dc329e584c@bootlin.com>
References: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
In-Reply-To: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, mark.yacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2071;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=XOiA6qvFUWldWJzLH5f5KiQg72/XGClmZj12ErglQLs=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoeUUJjRvqohRPe/selK4M/FmYIYECy2Pg+QzLI
 jyx8xeAZgqJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaHlFCQAKCRAgrS7GWxAs
 4injEACBLChvoYJvHPDshbhj1yVX6jZN6Z5opp6SJddwFcFbuE6lyskeOaMIc2hl4I3ZWafCCXz
 UuMGef1WJJQGb1K0Sr1pgiFASG5Q8JU7uOaUDv7JRXj8Ja139VOmePxKuFE5EB4sjAUbW0jpzvf
 r7nwRP3AlyDKDuSKqrIDZEhcS3n2FQcvdUv/1NQrTq9xEyd3+F9uItjWuTFWZ4GHoghnOuPpi1w
 nYlYeTartvn2StnquzwWWmKc2twO4YuZMSJLLzMuqGxuDKDqRSx26cXng5MI+MpvflQSXeF7kGu
 ZouVjJKWIIIJLYh6bUoDL5N0r8uyRdJcQTZubRE2JTlu5YbLoiVIhQ0eigYRuDumwjvLbRC3jHS
 HIG+4Ry4rC+WRW+ZuzHczQU2nq/jRc2lheEyprsxptFwPQiqmeHOCw0sQTXF1vhMGp6bqN89ElZ
 31mE8DbkB8UauhsrSu95cM+AvfVaWwM72FB9MQ279cSM+kAdTIszppVQcEYld1BZVdr7p3HCFQP
 cYOv9HNOBWsjoJAIQrep9ZiPKawT1inA/SKCJw1R9rwuxUfACP17vFqQI/qg7/u/MHRbOpb4ghA
 qtbhU/nuarqAu+9RNKyVY7NuGKa0TTWWBE2yHAIo00Yd9eFcG/7PAIe/tbwhhvJBAaNbFHDaPqp
 tmrnOVdCPNvHMMg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeiudefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehtdejtddtteeiiefgleejkeetteevhfdukeegleffjeehgeeivefhgeduffdvvdenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrieejngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepihhgthdquggvvheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrrhhkrdihrggtohhusgesghhoohhglhgvrdgtohhm
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
2.50.0

