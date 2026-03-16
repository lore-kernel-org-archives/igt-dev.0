Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC6DF53D6D
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:25:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6342210E292;
	Mon, 16 Mar 2026 16:25:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="WBvmIROi";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D3310E2B5
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 6C9BAC55044
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C696E5FC4A;
 Mon, 16 Mar 2026 16:23:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 97CC51037221A; Mon, 16 Mar 2026 17:23:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678206; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=GTLCLeq/1mTjZlagUuoSQriyqq8t6ycE+oWWMZyiKB0=;
 b=WBvmIROiKfm7TKjBT4Ujqc5Kp0riMsINZpykpWq3122PEgj+K97fvcuAwHeqNKjenNBDh7
 7noDbepJ14Vr8dtzmLT2i8VU5Mq8cKjlVQDOaKrYmM0AfxueHc2k0ra+i9dHeIhISRK4xQ
 SjmTWJBhGgsQkR0yrGig3vK5lxfNrSdqweJVLXWXl0J2C13JKmJOBWqjpxJdQ98W8WgovR
 iVTcaDkPCm68kGqELUF4IuiUxYFljfGzT+KNP7fXVW4zomtz/1DN+qbiauyA7KquIrlOwj
 hFseHomC0iJCPSeshBkUOsCzbXzs2UaZyuoGOHaskyEvWeYxJcE7kecwq2IWlQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:17:40 +0100
Subject: [PATCH i-g-t v9 19/49] lib/unigraf: Add TSI.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v9-19-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9972;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=bQrr2GOnzXTyaA4a67sXm3q3LjrMeJU5JhHH4SvIX1g=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6L9tRAh8/+iFNbfu59lPZd7cTAOXiiKallr
 7a5VIr4UnWJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabguixsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJIfg/+Ns8AvSfFTyB43fXVbiIqC/xf8fOrSWb
 Hl92ED2IfxdOeq+wZbjkkH+8M6n21ICOC9NnL9EqKha5qoxlVrMUH75Ts2HcgRDyd6FHL1JA2fw
 Re8m7eTtIqnNADX9QUmL9xdZ29aBZCFgNHf1nYwN1kIGhOUfijTC3TNOEKxl+FMGWhfJW1ZC9EN
 pdM+s71nCkTVRtKtz4AYQzA9sm69t75THKppx9ryfGXzSGtklccdsPAXemNxMb6Upo5FlR1y/qS
 hKimHPGcOzM56M8uC28ZkwvlB6cZF5MbRajTFORGVK5JNpt7/ycXlVir8TknZMcZGr2rL2qNFGe
 CBX5b6PTwC//8og2rlkjPuAo4929dum0gQDZ2P8OoOXHEbLC11fw4ye2/jPyCZtcSoppClDuWoR
 hA4gvS0JELWwwnIWucNtfmJFsJPQZPt4bNhDPkRohPDyiF06IAdEiLVx494wksAD0AZ9vTr7SHX
 0fybqvPZnQqY8tf1HMIbFGXrC/44JtbOzv5k0AZqY33UvgfKUoDe0GNsW1O2qumpBpb2v0dmrYB
 TLudFL7QmFQTSSESRATYnvqV41Pc7cnHqXTIz5ZnGQPi9Q2FmImBgOTogyfB46Fvj6zaMFPF7Kt
 ouafZTZ6Awq2QRNVmMPcZuKi8qNvWSAHlh/Uc8sJ2HSEqoC3cgSU=
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

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/TSI.h | 228 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 228 insertions(+)

diff --git a/lib/unigraf/TSI.h b/lib/unigraf/TSI.h
new file mode 100644
index 000000000000..ee822c19a055
--- /dev/null
+++ b/lib/unigraf/TSI.h
@@ -0,0 +1,228 @@
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
+ * TSI_MISC_GetErrorDescription() - Get a human readable error message
+ * @ErrorCode: Error code for which you want the message
+ * @ErrorString: Pointer where to copy the message
+ * @StringMaxLen: Size of the allocated string @ErrorString
+ *
+ * The official documentation states: If the function succeeds, the
+ * return value is the number of characters required for the complete
+ * error description string.
+ * In reality, this function always returns 0 or < 0 (error), so there is no way to
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
+ * should be called exactly the same number of times as TSI_Init
+ */
+TSI_RESULT TSI_Clean(void);
+
+/**
+ * TSIX_DEV_RescanDevices() - Refresh the internal list of devices for libTSI
+ * @SearchOptions: Options to filter the list of devices (e.g.,
+ *                 TSI_SEARCHOPTIONS_SHOW_DEVICES_IN_USE to include
+ *                 devices already in use).
+ * @RequiredCaps: Filter to list only devices with specific capabilities.
+ * @UnallowedCaps: Filter to list only devices without specific capabilities.
+ *
+ * Returns: >=0 in case of success, <0 on error. The value is not the number of devices,
+ *          you need to use TSIX_DEV_GetDeviceCount to get the discovered devices count.
+ *
+ * This function should be called every time you need to update the list of connected devices,
+ * and it must be called at least once before calling TSI_DEV_GetDeviceCount.
+ */
+TSI_RESULT TSIX_DEV_RescanDevices(TSI_SEARCH_OPTIONS SearchOptions,
+				  TSI_DEVICE_CAPS RequiredCaps,
+				  TSI_DEVICE_CAPS UnallowedCaps);
+
+/**
+ * TSIX_DEV_GetDeviceCount() - Get the count of scanned devices
+ * Returns: the number of devices that the previous call to TSIX_DEV_RescanDevices() detected
+ *
+ * Must be called after a TSIX_DEV_RescanDevices.
+ */
+TSI_RESULT TSIX_DEV_GetDeviceCount(void);
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
+ * TSIX_DEV_OpenDevice() - Open a device from the scanned list
+ * @DeviceID: index in the TSI_DEV_RescanDevices list
+ * @Result: Pointer to store the error code returned while opening the device
+ * Returns: if the device is found, an opaque pointer that can be used for other
+ * API calls, or NULL on error.
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
+ * TSIX_DEV_SelectRole() - Select a specific role for the specified device
+ * @Device: Device handle on which to assign the role
+ * @RoleIndex: Index of the role to assign
+ * Returns: >=0 in case of success
+ */
+TSI_RESULT TSIX_DEV_SelectRole(TSI_HANDLE Device, int RoleIndex);
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
+
+TSI_RESULT TSIX_VIN_Select(TSI_HANDLE Device, TSI_INPUT_ID InputID);
+/**
+ * TSIX_VIN_Enable() - Enable video input on the specified device
+ * @Device: Device handle to enable video input on
+ * @Flags: Flags to specify the options for enabling the video input
+ * Returns: >=0 in case of success
+ */
+TSI_RESULT TSIX_VIN_Enable(TSI_HANDLE Device, TSI_FLAGS Flags);
+
+/**
+ * TSIX_TS_GetConfigItem() - Read a configuration item from the UCD device
+ * @Device: Device handle to read config from. Can be NULL for certain configuration items,
+ *          for example TSI_VERSION_TEXT.
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
+#endif

-- 
2.52.0

