Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2935CA0FE7
	for <igt-dev@archiver.kernel.org>; Sat, 23 Aug 2025 02:17:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818AE10E18D;
	Sat, 23 Aug 2025 02:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="AjpV6CG/";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B34E610E193
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:17:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 347B21A0D81;
 Sat, 23 Aug 2025 02:11:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0DBB7606A7;
 Sat, 23 Aug 2025 02:11:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 686F01C22D43B; 
 Sat, 23 Aug 2025 04:11:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1755915115; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=jlF+QYtsupZuUw+ZZfp5n6/UJEMW78RIzcsPK5Nya5o=;
 b=AjpV6CG/Wz8tmntxzOXZiL3E92hvhj6d4qDRgS9qfcPiPHmRV1iefPFRuBDxuFF6Nh633Z
 /fbVhqZwksnCq0A/jRm2mGuxPvvClgVY0ZupEfiYljVEhjbp/Dn3et1EdYUs7bVU3pufWr
 gfdyDTl8URWpJbqEYLfoi01lNIO0PjKS4YmAAKUbKbp07PLUE7Cs2yHKqgxXJE/fh8hbVi
 4PFHM0s0wNbQpCCeMjjKQwPLxMuSueAZ2D66cfEkd3wj4mRmbmzx/sSmztglGNMzoiw+6R
 I2AbdwgffkkeQLqIgF960z62A4fqkOJlDNXJLrHPrznHYj4wliR8F765wnaL1A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 23 Aug 2025 04:11:34 +0200
Subject: [PATCH i-g-t v3 14/29] lib/unigraf: Introduce device configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-unigraf-integration-v3-14-cdc36d5fab4c@bootlin.com>
References: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
In-Reply-To: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4148;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=ajuGCxvvMtznlSMKLMfOV9vKDYuNo8IyNLk98Mni2a4=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoqSNVGHxlojkzom3RWGjLq5JslAGpMRYvNlvHE
 KuxBgwgli+JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaKkjVQAKCRAgrS7GWxAs
 4sozD/9EdUkmFZy2BnUp7IrpQn2GduoL7is03lWuNZhaiMNqIrxaKbk/PwNi9KPqvCQZn1qSKIC
 5ZvackugI2xJ/IqNoUVjYF/U+juVkn68BshrFRkddVgjzZHyKsHZUefeOlNYV6N2Iq0m/JmrJGx
 dYh2/nH+ErprA+MdS+fsY0XoVMywBLdnZcl/5spZLz/oAcXStnwDD8Z+rnK68qpi1hod12wv4VF
 Xpv9+NKnpwPWd5IV/HeQCisz2Jfc2Pvo2ooeRczUeyoLv52Y6by+LyxGIswixP5fCRR1vqqgl/E
 z2aqd6YgQD8z0GPuedgEg9akvUt/UuksQn2nu1QmbJoYt6j2GQfAyR51tyKReoodRAFKJH1rtUp
 +d7xQHg4o/LY4kdSNgpS4Wdw0+IZtsHzXl2cWyL3CNzofrBLPwkBL4zFkXoP6gU3qQlJMXZU1ge
 a/bhPapSrV3UI5m+4CH6H3oQnt0ue432TNzxsR7qe2AZef9Lm09+ZKQRXwp9AkqAosaDEk1sf3x
 cdSca+hnpBE0MRQd1ev/bZhGGd4Rzy23dIM8nOgt3jCsihF8q5WUhiEpiVA0bUIMcIM/3+NgRAf
 fUpDlWOdmrygwAwZYRkZDcU9/bwR3gkAkDArdcw3V6WlcYpctLyAPG3mWWGZb9efGg9YYbAXNwe
 TWi1NZ3TwsqhT9w==
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

As there could be multiple devices detected by libTSI, add a configuration
field to ensure that igt will use the proper unigraf device.

The unigraf integration will search for a [Unigraf] entry containing a
Device=

For example, it can look like:

[Unigraf]
Device=UCD-500 [2434C620]

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 76 ++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 69 insertions(+), 7 deletions(-)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 55c3c445fa5efae9559c10f4f56052442027346f..304567467b27a5e68cc2db6ce66b3a8b53fb87a3 100644
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
 
 #define unigraf_debug(fmt, ...)	igt_debug("TSI:%p: " fmt, unigraf_device, ##__VA_ARGS__)
 
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
@@ -68,11 +76,31 @@ static unsigned int unigraf_device_count(void)
 	return unigraf_assert(TSIX_DEV_GetDeviceCount());
 }
 
+static int unigraf_find_device(char *request)
+{
+	int chosen_device = -1;
+	int device_count = unigraf_device_count();
+
+	for (int i = 0; i < device_count; i++) {
+		char dev_name[UNIGRAF_NAME_MAX];
+
+		memset(dev_name, 0, UNIGRAF_NAME_MAX);
+		unigraf_assert(TSIX_DEV_GetDeviceName(i, dev_name, UNIGRAF_NAME_MAX));
+		unigraf_debug("Detected unigraf device %d: %s\n", i, dev_name);
+		if (!strncmp(dev_name, request, UNIGRAF_NAME_MAX))
+			chosen_device = i;
+	}
+	return chosen_device;
+}
+
 bool unigraf_open_device(int drm_fd)
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
 
@@ -83,6 +111,30 @@ bool unigraf_open_device(int drm_fd)
 
 	unigraf_init();
 
+	if (igt_key_file) {
+		char **group_list = g_key_file_get_groups(igt_key_file, NULL);
+
+		for (int i = 0; group_list[i]; i++) {
+			if (strcmp(group_list[i], UNIGRAF_CONFIG_GROUP))
+				continue;
+			cfg_group = strdup(group_list[i]);
+		}
+		g_strfreev(group_list);
+	}
+
+	if (!cfg_group) {
+		unigraf_debug("No device configured, will try to find the first available.\n");
+		cfg_device = NULL;
+		unigraf_connector_name = NULL;
+	} else {
+		cfg_device = g_key_file_get_string(igt_key_file, cfg_group,
+						   UNIGRAF_CONFIG_DEVICE_NAME, &cfg_error);
+		if (cfg_error) {
+			unigraf_debug("No device name configured, uses first device available.\n");
+			cfg_device = NULL;
+		}
+	}
+
 	unigraf_assert(TSIX_DEV_RescanDevices(0, TSI_DEVCAP_VIDEO_CAPTURE, 0));
 
 	device_count = unigraf_device_count();
@@ -91,6 +143,16 @@ bool unigraf_open_device(int drm_fd)
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
2.50.1

