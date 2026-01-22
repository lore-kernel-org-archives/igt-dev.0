Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E82D3EE8E
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 16:53:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D93D10E9FA;
	Thu, 22 Jan 2026 16:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="IT9l6oA6";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0289010EA09;
 Thu, 22 Jan 2026 16:53:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id F02434E421F4;
 Thu, 22 Jan 2026 16:53:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BBD1960711;
 Thu, 22 Jan 2026 16:53:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A7C2F119A8568; Thu, 22 Jan 2026 17:53:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769100783; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Zs3mJu/FzJxjv84aI2Ch8vddRewnniYx80rcpfq18r0=;
 b=IT9l6oA6f38vo/t3UrcWgYv5FQOTncczm0qt8NiJwBplQ2zShRtSkf7H3WGZVNdXPupMLZ
 Q7kckht3x6xe9EfCTjYWniNVlbmdbV1kBpEGGXv/YmNs+XrTjuJls9c4igMjh4sd3umbWb
 nIEFmaoOPyYli6/VR42dJYfC2ILSyufaPWmgP0ozcxxDw68DVXOB6Sa7/wxTrvKFDcHZiK
 4oSJzWd9LkcCBg3zINzh+2E0M1+jc44Dm24LTpysashNJ/P+ceJs3lJK2aGWKdGL1thzAl
 4IMdTExvOOis2lm5QixxkzYYIuLArjW+iAZx+8Vwa9zIPZ+KN6NkUOfQ+Kqb0Q==
Message-ID: <9376f3ad-2202-4eb7-9c74-bb57b30e21bf@bootlin.com>
Date: Thu, 22 Jan 2026 17:53:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 18/46] lib/unigraf: Add TSI.h
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com, igt-dev <igt-dev-bounces@lists.freedesktop.org>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
 <20251110-unigraf-integration-v4-18-0fc7bb1b4101@bootlin.com>
 <DFUGGVHPISTJ.ZSMBM3NR3UBZ@bootlin.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <DFUGGVHPISTJ.ZSMBM3NR3UBZ@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 1/21/26 18:49, Luca Ceresoli wrote:
