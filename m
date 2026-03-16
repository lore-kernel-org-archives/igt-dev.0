Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1E4F46449
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 10:24:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 864AA10E252;
	Mon, 16 Mar 2026 10:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="XsHujn/5";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B15410E258
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:24:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 1A35F4E42627
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:24:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E6ABD5FC4A;
 Mon, 16 Mar 2026 10:24:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8DCF610369F55; Mon, 16 Mar 2026 11:24:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773656646; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ykfam4USss4N4BiddhAhkCjJlqUoXNVV6/zV1ZsKQuk=;
 b=XsHujn/5aZbMTenIZhI5eShjzj80Yh5bQL0PWf9/Ge8u36PxaCgIPC4eQQbowLL4LVmJ1O
 KIwgp2pTjeZV4mEGgBqE8g/ro3oBBQMIPAX1ThkDwcMm8vJFGN5GIbA4nVCqPNUnTzE/8b
 QG408ejOlULQTtke5hKXEw1m9a8dspS8W9fU9bHfkECmN1LQtLR5FxaPaiJeCVrz81CKDS
 D5eedykWp8KwUIG8DEo3HOuH8T7LOrGvZIbdKU4NIRGR4ZQJ6hzvw8BDfD9PVNLlIi0bsb
 hcFB6O0ULN7t5fHX/r6SbRVXTnJMg+xaUjN9P+7xxgy9q+q+6nUUSVlwo7oJ5A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 11:24:30 +0100
Subject: [PATCH i-g-t v8 22/49] lib/unigraf: Introduce device configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v8-22-4489bf8572be@bootlin.com>
References: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3326;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=mYSY3xAozqps8M5XP9NUrnPsj8W148u2F1AZeFmlChs=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpt9pRhxuDu5vAy+X9SZAvztCDeS2h8xUlhLOM4
 Mk68qyZsISJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabfaURsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLL3A//WxcqkTql8cHxR2sW4UDywUP0eNjs++0
 OF4GVonLi4HjH8NoJldfFOS7sYqrv56wCYYk2WtQA5AX8rqgzbr2bsd8jRVqxWyMnd6yEDgfsaF
 7hIExQu7nYryxjwSCUCDlQ2ykekAeiGhElFHF9WrcSz46jy0tvSEa5Mp1qxLRczyU0YxRL8TTUl
 MQHzgTYYWNJ6QZUHmokStKuKxztPp1D9DlK1fW6ZO4GRgR0MatPBAE/ThdvveferofXlLVsAR9R
 llC2NPcHOt2KrZcuvB8j6g3uSTGCDI/H36k+I7rZvz7HS6YHNsW7Y4bfcS4zRVkoaUSJMc2sqTH
 t2cXGTelA30xP3pe4HWIGGC7B9S86TRPtp4LS3Wug6Rz/ImzCN9iTtD/r9Efklc4Ta9HpxyQC8V
 t6VtOnI6r+h473E/I4txoCYcGpmJQE1pWdHqT1vSIZrz+/67XpMZJbSd3Wa8+fKODwYWcmktld0
 USfBimEO1AbYDG+mu4+MVWzxRXNft0F7ruKWbOAMsayCSpMNy/OJ2gY86UQnFuXnhP0GRRXlxvD
 Zy/tedt0txYQkgkUh4Jfn6UVXhoiVN9foOJ7003uPiVxrKl5An/1IEhBfBVzkBrMRiEYzI7eo0D
 2KQQ3A7r41yGFrt6aYuWPIFFg1lj96tOwbHpjcdBQMMaoCuldlXA=
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

