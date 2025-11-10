Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F83CD1297
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:39:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92CC210E3BA;
	Mon, 10 Nov 2025 13:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="KbghTkK4";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1404210E3BB
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 03DC81A19AA;
 Mon, 10 Nov 2025 13:39:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C7756606F5;
 Mon, 10 Nov 2025 13:39:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DC1A71037190D; Mon, 10 Nov 2025 14:39:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762781989; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=dV3eSMUSrs1k4clF/Jn0PGrFBlr1Fn22UlyfnKg4TNY=;
 b=KbghTkK4w2w4zAuA/QQ8PnSHjA0flLqEHO+fG/lDM/epR4gCltIAuvhbgdW8Wp5HuBWbg6
 vBtbVQKIEUONT3FJ1O3wkj2XtKEFbVl6yCCxckWzE72L78qodZdHtEXAbX9rKQy6sSH4bp
 VGSjc6+GjqlPgx8U3SLZuFOG0vzZH+ORBEvOq/n0g4BAZNAoOSfq4yKCE7P0DvX+lvSLYx
 b7NjaD7yh4jsYBaGVIW6KFNyVaGS75zDWNcg5Bs9qizNB/wtu54gfjEUZMCxhI7ZZSb6s8
 7nniEw/4oel9qHfMjOHhIjHjoHYz2MCy+QBZg3ZLsXrIyJGW7ZadwQL7g7jvfw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:20 +0000
Subject: [PATCH i-g-t v4 18/46] lib/unigraf: Add TSI.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-18-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10088;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=2+1UwACYGTwbFUGuvxrdRMZgLk0G8CKzwp4JFNtN43Y=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesPn+qsHW/W99X9vqTd0PxDteR7vN111//6w
 nh7DdadRLuJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrDwAKCRAgrS7GWxAs
 4tpUD/9LKtLM5TtqhBxDXVvo817muNc/NJXRbvUaQrkjBnLhDRi/jRGoLFQuwG/f0xqk45ME3Vl
 ZvPAmu1pSPMKA0HbH6ZO/5CbyTbmKhkxE6faUS/V6br7erqKsuw8uI2zREkkXXgjnv2aIhiBPxn
 fPVUpx7ZxIWOF8JYusbGaQyHbb4rQi3bWGfg8Cmt/0Q1qXACUaH5bhT/1Dlfk6F/DWwj0q5z6Jv
 fbsY+GaFQklAzAt7V7NNVta1fPGiecbzRS6HYp28zaf/ak1i8LD5noBoYMArEU2IXkBOxKJw2e9
 eoj3ieBNPmouxbnxAUzCDKz9giXHpaQp6TRwrZlF7aF0E+ct+uagVAwp8FDhfVrMzY1z8zYrgya
 2K7jBJNa6DbQBpI8T1CxOy1GzpgysoaVLSYfxMa1l3SYeKJSat/zi3WLrCnUh6I/QxJuyY6U9Na
 6Bm54pFAmUkpjTUkVKD5TS15H+QKuwgePPsrvPhVWb1cALOZXBs/W/z9Zns+x9sFTeBimDNoHfr
 Y+U15KdFzN5l8s1WjRMzsZs8gnAgjoz5qYJW04bGU6J0GE8i7uQH01gQBO3C8Ap4fUv4z+IEyp1
 3KAoqlFTeRsb0rRKb/92wrRQonYBNsvS+2/dp2CrqRx485sTjRTkCERR7yguF2IV63htvTn9nsf
 ZEYa/2v3hxOrs2g==
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

Unigraf does not provide header for the libTSI.so file, only dynamic
library loading helpers for windows.

In order to link against this library and use unigraf devices, add the
function declaration used in the dynamic library loading wrappers.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/TSI.h | 234 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 234 insertions(+)