> On Mon Nov 10, 2025 at 2:39 PM CET, Louis Chauvet wrote:
>> Unigraf does not provide header for the libTSI.so file, only dynamic
>> library loading helpers for windows.
>>
>> In order to link against this library and use unigraf devices, add the
>> function declaration used in the dynamic library loading wrappers.
>>
>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>> ---
>>   lib/unigraf/TSI.h | 234 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 234 insertions(+)
>>
>> diff --git a/lib/unigraf/TSI.h b/lib/unigraf/TSI.h
>> new file mode 100644
>> index 000000000000..62daaab6300e
>> --- /dev/null
>> +++ b/lib/unigraf/TSI.h
>> @@ -0,0 +1,234 @@
>> +/* SPDX-License-Identifier: MIT */
>> +
>> +/*
>> + * tsi.h - Header for libTSI.so
>> + * Documentation here is taken from official documentation and developer observation.
>> + */
>> +
>> +#ifndef TSI_H
>> +#define TSI_H
>> +
>> +#define TSI_CURRENT_VERSION	12
>> +#define MAX_EDID_SIZE		4096
>> +
>> +#define TSI_SUCCESS		0
>> +
>> +typedef unsigned int		TSI_VERSION_ID;
>> +typedef unsigned int		TSI_SEARCH_OPTIONS;
>> +typedef unsigned int		TSI_DEVICE_CAPS;
>> +typedef unsigned int		TSI_CONFIG_ID;
>> +typedef unsigned int		TSI_DEVICE_ID;
>> +typedef unsigned int		TSI_INPUT_ID;
>> +typedef int			TSI_RESULT;
>> +typedef void			*TSI_HANDLE;
>> +typedef int			TSI_FLAGS;
>> +
>> +/**
>> + * TSI_Init() - Initialize the TSI library
>> + * @ClientVersion: Indicates the version used to call the libTSI.so functions.
>> + *
>> + * Initialize libTSI for use and sets up internal state. It can be called
>> + * multiple times, but TSI_Clean must be called the exact same number of time.
>                                                                              times
>> + *
>> + * Returns:
>> + * - In case of success: Reference count to the API (number of times to call TSI_Clean)
>> + * - TSI_ERROR_NOT_COMPATIBLE if the requested client version is not supported
>> + *   by the library
>> + * - TSI_ERROR_COMPATIBILITY_MISMATCH if TSI_Init is called twice with
>> + *   different client version
>> + */
>> +TSI_RESULT TSI_Init(TSI_VERSION_ID ClientVersion);
>> +
>> +/**
>> + * TSI_Clean() - Cleans and closes the TSI library
>> + *
>> + * When TSI_Clean is called for the last time, cleanup the internal state. It
>> + * should be called exactly the same number of time as TSI_Init
>                                                    times
> 
>> + */
>> +TSI_RESULT TSI_Clean(void);
>> +
>> +/**
>> + * TSI_MISC_GetErrorDescription() - Get a human readable error message
>> + * @ErrorCode: Error code for which you want the message
>> + * @ErrorString: Pointer where to copy the message
>> + * @StringMaxLen: Size of the allocated string @ErrorString
>> + *
>> + * The official documentation states: If the function succeeds, the
>> + * return value is the number of characters required for the complete
>> + * error description string.
>> + * In reality, this function always returns 0 or error, so there is no way to
> 
> On error it returns 0...

0 *or* error (<0):

	If the function succeeds, the return value is the number of
	characters required for the complete error description string.
	If the return value is EQUAL or HIGHER than StringMaxLen
	parameter's value, it means that the string was truncated.
	If the function fails, the return value is a negative error
	code.

>> + * tell if the allocated memory was big enough
>> + *
>> + * Returns:
>> + * - >= 0 on success, theorically the required string len to store the message
>> + * - < 0 on failure
> 
> ...or <0?
>
>> + */
>> +TSI_RESULT TSI_MISC_GetErrorDescription(TSI_RESULT ErrorCode,
>> +					char *ErrorString,
>> +					unsigned int StringMaxLen);
>> +
>> +/**
>> + * TSIX_TS_GetConfigItem() - Read a configuration item from the UCD device
>> + * @Device: Device handle to read config from. Can be NULL for certain configuration items.
> 
> For which items it can be NULL? I can guess some global config items, not
> device-specific. Is it the case?

Yes, at least for `TSI_VERSION_TEXT` according to the examples provided 
by unigraf.

>> + * @ConfigItemID: Identifier of the requested configuration item.
>> + * @ConfigItemData: Pointer to store the read value.
>> + * @ItemMaxSize: Size of the allocated memory for @ConfigItemData.
>> + *
>> + * Returns: The size of the raw data. If the return value is larger than ItemMaxSize, no data
>> + *          is copied to ConfigItemData.
>> + * Note:
>> + * - Some configurations require specific size and alignment for the allocated buffer. Refer to
>> + *   the specific item configuration documentation for details.
>> + * - Data may still be written to @ConfigItemData even if the return value is larger than
>> + *   @ItemMaxSize, potentially causing buffer overflow.
> 
> Oh, amazing!
>>> + */
>> +TSI_RESULT TSIX_TS_GetConfigItem(TSI_HANDLE Device, TSI_CONFIG_ID ConfigItemID,
>> +				 void *ConfigItemData,
>> +				 unsigned int ItemMaxSize);
>> +
>> +/**
>> + * TSIX_DEV_RescanDevices() - Refresh the internal list of devices for libTSI
>> + * @SearchOptions: Options to filter the list of devices (e.g.,
>> + *                 TSI_SEARCHOPTIONS_SHOW_DEVICES_IN_USE to include
>> + *                 devices already in use).
>> + * @RequiredCaps: Filter to list only devices with specific capabilities.
>> + * @UnallowedCaps: Filter to list only devices without specific capabilities.
>> + *
>> + * Returns: >=0 in case of success.
> 
> The returned value is not the amount of devices found? It's just some
> arbitrary non-negative number?
> 
> Being a closed source blob I can well understand a "don't know" answer of
> course.

That what the documentation tell me (the documentation is a PDF provided 
with the unigraf SDK)

	If the function succeeds, the return value is zero. Please note
	that future versions may return non-zero positive value to
	indicate success.


> Also, maybe add "<0 on error"?

Good idea!

>> + *
>> + * This function should be called every time you need to update the list of connected devices,
>> + * and it must be called at least once before calling TSI_DEV_GetDeviceCount.
>> + */
>> +TSI_RESULT TSIX_DEV_RescanDevices(TSI_SEARCH_OPTIONS SearchOptions,
>> +				  TSI_DEVICE_CAPS RequiredCaps,
>> +				  TSI_DEVICE_CAPS UnallowedCaps);
>> +/**
>> + * TSIX_DEV_GetDeviceCount() - Get the count of scanned devices
>> + * Returns: the number of devices that the previous call to TSIX_DEV_RescanDevices() detected
>> + *
>> + * Must be called after a TSIX_DEV_RescanDevices.
>> + */
>> +TSI_RESULT TSIX_DEV_GetDeviceCount(void);
>> +
>> +/**
>> + * TSIX_DEV_OpenDevice() - Open a device from the scanned list
>> + * @DeviceID: index in the TSI_DEV_RescanDevices list
>> + * @Result: Pointer to store the error code returned while opening the device
>> + * Returns: if the device is found, an opaque pointer that can be used for other
>> + * API calls. If some error occurred during the detection, the status code is
>> + * written in the pointer @Result.
> 
> Not in the pointer, I believe! :-)
> 
> Maybe "is written in *@Result."? But the sentence is actually redundant,
> it's implicit in the @Result parameter description. I'd rather add what is
> returned on error. Just guessing that's NULL:
> 
>   * Returns: if the device is found, an opaque pointer that can be used for other
>   * API calls, or NULL on error.

That a good formulation, I will copy it!

> 
>> + */
>> +TSI_HANDLE TSIX_DEV_OpenDevice(TSI_DEVICE_ID DeviceID, TSI_RESULT *Result);
>> +
>> +/**
>> + * TSIX_DEV_CloseDevice() - Close the device handle when finished
>> + * @Device: Device handle to close
>> + * Returns: >=0 in case of success
>> + */
>> +TSI_RESULT TSIX_DEV_CloseDevice(TSI_HANDLE Device);
> 
> Why not moving TSIX_TS_GetConfigItem() and TSIX_TS_SetConfigItem() here,
> alsop keeping them nearby? It looks to me logical: first the init/open
> functions, then the get/set config, then the various video operations.

