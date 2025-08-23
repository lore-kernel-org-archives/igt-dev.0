Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767DCCA0EEB
	for <igt-dev@archiver.kernel.org>; Sat, 23 Aug 2025 02:20:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29AA310E320;
	Sat, 23 Aug 2025 02:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="u8ox78KT";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04DCB10E30D
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:20:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id F1A284E40C0B
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:11:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CA570606A7;
 Sat, 23 Aug 2025 02:11:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 155351C22D406; 
 Sat, 23 Aug 2025 04:11:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1755915114; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=LSY0r9Y2LIk8fZHcKhU+K6u74k7Mrv9Up+nLqkRqk3A=;
 b=u8ox78KTGil0Q3koRBpiIgd2IpK6Vg1YZg9Ln5YHgmcwyOdN9/lZlthACHvNLKM816BDYD
 qO6d3XGHdmmyQEFxp47d2rKgU6u9N9ausKD41rBmzNK3WwdAMy7uHlqzviX1sV1ftJpmkp
 g1pyb0FEiPrGXMdNVFopParxbpt0j6TxzX+bH2BRuls0fdvEddtSaPeASudnMhtfGrfpn4
 vPYKaBqUmNRJm1v9DFbwv1fZjVSqlH+DTEemoj1jmRRLhxv71adxwT9vNLTEdp3AHOSaUf
 5REj+28/edBevhR7CaWrOn0+8XdQScu6jyTkEF1DcgbM3PkIYrs8DTB5hS7txQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 23 Aug 2025 04:11:32 +0200
Subject: [PATCH i-g-t v3 12/29] lib/unigraf: Initial Unigraf support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-unigraf-integration-v3-12-cdc36d5fab4c@bootlin.com>
References: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
In-Reply-To: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8857;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=y+SMbEQE2wwx2ShUH4+UrtY96+l5VpXv5Ut1EVfm3uM=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoqSNUKDgVEWqhB1cjmzCHET1MrXJGqObKsVQe9
 SXf9yXhFsOJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaKkjVAAKCRAgrS7GWxAs
 4os+EADXm00ywdsUr01rU/RBLG5NYamK4BWyuF/2vL6B4nmCIhzVJjZfuhC6Hk+hMsxtpv8e7kb
 aM7frajLDgwZdAQ+VR0S6CAriKzR4a3wNiHgC6WCI2J95FFcdmWnyGI0dqF383gaaqAS9RU9xFF
 CHV58Lx6iIE1NPgZrciMxAaJVp6N2H4X2ELtC3nTANgxk9l8iRjIP5iALPT2DcVZTl/VgaAO7NW
 4PVXVlTXyMmF5BE5mgtm6MuEVJuM/tiarvpppRHF6RC7WOurYJmReontfGT3iRj7jsA3FTZ44dQ
 qVeXpS4TzXh2FB5KBM4B6ffFbrpH772Zy7EzP1b2mCJu/lItUsn3ocrcNIbQziQVQNTcvoQ0Yz7
 zbF0wBghDMZLMeJtWYg6laG1BM0AH+qTmgmlJxcMob+OfHGugE9gteqjhDSXGGJL+TcVyw4xpiE
 jdBeIA5/zEYQ27NvAhrg2o3OHBVfgk0QBiGpyPaYb+zxcJPDyS6iB8jtZyQn6q+gKZkMuUC4Xlf
 e1mMNLQewfS3blSzRME3g4pXMa1Ye2EaHyn+Pr970P0cANFupVVAwRXlMyKnYOKxoAHgP+zyjXy
 HHZrbQGEyaw4WcUFvp/xybCgjSyuGoLeSnn8W7RT8ityGnzYrf+WxSsGtBfTetabB2kZEiox4N0
 5Wko9raglC4kWxw==
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
 lib/unigraf/unigraf.h |  50 +++++++++++++++++++++++
 meson.build           |  14 +++++++
 5 files changed, 183 insertions(+), 8 deletions(-)

diff --git a/lib/meson.build b/lib/meson.build
index f078dad4e5b17159849716f6698d6b4f1fd74475..f21e36ab5319bbdfb93533ee72e22d6b6e4197cb 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -143,6 +143,13 @@ lib_deps = [
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
@@ -212,6 +219,9 @@ endif
 if chamelium.found()
 	lib_deps += chamelium
 	lib_sources += [ 'igt_chamelium.c', 'igt_chamelium_stream.c' ]
+endif
+
+if chamelium.found() or libtsi.found()
 	lib_sources += 'monitor_edids/monitor_edids_helper.c'
 endif
 
diff --git a/lib/unigraf/TSI.h b/lib/unigraf/TSI.h
index 62daaab6300e3ad0057217af869749cd9dc287ee..669748c91aace505921e53ac872d453acb6ff7c3 100644
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
index 0000000000000000000000000000000000000000..55c3c445fa5efae9559c10f4f56052442027346f
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
index 0000000000000000000000000000000000000000..8cdbf00201b2a0467ec15259cf4bc0a2d8f9b61e
--- /dev/null
+++ b/lib/unigraf/unigraf.h
@@ -0,0 +1,50 @@
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
index aeed3b1d2240c4f224933600a531482791e612d1..f6d60243658148ead523bd0ad5c52d3ae997bdbc 100644
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
@@ -357,6 +364,12 @@ if get_option('use_rpath')
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
@@ -366,6 +379,7 @@ else
 	v3d_rpathdir = ''
 	vc4_rpathdir = ''
 	vmwgfx_rpathdir = ''
+	unigraf_rpathdir = ''
 endif
 
 build_testplan = get_option('testplan')

-- 
2.50.1

