Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7A2C3DA4C
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:35:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1974E10E5C6;
	Tue,  9 Jul 2024 15:35:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="bge6ewOb";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E0910E5AE
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:34:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8F14220016;
 Tue,  9 Jul 2024 15:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yfFK8/3QxXgt13RmQQ1XEUAmq+TP5KJvxRC4lSC6VyY=;
 b=bge6ewObPC15cvfn2MWjcbwPmtw8EyqjHhZq+R5tbCoNt9+MN9ZLYtqtR8SRG5hFrvi6wX
 JHIxy+8bXE6xOn3ygSaLqbHPyY8tOAH2q7TdhvUyWQx8YKz3EPEfM0S5pWlXIf6AGLs2sC
 SB+W/xUiBxdwpR9KXWuvHYJpmjBAt1IlfFeUgs4wjzxpEU4UVbGFbwFaSrUhAUTK64/cIy
 24+S8N07GULErrvNKWMfmpvhU1HI9BDmyrz9G4KTzEMnyNt7RjGq0XIDspI2Q8pNNCKmUq
 o5LEb8Mjv6gnAccjn6YVOhIzC8jusdvruNJ3sTTg+JGexLEgp2b016d68w596w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:24 +0200
Subject: [PATCH i-g-t v2 08/39] lib/monitor_edids: Add helper to print all
 available EDID names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-8-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1843;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=u8xhmW6V7BZnPRbeTXdkvx7EibasfmR4FgvRnLbhtzg=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjViXSynOuePGz2uaB5U/NpurYGJwsw0oj+kLD
 WNJwoXJ59OJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YlwAKCRAgrS7GWxAs
 4tNbD/4uutrQ0FonbYCOwtmHhajq3M6cb8aOxSbTEOGnaFkadKU6mfM5I+ISHthGcDEDPYvsljE
 UcmnUL7f3GDoii/EVkfFx5l94b2UWtVHpAwA/fZpB0abN80cdntWJxglHU/HoOZm2yoIFrnRMKB
 CrR9l841l4viTg8pu4Hg8oyrEGYOXn5W7pX18wMAp6ZIYW47f2fWc4qzzK636LMUaHEVXGFDTx9
 JhyAmsMxMKM7qG5f/KXp2xAU/iXjC97c6Htl0gnXngYGts0bxzN3JckZia9FPR0dzvb692/X0/V
 AtQNnQ54U723iTom+FCqa4jjfFTlSNzdq4rCduhn+CyViycHEBOkFKUeK+F8zjfXE5uxQyRxz/B
 ryjOQPlHnw9JwGoh6Rauh9PPjvyciHcHw2OfeFPigwTmLBMl7hIGDgwvdX5j3ExXR5E4AB5si1g
 bQdQvdwrC6notLtIOQYu2m6sDqfMadG32jm/5hkIk+X6m6kFbhxGnK0Z8SCWMQauXjKhu2JCkkv
 lE1tnbuTC06SAZ2JovnuRdvieGj7gRLDJ0tXg/G+2lJsgLT2/69p41B3heWTGBIgagP+75FsLwa
 6ShZGY1NI2+ZL0XNEzEDJzWXkx6xYhgpktJ/rKR9dXbcO3gATF77gWhNn0hcJUDpy5LAJuagDSx
 B8u4kH0crbHcQdA==
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
 lib/monitor_edids/monitor_edids_helper.c | 10 ++++++++++
 lib/monitor_edids/monitor_edids_helper.h |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/lib/monitor_edids/monitor_edids_helper.c b/lib/monitor_edids/monitor_edids_helper.c
index 0f92ced64d06..ca2f5006eada 100644
--- a/lib/monitor_edids/monitor_edids_helper.c
+++ b/lib/monitor_edids/monitor_edids_helper.c
@@ -170,3 +170,13 @@ struct edid *get_edid_by_name(char *name)
 	}
 	return NULL;
 }
+
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
index cd0e5a7b2645..50b08530826a 100644
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
\ No newline at end of file

-- 
2.44.2

