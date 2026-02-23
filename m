Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82ADBEA4FB6
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:09:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2518F10E37C;
	Mon, 23 Feb 2026 12:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="UD9IE4Hc";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73EA310E35F
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 5F8CFC143C6
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4198A5FD43;
 Mon, 23 Feb 2026 12:09:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 21B7510368F98; Mon, 23 Feb 2026 13:09:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848545; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=6m5Ma4Q1x5w8l3iibkNCL/yEjRILt7akA8d6XzmRk7Y=;
 b=UD9IE4Hc8lMWCaq6JlFS09Eebvanj5xPfyANFH9ubMcp7/LBDNLWK0TiIckAk+EYQ9eG7p
 pryxGnaW9IB7ufxsRRTwyrx/XQVGr9oIyeI7wdlbf/mwuZQZ/YPhTLgR7hcCFXdYN41u58
 8UloQ1n3Z+eWS8Hr1k6Yf+0JYxUznJCaMd/xvWHZfPP5rBQSEXKSOEWpvNIxJPM7qgjFYZ
 Lgatg6lHwzAu/RZqDKIwJDsEOO4lAl9Zt+DuxxdGdU2nOt/bw5/qVsFuHu7eHbTZxEl1a1
 602+BK+Cjk0AG2cAN97qS+w4UlZfBNlC5qY63m/wFKzEQrVc5nl9FIIA6UVIig==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 23 Feb 2026 13:09:28 +0100
Subject: [PATCH i-g-t v7 21/48] lib/unigraf: Introduce device configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-unigraf-integration-v7-21-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
In-Reply-To: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3517;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=0kqyccMnPiuJTTvADvrFgErmE92/PcMC6IFp3f0BssM=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpnENpDa/mgpapew/q7YE2GoFfZ8PrqK42XSxe2
 1vtrieNGaOJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaZxDaRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIacw/+NOYCQnwfJ9QuI5UaSLxCyJHdr0S9UN1
 8awl8RRzm85CMC+XvRlwUUXxq4eBALBdZQ7bBKSNvrBgTI7WkU/Zxd2HK3LDnpG8dhfQ1AljpXF
 E0disnl66BpwBXp1LRNOuTqER8APx4z96P9Rp20JwI7qtFGModHr0mNAKHDB+3w/IxtLay015Tb
 8j7rjeEnO99fvYpryTsLhlx7HyhbbS07r2ybRi5ZWItgPJx3cO8qbiBj7NnTNy5NFHABqPEUpX/
 60NNlKrnOJKZ4a0TtlbTJJJYqmMiIvhGsUE1yB3vXJf5Ol+vB64mX/GONIMGX25XuhRCb2pt+xa
 WFvH1QvFUFWN17aDz7qinu+GVjiW89wbBXyB8wSsc9aObzTgKwPY9GDKg5Q/cLB5Uw7y6gKQh68
 FuQf3ek8DNQ5LvOMiOsIML/866vZij4GumpnV9lUxaBSsPWWNRZgASUYldSWOvE1uqyoDOltcoM
 EYo/2y1UfiM1Tvx6rjrSF2Nc1urjZsP+/jm5+v6WPYyGtcg+d+344VgMmKHUkS1OnMc6HxDHwXw
 xPcGTZUgsq4L2QeGWeTt4XwhAG6+s5fXsFVKEwnZ5VQKPrLFLzdCK1dQh7ujn3SeNRPHBFnPOjY
 EeWJzQe9Z0U6PEgJ+rqyyaZjVnUyzvjeUbXdYvWxPo0mRIJMCoJU=
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
 lib/unigraf/unigraf.c | 57 +++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 55 insertions(+), 2 deletions(-)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index df18ab178e16..ec709a55c106 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -10,8 +10,9 @@
 #include <stdint.h>
 
 #include "unigraf.h"
-#include "TSI.h"
 #include "TSI_types.h"
+#include "TSI.h"
+#include "igt_rc.h"
 
 #define unigraf_debug(fmt, ...)	igt_debug("TSI:%p: " fmt, unigraf_device, ##__VA_ARGS__)
 
@@ -19,6 +20,21 @@ static TSI_HANDLE unigraf_device;
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
@@ -65,6 +81,22 @@ static unsigned int unigraf_device_count(void)
 	return unigraf_assert(TSIX_DEV_GetDeviceCount());
 }
 
+static int unigraf_find_device(char *request)
+{
+	int device_count = unigraf_device_count();
+
+	for (int i = 0; i < device_count; i++) {
+		char dev_name[UNIGRAF_NAME_MAX] = "";
+
+		memset(dev_name, 0, UNIGRAF_NAME_MAX);
+		unigraf_assert(TSIX_DEV_GetDeviceName(i, dev_name, UNIGRAF_NAME_MAX));
+		unigraf_debug("Detected unigraf device %d: %s\n", i, dev_name);
+		if (!strncmp(dev_name, request, UNIGRAF_NAME_MAX))
+			return i;
+	}
+	return -ENODEV;
+}
+
 /**
  * unigraf_open_device() - Search and open a device.
  * @drm_fd: File descriptor of the currently used drm device
@@ -76,8 +108,10 @@ static unsigned int unigraf_device_count(void)
 bool unigraf_open_device(int drm_fd)
 {
 	TSI_RESULT r;
+	GError *cfg_error = NULL;
+	char *cfg_device = NULL;
 	int device_count;
-	int chosen_device = 0;
+	int chosen_device;
 	int chosen_role = 0;
 	int chosen_input = 0;
 
@@ -88,6 +122,15 @@ bool unigraf_open_device(int drm_fd)
 
 	unigraf_init();
 
+	if (igt_key_file) {
+		cfg_device = g_key_file_get_string(igt_key_file, UNIGRAF_CONFIG_GROUP,
+						   UNIGRAF_CONFIG_DEVICE_NAME, &cfg_error);
+		if (cfg_error) {
+			unigraf_debug("No device name configured, uses first device available.\n");
+			cfg_device = NULL;
+		}
+	}
+
 	unigraf_assert(TSIX_DEV_RescanDevices(0, TSI_DEVCAP_VIDEO_CAPTURE, 0));
 
 	device_count = unigraf_device_count();
@@ -96,6 +139,16 @@ bool unigraf_open_device(int drm_fd)
 		return false;
 	}
 
+	if (!cfg_device) {
+		chosen_device = 0;
+	} else {
+		chosen_device = unigraf_find_device(cfg_device);
+		if (chosen_device < 0) {
+			igt_warn("The requested unigraf device %s is not found, err: %d.\n", cfg_device, chosen_device);
+			return false;
+		}
+	}
+
 	unigraf_device = TSIX_DEV_OpenDevice(chosen_device, &r);
 	unigraf_assert(r);
 	igt_assert(unigraf_device);

-- 
2.52.0