diff --git a/lib/unigraf/TSI.h b/lib/unigraf/TSI.h
new file mode 100644
index 000000000000..62daaab6300e
--- /dev/null
+++ b/lib/unigraf/TSI.h
@@ -0,0 +1,234 @@
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
+/**
+ * TSIX_TS_GetConfigItem() - Read a configuration item from the UCD device
+ * @Device: Device handle to read config from. Can be NULL for certain configuration items.
+ * @ConfigItemID: Identifier of the requested configuration item.
+ * @ConfigItemData: Pointer to store the read value.
+ * @ItemMaxSize: Size of the allocated memory for @ConfigItemData.
+ *
+ * Returns: The size of the raw data. If the return value is larger than ItemMaxSize, no data
+ *          is copied to ConfigItemData.
+ * Note:
+ * - Some configurations require specific size and alignment for the allocated buffer. Refer to
+ *   the specific item configuration documentation for details.
+ * - Data may still be written to @ConfigItemData even if the return value is larger than
+ *   @ItemMaxSize, potentially causing buffer overflow.
+ */
+TSI_RESULT TSIX_TS_GetConfigItem(TSI_HANDLE Device, TSI_CONFIG_ID ConfigItemID,
+				 void *ConfigItemData,
+				 unsigned int ItemMaxSize);
+
+/**
+ * TSIX_DEV_RescanDevices() - Refresh the internal list of devices for libTSI
+ * @SearchOptions: Options to filter the list of devices (e.g.,
+ *                 TSI_SEARCHOPTIONS_SHOW_DEVICES_IN_USE to include
+ *                 devices already in use).
+ * @RequiredCaps: Filter to list only devices with specific capabilities.
+ * @UnallowedCaps: Filter to list only devices without specific capabilities.
+ *
+ * Returns: >=0 in case of success.
+ *
+ * This function should be called every time you need to update the list of connected devices,
+ * and it must be called at least once before calling TSI_DEV_GetDeviceCount.
+ */
+TSI_RESULT TSIX_DEV_RescanDevices(TSI_SEARCH_OPTIONS SearchOptions,
+				  TSI_DEVICE_CAPS RequiredCaps,
+				  TSI_DEVICE_CAPS UnallowedCaps);
+/**
+ * TSIX_DEV_GetDeviceCount() - Get the count of scanned devices
+ * Returns: the number of devices that the previous call to TSIX_DEV_RescanDevices() detected
+ *
+ * Must be called after a TSIX_DEV_RescanDevices.
+ */
+TSI_RESULT TSIX_DEV_GetDeviceCount(void);
+
+/**
+ * TSIX_DEV_OpenDevice() - Open a device from the scanned list
+ * @DeviceID: index in the TSI_DEV_RescanDevices list
+ * @Result: Pointer to store the error code returned while opening the device
+ * Returns: if the device is found, an opaque pointer that can be used for other
+ * API calls. If some error occurred during the detection, the status code is
+ * written in the pointer @Result.
+ */
+TSI_HANDLE TSIX_DEV_OpenDevice(TSI_DEVICE_ID DeviceID, TSI_RESULT *Result);
+
+/**
+ * TSIX_DEV_CloseDevice() - Close the device handle when finished
+ * @Device: Device handle to close
+ * Returns: >=0 in case of success
+ */
+TSI_RESULT TSIX_DEV_CloseDevice(TSI_HANDLE Device);
+
+/**
+ * TSIX_VIN_Disable() - Disable video input on the specified device
+ * @Device: Device handle to disable video input on
+ * Returns: >=0 in case of success
+ */
+TSI_RESULT TSIX_VIN_Disable(TSI_HANDLE Device);
+
+/**
+ * TSIX_VIN_Select() - Select a specific video input on the specified device
+ * @Device: Device handle on which to select the input
+ * @InputID: Identifier of the input to select
+ * Returns: >=0 in case of success
+ */
+TSI_RESULT TSIX_VIN_Select(TSI_HANDLE Device, TSI_INPUT_ID InputID);
+
+/**
+ * TSIX_DEV_SelectRole() - Select a specific role for the specified device
+ * @Device: Device handle on which to assign the role
+ * @RoleIndex: Index of the role to assign
+ * Returns: >=0 in case of success
+ */
+TSI_RESULT TSIX_DEV_SelectRole(TSI_HANDLE Device, int RoleIndex);
+
+/**
+ * TSIX_TS_SetConfigItem() - Set a configuration item on the specified device
+ * @Device: Device handle to set the configuration on
+ * @ConfigItemID: Identifier of the configuration item to set
+ * @ItemData: Pointer to the data to set
+ * @ItemSize: Size of the data to set
+ * Returns: >=0 in case of success
+ */
+TSI_RESULT TSIX_TS_SetConfigItem(TSI_HANDLE Device, TSI_CONFIG_ID ConfigItemID,
+				 const void *ItemData, unsigned int ItemSize);
+
+/**
+ * TSIX_VIN_Enable() - Enable video input on the specified device
+ * @Device: Device handle to enable video input on
+ * @Flags: Flags to specify the options for enabling the video input
+ * Returns: >=0 in case of success
+ */
+TSI_RESULT TSIX_VIN_Enable(TSI_HANDLE Device, TSI_FLAGS Flags);
+
+/**
+ * TSIX_VIN_GetInputCount() - Get the number of video inputs available on a device
+ * @Device: Device handle to query
+ *
+ * Returns: >=0 in case of success, the number of video inputs available on the device
+ */
+TSI_RESULT TSIX_VIN_GetInputCount(TSI_HANDLE Device);
+
+/**
+ * TSIX_DEV_GetDeviceName() - Get the name of a device from the scanned list
+ * @DeviceID: Index in the TSI_DEV_RescanDevices list
+ * @DevNameString: Pointer to store the device name
+ * @NameStringMaxLength: Size of the allocated memory for @DevNameString
+ *
+ * Returns: >=0 in case of success, the length of the device name string
+ * Note: If the return value is larger than NameStringMaxLength, the string may be truncated
+ */
+TSI_RESULT TSIX_DEV_GetDeviceName(TSI_DEVICE_ID DeviceID, char *DevNameString,
+				  unsigned int NameStringMaxLength);
+
+/**
+ * TSIX_DEV_GetDeviceRoleCount() - Get the number of roles available for a device
+ * @Device: Device handle to query
+ *
+ * Returns: >=0 in case of success, the number of roles available for the device
+ */
+TSI_RESULT TSIX_DEV_GetDeviceRoleCount(TSI_HANDLE Device);
+
+/**
+ * TSIX_DEV_GetDeviceRoleName() - Get the name of a specific role for a device
+ * @Device: Device handle to query
+ * @RoleIndex: Index of the role to get the name for
+ * @RoleNameString: Pointer to store the role name
+ * @RoleStringMaxLength: Size of the allocated memory for @RoleNameString
+ *
+ * Returns: >=0 in case of success, the length of the role name string
+ * Note: If the return value is larger than RoleStringMaxLength, the string may be truncated
+ */
+TSI_RESULT TSIX_DEV_GetDeviceRoleName(TSI_HANDLE Device, int RoleIndex,
+				      char *RoleNameString, unsigned int RoleStringMaxLength);
+
+/**
+ * TSIX_VIN_GetInputCount() - Get the number of video inputs available on a device
+ * @Device: Device handle to query
+ *
+ * Returns: >=0 in case of success, the number of video inputs available on the device
+ */
+TSI_RESULT TSIX_VIN_GetInputCount(TSI_HANDLE Device);
+
+/**
+ * TSIX_VIN_GetInputName() - Get the name of a specific video input on a device
+ * @Device: Device handle to query
+ * @InputID: Identifier of the input to get the name for
+ * @InputNameString: Pointer to store the input name
+ * @NameStringMaxLen: Size of the allocated memory for @InputNameString
+ *
+ * Returns: >=0 in case of success, the length of the input name string
+ * Note: If the return value is larger than NameStringMaxLen, the string may be truncated
+ */
+TSI_RESULT TSIX_VIN_GetInputName(TSI_HANDLE Device, TSI_INPUT_ID InputID,
+				 char *InputNameString, unsigned int NameStringMaxLen);
+
+#endif

-- 
2.51.0

