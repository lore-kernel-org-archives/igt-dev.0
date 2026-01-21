Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D67CC44508
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 17:49:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E545A10E0D9;
	Wed, 21 Jan 2026 17:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="1sFcsOT0";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD8D10E0D9
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 17:49:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 317114E421CF
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 17:49:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 038896070A;
 Wed, 21 Jan 2026 17:49:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 87E48119B1B13; Wed, 21 Jan 2026 18:49:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769017788; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=0b0IcY3/73iiENfyYf+3+ekFH1YvTUlwmjcaOdNrIZM=;
 b=1sFcsOT0LuerCMjVc5VHuJ7g36h5XYEAje6Y/QPNi59O63Gc7s8fgBRsSq4hw1wzaa6r0+
 tqrKmHo9+ADuPChkKQicbMRZg4NUL9H41jzDFQEt1ekbP2nrbMH5y0dsS7XjMi3ujGQoKG
 aBvnfs4Fevr4WcK+H6T+RzmhJSdOSPQbVsMBc8JNYgEOZv0O4hT0lPw8xaEfYp7uLQzkGn
 eX0A7Hs2HAXOTlIQnZmdj5L9kHvbcNuYh64i0WxTc4O8+0FXExKSTpXrYOCFGCNXq69LMu
 etJyJmgUDoRv0naTgHSRsyhhfVHHNk//uwhn+0V3zzvD7qCyt3AG6BQRPZ98sg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 18:49:45 +0100
Message-Id: <DFUGGVHPISTJ.ZSMBM3NR3UBZ@bootlin.com>
Subject: Re: [PATCH i-g-t v4 18/46] lib/unigraf: Add TSI.h
Cc: <thomas.petazzoni@bootlin.com>, <markyacoub@google.com>,
 <khaled.almahallawy@intel.com>, "igt-dev"
 <igt-dev-bounces@lists.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>,
 <igt-dev@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
 <20251110-unigraf-integration-v4-18-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-18-0fc7bb1b4101@bootlin.com>
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

