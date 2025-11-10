Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9162CCD13D2
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:39:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE7810E3B9;
	Mon, 10 Nov 2025 13:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ngKSpZNA";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB2B10E3C1
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 9606D4E41609;
 Mon, 10 Nov 2025 13:39:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6B8C9606F5;
 Mon, 10 Nov 2025 13:39:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6712010371912; Mon, 10 Nov 2025 14:39:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762781992; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=CTBuMUHLEhDBJ6uGJxmcdZXJTtLRZ22cYNncdzitTNs=;
 b=ngKSpZNAJx8nB1BU5qeUblw2tfFYWQqT46uOa2EFn40rjdHpYxBRh4+dmSrah+Dx9rpzRn
 Vmm7sKuA5oH5FHQ4buBGTeuUoGSCFKpfM1XacR0UChitN6b6Yk/6fMKmskw05WHg4MoWVO
 d9tCFjg56AMWLR3ORTZP8BQyXkbRthZX6CjmmJ02qU1WCvz2gpupeMXP1GmKCwsXazM0E6
 HA/ZyysbD59ZWUhT1oP6sz7sgXCi/Rvx5luOCbDQ+q3u8ofOQCdxJBJi1LHBgShe2zSFeu
 OMS6Qp2ytCS0k7Ufv2f1z819Z4AS167XfIldw+73dmgk4UVQZP/pqTDqEQ6sLQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:23 +0000
Subject: [PATCH i-g-t v4 21/46] lib/unigraf: Introduce device configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-21-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4092;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=DhAy0vZKTWTJa4/JAqlNQ8G0b4IPA2tteAK8pb2BZ3Y=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesP6hdgfu72S93xfXCKFe3bnHd2iWQxSnztG
 rgcBNNCe/GJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrDwAKCRAgrS7GWxAs
 4uBQD/92SaRKSwTP40RnePiEWwahXegiJosdPnznwSMz7nDH7wUDAUy6qCSjPpFjvAsm7F5lrTe
 yl+N3j99n+lFf3n+rb7wALK33D4dIf/0XOWlF4OfngHHGDuMgk8eVj9ejcwuWdrXS+9Om7VNA4u
 OrjjBsmHKJ5Y89iujJKt9A2/U/L0ulXsI+VADbW8JxJ6BPuCTd2ITkT+4ExEE0hgN74neCwos12
 6M3o2zzcXuSUelVfSW4IHaqH7sPqMkodb2TccqNX4y2oyeNzh22L9o5MWjE/RcZQBArulhiTPP2
 k8PSDbTdDIByCfUEiCHKBOiEOdZLxjoHKSuER8F/f4uhNFstDOEIlfRjTMSrdwfutaIl4/nBSJY
 7QGPM+rKLGrVVB2GxmxxLFN3RNzuX0pBg652XQUbgdulPLh4/yzn538RPNNtrFxFkAvwSfYdnYr
 SSBIJ+1V4PG5zV88CmH3r5D8lVhLWXYSMkoB/+obh/5xPhWYfqqEgdj2Bcvy+W8Ef+2lYmEBFeS
 ye1puqTwRWpN6kXIZ1aPhwirPGuLD3E+1DX79fLcRBBHQqE1R4jfAFRn9sj8ZfC2sphM3LnfaDF
 kniz8cHQvQ/+x5O2FfrYYuMWOx4lUtUn5XDGz7aClQPblffg4rwlk2KOVR08zRhNHmGlA//NKNv
 jolpNP472vaiB8A==
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
index 55c3c445fa5e..304567467b27 100644
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
2.51.0

