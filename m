Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F65AE7DEF2
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:32:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200F510E4EC;
	Mon,  2 Feb 2026 14:32:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="DDp3kJqE";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC33010E4E7
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 65188C237F3
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9983260767;
 Mon,  2 Feb 2026 14:32:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7A6DC119A8905; Mon,  2 Feb 2026 15:32:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042766; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=g8PQImWztTScdZEW3ltUOsr+A0gh+KFUeVKRJNex8KY=;
 b=DDp3kJqE2MlLImNAqJxK3XIzBtKZI2nEz7vpRLUmCiTPK8uHm6nc6igUvPCD9bTvM3mO+5
 L6j31EN18MrtQzmHPjs47eEZRnkqSOiR0epDacBu7yMZr1ecy55h3khUOtSPAr8Finiv8v
 oFGc3WlY6OSG1CNauXHG0gY2GsMtwpw/Yrwp8NuoWtj1qIvuOHTTYgXU3+3bbXTAoObgNo
 vXdjLHEHjZ0jMVrqQ6YvkaQ+T6/lXioYrdFW2dYWAoFOUeWQGYu3ihUSgsaLyK0Ff9DuFH
 YXIiawN4y0Lzy2W/PmKTDvWTOBbxD63MEMWjh4uKqYdpdt1z6hO9ZJ12sEgocQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:33:00 +0100
Subject: [PATCH i-g-t v6 21/48] lib/unigraf: Introduce device configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-21-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3985;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=RSE0igLsu1/bG5LygsgQM2liomAxn2QTBppKrS0VA6E=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWRDEv5mO4s/TwvaiDRgN5EPpomkfhV1Haeo
 4sHnQQz2V6JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1kRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJcuw//fGvlL5DDfw5t08u2NM2K/zsV0J2X8v2
 AaPQqMsC0C3ZX1ON1p8CPIJcUxpH5T9wWGZPcHKb8jtBmA5Ae81V4bo26Ig8UyhP+e0PZOcBj7U
 jZuV2BURvKYbsSIWY6qqkr1Z5bYvZlcDR5jGvWn0mNwuA35ECO9oL97doeEkhzZ2/Xwspjod46X
 5tVMfFwHQO+bFOefEUKj4Kx9UJxS0RG/wMJ/nRHUasL07tSO7fiTrcka/xRSK4zX3UInhKs02me
 T4K2uNLa8h6SJn64qIn74OvSNNUXtzAjpQlgkcGbroQnpTyUwCXz31IaLsY+ge7Gsq1zcLiCYA/
 7+KD32GWhjdbE0kHz+1gE+YMrurwQxWLneMZ6BbFpUK8+gQB93sIN5Sh9gt+g7I9o/FATPEsWfT
 BmgpCFRgbNJ2TQaiv+e7AOuGhz37c+tzj0AtZN2aA46C3+Pn1OR3LsW8VcQxqTNskB8774eTKjA
 VxDpa5UsWlUZjl+VfenSonYMY8rgwJQbkC3DXUO7Qv1KVC76nHySRbzB12mghG1e9ZgZqkZhcko
 wJ9NgueMQh+iCu5/O7isu/2tj1vfRIN0vpLkKPV/uikonr+XWxK7uyMWQiBGseA9oujq2A3v4BS
 bWczC8ZGpOlmdRIFa98e4Aib5Z+qQgc65ukhfBZwp2p4iMpWE9Z0=
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
 lib/unigraf/unigraf.c | 74 +++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 72 insertions(+), 2 deletions(-)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 3318c95fbbb6..800e9c3545f4 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -4,8 +4,9 @@
 #include <stdint.h>
 
 #include "unigraf.h"
-#include "TSI.h"
 #include "TSI_types.h"
+#include "TSI.h"
+#include "igt_rc.h"
 
 #define unigraf_debug(fmt, ...)	igt_debug("TSI:%p: " fmt, unigraf_device, ##__VA_ARGS__)
 
@@ -13,6 +14,21 @@ static TSI_HANDLE unigraf_device;
 static char *unigraf_default_edid;
 static char *unigraf_connector_name;
 
+/**
+ * UNIGRAF_NAME_MAX - Maximum name length to be used for TSI functions
+ */
+#define UNIGRAF_NAME_MAX 1024
+
+/**
+ * UNIGRAF_CONFIG_GROUP - Name of the unigraf group in the configuration file
+ */
+#define UNIGRAF_CONFIG_GROUP "Unigraf"
+
+/**
+ * UNIGRAF_CONFIG_DEVICE_NAME - Key of the device name in the configuration file
+ */
+#define UNIGRAF_CONFIG_DEVICE_NAME "Device"
+
 static void unigraf_close_device(void)
 {
 	if (!unigraf_device)
@@ -59,6 +75,23 @@ static unsigned int unigraf_device_count(void)
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
 /**
  * unigraf_open_device() - Search and open a device.
  * @drm_fd: File descriptor of the currently used drm device
@@ -70,8 +103,11 @@ static unsigned int unigraf_device_count(void)
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
 
@@ -82,6 +118,30 @@ bool unigraf_open_device(int drm_fd)
 
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
@@ -90,6 +150,16 @@ bool unigraf_open_device(int drm_fd)
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
2.52.0

