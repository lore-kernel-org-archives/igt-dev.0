Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D69F53D6F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:23:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C30910E29A;
	Mon, 16 Mar 2026 16:23:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="UbyVXy+9";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5974510E3AB
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 62019C55044;
 Mon, 16 Mar 2026 16:23:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BCB645FC4A;
 Mon, 16 Mar 2026 16:23:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8A27910372204; Mon, 16 Mar 2026 17:23:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678209; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ykfam4USss4N4BiddhAhkCjJlqUoXNVV6/zV1ZsKQuk=;
 b=UbyVXy+9AN6uvie1cHXW0s23RWxrj86Hy3dHJkuS+95vEzV4KyzycNGw6mjB1JjWd/DmIV
 /E5+kJKujM2vX39rdCh/0JLqmE8KpAIDLKGAorv1utfFPNkn2BfauHPGglJTQFBSzR9rfZ
 XPLTeQbnarcQ/EwCCKKvRZqXmPB9SbZB0TTD6kv1e9fDNLSl5s3WH7E8B8K3JP+NwX4FOH
 SROZx2YvU2jZmoKxNyO2671I0gNsI3OquEDSjzmesB30xP6lI3ijt87jhpXirhRJZK8UHX
 b/0XR50GjMK0bhUv0PQVejX4NTg4sUV1Y+xR049rppH50zV68Hzbs/2GMYMSCw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:17:43 +0100
Subject: [PATCH i-g-t v9 22/49] lib/unigraf: Introduce device configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v9-22-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3326;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=mYSY3xAozqps8M5XP9NUrnPsj8W148u2F1AZeFmlChs=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6MbNYoEVdsigoFibrXGu9KNfWriuxa5qXLD
 UXc9dMiEOyJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabgujBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIDJQ/+Mihl6+5fD5IO3tkz2h4rguWH+WFHKvk
 ONuel6m7UFE5Id3mklSRp056TNpQE+NlzsPUPQ4W9xkJGf/ezPYgT6Tq7KkxUl+Q3pJZ8r8c6pi
 rqId04VAT2g5TgDrfMnDoyrWctdgxwsCz6hf4OxezwqZvmS6D2BQL35xCBnUrCg+o+RFJuh+hoE
 TmtZ0nWvYVGo7Y3lpCn2YfjdZEP5JdlrJqFNoI8uZUFfVOHslrwmWPmR1WoyGcd0YJ1UBwzDl4T
 x6XYqAjs20O59Onv+mZ+sHt9MlEXzYg5H7yjLGlCCJOz3A16uNdanUpJCknISpJVlG/wUFF7K1d
 giW+28qJClkKla1kGfJ1KPAFAnFMirx3Zkxp4TEXMFsc5v8Cc3Zqz0Eq0TE1lhrj/pNqDAKevmm
 aoOBqvmfpBIPzb7LEz3KIV+cSc9xHmtVFAoOBoxo4gz9cfiTk5Wb5CENbGG5FjoHQH1GP4wNgZC
 tgIh3b1nqO7TAW6lBKGkqOpSK/Uu+MIgaXKy+VUWeQ8SdqhneMTRs4dCQoDzRQwhkZ+d2to9bfX
 K0RNygTJ+DXaNpITpF7Ij1CANJVgxy450tEXZkeozd/R6fzNTDB3s6aOUMz5zj/lE7q4EZ25kW2
 Gd57gOrpkK0CkADhAhWj28j1Wc0k54mGe5j9fkGepZqP+os8vLLM=
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
 lib/unigraf/unigraf.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index df18ab178e16..9d5f0a488bed 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -12,6 +12,7 @@
 #include "unigraf.h"
 #include "TSI.h"
 #include "TSI_types.h"
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
@@ -65,6 +81,21 @@ static unsigned int unigraf_device_count(void)
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
@@ -76,6 +107,8 @@ static unsigned int unigraf_device_count(void)
 bool unigraf_open_device(int drm_fd)
 {
 	TSI_RESULT r;
+	GError *cfg_error = NULL;
+	char *cfg_device = NULL;
 	int device_count;
 	int chosen_device = 0;
 	int chosen_role = 0;
@@ -88,6 +121,15 @@ bool unigraf_open_device(int drm_fd)
 
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
@@ -96,6 +138,14 @@ bool unigraf_open_device(int drm_fd)
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

