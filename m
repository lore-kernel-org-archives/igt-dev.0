Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E370AD25B5F
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:15:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A9710E6E0;
	Wed, 28 Jan 2026 13:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="VlMCP3qu";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51FFC10E119
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 4654E1A2AC1
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1C9856071F;
 Wed, 28 Jan 2026 13:14:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 20D87119A881F; Wed, 28 Jan 2026 14:14:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769606084; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=2QHjofWC/lHDxJYsNwLPN3/LazqBuuSdlm1QxBM0Y9Y=;
 b=VlMCP3qu0Li6jFjqGKOT/UYuWo6RoiL4zIoTjr62xsSRRjKaASrerM7iW5EhuQXBATk+18
 oIOe9jGwIM9S+S7PSC/QcnzKXcDOCiotCp9wKKp5BtS4OCd/OIodpz3XbPGcImDgkbQY65
 quyRZMGyzLGeMFhTa6O/QGtVLFoH56OFRCDyMKwLnZ3xHmktvJDWIHb/5Asq77KkDLfmba
 VBD31ajU6hQu0mYeuNhspXn0b3D4JqyfEwoCI70Fe5FBDWvHM0Wt4g7JWwQv4OO+uCnBv2
 WwYrG5eU9dFC3dXxiIAyGB/HUtD22XSK7OZi4doi8c73QQUPEhdxWdCqMTrlQQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Jan 2026 14:14:50 +0100
Subject: [PATCH i-g-t v5 19/48] lib/unigraf: Initial Unigraf support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-unigraf-integration-v5-19-fbf2e997a011@bootlin.com>
References: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
In-Reply-To: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7446;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=LowCEjqki7pk5oJMG4Iqwf9BXK4xN8IMuzgSXqAUXQE=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpegvKwUHht24PlJa04O0BxxDMy4zRHw019RGtA
 6WldUOPIW6JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaXoLyhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOL5QRAAvveEGg+5/NMMkerAUBiAAcHpmJnrp66
 R/OB84MOHJTJAry3p9dnl8+QuXz9btM4MutnQ60jC4hJJ+GRtUdepP+YXBbaIViT6fUmI7bekcC
 jpt09ZENDKRMyBj/7cvYoDFbJNlKhPivHCCwRzN2Pgajn7KsElGcFM625Qgc+KS45mzFW/HrOeA
 AGX5uij0iZooT2IgpYGpjacjYV7rhTbMx2Dk3pKzSbCDoqDZ7hVdiaGvIn+VQIylqlRh0PEJwSX
 bHIneW8qRNCC/XpzxiApH6xq57ehZHNJvErhvKoaUSXL0qiCJmftaotjzlrOpyg3eCfKQyFA2NQ
 975Yhye29HOp06Qu9AtrwzQj2DdvO1gez7pT+7IoiS+aGqs/Y4np6kGeUGKCRVJybUQXHNrhWaa
 QRdwkjdSgDhRrRNrt6mphhDpCavWalhBgelQOggVmRP5OifyzT/RS3ceXpahAWnON6EqTYo+hk3
 1v3Hl2toaeRtRA31FQ+zltmtiOX5/ibaNF0H+9POh+g995DFIQK8Fz5FbV90XC2B9vQkajJ+XGl
 rjTZ7GQFcHcYsIaXmTWpJMFT44bEJrdzVZ/o8HLVPteD5ODTXkrs8E6+4j+9ZuibYihEGmHkzu/
 LgN5VatClWv4Yoht/lrgT7NfM91B6cThj+OebySI8z/OAMxMoPWI=
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

This introduce the basic boilerplate to connect to a unigraf device.

This integration currently only supports one device openned to simplify
its usage and cleanup.

The functions unigraf_open_device and unigraf_require_device will register
a handler to do proper cleanup on IGT exit.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/meson.build       |  10 +++++
 lib/unigraf/unigraf.c | 114 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h |  37 ++++++++++++++++
 meson.build           |  14 +++++++
 4 files changed, 175 insertions(+)

diff --git a/lib/meson.build b/lib/meson.build
index 1a569ba52aff..5e74222f17b7 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -148,6 +148,13 @@ lib_deps = [
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
@@ -228,6 +235,9 @@ endif
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
index 000000000000..3318c95fbbb6
--- /dev/null
+++ b/lib/unigraf/unigraf.c
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: MIT
+
+#include "igt_core.h"
+#include <stdint.h>
+
+#include "unigraf.h"
+#include "TSI.h"
+#include "TSI_types.h"
+
+#define unigraf_debug(fmt, ...)	igt_debug("TSI:%p: " fmt, unigraf_device, ##__VA_ARGS__)
+
+static TSI_HANDLE unigraf_device;
+static char *unigraf_default_edid;
+static char *unigraf_connector_name;
+
+static void unigraf_close_device(void)
+{
+	if (!unigraf_device)
+		return;
+
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
+	unigraf_close_device();
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
+/**
+ * unigraf_open_device() - Search and open a device.
+ * @drm_fd: File descriptor of the currently used drm device
+ *
+ * Returns: true if a device was found and initialized, otherwise false.
+ *
+ * This function searches for a compatible device and opens it.
+ */
+bool unigraf_open_device(int drm_fd)
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
+/**
+ * unigraf_require_device() - Search and open a device.
+ * @drm_fd: File descriptor of the currently used drm device
+ *
+ * This is a shorthand to reduce test boilerplate when a unigraf device must be present.
+ */
+void unigraf_require_device(int drm_fd)
+{
+	igt_require(unigraf_open_device(drm_fd));
+}
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
new file mode 100644
index 000000000000..376ed910bfa8
--- /dev/null
+++ b/lib/unigraf/unigraf.h
@@ -0,0 +1,37 @@
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
+#define unigraf_assert(result)									\
+({												\
+	char msg[256];										\
+	TSI_RESULT __r = (result);								\
+	if (__r < TSI_SUCCESS) {								\
+		TSI_RESULT __r2 = TSI_MISC_GetErrorDescription(__r, msg, sizeof(msg));		\
+		if (__r2 < TSI_SUCCESS)								\
+			igt_assert_f(false,							\
+				     "unigraf error: %d (get error description failed: %d)\n",	\
+				     __r, __r2);						\
+		else										\
+			igt_assert_f(false, "unigraf error: %d (%s)\n", __r, msg);		\
+	}											\
+	(__r);											\
+})
+
+bool unigraf_open_device(int drm_fd);
+
+void unigraf_require_device(int drm_fd);
+
+#endif // UNIGRAF_H
diff --git a/meson.build b/meson.build
index 4b2496c01679..ff197cec314d 100644
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
@@ -289,6 +295,7 @@ amdgpudir = join_paths(libexecdir, 'amdgpu')
 msmdir = join_paths(libexecdir, 'msm')
 panfrostdir = join_paths(libexecdir, 'panfrost')
 panthordir = join_paths(libexecdir, 'panthor')
+unigrafdir = join_paths(libexecdir, 'unigraf')
 v3ddir = join_paths(libexecdir, 'v3d')
 vc4dir = join_paths(libexecdir, 'vc4')
 vkmsdir = join_paths(libexecdir, 'vkms')
@@ -371,6 +378,12 @@ if get_option('use_rpath')
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
@@ -382,6 +395,7 @@ else
 	vc4_rpathdir = ''
 	vkms_rpathdir = ''
 	vmwgfx_rpathdir = ''
+	unigraf_rpathdir = ''
 endif
 
 build_testplan = get_option('testplan')

-- 
2.52.0

