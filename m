Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A35D25B5B
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:14:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372C010E6DD;
	Wed, 28 Jan 2026 13:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Y0HSMl3Q";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD24510E119
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 95F534E422FC;
 Wed, 28 Jan 2026 13:14:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6D8B46071F;
 Wed, 28 Jan 2026 13:14:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8E4CE119A8821; Wed, 28 Jan 2026 14:14:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769606086; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=g8PQImWztTScdZEW3ltUOsr+A0gh+KFUeVKRJNex8KY=;
 b=Y0HSMl3Qtq6msZN5EP8y5GT9DjScIZYi6u6MlBLJMiHrGDyLXHWxr+CO1mVnuEYRz+PKPl
 H47XSwSrkf5Ip4Gzc4IDNuP5m9PGd8FN3bAwDtj0mRSdop9lxc2zbsM+PtSHSVUH5BnBh0
 XQvr5nrhW1oHf5iSRt91TkCIkNRVLZwr37j7Z3htRC67IfmM3kEkJIQm00EaTjRbKpgUet
 qb68+LkeJ+1lGOT5JnRVuvEu/Ho9UcC30E22U0Fx1wPWsr2TznwwQyLGrh9Ac5OSlggeMQ
 //Y07PooCQsLmddSFilZSJw4164LyGHo4b42T9ggo8kbFEfRp46NU/DDKkFAfw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Jan 2026 14:14:52 +0100
Subject: [PATCH i-g-t v5 21/48] lib/unigraf: Introduce device configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-unigraf-integration-v5-21-fbf2e997a011@bootlin.com>
References: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
In-Reply-To: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3985;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=RSE0igLsu1/bG5LygsgQM2liomAxn2QTBppKrS0VA6E=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpegvKXXeMhyfyFhy4CSDLVMpqmtyAzjD2FqmnW
 0TPRSPTSv6JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaXoLyhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJeBhAAmhsLC7ZizZc/+CoWkS08cyjlXLqjCbX
 RizQ8vCl8Agm2tosHztXhf6DxqTVhnn4iSD5Mki0QxFdzfuivcEl8tDwytiXbfdlZTqhP6tQ05e
 VQk4hCoFAWOFTn8NGNRYT+ZZRHQc0SguCaXZODrPU1k2UZLQ2axhzGQ4ONFz0xOlXopBdqXXsba
 TrRKbJ9kPobCS489TGjAvgOKsRsAuve2OGIGuQxQTPIXA2UFBLd9TntZYwAlGCfhD/0SXtJKwaN
 SzQ9FycQyC1G8b0+xqAk0isH2LeFFQObQIcVOJ7XQMLEUx2rWVhkdA70/SwgAEolsjzDHEEhgIr
 jDem3b63WLpM0YMhxWC0I5IUhar4RafrP0frtI0xFrtirBG5XR+c2spE+coMnHqDja6e6NXWvBe
 LocAnFu7rTiND0uMomYfQqOw2v9swWuU7TIxS6ll4aJTIABWZ4OI7hDAF4Orz2Pd/EIzsKy5Tpf
 VQXTYTA19NNJQPYwgszNrsXn/dnnhu6mbXV0coA8QorWl//esUIb2JyXL0Hvwq+dA/Rtf3FGOLm
 +tOJ+x45Rpj6jpok464gcLEVmSrXDcBpkCouAj5bKQ3sNRd9ZBxTmCVVsfcHgddIoXpePHvXZF9
 ntl5PKrHj4buO6o2PUhZ5ElhvdmM3cSdraSdOF319Kb+f1AT2E3o=
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

