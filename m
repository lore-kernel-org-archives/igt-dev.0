Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2158FF60F4
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:11:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F24910EC50;
	Tue, 31 Mar 2026 17:11:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="1n2Va3M+";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D2510EC43
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 081C6C59957;
 Tue, 31 Mar 2026 17:11:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 64D4D6029D;
 Tue, 31 Mar 2026 17:11:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5D4A010450574; 
 Tue, 31 Mar 2026 19:11:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977066; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=w57g6xSW5hPj0JLRKlSDjUAxEQbne20D4o6YBf35KGo=;
 b=1n2Va3M+J3E+yUZsqV2kABoXusGO+EaeduGPVr0RNs8tjQnuy52FV2a20qiq8pBEt3CkiX
 MtSx/Gf6A/Q0oESv8nXEcgV6GHweKwWprH/na04Ppjb/qLxPsNNbflqxsFvKbapukAlmTV
 pWoprSDMO6Pjls/FgF0t4fWIxo2f9qVAexYFKMGOtJeiDViH67d/jE7DvpngAO3WhhWTlL
 8oz6cIDOBiECeGsdkFbmSw/G5NS3byh7jXIaM+SKDvDoiUdUcWko6Th2j7v62CB3yZd7V+
 3EQsrNkvKGwwAKttRa7X7FCwM+9lClj0H3pIq12BF/fkCZCWjBOppvzAwRQzQQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:11:37 +0200
Subject: [PATCH i-g-t v10 20/49] lib/unigraf: Initial Unigraf support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260331-unigraf-integration-v10-20-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7877;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=PJejE7C8C9aCYDjVW99zF6iSz1YkiNyWtVvflJh/X6c=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzAA+Qx+AVMqSNfOpsmaYCJ22lHDd/Ur14VbLs
 kqdL+WIaFeJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAPhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLOoQ/8CxjbSTEXKFoibhxeVj9glKMBbB4lly5
 CmxAgj5e+Y25OkFIidx++uzvnk8ERYT8I1Zx5r9AtIL+lUFGYmau9XEReUo5hC358MOC0dKeYUT
 wsyiTykV/PzjjelSck3vvNwpTAuiJpKLcE1nEd07I3yeLeBuL2EhS4fkD35U3YEOLLXaacO+0o4
 na0N8VoPf6B/bFkyF7knJKbH+9OkF+CdCfT890WPqyV1QZ696IbzpnDpXPjKRaofUpCqyZkBAsQ
 3Eg0WUfr/sChFHVnSkDPLdHNjxbT/QHnUYGAhPkiveKVain9tmjKtc7I9SkZAmPUhyxBsbeKvat
 vfjT9N7Uo8jKlUlXa0rNYJb52qiq/ACIAkPIJ9Xw3ds7y6FLXd/T75gVxAghF2sSn4X7nlR4wgg
 ef1CV3bGadTSwibzgJYJ1PsSchS44P5lGfwCGzTXN/pt5q03ap5sy1tN6tGPuBStcJEj/88t6N8
 QCOgRezP158UukrOUEnTnZPGiLow1ZZSGJA8GSmlSNU0MYTRs0dMSTViEPbiPzkJX9sJrU6WHML
 VAa2sJJkFjE0zXwo1Rw04hruibTfFi6d1iTOM629uiMBLu5kzlm0Qi7ku7dPp8YY7T4eOokO93c
 mZNoKnDLWn2kfdAzHlvTbiuOlLMzbCbQ/pL1Vfhb8AfIhy5WRLEI=
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
index 5c4829345e93..82d6ea9a5ceb 100644
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
index 57849648a377..2092dbddbdbe 100644
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
@@ -290,6 +296,7 @@ amdgpudir = join_paths(libexecdir, 'amdgpu')
 msmdir = join_paths(libexecdir, 'msm')
 panfrostdir = join_paths(libexecdir, 'panfrost')
 panthordir = join_paths(libexecdir, 'panthor')
+unigrafdir = join_paths(libexecdir, 'unigraf')
 v3ddir = join_paths(libexecdir, 'v3d')
 vc4dir = join_paths(libexecdir, 'vc4')
 vkmsdir = join_paths(libexecdir, 'vkms')
@@ -367,6 +374,12 @@ if get_option('use_rpath')
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
@@ -382,6 +395,7 @@ else
 	v3d_rpathdir = ''
 	vc4_rpathdir = ''
 	vkms_rpathdir = ''
+	unigraf_rpathdir = ''
 	vmwgfx_rpathdir = ''
 endif
 

-- 
2.52.0

