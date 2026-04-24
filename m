Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE36DFED3F1
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 16:57:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D58A8961D;
	Fri, 24 Apr 2026 16:57:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="sglHl2zA";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE19C890BE
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:54:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E38691A3402
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:54:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BB94E604EB;
 Fri, 24 Apr 2026 16:54:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E7D8310720A20; 
 Fri, 24 Apr 2026 18:54:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1777049686; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=cgrGztxkG/H70JBpz2YEhuzLim7nt32N8UlVzY1hrJY=;
 b=sglHl2zAtpHAYJFllTP7FXsXSZXTproGELPBv0T3OSHh5A8vswnZvG/fa214nT03McIFxU
 675fFc+/ql8vf4xH4ZCeQgNkqMbkHzI/UbIuUreKQoGv2kJ9jn4nGa3Bzfp3+hwdjxMuXD
 HW59Zr9U/wNjJrUm8hKnfac0aLeZhW7hCh4ZHRA/2MrGL1Ptllwgn/HtPot6Be498/uAsL
 hkqBFxnGOY/BH3b87oDBKRFMeigKb3SavHiDfN4KqAH6bIPqUE4CXYd2SAELRfwhVRd9C3
 6q1EXLxFEW+LDdmq9wgiIigMpCsn8X+0QIwEa6+i5D9Hil3YuMaUFhvEu1zk2Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 24 Apr 2026 18:52:55 +0200
Subject: [PATCH i-g-t v11 20/49] lib/unigraf: Initial Unigraf support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260424-unigraf-integration-v11-20-0c5f5346ae60@bootlin.com>
References: <20260424-unigraf-integration-v11-0-0c5f5346ae60@bootlin.com>
In-Reply-To: <20260424-unigraf-integration-v11-0-0c5f5346ae60@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
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

This integration currently only supports one device opened to simplify
its usage and cleanup.

The functions unigraf_open_device and unigraf_require_device will register
a handler to do proper cleanup on IGT exit.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/meson.build              |  10 ++++
 lib/vendor/unigraf/unigraf.c | 124 +++++++++++++++++++++++++++++++++++++++++++
 lib/vendor/unigraf/unigraf.h |  43 +++++++++++++++
 meson.build                  |  14 +++++
 4 files changed, 191 insertions(+)

diff --git a/lib/meson.build b/lib/meson.build
index 0e7efadf30ad..e17aece2fdf0 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -155,6 +155,13 @@ lib_deps = [
 
 inc = [ inc, include_directories('vendor') ]
 
+if libtsi.found()
+	lib_deps += libtsi
+	lib_sources += [
+		'vendor/unigraf/unigraf.c'
+	]
+endif
+
 if libdrm_nouveau.found()
 	lib_deps += libdrm_nouveau
 	lib_sources += [
@@ -236,6 +243,9 @@ endif
 if chamelium.found()
 	lib_deps += chamelium
 	lib_sources += [ 'igt_chamelium.c', 'igt_chamelium_stream.c' ]
+endif
+
+if chamelium.found() or libtsi.found()
 	lib_sources += 'monitor_edids/monitor_edids_helper.c'
 endif
 
diff --git a/lib/vendor/unigraf/unigraf.c b/lib/vendor/unigraf/unigraf.c
new file mode 100644
index 000000000000..81ffae7a8ac3
--- /dev/null
+++ b/lib/vendor/unigraf/unigraf.c
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Google
+ *
+ * Authors:
+ *   Louis Chauvet <louis.chauvet@bootlin.com>
+ */
+
+#include <stdint.h>
+
+#include "igt_core.h"
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
+ * Assert if:
+ * - called outside tests / fixup
+ * - TSI library raise errors
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
diff --git a/lib/vendor/unigraf/unigraf.h b/lib/vendor/unigraf/unigraf.h
new file mode 100644
index 000000000000..c08ce62894c5
--- /dev/null
+++ b/lib/vendor/unigraf/unigraf.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Google
+ *
+ * Authors:
+ *   Louis Chauvet <louis.chauvet@bootlin.com>
+ */
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
index 79051be217ad..e750f7a51476 100644
--- a/meson.build
+++ b/meson.build
@@ -166,6 +166,12 @@ libpci = dependency('libpci', required : true)
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
@@ -293,6 +299,7 @@ amdgpudir = join_paths(libexecdir, 'amdgpu')
 msmdir = join_paths(libexecdir, 'msm')
 panfrostdir = join_paths(libexecdir, 'panfrost')
 panthordir = join_paths(libexecdir, 'panthor')
+unigrafdir = join_paths(libexecdir, 'unigraf')
 v3ddir = join_paths(libexecdir, 'v3d')
 vc4dir = join_paths(libexecdir, 'vc4')
 vkmsdir = join_paths(libexecdir, 'vkms')
@@ -370,6 +377,12 @@ if get_option('use_rpath')
 	endforeach
 	vkms_rpathdir = join_paths(vkms_rpathdir, libdir)
 
+	unigraf_rpathdir = '$ORIGIN'
+	foreach p : unigrafdir.split('/')
+		unigraf_rpathdir = join_paths(unigraf_rpathdir, '..')
+	endforeach
+	unigraf_rpathdir = join_paths(unigraf_rpathdir, libdir)
+
 	vmwgfx_rpathdir = '$ORIGIN'
 	foreach p : vmwgfxdir.split('/')
 		vmwgfx_rpathdir = join_paths(vmwgfx_rpathdir, '..')
@@ -385,6 +398,7 @@ else
 	v3d_rpathdir = ''
 	vc4_rpathdir = ''
 	vkms_rpathdir = ''
+	unigraf_rpathdir = ''
 	vmwgfx_rpathdir = ''
 endif
 

-- 
2.54.0