For unigraf the logic is: open, role select, VIN select, your stuff, VIN 
disable, close. VIN stuff is part of the "init".

>> +
>> +/**
>> + * TSIX_VIN_Disable() - Disable video input on the specified device
>> + * @Device: Device handle to disable video input on
>> + * Returns: >=0 in case of success
>> + */
>> +TSI_RESULT TSIX_VIN_Disable(TSI_HANDLE Device);
>> +
>> +/**
>> + * TSIX_VIN_Select() - Select a specific video input on the specified device
>> + * @Device: Device handle on which to select the input
>> + * @InputID: Identifier of the input to select
>> + * Returns: >=0 in case of success
>> + */
>> +TSI_RESULT TSIX_VIN_Select(TSI_HANDLE Device, TSI_INPUT_ID InputID);
>> +
>> +/**
>> + * TSIX_DEV_SelectRole() - Select a specific role for the specified device
>> + * @Device: Device handle on which to assign the role
>> + * @RoleIndex: Index of the role to assign
> 
> Is there an enum telling us which values mean what?

That would be too easy:

	A numeric value identifying the queried role. Valid RoleIndex
	values range from zero to the number of roles returned
	by TSIX_DEV_GetDeviceRoleCount minus one.

The only "identifier" for a role is the Name...

Role name is something like "UCD-500 DP Input,DP Output", "UCD 500, USBC 
Input,DP Output"...

> PS: I see you can get a list and the names from
> TSIX_DEV_GetDeviceRoleCount/Name(), below. One more reason to keep related
> functions together...
 >
>> +/**
>> + * TSIX_DEV_GetDeviceRoleName() - Get the name of a specific role for a device
>> + * @Device: Device handle to query
>> + * @RoleIndex: Index of the role to get the name for
>> + * @RoleNameString: Pointer to store the role name
>> + * @RoleStringMaxLength: Size of the allocated memory for @RoleNameString
>> + *
>> + * Returns: >=0 in case of success, the length of the role name string
>> + * Note: If the return value is larger than RoleStringMaxLength, the string may be truncated
>> + */
>> +TSI_RESULT TSIX_DEV_GetDeviceRoleName(TSI_HANDLE Device, int RoleIndex,
>> +				      char *RoleNameString, unsigned int RoleStringMaxLength);
>> +
> 
> ...as said above, TSIX_DEV_SelectRole() should probably be here.

Ack, I will reorder properly

Thanks for all your reviews!

>> +TSI_RESULT TSIX_VIN_GetInputName(TSI_HANDLE Device, TSI_INPUT_ID InputID,
>> +				 char *InputNameString, unsigned int NameStringMaxLen);
>> +
>> +#endif
> 
> As for patch 17, I'd add:
> 
>     #endif /* TSI_H */
> 
> 
> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

