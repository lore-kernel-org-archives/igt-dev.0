Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D21C67861
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 17:27:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5D810E42D;
	Wed, 28 Aug 2024 17:27:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="P5B2wb14";
	dkim-atps=neutral
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1391F10E384
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 17:27:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 290D6240008;
 Wed, 28 Aug 2024 17:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724866023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yfFK8/3QxXgt13RmQQ1XEUAmq+TP5KJvxRC4lSC6VyY=;
 b=P5B2wb14TsmhgX6s0382S82lBi8jGbWITZSrV9LHcuYS2AkCE5n5xffnw1N50mKTPylsWJ
 eHDlMG6v4J0uqcKwN4koBl2Omcn3nxTQSDXF8qR4XtR/N2XAPQfd5x/oxnMGCZKYplraPN
 e35E4mbZq24k5yW1BxHRn0iXl9dDfQHVLT0hS/dp/3KkxFyXa7vHu+j4be8bVcCTXPJAoU
 4nGOVJrz9NmutEKjDP/wBTc+e1Uzcx7MZsFnRoMcyLbKVTpiwYjwwOTPEhs0NRA8DwUZGm
 tkuch7UTa1ZtlhjyreeQ1ZLUDD6WVnA7L3CVfFRnR7hofZMKeU6dfAxKV1KWjg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Aug 2024 19:26:37 +0200
Subject: [PATCH i-g-t 3/5] lib/monitor_edids: Add helper to print all
 available EDID names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-b4-cv3-02-monitor-edids-v1-3-29c846bcf251@bootlin.com>
References: <20240828-b4-cv3-02-monitor-edids-v1-0-29c846bcf251@bootlin.com>
In-Reply-To: <20240828-b4-cv3-02-monitor-edids-v1-0-29c846bcf251@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1843;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=u8xhmW6V7BZnPRbeTXdkvx7EibasfmR4FgvRnLbhtzg=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmz13k7UvLtJTsx3i83k5X4HZmibTNk5R+yempm
 7nojin0YVmJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZs9d5AAKCRAgrS7GWxAs
 4tNuD/9rTBBYCTd95k8YKWl5KuSLec2U+pXEbGXxyzIraupmRQi+DwxmEMyeOkrFHpPSmqPgp3y
 fMO3XYD3Q/XpcSpHRCZFGCktkOEI5PBCEBh7wmes2kqPVMRGBTnwg8T94Tcl7hBV3ycH2Qu8MF3
 hV9Hv8mB+IywvFGJo/opZe+Biw9dBevjyemUvwHlfWHtSzo7cuXOoAHhuTTZYnEodgE3+WXeb9z
 LRMkLSA18hvI+XuQ6ZI8SS36ltD+Fe0Pkoox/ETuukvnu62/pb/uuD00sk2yh2F2A4ODr104suP
 DQ22EAHxt4pzHwCZLLYn6/c1jxgN9u28s9sRf0H+pxkO974gWY3wuQaWb3TAwzbRWNOTEpnWDUS
 hNN45vX+LYu1FPjPi1msVFLf4EXQ4CpNH5eBbJVgX3eqUBUeQZ8L4tIEdMSOoVaPwJp2XBHwWge
 8Dk2ZPxYYAzMwl4JkyzwGXCnHazonuDgLLQ/xZ/kGIzKHmXNkXaJiaBVHgWUR6SDvf99nKPZvJG
 CeRkMI4N5P8J0NugVGXW48vB93yPU3X69/6ze8RDr/TtFr4SA0rBYoXbul7E162Vdcsdlmv1ff2
 ppXEEUugckxfJLxEdaVJqzNmR3cFBfu3TAQ8sh16F9bHF6MELAezlajosHjfIss2d+gQ5tRYZqV
 zcDyEgB8zjivEYA==
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

