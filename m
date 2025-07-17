Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72781C83F3B
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 18:46:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E564510E886;
	Thu, 17 Jul 2025 18:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hm2fF3Yo";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C244710E15A
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 18:46:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6570D442B2;
 Thu, 17 Jul 2025 18:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752778003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=koxdETQZ638HkiKtlyMR7QqAKDSyf5oeoH5ip1grZYo=;
 b=hm2fF3YoAf17gss4pm2F5El1IMVfftXfoR8nB8NiSde9W9+j3sMTUULK5/tmOMRNt3SqkC
 GIsrv7jM6GfCYxwmgzaY7olwdZAp/aescT8hyKZM4S03z+3OlrXLGmxK1pRn65zu/j+Jw3
 yYgxqQotkp7R8VJh3DKa8N/ju7olzut5lPbQZ4ItMi0iEPbduhpryHYAchlFZ9tcAiYta0
 M/unHnm1XlfOfmCnPPsfxKjDj92tQYhNylx+lY57yK6aVLzIiUHRHfzfSCjxnWlduwpCjs
 ij3iJg3n0aub/V1PC4iEaUAWRfYw9H5s2SncberVZi7Q/gI/hcA/HZOqCBt3kw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 17 Jul 2025 20:46:33 +0200
Subject: [PATCH i-g-t v2 13/26] lib/unigraf: Introduce device configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-unigraf-integration-v2-13-77dc329e584c@bootlin.com>
References: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
In-Reply-To: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, mark.yacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4060;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=b9vMw5ATTmp2eMZxTa3k4+jE07UjjgJN99LoxiveWEs=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoeUUKhs2FCI1sM4TuEYxH+pB7h0LRAl6UCfEl9
 S/b8M8HSriJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaHlFCgAKCRAgrS7GWxAs
 4phjD/9j0umjgGZlZ4hesYwDdeDYH/hI3ku5aMjw3A+pq3WYSwmq84aLtkZ+BJsAgBM+qAlWik2
 rQzFqnRhy0nYhtuhXrHLgJiGnIIVFQ+lEgiP/4Vwsb50dlLjLliwTITXrmHw5i41Nyyp7DqAkbr
 7r4MlK/msLMUTG6/yurROXGnTGyPZUAqXDOPb4DQZzWe74FqUWzOcTk7e5LbLUk/cDnxjwB2mn4
 83XnZgHvB9QPneYEUcY/5ZK6m/jrnCCnlro36RoJ0BOlEdNlwLtuI/PikadMZ3+lmWb2NfGyUmd
 kOT3zsehVg+Fmnz1jIm/V3K0m2oY5jMz+4YChk65b79WvombsObDLTM1QVLJ6ipncQqwznhlKsg
 B5NHqYKhUjx1wkmCJgRFyM9h7XG8Hi8sUdNU3vYomHZ4+rggJs45W3C2fdYxI1n1q/4vxLaWCGb
 HNQiocxLOFfbiYBo/5YLTHPFnLrfhVllP59PrmuuWOQmL8QJdFAuqDBe2GXAHdG4FZQ5JxeWuZt
 dDcsVxRdhwOf5gzj7wK07STnhyweV549V7UZSBFjFWm7LObk9JLXB6KMXqlay66lglLSFDxJAfm
 mnQ7UJHC+qSeRNLspAYn59VFUDis4370YQcICjsW3+hKI+q0Dk/L34a01VNND/GeXB4e7p41vIT
 uhGdjVwAHkDLoKw==
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

As there could be multiple devices detected by libTSI, add a configuration
field to ensure that igt will use the proper unigraf device.

The unigraf integration will search for a [Unigraf] entry containing a
Device=

For example, it can look like:

[Unigraf]
Device=UCD-500 [2434C620]
---
 lib/unigraf/unigraf.c | 71 ++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 64 insertions(+), 7 deletions(-)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index a9f6e94498ef21fbfde3295456aa3bea9fdc7d67..f4b6183dbacf359c5e91ea70bc3b6acb9488839a 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -1,21 +1,16 @@
 // SPDX-License-Identifier: MIT
 
-#include "drmtest.h"
 #include "glib.h"
 #include "igt_core.h"
-#include "igt_edid.h"
 #include <stdint.h>
 #include <stdio.h>
 #include <string.h>
 #include <time.h>
 
 #include "unigraf.h"