On Mon Nov 10, 2025 at 2:39 PM CET, Louis Chauvet wrote:
> Unigraf does not provide header for the libTSI.so file, only dynamic
> library loading helpers for windows.
>
> In order to link against this library and use unigraf devices, add the
> function declaration used in the dynamic library loading wrappers.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/unigraf/TSI.h | 234 ++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 234 insertions(+)
>
> diff --git a/lib/unigraf/TSI.h b/lib/unigraf/TSI.h
> new file mode 100644
> index 000000000000..62daaab6300e
> --- /dev/null
> +++ b/lib/unigraf/TSI.h
> @@ -0,0 +1,234 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +/*
> + * tsi.h - Header for libTSI.so
> + * Documentation here is taken from official documentation and developer=
 observation.
> + */
> +
> +#ifndef TSI_H
> +#define TSI_H
> +
> +#define TSI_CURRENT_VERSION	12
> +#define MAX_EDID_SIZE		4096
> +
> +#define TSI_SUCCESS		0
> +
> +typedef unsigned int		TSI_VERSION_ID;
> +typedef unsigned int		TSI_SEARCH_OPTIONS;
> +typedef unsigned int		TSI_DEVICE_CAPS;
> +typedef unsigned int		TSI_CONFIG_ID;
> +typedef unsigned int		TSI_DEVICE_ID;
> +typedef unsigned int		TSI_INPUT_ID;
> +typedef int			TSI_RESULT;
> +typedef void			*TSI_HANDLE;
> +typedef int			TSI_FLAGS;
> +
> +/**
> + * TSI_Init() - Initialize the TSI library
> + * @ClientVersion: Indicates the version used to call the libTSI.so func=
tions.
> + *
> + * Initialize libTSI for use and sets up internal state. It can be calle=
d
> + * multiple times, but TSI_Clean must be called the exact same number of=
 time.
                                                                           =
 times
> + *
> + * Returns:
> + * - In case of success: Reference count to the API (number of times to =
call TSI_Clean)
> + * - TSI_ERROR_NOT_COMPATIBLE if the requested client version is not sup=
ported
> + *   by the library
> + * - TSI_ERROR_COMPATIBILITY_MISMATCH if TSI_Init is called twice with
> + *   different client version
> + */
> +TSI_RESULT TSI_Init(TSI_VERSION_ID ClientVersion);
> +
> +/**
> + * TSI_Clean() - Cleans and closes the TSI library
> + *
> + * When TSI_Clean is called for the last time, cleanup the internal stat=
e. It
> + * should be called exactly the same number of time as TSI_Init
                                                  times

> + */
> +TSI_RESULT TSI_Clean(void);
> +
> +/**
> + * TSI_MISC_GetErrorDescription() - Get a human readable error message
> + * @ErrorCode: Error code for which you want the message
> + * @ErrorString: Pointer where to copy the message
> + * @StringMaxLen: Size of the allocated string @ErrorString
> + *
> + * The official documentation states: If the function succeeds, the
> + * return value is the number of characters required for the complete
> + * error description string.
> + * In reality, this function always returns 0 or error, so there is no w=
ay to

On error it returns 0...

> + * tell if the allocated memory was big enough
> + *
> + * Returns:
> + * - >=3D 0 on success, theorically the required string len to store the=
 message
> + * - < 0 on failure

...or <0?

> + */
> +TSI_RESULT TSI_MISC_GetErrorDescription(TSI_RESULT ErrorCode,
> +					char *ErrorString,
> +					unsigned int StringMaxLen);
> +
> +/**
> + * TSIX_TS_GetConfigItem() - Read a configuration item from the UCD devi=
ce
> + * @Device: Device handle to read config from. Can be NULL for certain c=
onfiguration items.

For which items it can be NULL? I can guess some global config items, not
device-specific. Is it the case?

> + * @ConfigItemID: Identifier of the requested configuration item.
> + * @ConfigItemData: Pointer to store the read value.
> + * @ItemMaxSize: Size of the allocated memory for @ConfigItemData.
> + *
> + * Returns: The size of the raw data. If the return value is larger than=
 ItemMaxSize, no data
> + *          is copied to ConfigItemData.
> + * Note:
> + * - Some configurations require specific size and alignment for the all=
ocated buffer. Refer to
> + *   the specific item configuration documentation for details.
> + * - Data may still be written to @ConfigItemData even if the return val=
ue is larger than
> + *   @ItemMaxSize, potentially causing buffer overflow.

Oh, amazing!

> + */
> +TSI_RESULT TSIX_TS_GetConfigItem(TSI_HANDLE Device, TSI_CONFIG_ID Config=
ItemID,
> +				 void *ConfigItemData,
> +				 unsigned int ItemMaxSize);
> +
> +/**
> + * TSIX_DEV_RescanDevices() - Refresh the internal list of devices for l=
ibTSI
> + * @SearchOptions: Options to filter the list of devices (e.g.,
> + *                 TSI_SEARCHOPTIONS_SHOW_DEVICES_IN_USE to include
> + *                 devices already in use).
> + * @RequiredCaps: Filter to list only devices with specific capabilities=
.
> + * @UnallowedCaps: Filter to list only devices without specific capabili=
ties.
> + *
> + * Returns: >=3D0 in case of success.

The returned value is not the amount of devices found? It's just some
arbitrary non-negative number?

Being a closed source blob I can well understand a "don't know" answer of
course.

Also, maybe add "<0 on error"?

> + *
> + * This function should be called every time you need to update the list=
 of connected devices,
> + * and it must be called at least once before calling TSI_DEV_GetDeviceC=
ount.
> + */
> +TSI_RESULT TSIX_DEV_RescanDevices(TSI_SEARCH_OPTIONS SearchOptions,
> +				  TSI_DEVICE_CAPS RequiredCaps,
> +				  TSI_DEVICE_CAPS UnallowedCaps);
> +/**
> + * TSIX_DEV_GetDeviceCount() - Get the count of scanned devices
> + * Returns: the number of devices that the previous call to TSIX_DEV_Res=
canDevices() detected
> + *
> + * Must be called after a TSIX_DEV_RescanDevices.
> + */
> +TSI_RESULT TSIX_DEV_GetDeviceCount(void);
> +
> +/**
> + * TSIX_DEV_OpenDevice() - Open a device from the scanned list
> + * @DeviceID: index in the TSI_DEV_RescanDevices list
> + * @Result: Pointer to store the error code returned while opening the d=
evice
> + * Returns: if the device is found, an opaque pointer that can be used f=
or other
> + * API calls. If some error occurred during the detection, the status co=
de is
> + * written in the pointer @Result.

Not in the pointer, I believe! :-)

Maybe "is written in *@Result."? But the sentence is actually redundant,
it's implicit in the @Result parameter description. I'd rather add what is
returned on error. Just guessing that's NULL:

 * Returns: if the device is found, an opaque pointer that can be used for =
other
 * API calls, or NULL on error.


> + */
> +TSI_HANDLE TSIX_DEV_OpenDevice(TSI_DEVICE_ID DeviceID, TSI_RESULT *Resul=
t);
> +
> +/**
> + * TSIX_DEV_CloseDevice() - Close the device handle when finished
> + * @Device: Device handle to close
> + * Returns: >=3D0 in case of success
> + */
> +TSI_RESULT TSIX_DEV_CloseDevice(TSI_HANDLE Device);

