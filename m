Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F82C83F34
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 18:46:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B826A10E885;
	Thu, 17 Jul 2025 18:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="FFY2PPET";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4374510E15A
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 18:46:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D311D442AB;
 Thu, 17 Jul 2025 18:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752778003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gzCPR+vAWSeyDVvF34x0+Qlc/4+SLEttHZPNQVK8EHM=;
 b=FFY2PPETBIT7z2VOD3UWF8ekFEsUBV0ONkDNIJbCAY2WDwL2aetYPkm3mddi2w3DFzsbEe
 K63Dv83yB26Gx2J0LU4kpnbzsxwTJZJMvLYWw8K4eXEhH4v63iOpl2mLEZU35jdWqvFE/k
 Duww2YmSHX7L+U1Tado5u9W9IQJUrrdfdWuY+W4rTYPVeyeqnzE5wb7N+pvfXx8465MTUd
 fmM43QSbsg2wslTB93ZjLhvF2kNDsWHciYPnqdstIp9LmA8UDHkS0641Tq16bsaT4LxGYS
 M8BuDheradV8mjN3uDTQFZHXt957viGZ/TrmhUUUIMTkO7JhGppUztrY4tOx0Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 17 Jul 2025 20:46:31 +0200
Subject: [PATCH i-g-t v2 11/26] lib/unigraf: Initial Unigraf support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-unigraf-integration-v2-11-77dc329e584c@bootlin.com>
References: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
In-Reply-To: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, mark.yacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7750;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=QnCzdLFO+rNYsjuWNZ0mnirZf8/eE48B64pNSqXTYR4=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoeUUK4U80ozTUcOgfVMsmzmKxDMSNAdi/VUh24
 0mPMTkuGoKJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaHlFCgAKCRAgrS7GWxAs
 4kQ/EADCeGOu/kGkiI1akQe+e9kKEZFKQO2A2RzO8zCNsE7LvMLlggaXmSqsZzvHIFNiPVr20GS
 H+uKHwIrbrvfB2X3KvMCKHwtgcqAXhw/xg69+xdKI1Vzj/XafK3A94tMP1RvyBaiDqCCmkkfTLT
 7KlcChC6QgqC1YszuabWAF8untE62HYJJ3M6OrCqha7f88J19ttNseAEnlXOh5ZH4kuJMl969aU
 mjrhnMp4HfNX/T0r7n4J2CFGyZZTWsuz1GIS6JxxhKo+ZUQdZZlZeU4mTfErxSgaN3SIOOUo6xa
 Si9rl07uqeMCsTIdIpWE7AghSYYd7wtEbnpTMYeGyVgIYGzS6YF2RAD/0UAcLxb5wyBLGgG9D/1
 Bhl+Ipaoyn+ZkvmBXaqDnTd16n1bp41iY8jzez2gu0SpnlADyf12hA+MMQs/1WNur+7HNzJuBHH
 kO72TplkBAHC8wlSUMp1x7HRTzQZJwLl2NLlKi3Box4GoT7BYTRRG7UQ+zsY0ipxSymiNLNYiuo
 JYjSEZfV6t9Ywafe88oIMhXPtsTVW+CywDarMfT1gmKvAxtASVWVGUzSTiw7ku5zw4yVvG7QDSi
 ZpfAhMGHsrbIg067X5c3DZS8XYyO/nYPZ+Oau7jOFMEr6/lo1zvPW2eCMcPXepQzddnO0ffrGdI
 AvgZh74vAvG41rQ==
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

This introduce the basic boilerplate to connect to a unigraf device.

This integration currently only supports one device openned to simplify
its usage and cleanup.

The functions unigraf_open_device and unigraf_require_device will register
a handler to do proper cleanup on IGT exit.
---
 lib/meson.build       |  10 +++++
 lib/unigraf/unigraf.c | 109 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h |  48 ++++++++++++++++++++++
 meson.build           |  14 +++++++
 4 files changed, 181 insertions(+)

diff --git a/lib/meson.build b/lib/meson.build
index ff81baae13ad810eea56b97a42d556e5c6978718..fa4e4f40da48292d841e684cd0871a1b4894ebdf 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -141,6 +141,13 @@ lib_deps = [
 	zlib
 ]
 
