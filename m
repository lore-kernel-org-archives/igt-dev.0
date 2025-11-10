Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F461CCFA13
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:39:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C914D10E3BB;
	Mon, 10 Nov 2025 13:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="mq78APKn";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED0110E3BB
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id CF8B31A19A7;
 Mon, 10 Nov 2025 13:39:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9F7F2606F5;
 Mon, 10 Nov 2025 13:39:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A054C1037190E; Mon, 10 Nov 2025 14:39:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762781990; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=CkaYFbMLNM4iYrafODrCCOfp5t5/FHUB7KFtyw47wW8=;
 b=mq78APKnzvwdcsNL+/T+7vYexlZsTk9WoLgrrHiGsgaV7Lc3KCqUy6l2+kQv3DubkW5hf+
 el6HWv8ysYufar0Rzp72UINM3rQjKLxObI8RSm+x5cOn0oihk5s3cMuS5AuwrewnClbXUb
 aGP9yv0XE/L/r8PMRAkkecuzA7srorKmmFHMGbtfqaJjTOAYIFCyHrDaCFszikHp2K+71I
 qy+/1rDxKZSA+gpyDrtJUsPLtjjmn2jAIGq9HSsKgWm1vW5lHeJPk/u9KvI2RWKJUho1sc
 GB0OIeZwOQlxfy/axfB5HT79IKiYX7L6uFN6m7Y9kkK6amHTigD39AH0DH3vAQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:21 +0000
Subject: [PATCH i-g-t v4 19/46] lib/unigraf: Initial Unigraf support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-19-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8561;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=JQa/ugQb31QVcGLLgMGJ36D54s8Xu0cfm3srdi4Hx3k=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesPU13h9NgrkslvCv/VzElxG/FvqRjZx5QrO
 qKHRL0rDmaJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrDwAKCRAgrS7GWxAs
 4owaD/9QSCLQkqdQmHrmPx+IDX0RqMSCPYWV1YC5cB9Ro/GypCKIScmOE/52s1n8gzR82gRfWCU
 IMXolOme5sI/CnVKsLr2Kut1JlmgQwpfLGt9tIDiNwOdUGLSWkuQt2SgnmMNNIz2UE+mAA5nSYi
 tKLCQW4CEJ/yUTMtEweri3Qk1NoF/Xn2RcT0h1pUJnPnHqDfcWh8jD2aIvqtpOuAexvx3T9gpD6
 Ojo0H8/FRktwHksMTslOzgd/K/7W9nYC2yoTMR9CoIMKSGS8KttcCsjVqD0tRWO/z+fUPGrpzko
 QUd9XeIlOiOTeQTbvBNyhFXBOPOolCvOnKXa7EwqQnJT5394Yu2Xmb+pc24OaObdnH2bngT/oLW
 EzIISXr0WhzgyEEHWB8mwnZl+7MDh5Ey9Bu6nCOqG09x+rL8I5NEl3fyo/mY28LZDd12iOhQIVl
 dobIuCgDqjXFS7xeGQHVMstgqFDh0FZ7k0BsFyqv2jCv7xGt1PjPWOUVomfZsfehz0s0637O+T+
 s7/7L8x/Du53VWcQGjXoLvrG8UrVm9wV2WtbBbCxjqzWt2l9u8cGXuqZqV1cEt+9GPjskIfIkbq
 Dl/ZBLnjpgk06Uzrf5p5Ee2NCjaGzDl0fvIGvYhHtq45PG3tN3BwvylV5eETsGD2ldq9IRbBF8K
 wcyB9KYR9cXHBcQ==
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
 lib/unigraf/TSI.h     |   8 ----
 lib/unigraf/unigraf.c | 109 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h |  51 +++++++++++++++++++++++
 meson.build           |  14 +++++++
 5 files changed, 184 insertions(+), 8 deletions(-)

diff --git a/lib/meson.build b/lib/meson.build
index 707ce6ff9ce2..fd98e280637c 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -146,6 +146,13 @@ lib_deps = [
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
@@ -215,6 +222,9 @@ endif
 if chamelium.found()
 	lib_deps += chamelium
 	lib_sources += [ 'igt_chamelium.c', 'igt_chamelium_stream.c' ]
+endif
+
+if chamelium.found() or libtsi.found()
 	lib_sources += 'monitor_edids/monitor_edids_helper.c'
 endif
 
diff --git a/lib/unigraf/TSI.h b/lib/unigraf/TSI.h
index 62daaab6300e..669748c91aac 100644
--- a/lib/unigraf/TSI.h
+++ b/lib/unigraf/TSI.h
@@ -210,14 +210,6 @@ TSI_RESULT TSIX_DEV_GetDeviceRoleCount(TSI_HANDLE Device);
 TSI_RESULT TSIX_DEV_GetDeviceRoleName(TSI_HANDLE Device, int RoleIndex,
 				      char *RoleNameString, unsigned int RoleStringMaxLength);
 
-/**
- * TSIX_VIN_GetInputCount() - Get the number of video inputs available on a device
- * @Device: Device handle to query
- *
- * Returns: >=0 in case of success, the number of video inputs available on the device
- */
-TSI_RESULT TSIX_VIN_GetInputCount(TSI_HANDLE Device);
-
 /**
  * TSIX_VIN_GetInputName() - Get the name of a specific video input on a device
  * @Device: Device handle to query
diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
new file mode 100644
index 000000000000..55c3c445fa5e
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
+#define unigraf_debug(fmt, ...)	igt_debug("TSI:%p: " fmt, unigraf_device, ##__VA_ARGS__)
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
+void unigraf_require_device(int drm_fd)
+{
+	igt_require(unigraf_open_device(drm_fd));
+}
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
new file mode 100644
index 000000000000..a93bd464bac3
--- /dev/null
+++ b/lib/unigraf/unigraf.h
@@ -0,0 +1,51 @@
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
+/**
+ * unigraf_open_device() - Search and open a device.
+ * @drm_fd: File descriptor of the currently used drm device
+ *
+ * Returns: true if a device was found and initialized, otherwise false.
+ *
+ * This function searches for a compatible device and opens it.
+ */
+bool unigraf_open_device(int drm_fd);
+
+/**
+ * unigraf_require_device() - Search and open a device.
+ * @drm_fd: File descriptor of the currently used drm device
+ *
+ * This is a shorthand to reduce test boilerplate when a unigraf device must be present.
+ */
+void unigraf_require_device(int drm_fd);
+
+#endif // UNIGRAF_H
diff --git a/meson.build b/meson.build
index bfcffbb9a3cd..c411f4cf8248 100644
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
2.51.0