Why not moving TSIX_TS_GetConfigItem() and TSIX_TS_SetConfigItem() here,
alsop keeping them nearby? It looks to me logical: first the init/open
functions, then the get/set config, then the various video operations.

> +
> +/**
> + * TSIX_VIN_Disable() - Disable video input on the specified device
> + * @Device: Device handle to disable video input on
> + * Returns: >=3D0 in case of success
> + */
> +TSI_RESULT TSIX_VIN_Disable(TSI_HANDLE Device);
> +
> +/**
> + * TSIX_VIN_Select() - Select a specific video input on the specified de=
vice
> + * @Device: Device handle on which to select the input
> + * @InputID: Identifier of the input to select
> + * Returns: >=3D0 in case of success
> + */
> +TSI_RESULT TSIX_VIN_Select(TSI_HANDLE Device, TSI_INPUT_ID InputID);
> +
> +/**
> + * TSIX_DEV_SelectRole() - Select a specific role for the specified devi=
ce
> + * @Device: Device handle on which to assign the role
> + * @RoleIndex: Index of the role to assign

Is there an enum telling us which values mean what?

PS: I see you can get a list and the names from
TSIX_DEV_GetDeviceRoleCount/Name(), below. One more reason to keep related
functions together...

> +/**
> + * TSIX_DEV_GetDeviceRoleName() - Get the name of a specific role for a =
device
> + * @Device: Device handle to query
> + * @RoleIndex: Index of the role to get the name for
> + * @RoleNameString: Pointer to store the role name
> + * @RoleStringMaxLength: Size of the allocated memory for @RoleNameStrin=
g
> + *
> + * Returns: >=3D0 in case of success, the length of the role name string
> + * Note: If the return value is larger than RoleStringMaxLength, the str=
ing may be truncated
> + */
> +TSI_RESULT TSIX_DEV_GetDeviceRoleName(TSI_HANDLE Device, int RoleIndex,
> +				      char *RoleNameString, unsigned int RoleStringMaxLength);
> +

...as said above, TSIX_DEV_SelectRole() should probably be here.

> +TSI_RESULT TSIX_VIN_GetInputName(TSI_HANDLE Device, TSI_INPUT_ID InputID=
,
> +				 char *InputNameString, unsigned int NameStringMaxLen);
> +
> +#endif

As for patch 17, I'd add:

   #endif /* TSI_H */



--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