+if libtsi.found()
+	lib_deps += libtsi
+	lib_sources += [
+		'unigraf/unigraf.c'
+	]
+endif
+
 if libdrm_nouveau.found()
 	lib_deps += libdrm_nouveau
 	lib_sources += [
@@ -210,6 +217,9 @@ endif
 if chamelium.found()
 	lib_deps += chamelium
 	lib_sources += [ 'igt_chamelium.c', 'igt_chamelium_stream.c' ]
+endif
+
+if chamelium.found() or libtsi.found()
 	lib_sources += 'monitor_edids/monitor_edids_helper.c'
 endif
 
diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
new file mode 100644
index 0000000000000000000000000000000000000000..a9f6e94498ef21fbfde3295456aa3bea9fdc7d67
--- /dev/null
+++ b/lib/unigraf/unigraf.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: MIT
+
+#include "drmtest.h"
+#include "glib.h"
+#include "igt_core.h"
+#include "igt_edid.h"
+#include <stdint.h>
+#include <stdio.h>
+#include <string.h>
+#include <time.h>
+
+#include "unigraf.h"
+#include "TSI.h"
+#include "TSI_types.h"
+#include "igt_kms.h"
+#include "igt_pipe_crc.h"
+#include "igt_rc.h"
+#include "monitor_edids/monitor_edids_helper.h"
+
+#define unigraf_debug(fmt, ...)	igt_debug("TSI:%p: " fmt, unigraf_device,##__VA_ARGS__)
+
+static int unigraf_open_count;
+static TSI_HANDLE unigraf_device;
+static char *unigraf_default_edid;
+static char *unigraf_connector_name;
+
+static void unigraf_close_device(void)
+{
+	unigraf_debug("Closing...\n");
+	unigraf_assert(TSIX_DEV_CloseDevice(unigraf_device));
+	TSI_Clean();
+	unigraf_device = NULL;
+	free(unigraf_default_edid);
+	free(unigraf_connector_name);
+}
+
+/**
+ * unigraf_exit_handler - Handle the exit signal and clean up unigraf resources.
+ * @sig: The signal number received.
+ *
+ * This function is called when the program receives an exit signal. It ensures
+ * that all unigraf resources are properly cleaned up by calling unigraf_deinit
+ * for each open instance.
+ */
+static void unigraf_exit_handler(int sig)
+{
+	if (unigraf_open_count)
+		unigraf_close_device();
+}
+
+static void unigraf_init(void)
+{
+	int ret;
+
+	unigraf_debug("Initialize unigraf...\n");
+	ret = TSI_Init(TSI_CURRENT_VERSION);
+	unigraf_assert(ret);
+	igt_install_exit_handler(unigraf_exit_handler);
+}
+
+/**
+ * unigraf_device_count() - Return the number of scanned devices
+ *
+ * Must be called after a unigraf_rescan_devices().
+ */
+static unsigned int unigraf_device_count(void)
+{
+	return unigraf_assert(TSIX_DEV_GetDeviceCount());
+}
+
+bool unigraf_open_device(void)
+{
+	TSI_RESULT r;
+	int device_count;
+	int chosen_device = 0;
+	int chosen_role = 0;
+	int chosen_input = 0;
+
+	assert(igt_can_fail());
+
+	if (unigraf_device)
+		return true;
+
+	unigraf_init();
+
+	unigraf_assert(TSIX_DEV_RescanDevices(0, TSI_DEVCAP_VIDEO_CAPTURE, 0));
+
+	device_count = unigraf_device_count();
+	if (device_count < 1) {
+		unigraf_debug("No device found.\n");
+		return false;
+	}
+
+	unigraf_device = TSIX_DEV_OpenDevice(chosen_device, &r);
+	unigraf_assert(r);
+	igt_assert(unigraf_device);
+	unigraf_debug("Successfully opened the unigraf device %d.\n", chosen_device);
+
+	unigraf_assert(TSIX_DEV_SelectRole(unigraf_device, chosen_role));
+	unigraf_assert(TSIX_VIN_Select(unigraf_device, chosen_input));
+	unigraf_assert(TSIX_VIN_Enable(unigraf_device, chosen_input));
+
+	return true;
+}
+
+void unigraf_require_device(void)
+{
+	igt_require(unigraf_open_device());
+}
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
new file mode 100644
index 0000000000000000000000000000000000000000..8e0137ce30ed1bc0b334540561f93c7ade38e386
--- /dev/null
+++ b/lib/unigraf/unigraf.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef UNIGRAF_H
+#define UNIGRAF_H
+
+#include <stdbool.h>
+#include <stdint.h>
+
+/**
+ * unigraf_assert: Helper macro to assert a TSI return value and retrieve a detailed error message.
+ * @result: libTSI return value to check
+ *
+ * This macro checks the return value of a libTSI function call. If the return value indicates an
+ * error, it retrieves a detailed error message and asserts with that message.
+ * If retrieving the error description fails, it asserts with a generic error message.
+ */
+#define unigraf_assert(result)										\
+({													\
+	char msg[256];											\
+	TSI_RESULT __r = (result);									\
+	if (__r < TSI_SUCCESS) {									\
+		TSI_RESULT __r2 = TSI_MISC_GetErrorDescription(__r, msg, sizeof(msg));			\
+		if (__r2 < TSI_SUCCESS)									\
+			igt_assert_f(false, "unigraf error: %d (get error description failed: %d)\n",	\
+				     __r, __r2);							\
+		else											\
+			igt_assert_f(false, "unigraf error: %d (%s)\n", __r, msg);			\
+	}												\
+	(__r);												\
+})
+
+/**
+ * unigraf_open_device() - Search and open a device.
+ *
+ * Returns: true if a device was found and initialized, otherwise false.
+ *
+ * This function searches for a compatible device and opens it.
+ */
+bool unigraf_open_device(void);
+
+/**
+ * unigraf_require_device() - Search and open a device.
+ *
+ * This is a shorthand to reduce test boilerplate when a unigraf device must be present.
+ */
+void unigraf_require_device(void);
+
+#endif // UNIGRAF_H
diff --git a/meson.build b/meson.build
index 3d18267e652943c5984575498ddeacdec7e079da..2bc2dd1cf024875adab5adfebfe6da528cab787e 100644
--- a/meson.build
+++ b/meson.build
@@ -165,6 +165,12 @@ cairo = dependency('cairo', version : '>1.12.0', required : true)
 libudev = dependency('libudev', required : true)
 glib = dependency('glib-2.0', required : true)
 
+libtsi = cc.find_library('TSI', required : false)
+
+if libtsi.found()
+	config.set('HAVE_UNIGRAF', 1)
+endif
+
 xmlrpc = dependency('xmlrpc', required : false)
 xmlrpc_util = dependency('xmlrpc_util', required : false)
 xmlrpc_client = dependency('xmlrpc_client', required : false)
@@ -288,6 +294,7 @@ libexecdir = join_paths(get_option('libexecdir'), 'igt-gpu-tools')
 amdgpudir = join_paths(libexecdir, 'amdgpu')
 msmdir = join_paths(libexecdir, 'msm')
 panfrostdir = join_paths(libexecdir, 'panfrost')
+unigrafdir = join_paths(libexecdir, 'unigraf')
 v3ddir = join_paths(libexecdir, 'v3d')
 vc4dir = join_paths(libexecdir, 'vc4')
 vmwgfxdir = join_paths(libexecdir, 'vmwgfx')
@@ -356,6 +363,12 @@ if get_option('use_rpath')
 		vmwgfx_rpathdir = join_paths(vmwgfx_rpathdir, '..')
 	endforeach
 	vmwgfx_rpathdir = join_paths(vmwgfx_rpathdir, libdir)
+
+	unigraf_rpathdir = '$ORIGIN'
+	foreach p : unigrafdir.split('/')
+		unigraf_rpathdir = join_paths(unigraf_rpathdir, '..')
+	endforeach
+	unigraf_rpathdir = join_paths(unigraf_rpathdir, libdir)
 else
 	bindir_rpathdir = ''
 	libexecdir_rpathdir = ''
@@ -365,6 +378,7 @@ else
 	v3d_rpathdir = ''
 	vc4_rpathdir = ''
 	vmwgfx_rpathdir = ''
+	unigraf_rpathdir = ''
 endif
 
 build_testplan = get_option('testplan')

-- 
2.50.0

