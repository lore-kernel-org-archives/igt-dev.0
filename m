Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC4AC2D0CD
	for <igt-dev@archiver.kernel.org>; Sat, 17 May 2025 12:16:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 294A110E16B;
	Sat, 17 May 2025 12:16:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="J7xRvlL6";
	dkim-atps=neutral
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4421310E16B
 for <igt-dev@lists.freedesktop.org>; Sat, 17 May 2025 12:16:36 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id E43755802C3
 for <igt-dev@lists.freedesktop.org>; Sat, 17 May 2025 11:11:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E6F7643ACE;
 Sat, 17 May 2025 11:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1747480288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=F0gFumHhaXzkhrrhgH2JPEhb3mxjJEso4aG1xCIM5Ac=;
 b=J7xRvlL6jSIpi4bSUyUYrNlJzW3a/z375Eywlc64h1VbLW9DE9lvJ4fhXTx8FoRAPv5xzo
 24n4IKmWoXM2+Cs3BfUksftt/sam7OPMZCfmO6zNFZOOrgCEi2g89sZNt67DxQiCJGTpN0
 vUKWdYZ+Z88ewlKUWwCx9e320bXpAOlCGUGUV65BcgDaKtltsslcT3KifIGOgPem6zPbXm
 Zvi6ev0TC+gVKcBkkiPz6IEkkwjr2xz7nRy3wkrublRqQlyhOOAdRiruo8fGmSQT2fpH+K
 iwbOA3P1ToaO0wM7Trz7t2Ws6ThXXkrxxJMblOW6WX5jNlFEa9o7VXukPOLtUw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 17 May 2025 13:11:22 +0200
Subject: [PATCH i-g-t RFC] tests/unigraf/unigraf_connectivity: Add unigraf
 device support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-unigraf-integration-v1-1-044acd2133dd@bootlin.com>
X-B4-Tracking: v=1; b=H4sIANluKGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyNT3dK8zPSixDTdzLySVCCjBKhe19AwNcXY2MDc1DTFVAmos6AoNS2
 zAmxqtFKmbrpuiUKQm7NSbG0tAFOW0ZRwAAAA
X-Change-ID: 20250425-unigraf-integration-11ed330755d5
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=19584;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=BgZ4UMyfU2yBI3uqm8eAHOM+eKjPb57l5oYoaXd6QUc=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoKG7fdtRfO8mQ7LK0wFvTllgq2RJPI46QPgU41
 3ZtGwLGWWWJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaChu3wAKCRAgrS7GWxAs
 4vXHD/9TLNs3OGKn52RrDGQRTXJe6A3Mn53a1BypeaXG4Qr9/ijP5zI6ObFIcKN7u0aJmRGVNKd
 1DYKrLS6xIjSDQ2wTDDCagNfw8z64qcZYm+iD6zyqFLWSzL/XLu+aEuy4AKsP5LCxScH+oPosBk
 hp33dnuMr5V7HKI1z6ayBnA8Can0L2Y6fHe+w6Hw+q2Gem+vjtOFwOlSo78UtYq0IFCNsqczS5I
 12nfKvdjwD15Hic7j+hTRB7E/LZ3V72KRlGM+wYYTkEdnrBOYyFgmlAQNC7Mr9JpH3pl3Yb9SDN
 HK2Tx0mFTyvy0Ne4LImJAyRbZTj//HWcI+Z+SAg2QJgrVlhTV/bj7b0moRZhmsO5hAb6nDgjVjL
 oa5pzl7brgRJsmWgQBS8zCO/jYFbASFOD4abu0Q/D5DCkSrQBs5hvzSSL0l5kdVEjmItoIHLfbE
 MVdxv6744+Y5pX+TbHS9YcXR4NZ9FSbC/dfkCVFqHZTno0NojTTxo9zv1GY4O6tIldyn54v5eFU
 dwyUwbkcbj/FqQCs59YkBAc21Clyx4vPyP1bWKEEoyGEniuHDJiK0YJtFSnkOGLyMf4I3qZr7Lb
 0oQqSuyxv5EAucAyeUSmNLfpclhnF1KWgvWoDXkuk3VmOcOxl2zMtObyYqUGKsVqL/SFFOj4/5q
 dzJkXajG3Qj13aQ==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudehgeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepiedvveekffdvffefgeetledvueehffejjeevudelheeigfdvgfeujeekteehuedunecuffhomhgrihhnpehunhhighhrrghfrdhfihenucfkphepvddttddumeekiedumeegudegtdemtgekiedtmeehugeiudemieeffeelmeeiiegrieemvgdtjeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeegudegtdemtgekiedtmeehugeiudemieeffeelmeeiiegrieemvgdtjeehpdhhvghloheplgduledvrdduieekrddurddvjegnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepihhgthdquggvvheslhhishhtshdrfhhrvggvuggvs
 hhkthhophdrohhrgh
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

