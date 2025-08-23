Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD10CA0EFC
	for <igt-dev@archiver.kernel.org>; Sat, 23 Aug 2025 02:20:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4E6110E193;
	Sat, 23 Aug 2025 02:20:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="nPg3Jue7";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 901B410E191
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:20:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 3A6D1C8EC76
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:11:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 204E4606A7;
 Sat, 23 Aug 2025 02:11:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8595C1C22D3FC; 
 Sat, 23 Aug 2025 04:11:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1755915113; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=qqMcTc0ezNGRDNFAMZY3oMw+GbxMpI29LT+pycW2FRg=;
 b=nPg3Jue7fzBAqOomkITHOaBWcU8Sxd8I9BKDzF7cDy7Utd9FdgHPpLUJ+lB2yN1KXUFP2v
 VxNe0/ZZFXWBg0cGS1n3ftutZk+TDLRKyKUNJ46m/WfKRuxQLa9RipVX5GrWbGEmiMIoUn
 AOSeG4gRdfV7DwxcSIdveXkGBcKRlDfi5SLSGeTAOgfZ5Wf8c53SAc6n9TRThUEqeDYx/Q
 Sh3ZlgkbDmRua3oThiyjHC0K4YMg6QAqlsiHKMxUflcN1IJVoud+MM3uvwweYWYjrN6lyv
 FV5vlBM3t05vijf9Ym4F0ARBAQOnhnVgwMYC6mCf8BWKmU5vMYQmR5DWMY1n5A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 23 Aug 2025 04:11:31 +0200
Subject: [PATCH i-g-t v3 11/29] lib/unigraf: Add TSI.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-unigraf-integration-v3-11-cdc36d5fab4c@bootlin.com>
References: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
In-Reply-To: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10144;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=/Uzb3Q359cCetYK6nVsMm/ArzhHbaPuOrf0uhqTHkQk=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoqSNUmCGSLbUdcfPbMCglCSrwbzUr7si09q1Fc
 nLGKVnuxx+JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaKkjVAAKCRAgrS7GWxAs
 4nhUEADGAtoqVIuRpPnHT0XoNL0hGW+FB1jERf1WX2jEYbzcMh4XfQb+t29HQUifL2Hdl9L3+7d
 aN0CtEzf+XkKLulslYL1sQLBnreGJ5lqsiPrykbGQu4goS/6aI3dQQs3aJoAQrHpPXFBheeaObO
 7CbUsqbpurfG3SBzvyqnZLKE4/Ilg3l0Y/hRFrfQqsDDa2mjU3tMCL/q7JQXx0hpNilqdOJp1lx
 D8BMqnY2+kE8emuz321Mq1RyIWEmuh8/nqcUuo75O1HiQYR7s4+utkxLGRQ/yRQ+NrQJ6/fP0jN
 odZk57WMpLnqYeJqNLV5itMX+A/Xy/U53TLGX9iK/LHIOGCyItSCXWdPe81bCwhfKPDqndDBXE2
 sskLzmM6PlbSdguSNT626grSMmP7Qqu1Hh1jRVowUhHEwBoCl5M7jmEewpo7sSOCZ7sHufi8tE2
 4YOFHYEVEMWuPvBU3L0J7bBXJKlkZ412BEDbqp527esZJVjwJxWfeIZDOjeyJQpu4mQMFWvbJaJ
 mkeuWVz94eszkzC05WKq4M9wN1MglhchRQ0hwJaYaLU5yDemhJvqv22SqTW4m4NiRKC5AvMp0RM
 T4URYtMYosg324fgX4Ahp6uDlG2MIryZbHaWAYa2IKAccOffUstOi6n4/wfpW0atgBQ48Spr5uK
 whHVX6R9iuLZUBg==
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
index 0000000000000000000000000000000000000000..62daaab6300e3ad0057217af869749cd9dc287ee
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
2.50.1

