Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCC710F92E0
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:11:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F1C10EC48;
	Tue, 31 Mar 2026 17:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="UPG/mlWW";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F6A10EC43
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 168C0C59955;
 Tue, 31 Mar 2026 17:11:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7368C6029D;
 Tue, 31 Mar 2026 17:11:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 568F2104505DF; 
 Tue, 31 Mar 2026 19:11:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977068; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=7p88wpHydXZxpCIC0EYwEi+EAjYHkOUfV5q2CxDBqrY=;
 b=UPG/mlWWUU+4VFTZio3Czod6+zElMnYlqXEc6sWVyEE0iNu7SOtPRV087KaGxUHSazCWqp
 /TipNf2Xt0Jc4Fv+9TIPi8qyLTQzTpaIThohLxCmwiUqsQ9U4XZ4BsFkwtDEeqxuowXL7S
 5uk/DOhh52raKfGZZ3yAvXEuOR4Nmf8sA1Ic+ZyKFWeXrr1gF/kDIpCNI8UW+NtOm/TTjJ
 vc6JIgw3YjupJGGk3NebY5YMiqzuq8fQpH5fGLpJx59SgxX1hbnW+Oiq6czZkiW1nDqv2G
 xUrr4TxOB5Xqj2WfWq2U9zdWxAWwbMwiFng8uDjQEwPksSXteCCyrHWfNspCYw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:11:39 +0200
Subject: [PATCH i-g-t v10 22/49] lib/unigraf: Introduce device
 configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-unigraf-integration-v10-22-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3356;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=40h1dKEIAc475DtFEIy2yx+wN+N+wXh2aEklcgAkc2I=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzAA+sOZcrVVebqndhcncAnAmFwehbszspp9Wp
 Q6x7VNSBn+JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAPhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLFVg/+Oxv01w+/pQHe+/Ph5cT1B+68KGyR7Fl
 t/bIIPzT3aelDZSBgWZHKSkq+GhF1KaYMlzkKQcpMeb1IAWFaJeGsVZDm0MimlS94iKxZQKvT5D
 8iUOfiYS1cpfqt7NOhTTHGO3Kr4V9Ym1SHd5dhaRZz2O8sK3Tj/CTF/nD0fFg5I8dMuD8+QeE5V
 up5WTargFaJ2GPeyVJOwaXXCrgtUE9n08X7JbZY4De879orkjwdJLgKNGoIsDo30EsOj7g8ZidA
 elqgjn3HXaV6e9ZNNbwnKOMdMqivm9wg/WoZetpZRTkRTBZEEO5XLd/nRv7iTX5C8Q0O9ew7qp7
 AhcTeqkkJQv5rTae3FNixzjHtmbnj5196KG77eZK7y5hO3ocpQUsuOakuv/hCWVS+n9y8EGScTD
 rBVNK2ilLPiYKSxxBk30AM3LGZ6Qdy2aWJdOCD6Hx0dBGWBHAcdpz9CVriX/yJU1ElTjx/EEbFU
 VTc+qj5zyAJQUeWUKuna5on1dZWjeHtdjRFHewivQsVQ4ucZA+X/NiG7JC7VsDRv193hgbCILCG
 s5eEApel5MDAIQg8mnRMUjzXVQ08gd/+pKbDY1ciToDcGBfJ3Ttkem26WSBc9m5ZzPXfxcNOiT7
 cdNw5Zu83BC/2MbQMqpcz4Xwv61ChF+0TD0nri6Z+1e80069wVNA=
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
 lib/vendor/unigraf/unigraf.c | 50 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/lib/vendor/unigraf/unigraf.c b/lib/vendor/unigraf/unigraf.c
index 81ffae7a8ac3..bf52357e1dc9 100644
--- a/lib/vendor/unigraf/unigraf.c
+++ b/lib/vendor/unigraf/unigraf.c
@@ -13,6 +13,7 @@
 #include "unigraf.h"
 #include "TSI.h"
 #include "TSI_types.h"
+#include "igt_rc.h"
 
 #define unigraf_debug(fmt, ...)	igt_debug("TSI:%p: " fmt, unigraf_device, ##__VA_ARGS__)
 
@@ -20,6 +21,21 @@ static TSI_HANDLE unigraf_device;
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
@@ -66,6 +82,21 @@ static unsigned int unigraf_device_count(void)
 	return unigraf_assert(TSIX_DEV_GetDeviceCount());
 }
 
+static int unigraf_find_device(char *request)
+{
+	int device_count = unigraf_device_count();
+
+	for (int i = 0; i < device_count; i++) {
+		char dev_name[UNIGRAF_NAME_MAX] = "";
+
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
@@ -80,6 +111,8 @@ static unsigned int unigraf_device_count(void)
 bool unigraf_open_device(int drm_fd)
 {
 	TSI_RESULT r;
+	GError *cfg_error = NULL;
+	char *cfg_device = NULL;
 	int device_count;
 	int chosen_device = 0;
 	int chosen_role = 0;
@@ -92,6 +125,15 @@ bool unigraf_open_device(int drm_fd)
 
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
@@ -100,6 +142,14 @@ bool unigraf_open_device(int drm_fd)
 		return false;
 	}
 
+	if (cfg_device) {
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