This commit introduces support for Unigraf devices, aiming to facilitate
the testing of various hardware features related to display connections.

Key feature that unigraf devices can test:
- Link training
- Signal integrity
- HDCP
- DSC
- usb-c electrical characteristics

This implementation utilizes the external libtsi library provided by
Unigraf, which must be downloaded separately to enable compilation.

DO NOT MERGE!

The file lib/unigraf/TSI_types.h currently contains hardcoded values that
should be replaced by the next unigraf release. The current unigraf SDK
release is not c-compatible, so I had to copy those values. The proper v1
will not contains hardcoded value and will use the correct TSI_types.h
file.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Hi everyone,

I am excited to share I currently have access to a Unigraf device,
which I believe could significantly enhance the capabilities within IGT.
This device has the potential to enable testing of low-level hardware
features that are currently not covered. Specifically, Unigraf devices can
assist in testing link training, signal integrity, HDCP, DSC, and more.

It's important to note that the Unigraf SDK is not open-source, and the
communication protocol with the device is proprietary. As a result, I have
utilized the libTSI.so library, which can be downloaded from [1]. In this
RFC, I have not used the official TSI_types.h header because it was
incompatible with C, so I hardcoded some necessary values. The next
iteration will use the official TSI_types.h (they plan to fix it for the
next release)

This RFC is intentionally concise to gather initial feedback from the
community regarding the integration of a proprietary device into the test
suite. I plan to expand on this work by adding more features and pushing
the developments upstream.

Looking forward to your thoughts and suggestions!

Thanks,
Louis Chauvet

[1]:https://www.unigraf.fi/downloads/
---
 lib/meson.build                      |   9 ++-
 lib/unigraf/TSI.h                    |  91 ++++++++++++++++++++++
 lib/unigraf/TSI_types.h              |  18 +++++
 lib/unigraf/unigraf.c                | 143 +++++++++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h                |  84 ++++++++++++++++++++
 meson.build                          |  14 ++++
 tests/meson.build                    |   4 +
 tests/unigraf/meson.build            |  12 +++
 tests/unigraf/unigraf_connectivity.c |  79 +++++++++++++++++++
 9 files changed, 453 insertions(+), 1 deletion(-)