-#include "TSI.h"
 #include "TSI_types.h"
-#include "igt_kms.h"
-#include "igt_pipe_crc.h"
+#include "TSI.h"
 #include "igt_rc.h"
-#include "monitor_edids/monitor_edids_helper.h"
 
 #define unigraf_debug(fmt, ...)	igt_debug("TSI:%p: " fmt, unigraf_device,##__VA_ARGS__)
 
@@ -24,6 +19,19 @@ static TSI_HANDLE unigraf_device;
 static char *unigraf_default_edid;
 static char *unigraf_connector_name;
 
+/**
+ * UNIGRAF_CONFIG_GROUP - Name of the unigraf group in the configuration file
+ */
+#define UNIGRAF_CONFIG_GROUP "Unigraf"
+/**
+ * UNIGRAF_CONFIG_DEVICE_NAME - Key of the device name in the configuration file
+ */
+#define UNIGRAF_CONFIG_DEVICE_NAME "Device"
+/**
+ * UNIGRAF_NAME_MAX - Maximum name length to be used for TSI functions
+ */
+#define UNIGRAF_NAME_MAX 1024
+
 static void unigraf_close_device(void)
 {
 	unigraf_debug("Closing...\n");
@@ -68,11 +76,28 @@ static unsigned int unigraf_device_count(void)
 	return unigraf_assert(TSIX_DEV_GetDeviceCount());
 }
 
+static int unigraf_find_device(char *request) {
+	int chosen_device = -1;
+	int device_count = unigraf_device_count();
+	for (int i = 0; i < device_count; i++) {
+		char dev_name[UNIGRAF_NAME_MAX];
+		memset(dev_name, 0, UNIGRAF_NAME_MAX);
+		unigraf_assert(TSIX_DEV_GetDeviceName(i, dev_name, UNIGRAF_NAME_MAX));
+		unigraf_debug("Detected unigraf device %d: %s\n", i, dev_name);
+		if(!strncmp(dev_name, request, UNIGRAF_NAME_MAX))
+			chosen_device = i;
+	}
+	return chosen_device;
+}
+
 bool unigraf_open_device(void)
 {
 	TSI_RESULT r;
+	char *cfg_group = NULL;
+	GError *cfg_error = NULL;
+	char *cfg_device = NULL;
 	int device_count;
-	int chosen_device = 0;
+	int chosen_device;
 	int chosen_role = 0;
 	int chosen_input = 0;
 
@@ -83,6 +108,28 @@ bool unigraf_open_device(void)
 
 	unigraf_init();
 
+	if (igt_key_file) {
+		char **group_list = g_key_file_get_groups(igt_key_file, NULL);
+		for (int i = 0; group_list[i] != NULL; i++) {
+			if (strcmp(group_list[i], UNIGRAF_CONFIG_GROUP))
+				continue;
+			cfg_group = strdup(group_list[i]);
+		}
+		g_strfreev(group_list);
+	}
+
+	if(cfg_group == NULL) {
+		unigraf_debug("No device configured, will try to find the first available.\n");
+		cfg_device = NULL;
+		unigraf_connector_name = NULL;
+	} else {
+		cfg_device = g_key_file_get_string(igt_key_file, cfg_group, UNIGRAF_CONFIG_DEVICE_NAME, &cfg_error);
+		if (cfg_error) {
+			unigraf_debug("No device name configured, uses first device available.\n");
+			cfg_device = NULL;
+		}
+	}
+
 	unigraf_assert(TSIX_DEV_RescanDevices(0, TSI_DEVCAP_VIDEO_CAPTURE, 0));
 
 	device_count = unigraf_device_count();
@@ -91,6 +138,16 @@ bool unigraf_open_device(void)
 		return false;
 	}
 
+	if (!cfg_device) {
+		chosen_device = 0;
+	} else {
+		chosen_device = unigraf_find_device(cfg_device);
+		if (chosen_device == -1) {
+			igt_warn("The requested unigraf device %s is not found.\n", cfg_device);
+			return false;
+		}
+	}
+
 	unigraf_device = TSIX_DEV_OpenDevice(chosen_device, &r);
 	unigraf_assert(r);
 	igt_assert(unigraf_device);

-- 
2.50.0