diff --git a/lib/meson.build b/lib/meson.build
index 8517cd540437..c1a1c8aa1b24 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -138,6 +138,13 @@ lib_deps = [
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
@@ -177,7 +184,7 @@ if libdrm_amdgpu.found()
 	if cc.has_function('amdgpu_create_userqueue', dependencies: libdrm_amdgpu)
 		add_project_arguments('-DAMDGPU_USERQ_ENABLED=1', language: 'c')
 		#conf.set('AMDGPU_USERQ_ENABLED', 1)
-	endif	
+	endif
 endif
 
 if libunwind.found()
diff --git a/lib/unigraf/TSI.h b/lib/unigraf/TSI.h
new file mode 100644
index 000000000000..e057823c3df0
--- /dev/null
+++ b/lib/unigraf/TSI.h
@@ -0,0 +1,91 @@
+/* SPDX-License-Identifier: MIT */
+
+/*
+ * tsi.h - Header for libTSI.so
+ * Documentation here is taken from official documentation and developer observation.
+ */
+
+#ifndef TSI_H
+#define TSI_H
+
+#define TSI_CURRENT_VERSION	12
+#define MAX_EDID_SIZE		4096
+
+#define TSI_SUCCESS		0
+
+typedef unsigned int		TSI_VERSION_ID;
+typedef unsigned int		TSI_SEARCH_OPTIONS;
+typedef unsigned int		TSI_DEVICE_CAPS;
+typedef unsigned int		TSI_CONFIG_ID;
+typedef unsigned int		TSI_DEVICE_ID;
+typedef unsigned int		TSI_INPUT_ID;
+typedef int			TSI_RESULT;
+typedef void			*TSI_HANDLE;
+typedef int			TSI_FLAGS;
+
+/**
+ * TSI_Init() - Initialize the TSI library
+ * @ClientVersion: Indicates the version used to call the libTSI.so functions.
+ *
+ * Initialize libTSI for use and sets up internal state. It can be called
+ * multiple times, but TSI_Clean must be called the exact same number of time.
+ *
+ * Returns:
+ * - In case of success: Reference count to the API (number of times to call TSI_Clean)
+ * - TSI_ERROR_NOT_COMPATIBLE if the requested client version is not supported
+ *   by the library
+ * - TSI_ERROR_COMPATIBILITY_MISMATCH if TSI_Init is called twice with
+ *   different client version
+ */
+TSI_RESULT TSI_Init(TSI_VERSION_ID ClientVersion);
+
+/**
+ * TSI_Clean() - Cleans and closes the TSI library
+ *
+ * When TSI_Clean is called for the last time, cleanup the internal state. It
+ * should be called exactly the same number of time as TSI_Init
+ */
+TSI_RESULT TSI_Clean(void);
+
+/**
+ * TSI_MISC_GetErrorDescription() - Get a human readable error message
+ * @ErrorCode: Error code for which you want the message
+ * @ErrorString: Pointer where to copy the message
+ * @StringMaxLen: Size of the allocated string @ErrorString
+ *
+ * The official documentation states: If the function succeeds, the
+ * return value is the number of characters required for the complete
+ * error description string.
+ * In reality, this function always returns 0 or error, so there is no way to
+ * tell if the allocated memory was big enough
+ *
+ * Returns:
+ * - >= 0 on success, theorically the required string len to store the message
+ * - < 0 on failure
+ */
+TSI_RESULT TSI_MISC_GetErrorDescription(TSI_RESULT ErrorCode,
+					char *ErrorString,
+					unsigned int StringMaxLen);
+
+TSI_RESULT TSIX_TS_GetConfigItem(TSI_HANDLE Device, TSI_CONFIG_ID ConfigItemID,
+				 void *ConfigItemData,
+				 unsigned int ItemMaxSize);
+
+TSI_RESULT TSIX_DEV_RescanDevices(TSI_SEARCH_OPTIONS SearchOptions,
+				  TSI_DEVICE_CAPS RequiredCaps,
+				  TSI_DEVICE_CAPS UnallowedCaps);
+TSI_RESULT TSIX_DEV_GetDeviceCount(void);
+
+TSI_HANDLE TSIX_DEV_OpenDevice(TSI_DEVICE_ID DeviceID, TSI_RESULT *Result);
+
+TSI_RESULT TSIX_DEV_CloseDevice(TSI_HANDLE Device);
+
+TSI_RESULT TSIX_VIN_Disable(TSI_HANDLE Device);
+
+TSI_RESULT TSIX_VIN_Select(TSI_HANDLE Device, TSI_INPUT_ID InputID);
+TSI_RESULT TSIX_DEV_SelectRole(TSI_HANDLE Device, int RoleIndex);
+TSI_RESULT TSIX_TS_SetConfigItem(TSI_HANDLE Device, TSI_CONFIG_ID ConfigItemID,
+				 const void *ItemData, unsigned int ItemSize);
+TSI_RESULT TSIX_VIN_Enable(TSI_HANDLE Device, TSI_FLAGS Flags);
+
+#endif
diff --git a/lib/unigraf/TSI_types.h b/lib/unigraf/TSI_types.h
new file mode 100644
index 000000000000..a3bd20f53066
--- /dev/null
+++ b/lib/unigraf/TSI_types.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: MIT */
+
+// DO NOT MERGE THIS FILE
+//
+// Current unigraf public release are not c-compatible, this file hardcode some values
+// The next release of libTSI should include a c-compatible TSI_types.h file, that will
+// be directly used in place of this file
+
+#ifndef TSI_REG_H
+
+#define TSI_VERSION_TEXT			0x80000001
+#define TSI_DEVCAP_VIDEO_CAPTURE		0x00000001
+#define TSI_SEARCHOPTIONS_SHOW_DEVICES_IN_USE	0x00000001
+
+#define TSI_EDID_TE_INPUT			0x1100
+#define TSI_EDID_SELECT_STREAM			0x1102
+
+#endif
diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
new file mode 100644
index 000000000000..3200cb881f91
--- /dev/null
+++ b/lib/unigraf/unigraf.c
@@ -0,0 +1,143 @@
+// SPDX-License-Identifier: MIT
+
+#include "igt_core.h"
+#include "igt_edid.h"
+#include <stdint.h>
+#include <stdio.h>
+
+#include "unigraf.h"
+#include "TSI.h"
+#include "TSI_types.h"
+
+static int unigraf_open_count;
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
+	while (unigraf_open_count)
+		unigraf_deinit();
+}
+
+void unigraf_init(void)
+{
+	int ret;
+
+	igt_debug("TSI: Initialize unigraf...\n");
+
+	__sync_fetch_and_add(&unigraf_open_count, 1);
+	ret = TSI_Init(TSI_CURRENT_VERSION);
+	if (ret < TSI_SUCCESS)
+		__sync_fetch_and_sub(&unigraf_open_count, 1);
+	else
+		igt_install_exit_handler(unigraf_exit_handler);
+	unigraf_assert(ret);
+}
+
+void unigraf_deinit(void)
+{
+	igt_debug("TSI: Uninitialize unigraf...\n");
+
+	if (unigraf_open_count >= 1) {
+		TSI_Clean();
+		__sync_fetch_and_sub(&unigraf_open_count, 1);
+	}
+}
+
+/**
+ * unigraf_write() - Helper to write a value to unigraf
+ * @dev: device handle, can be null for some config id
+ * @config: config id to write
+ * @data: data to write
+ * @data_len: length of the data
+ * Returns
+ */
+static void unigraf_write(TSI_HANDLE dev, TSI_CONFIG_ID config, const void *data, size_t data_len)
+{
+	igt_debug("TSI: Writing %zu bytes to %d\n", data_len, config);
+
+	unigraf_assert(TSIX_TS_SetConfigItem(dev, config, data, data_len));
+}
+
+/**
+ * unigraf_rescan_device() - Force the scan of all connected device
+ */
+static void unigraf_rescan_devices(void)
+{
+	unigraf_assert(TSIX_DEV_RescanDevices(0, TSI_DEVCAP_VIDEO_CAPTURE, 0));
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
+char *unigraf_get_version(TSI_HANDLE dev)
+{
+	int ret;
+	void *data;
+
+	igt_debug("TSI: Fetching version for device %p\n", dev);
+
+	ret = unigraf_assert(TSIX_TS_GetConfigItem(dev, TSI_VERSION_TEXT, NULL, 0));
+
+	data = malloc(ret);
+	memset(data, 0, ret);
+	ret = unigraf_assert(TSIX_TS_GetConfigItem(dev, TSI_VERSION_TEXT, data, ret));
+
+	return data;
+}
+
+void unigraf_close_device(TSI_HANDLE dev)
+{
+	igt_debug("TSI: Closing device %p\n", dev);
+	unigraf_assert(TSIX_DEV_CloseDevice(dev));
+}
+
+TSI_HANDLE unigraf_require_device(void)
+{
+	TSI_RESULT r;
+	TSI_HANDLE handle;
+
+	unigraf_rescan_devices();
+
+	igt_require(unigraf_device_count() >= 1);
+	handle = TSIX_DEV_OpenDevice(0, &r);
+	unigraf_assert(r);
+	igt_assert(handle);
+
+	igt_debug("TSI: Opened device %p. Selecting role and input...\n", handle);
+
+	// By default, enable the first role and input
+	unigraf_assert(TSIX_DEV_SelectRole(handle, 0));
+	unigraf_assert(TSIX_VIN_Select(handle, 0));
+	unigraf_assert(TSIX_VIN_Enable(handle, 0));
+
+	return handle;
+}
+
+struct edid *unigraf_read_edid(TSI_HANDLE dev, uint32_t stream, uint32_t *edid_size)
+{
+	void *edid;
+
+	igt_debug("TSI:%p: Read EDID for stream %d...\n", dev, stream);
+
+	edid = malloc(2048);
+	memset(edid, 0, 2048);
+
+	unigraf_write(dev, TSI_EDID_SELECT_STREAM, &stream, sizeof(stream));
+	*edid_size = unigraf_assert(TSIX_TS_GetConfigItem(dev, TSI_EDID_TE_INPUT, edid, 2048));
+
+	return edid;
+}
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
new file mode 100644
index 000000000000..57f2597d182d
--- /dev/null
+++ b/lib/unigraf/unigraf.h
@@ -0,0 +1,84 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef UNIGRAF_H
+#define UNIGRAF_H
+
+#include <stdint.h>
+
+typedef void *TSI_HANDLE;
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
+ * unigraf_init() - Initialize the unigraf library
+ *
+ * This function initializes the unigraf library and install an exit
+ * handler to ensure proper cleanup on program termination.
+ */
+void unigraf_init(void);
+
+/**
+ * unigraf_deinit() - Uninitialize the unigraf library
+ */
+void unigraf_deinit(void);
+
+/**
+ * unigraf_get_version() - Retrieve the version information of the libTSI library and the device.
+ * @dev: The device handle. If set, the function will also retrieve information from the device.
+
+ * Returns: A null-terminated string containing the version information. The caller
+ * is responsible to free this string.
+ */
+char *unigraf_get_version(TSI_HANDLE dev);
+
+/**
+ * unigraf_require_device() - Search and open a device.
+ *
+ * Returns: A non-null opaque pointer to the device handle if successful, otherwise NULL.
+ *
+ * This function searches for a compatible device and opens it. If a device is found and
+ * successfully opened, it returns a non-null opaque pointer to the device handle. If no device
+ * is found or an error occurs during the opening process, the function will handle the error
+ * appropriately and return a null pointer.
+ */
+TSI_HANDLE unigraf_require_device(void);
+
+/**
+ * unigraf_close_device() - Close the device.
+ * @dev: The device handle to close.
+ */
+void unigraf_close_device(TSI_HANDLE dev);
+
+/**
+ * unigraf_read_edid() - Read the EDID from the specified input
+ * @dev: The device handle
+ * @stream: The stream ID to read the EDID from
+ * @edid_size: Pointer to an integer where the size of the EDID will be stored
+ *
+ * Returns: A pointer to the EDID structure, or NULL if the operation failed. The caller
+ * is responsible to free this pointer.
+ */
+struct edid *unigraf_read_edid(TSI_HANDLE dev, uint32_t stream, uint32_t *edid_size);
+
+#endif // UNIGRAF_H
diff --git a/meson.build b/meson.build
index 6a580bd7e3a3..d143e3835475 100644
--- a/meson.build
+++ b/meson.build
@@ -162,6 +162,12 @@ cairo = dependency('cairo', version : '>1.12.0', required : true)
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
@@ -285,6 +291,7 @@ libexecdir = join_paths(get_option('libexecdir'), 'igt-gpu-tools')
 amdgpudir = join_paths(libexecdir, 'amdgpu')
 msmdir = join_paths(libexecdir, 'msm')
 panfrostdir = join_paths(libexecdir, 'panfrost')
+unigrafdir = join_paths(libexecdir, 'unigraf')
 v3ddir = join_paths(libexecdir, 'v3d')
 vc4dir = join_paths(libexecdir, 'vc4')
 vmwgfxdir = join_paths(libexecdir, 'vmwgfx')
@@ -353,6 +360,12 @@ if get_option('use_rpath')
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
@@ -362,6 +375,7 @@ else
 	v3d_rpathdir = ''
 	vc4_rpathdir = ''
 	vmwgfx_rpathdir = ''
+	unigraf_rpathdir = ''
 endif
 
 build_testplan = get_option('testplan')
diff --git a/tests/meson.build b/tests/meson.build
index 6328792e3a4d..14798547603f 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -452,6 +452,10 @@ foreach prog : intel_progs
 	endif
 endforeach
 
+if libtsi.found()
+	subdir('unigraf')
+endif
+
 if chamelium.found()
 	foreach prog : chamelium_progs
 		testexe = executable(prog,
diff --git a/tests/unigraf/meson.build b/tests/unigraf/meson.build
new file mode 100644
index 000000000000..4ef8c32151e4
--- /dev/null
+++ b/tests/unigraf/meson.build
@@ -0,0 +1,12 @@
+unigraf_progs = [
+	'unigraf_connectivity',
+]
+
+foreach prog : unigraf_progs
+	test_executables += executable(prog, prog + '.c',
+				       dependencies : test_deps,
+				       install_dir : unigrafdir,
+				       install_rpath : unigraf_rpathdir,
+				       install : true)
+	test_list += join_paths('unigraf', prog)
+endforeach
diff --git a/tests/unigraf/unigraf_connectivity.c b/tests/unigraf/unigraf_connectivity.c
new file mode 100644
index 000000000000..01266e84db76
--- /dev/null
+++ b/tests/unigraf/unigraf_connectivity.c
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: MIT
+
+#include <cstdint>
+#include <xf86drmMode.h>
+
+#include "drmtest.h"
+#include "igt_aux.h"
+#include "igt_core.h"
+#include "igt_kms.h"
+#include "unigraf/unigraf.h"
+
+/**
+ * TEST: unigraf connectivity
+ * Category: Core
+ * Description: Testing connectivity with a unigraf device
+ *
+ * SUBTEST: unigraf-open
+ * Description: Make sure that a unigraf device can be accessed
+ *
+ * SUBTEST: unigraf-connected
+ * Description: Make sure that the unigraf device is connected to the DUT
+ */
+
+IGT_TEST_DESCRIPTION("Test basic unigraf connectivity");
+igt_main
+{
+	TSI_HANDLE unigraf_dev;
+
+	igt_fixture {
+		unigraf_init();
+	}
+
+	igt_describe("Testing connectivity with a unigraf device");
+	igt_subtest("unigraf-open") {
+		unigraf_dev = unigraf_require_device();
+		unigraf_close_device(unigraf_dev);
+	}
+
+	igt_describe("Make sure that the unigraf device is connected to the DUT");
+	igt_subtest("unigraf-connected") {
+		drmModePropertyBlobPtr edid_blob = NULL;
+		struct igt_display display;
+		uint64_t edid_blob_id;
+		igt_output_t *output;
+		uint32_t unigraf_edid_len;
+		void *unigraf_edid;
+		int drm_fd;
+		bool found;
+
+		unigraf_dev = unigraf_require_device();
+
+		drm_fd = drm_open_driver_master(DRIVER_ANY);
+		igt_display_require(&display, drm_fd);
+
+		unigraf_edid = unigraf_read_edid(unigraf_dev, 0, &unigraf_edid_len);
+
+		for_each_connected_output(&display, output) {
+			if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) {
+				igt_assert(kmstest_get_property(drm_fd, output->config.connector->connector_id,
+								DRM_MODE_OBJECT_CONNECTOR, "EDID", NULL,
+								&edid_blob_id, NULL));
+				edid_blob = drmModeGetPropertyBlob(drm_fd, edid_blob_id);
+				igt_assert(edid_blob);
+
+				found |= memcmp(unigraf_edid, edid_blob->data, min(edid_blob->length, unigraf_edid_len)) == 0;
+
+				drmModeFreePropertyBlob(edid_blob);
+			}
+		}
+		igt_assert_f(found, "No output with the correct EDID was found\n");
+
+		free(unigraf_edid);
+		unigraf_close_device(unigraf_dev);
+	}
+
+	igt_fixture {
+		unigraf_deinit();
+	}
+}

---
base-commit: a5f980e11a5540c1c079cc6fceb2b2d889b5a460
change-id: 20250425-unigraf-integration-11ed330755d5

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

