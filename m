Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA1DC54F30
	for <igt-dev@archiver.kernel.org>; Tue, 27 May 2025 13:08:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFBD410E4F2;
	Tue, 27 May 2025 13:08:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="OfCrsggW";
	dkim-atps=neutral
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D1810E42A
 for <igt-dev@lists.freedesktop.org>; Tue, 27 May 2025 13:08:49 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 82FD55850CA
 for <igt-dev@lists.freedesktop.org>; Tue, 27 May 2025 12:51:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB4F143B0F;
 Tue, 27 May 2025 12:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1748350314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=s9ncJ04OhT8LPyByWbNm62ZCFCBS11yRUYQpgUidApg=;
 b=OfCrsggWrWeEKhZ3jByQvsIitKrKwB1vIckENFWwxpaBGxDFvHQicoasjhUVwaf8c/wsH/
 1Jme3MSjKhNRyVSAabXGtYTBvYPtXTqPVtSjiJIPm9+D61BF0j8B7Jt9zy6yZF5nGGbu7b
 UUfA4nIGhvC3uAjMmEg051KI47BdwgImMgQIxGNKAXqTC+mjcObuC58v5ih/nZzH24eYOz
 4fgO/qwsH6FLw0zPodyHoxnhOvrGD2EiPW71u2tVqVD92joIOmyyIipCOsqb0gb4r1WV7D
 Pw+XC3OR36bArYrYrKm+iyngrEFGAvlvN43TGnmwt3mJD9WAmDO+JP9rn+Ze4A==
Message-ID: <3792f8e8-a0f7-4f35-a784-4ac1b5f7fc2f@bootlin.com>
Date: Tue, 27 May 2025 14:51:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH i-g-t RFC] tests/unigraf/unigraf_connectivity: Add unigraf
 device support
To: "Almahallawy, Khaled" <khaled.almahallawy@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "Nikula, Jani" <jani.nikula@intel.com>, "Leung, Benson" <bleung@google.com>,
 "Shankar, Uma" <uma.shankar@intel.com>,
 "markyacoub@google.com" <markyacoub@google.com>,
 "Deak, Imre" <imre.deak@intel.com>, "Lin, Charlton"
 <charlton.lin@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>
References: <20250517-unigraf-integration-v1-1-044acd2133dd@bootlin.com>
 <2b05fb343a5151faf1cb3f53bfc89185acf675af.camel@intel.com>
Content-Language: en-US
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <2b05fb343a5151faf1cb3f53bfc89185acf675af.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvtdegfeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfhffuvfevfhgjtgfgsehtkeertddtvdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfdtleehveeuuedtudehhfefkedukeelvdfgkeefvdeluddvgedvtdekffekgfelnecuffhomhgrihhnpehunhhighhrrghfrdhfihdpsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvtdgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepkhhhrghlvggurdgrlhhmrghhrghllhgrfiihsehinhhtvghlrdgtohhmpdhrtghpthhtohepihhgthdquggvvheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtl
 hhinhdrtghomhdprhgtphhtthhopehjrghnihdrnhhikhhulhgrsehinhhtvghlrdgtohhmpdhrtghpthhtohepsghlvghunhhgsehgohhoghhlvgdrtghomhdprhgtphhtthhopehumhgrrdhshhgrnhhkrghrsehinhhtvghlrdgtohhmpdhrtghpthhtohepmhgrrhhkhigrtghouhgssehgohhoghhlvgdrtghomhdprhgtphhtthhopehimhhrvgdruggvrghksehinhhtvghlrdgtohhm
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

Hi Khaled,

Le 20/05/2025 à 20:49, Almahallawy, Khaled a écrit :
> Hi Louis,
> 
> On Sat, 2025-05-17 at 13:11 +0200, Louis Chauvet wrote:
>> This commit introduces support for Unigraf devices, aiming to
>> facilitate
>> the testing of various hardware features related to display
>> connections.
>>
> Which Unigraf devices are we focusing on?

I have a UCD500 [1] with multiple licenses, so I will focus on this one. 
The API for all UCD devices is the same, so I think adapting the code 
for a new unigraf devices should be "easy" (can be a simple flag in igt 
configuration).

[1]:https://www.unigraf.fi/product/displayport-2-video-generator-analyzer-ucd-500/

>> Key feature that unigraf devices can test:
>> - Link training
>> - Signal integrity
> Which specific Unigraf device supports Signal Integrity(SI)? Which
> aspects or tests of SI are we addressing?

I will focus on different link rates/lane count and link training with 
multiple configurations (scrambling, voltage swing...), and test if the 
Unigraf properly receives the data.

>> - HDCP
>> - DSC
> Will HDCP/DSC be available without requiring a license?

Unfortunately, I think part will require a license, I plan to add 
something to detect the features (runtime or config, I don't know yet).

The goal of this part is to test if the device properly generate 
encryted and compressed stream.

>> - usb-c electrical characteristics
> Similarly to SI, which device supports USB-C electrical
> characteristics? Or are you referring to USB-C PD flows?

I was referring to the power delivery side. According to the 
documentation, UCD500 can emulate different kind of power delivery 
configuration.

It is a bit out of scope for IGT, so I will only focus on video testing 
for now.

>>
>> This implementation utilizes the external libtsi library provided by
>> Unigraf, which must be downloaded separately to enable compilation.
> 
> If a new device/vendor is introduced to IGT and offers similar tests
> and capabilities, do you intend to generalize the interface for tests
> rather than using a vendor-specific one?

That could be a very good idea, but I don't know what kind of interface 
can be proposed yet.

For now I will focus on creating a "device specific API" and some device 
specific tests, as most of the tests will be specific to unigraf.

At some point, I may introduce a generic API for some part (EDID 
managment, screen capture), but it is not my main focus right now.

FYI, my todo-list for the rest of the year is: MST, suspend/resume, link 
training, AUX communication, EDID, HDCP, DSC, color format, 
plane/overlay, VRR, tiled display.

Louis Chauvet

> Thank You
> Khaled
>>
>> DO NOT MERGE!
>>
>> The file lib/unigraf/TSI_types.h currently contains hardcoded values
>> that
>> should be replaced by the next unigraf release. The current unigraf
>> SDK
>> release is not c-compatible, so I had to copy those values. The
>> proper v1
>> will not contains hardcoded value and will use the correct
>> TSI_types.h
>> file.
>>
>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>> ---
>> Hi everyone,
>>
>> I am excited to share I currently have access to a Unigraf device,
>> which I believe could significantly enhance the capabilities within
>> IGT.
>> This device has the potential to enable testing of low-level hardware
>> features that are currently not covered. Specifically, Unigraf
>> devices can
>> assist in testing link training, signal integrity, HDCP, DSC, and
>> more.
>>
>> It's important to note that the Unigraf SDK is not open-source, and
>> the
>> communication protocol with the device is proprietary. As a result, I
>> have
>> utilized the libTSI.so library, which can be downloaded from [1]. In
>> this
>> RFC, I have not used the official TSI_types.h header because it was
>> incompatible with C, so I hardcoded some necessary values. The next
>> iteration will use the official TSI_types.h (they plan to fix it for
>> the
>> next release)
>>
>> This RFC is intentionally concise to gather initial feedback from the
>> community regarding the integration of a proprietary device into the
>> test
>> suite. I plan to expand on this work by adding more features and
>> pushing
>> the developments upstream.
>>
>> Looking forward to your thoughts and suggestions!
>>
>> Thanks,
>> Louis Chauvet
>>
>> [1]:https://www.unigraf.fi/downloads/
>> ---
>>   lib/meson.build                      |   9 ++-
>>   lib/unigraf/TSI.h                    |  91 ++++++++++++++++++++++
>>   lib/unigraf/TSI_types.h              |  18 +++++
>>   lib/unigraf/unigraf.c                | 143
>> +++++++++++++++++++++++++++++++++++
>>   lib/unigraf/unigraf.h                |  84 ++++++++++++++++++++
>>   meson.build                          |  14 ++++
>>   tests/meson.build                    |   4 +
>>   tests/unigraf/meson.build            |  12 +++
>>   tests/unigraf/unigraf_connectivity.c |  79 +++++++++++++++++++
>>   9 files changed, 453 insertions(+), 1 deletion(-)
>>
>> diff --git a/lib/meson.build b/lib/meson.build
>> index 8517cd540437..c1a1c8aa1b24 100644
>> --- a/lib/meson.build
>> +++ b/lib/meson.build
>> @@ -138,6 +138,13 @@ lib_deps = [
>>   	zlib
>>   ]
>>   
>> +if libtsi.found()
>> +	lib_deps += libtsi
>> +	lib_sources += [
>> +		'unigraf/unigraf.c'
>> +	]
>> +endif
>> +
>>   if libdrm_nouveau.found()
>>   	lib_deps += libdrm_nouveau
>>   	lib_sources += [
>> @@ -177,7 +184,7 @@ if libdrm_amdgpu.found()
>>   	if cc.has_function('amdgpu_create_userqueue', dependencies:
>> libdrm_amdgpu)
>>   		add_project_arguments('-DAMDGPU_USERQ_ENABLED=1',
>> language: 'c')
>>   		#conf.set('AMDGPU_USERQ_ENABLED', 1)
>> -	endif	
>> +	endif
>>   endif
>>   
>>   if libunwind.found()
>> diff --git a/lib/unigraf/TSI.h b/lib/unigraf/TSI.h
>> new file mode 100644
>> index 000000000000..e057823c3df0
>> --- /dev/null
>> +++ b/lib/unigraf/TSI.h
>> @@ -0,0 +1,91 @@
>> +/* SPDX-License-Identifier: MIT */
>> +
>> +/*
>> + * tsi.h - Header for libTSI.so
>> + * Documentation here is taken from official documentation and
>> developer observation.
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
>> + * @ClientVersion: Indicates the version used to call the libTSI.so
>> functions.
>> + *
>> + * Initialize libTSI for use and sets up internal state. It can be
>> called
>> + * multiple times, but TSI_Clean must be called the exact same
>> number of time.
>> + *
>> + * Returns:
>> + * - In case of success: Reference count to the API (number of times
>> to call TSI_Clean)
>> + * - TSI_ERROR_NOT_COMPATIBLE if the requested client version is not
>> supported
>> + *   by the library
>> + * - TSI_ERROR_COMPATIBILITY_MISMATCH if TSI_Init is called twice
>> with
>> + *   different client version
>> + */
>> +TSI_RESULT TSI_Init(TSI_VERSION_ID ClientVersion);
>> +
>> +/**
>> + * TSI_Clean() - Cleans and closes the TSI library
>> + *
>> + * When TSI_Clean is called for the last time, cleanup the internal
>> state. It
>> + * should be called exactly the same number of time as TSI_Init
>> + */
>> +TSI_RESULT TSI_Clean(void);
>> +
>> +/**
>> + * TSI_MISC_GetErrorDescription() - Get a human readable error
>> message
>> + * @ErrorCode: Error code for which you want the message
>> + * @ErrorString: Pointer where to copy the message
>> + * @StringMaxLen: Size of the allocated string @ErrorString
>> + *
>> + * The official documentation states: If the function succeeds, the
>> + * return value is the number of characters required for the
>> complete
>> + * error description string.
>> + * In reality, this function always returns 0 or error, so there is
>> no way to
>> + * tell if the allocated memory was big enough
>> + *
>> + * Returns:
>> + * - >= 0 on success, theorically the required string len to store
>> the message
>> + * - < 0 on failure
>> + */
>> +TSI_RESULT TSI_MISC_GetErrorDescription(TSI_RESULT ErrorCode,
>> +					char *ErrorString,
>> +					unsigned int StringMaxLen);
>> +
>> +TSI_RESULT TSIX_TS_GetConfigItem(TSI_HANDLE Device, TSI_CONFIG_ID
>> ConfigItemID,
>> +				 void *ConfigItemData,
>> +				 unsigned int ItemMaxSize);
>> +
>> +TSI_RESULT TSIX_DEV_RescanDevices(TSI_SEARCH_OPTIONS SearchOptions,
>> +				  TSI_DEVICE_CAPS RequiredCaps,
>> +				  TSI_DEVICE_CAPS UnallowedCaps);
>> +TSI_RESULT TSIX_DEV_GetDeviceCount(void);
>> +
>> +TSI_HANDLE TSIX_DEV_OpenDevice(TSI_DEVICE_ID DeviceID, TSI_RESULT
>> *Result);
>> +
>> +TSI_RESULT TSIX_DEV_CloseDevice(TSI_HANDLE Device);
>> +
>> +TSI_RESULT TSIX_VIN_Disable(TSI_HANDLE Device);
>> +
>> +TSI_RESULT TSIX_VIN_Select(TSI_HANDLE Device, TSI_INPUT_ID InputID);
>> +TSI_RESULT TSIX_DEV_SelectRole(TSI_HANDLE Device, int RoleIndex);
>> +TSI_RESULT TSIX_TS_SetConfigItem(TSI_HANDLE Device, TSI_CONFIG_ID
>> ConfigItemID,
>> +				 const void *ItemData, unsigned int
>> ItemSize);
>> +TSI_RESULT TSIX_VIN_Enable(TSI_HANDLE Device, TSI_FLAGS Flags);
>> +
>> +#endif
>> diff --git a/lib/unigraf/TSI_types.h b/lib/unigraf/TSI_types.h
>> new file mode 100644
>> index 000000000000..a3bd20f53066
>> --- /dev/null
>> +++ b/lib/unigraf/TSI_types.h
>> @@ -0,0 +1,18 @@
>> +/* SPDX-License-Identifier: MIT */
>> +
>> +// DO NOT MERGE THIS FILE
>> +//
>> +// Current unigraf public release are not c-compatible, this file
>> hardcode some values
>> +// The next release of libTSI should include a c-compatible
>> TSI_types.h file, that will
>> +// be directly used in place of this file
>> +
>> +#ifndef TSI_REG_H
>> +
>> +#define TSI_VERSION_TEXT			0x80000001
>> +#define TSI_DEVCAP_VIDEO_CAPTURE		0x00000001
>> +#define TSI_SEARCHOPTIONS_SHOW_DEVICES_IN_USE	0x00000001
>> +
>> +#define TSI_EDID_TE_INPUT			0x1100
>> +#define TSI_EDID_SELECT_STREAM			0x1102
>> +
>> +#endif
>> diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
>> new file mode 100644
>> index 000000000000..3200cb881f91
>> --- /dev/null
>> +++ b/lib/unigraf/unigraf.c
>> @@ -0,0 +1,143 @@
>> +// SPDX-License-Identifier: MIT
>> +
>> +#include "igt_core.h"
>> +#include "igt_edid.h"
>> +#include <stdint.h>
>> +#include <stdio.h>
>> +
>> +#include "unigraf.h"
>> +#include "TSI.h"
>> +#include "TSI_types.h"
>> +
>> +static int unigraf_open_count;
>> +
>> +/**
>> + * unigraf_exit_handler - Handle the exit signal and clean up
>> unigraf resources.
>> + * @sig: The signal number received.
>> + *
>> + * This function is called when the program receives an exit signal.
>> It ensures
>> + * that all unigraf resources are properly cleaned up by calling
>> unigraf_deinit
>> + * for each open instance.
>> + */
>> +static void unigraf_exit_handler(int sig)
>> +{
>> +	while (unigraf_open_count)
>> +		unigraf_deinit();
>> +}
>> +
>> +void unigraf_init(void)
>> +{
>> +	int ret;
>> +
>> +	igt_debug("TSI: Initialize unigraf...\n");
>> +
>> +	__sync_fetch_and_add(&unigraf_open_count, 1);
>> +	ret = TSI_Init(TSI_CURRENT_VERSION);
>> +	if (ret < TSI_SUCCESS)
>> +		__sync_fetch_and_sub(&unigraf_open_count, 1);
>> +	else
>> +		igt_install_exit_handler(unigraf_exit_handler);
>> +	unigraf_assert(ret);
>> +}
>> +
>> +void unigraf_deinit(void)
>> +{
>> +	igt_debug("TSI: Uninitialize unigraf...\n");
>> +
>> +	if (unigraf_open_count >= 1) {
>> +		TSI_Clean();
>> +		__sync_fetch_and_sub(&unigraf_open_count, 1);
>> +	}
>> +}
>> +
>> +/**
>> + * unigraf_write() - Helper to write a value to unigraf
>> + * @dev: device handle, can be null for some config id
>> + * @config: config id to write
>> + * @data: data to write
>> + * @data_len: length of the data
>> + * Returns
>> + */
>> +static void unigraf_write(TSI_HANDLE dev, TSI_CONFIG_ID config,
>> const void *data, size_t data_len)
>> +{
>> +	igt_debug("TSI: Writing %zu bytes to %d\n", data_len,
>> config);
>> +
>> +	unigraf_assert(TSIX_TS_SetConfigItem(dev, config, data,
>> data_len));
>> +}
>> +
>> +/**
>> + * unigraf_rescan_device() - Force the scan of all connected device
>> + */
>> +static void unigraf_rescan_devices(void)
>> +{
>> +	unigraf_assert(TSIX_DEV_RescanDevices(0,
>> TSI_DEVCAP_VIDEO_CAPTURE, 0));
>> +}
>> +
>> +/**
>> + * unigraf_device_count() - Return the number of scanned devices
>> + *
>> + * Must be called after a unigraf_rescan_devices().
>> + */
>> +static unsigned int unigraf_device_count(void)
>> +{
>> +	return unigraf_assert(TSIX_DEV_GetDeviceCount());
>> +}
>> +
>> +char *unigraf_get_version(TSI_HANDLE dev)
>> +{
>> +	int ret;
>> +	void *data;
>> +
>> +	igt_debug("TSI: Fetching version for device %p\n", dev);
>> +
>> +	ret = unigraf_assert(TSIX_TS_GetConfigItem(dev,
>> TSI_VERSION_TEXT, NULL, 0));
>> +
>> +	data = malloc(ret);
>> +	memset(data, 0, ret);
>> +	ret = unigraf_assert(TSIX_TS_GetConfigItem(dev,
>> TSI_VERSION_TEXT, data, ret));
>> +
>> +	return data;
>> +}
>> +
>> +void unigraf_close_device(TSI_HANDLE dev)
>> +{
>> +	igt_debug("TSI: Closing device %p\n", dev);
>> +	unigraf_assert(TSIX_DEV_CloseDevice(dev));
>> +}
>> +
>> +TSI_HANDLE unigraf_require_device(void)
>> +{
>> +	TSI_RESULT r;
>> +	TSI_HANDLE handle;
>> +
>> +	unigraf_rescan_devices();
>> +
>> +	igt_require(unigraf_device_count() >= 1);
>> +	handle = TSIX_DEV_OpenDevice(0, &r);
>> +	unigraf_assert(r);
>> +	igt_assert(handle);
>> +
>> +	igt_debug("TSI: Opened device %p. Selecting role and
>> input...\n", handle);
>> +
>> +	// By default, enable the first role and input
>> +	unigraf_assert(TSIX_DEV_SelectRole(handle, 0));
>> +	unigraf_assert(TSIX_VIN_Select(handle, 0));
>> +	unigraf_assert(TSIX_VIN_Enable(handle, 0));
>> +
>> +	return handle;
>> +}
>> +
>> +struct edid *unigraf_read_edid(TSI_HANDLE dev, uint32_t stream,
>> uint32_t *edid_size)
>> +{
>> +	void *edid;
>> +
>> +	igt_debug("TSI:%p: Read EDID for stream %d...\n", dev,
>> stream);
>> +
>> +	edid = malloc(2048);
>> +	memset(edid, 0, 2048);
>> +
>> +	unigraf_write(dev, TSI_EDID_SELECT_STREAM, &stream,
>> sizeof(stream));
>> +	*edid_size = unigraf_assert(TSIX_TS_GetConfigItem(dev,
>> TSI_EDID_TE_INPUT, edid, 2048));
>> +
>> +	return edid;
>> +}
>> diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
>> new file mode 100644
>> index 000000000000..57f2597d182d
>> --- /dev/null
>> +++ b/lib/unigraf/unigraf.h
>> @@ -0,0 +1,84 @@
>> +/* SPDX-License-Identifier: MIT */
>> +
>> +#ifndef UNIGRAF_H
>> +#define UNIGRAF_H
>> +
>> +#include <stdint.h>
>> +
>> +typedef void *TSI_HANDLE;
>> +
>> +/**
>> + * unigraf_assert: Helper macro to assert a TSI return value and
>> retrieve a detailed error message.
>> + * @result: libTSI return value to check
>> + *
>> + * This macro checks the return value of a libTSI function call. If
>> the return value indicates an
>> + * error, it retrieves a detailed error message and asserts with
>> that message.
>> + * If retrieving the error description fails, it asserts with a
>> generic error message.
>> + */
>> +#define
>> unigraf_assert(result)										\
>> +({								
>> 					\
>> +	char
>> msg[256];											\
>> +	TSI_RESULT __r =
>> (result);									\
>> +	if (__r < TSI_SUCCESS)
>> {									\
>> +		TSI_RESULT __r2 = TSI_MISC_GetErrorDescription(__r,
>> msg, sizeof(msg));			\
>> +		if (__r2 <
>> TSI_SUCCESS)									\
>> +			igt_assert_f(false, "unigraf error: %d (get
>> error description failed: %d)\n",	\
>> +				     __r,
>> __r2);							\
>> +		else						
>> 					\
>> +			igt_assert_f(false, "unigraf error: %d
>> (%s)\n", __r, msg);			\
>> +	}							
>> 					\
>> +	(__r);							
>> 					\
>> +})
>> +
>> +/**
>> + * unigraf_init() - Initialize the unigraf library
>> + *
>> + * This function initializes the unigraf library and install an exit
>> + * handler to ensure proper cleanup on program termination.
>> + */
>> +void unigraf_init(void);
>> +
>> +/**
>> + * unigraf_deinit() - Uninitialize the unigraf library
>> + */
>> +void unigraf_deinit(void);
>> +
>> +/**
>> + * unigraf_get_version() - Retrieve the version information of the
>> libTSI library and the device.
>> + * @dev: The device handle. If set, the function will also retrieve
>> information from the device.
>> +
>> + * Returns: A null-terminated string containing the version
>> information. The caller
>> + * is responsible to free this string.
>> + */
>> +char *unigraf_get_version(TSI_HANDLE dev);
>> +
>> +/**
>> + * unigraf_require_device() - Search and open a device.
>> + *
>> + * Returns: A non-null opaque pointer to the device handle if
>> successful, otherwise NULL.
>> + *
>> + * This function searches for a compatible device and opens it. If a
>> device is found and
>> + * successfully opened, it returns a non-null opaque pointer to the
>> device handle. If no device
>> + * is found or an error occurs during the opening process, the
>> function will handle the error
>> + * appropriately and return a null pointer.
>> + */
>> +TSI_HANDLE unigraf_require_device(void);
>> +
>> +/**
>> + * unigraf_close_device() - Close the device.
>> + * @dev: The device handle to close.
>> + */
>> +void unigraf_close_device(TSI_HANDLE dev);
>> +
>> +/**
>> + * unigraf_read_edid() - Read the EDID from the specified input
>> + * @dev: The device handle
>> + * @stream: The stream ID to read the EDID from
>> + * @edid_size: Pointer to an integer where the size of the EDID will
>> be stored
>> + *
>> + * Returns: A pointer to the EDID structure, or NULL if the
>> operation failed. The caller
>> + * is responsible to free this pointer.
>> + */
>> +struct edid *unigraf_read_edid(TSI_HANDLE dev, uint32_t stream,
>> uint32_t *edid_size);
>> +
>> +#endif // UNIGRAF_H
>> diff --git a/meson.build b/meson.build
>> index 6a580bd7e3a3..d143e3835475 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -162,6 +162,12 @@ cairo = dependency('cairo', version : '>1.12.0',
>> required : true)
>>   libudev = dependency('libudev', required : true)
>>   glib = dependency('glib-2.0', required : true)
>>   
>> +libtsi = cc.find_library('TSI', required : false)
>> +
>> +if libtsi.found()
>> +	config.set('HAVE_UNIGRAF', 1)
>> +endif
>> +
>>   xmlrpc = dependency('xmlrpc', required : false)
>>   xmlrpc_util = dependency('xmlrpc_util', required : false)
>>   xmlrpc_client = dependency('xmlrpc_client', required : false)
>> @@ -285,6 +291,7 @@ libexecdir = join_paths(get_option('libexecdir'),
>> 'igt-gpu-tools')
>>   amdgpudir = join_paths(libexecdir, 'amdgpu')
>>   msmdir = join_paths(libexecdir, 'msm')
>>   panfrostdir = join_paths(libexecdir, 'panfrost')
>> +unigrafdir = join_paths(libexecdir, 'unigraf')
>>   v3ddir = join_paths(libexecdir, 'v3d')
>>   vc4dir = join_paths(libexecdir, 'vc4')
>>   vmwgfxdir = join_paths(libexecdir, 'vmwgfx')
>> @@ -353,6 +360,12 @@ if get_option('use_rpath')
>>   		vmwgfx_rpathdir = join_paths(vmwgfx_rpathdir, '..')
>>   	endforeach
>>   	vmwgfx_rpathdir = join_paths(vmwgfx_rpathdir, libdir)
>> +
>> +	unigraf_rpathdir = '$ORIGIN'
>> +	foreach p : unigrafdir.split('/')
>> +		unigraf_rpathdir = join_paths(unigraf_rpathdir,
>> '..')
>> +	endforeach
>> +	unigraf_rpathdir = join_paths(unigraf_rpathdir, libdir)
>>   else
>>   	bindir_rpathdir = ''
>>   	libexecdir_rpathdir = ''
>> @@ -362,6 +375,7 @@ else
>>   	v3d_rpathdir = ''
>>   	vc4_rpathdir = ''
>>   	vmwgfx_rpathdir = ''
>> +	unigraf_rpathdir = ''
>>   endif
>>   
>>   build_testplan = get_option('testplan')
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 6328792e3a4d..14798547603f 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -452,6 +452,10 @@ foreach prog : intel_progs
>>   	endif
>>   endforeach
>>   
>> +if libtsi.found()
>> +	subdir('unigraf')
>> +endif
>> +
>>   if chamelium.found()
>>   	foreach prog : chamelium_progs
>>   		testexe = executable(prog,
>> diff --git a/tests/unigraf/meson.build b/tests/unigraf/meson.build
>> new file mode 100644
>> index 000000000000..4ef8c32151e4
>> --- /dev/null
>> +++ b/tests/unigraf/meson.build
>> @@ -0,0 +1,12 @@
>> +unigraf_progs = [
>> +	'unigraf_connectivity',
>> +]
>> +
>> +foreach prog : unigraf_progs
>> +	test_executables += executable(prog, prog + '.c',
>> +				       dependencies : test_deps,
>> +				       install_dir : unigrafdir,
>> +				       install_rpath :
>> unigraf_rpathdir,
>> +				       install : true)
>> +	test_list += join_paths('unigraf', prog)
>> +endforeach
>> diff --git a/tests/unigraf/unigraf_connectivity.c
>> b/tests/unigraf/unigraf_connectivity.c
>> new file mode 100644
>> index 000000000000..01266e84db76
>> --- /dev/null
>> +++ b/tests/unigraf/unigraf_connectivity.c
>> @@ -0,0 +1,79 @@
>> +// SPDX-License-Identifier: MIT
>> +
>> +#include <cstdint>
>> +#include <xf86drmMode.h>
>> +
>> +#include "drmtest.h"
>> +#include "igt_aux.h"
>> +#include "igt_core.h"
>> +#include "igt_kms.h"
>> +#include "unigraf/unigraf.h"
>> +
>> +/**
>> + * TEST: unigraf connectivity
>> + * Category: Core
>> + * Description: Testing connectivity with a unigraf device
>> + *
>> + * SUBTEST: unigraf-open
>> + * Description: Make sure that a unigraf device can be accessed
>> + *
>> + * SUBTEST: unigraf-connected
>> + * Description: Make sure that the unigraf device is connected to
>> the DUT
>> + */
>> +
>> +IGT_TEST_DESCRIPTION("Test basic unigraf connectivity");
>> +igt_main
>> +{
>> +	TSI_HANDLE unigraf_dev;
>> +
>> +	igt_fixture {
>> +		unigraf_init();
>> +	}
>> +
>> +	igt_describe("Testing connectivity with a unigraf device");
>> +	igt_subtest("unigraf-open") {
>> +		unigraf_dev = unigraf_require_device();
>> +		unigraf_close_device(unigraf_dev);
>> +	}
>> +
>> +	igt_describe("Make sure that the unigraf device is connected
>> to the DUT");
>> +	igt_subtest("unigraf-connected") {
>> +		drmModePropertyBlobPtr edid_blob = NULL;
>> +		struct igt_display display;
>> +		uint64_t edid_blob_id;
>> +		igt_output_t *output;
>> +		uint32_t unigraf_edid_len;
>> +		void *unigraf_edid;
>> +		int drm_fd;
>> +		bool found;
>> +
>> +		unigraf_dev = unigraf_require_device();
>> +
>> +		drm_fd = drm_open_driver_master(DRIVER_ANY);
>> +		igt_display_require(&display, drm_fd);
>> +
>> +		unigraf_edid = unigraf_read_edid(unigraf_dev, 0,
>> &unigraf_edid_len);
>> +
>> +		for_each_connected_output(&display, output) {
>> +			if (output->config.connector->connector_type
>> == DRM_MODE_CONNECTOR_DisplayPort) {
>> +				igt_assert(kmstest_get_property(drm_
>> fd, output->config.connector->connector_id,
>> +								DRM_
>> MODE_OBJECT_CONNECTOR, "EDID", NULL,
>> +								&edi
>> d_blob_id, NULL));
>> +				edid_blob =
>> drmModeGetPropertyBlob(drm_fd, edid_blob_id);
>> +				igt_assert(edid_blob);
>> +
>> +				found |= memcmp(unigraf_edid,
>> edid_blob->data, min(edid_blob->length, unigraf_edid_len)) == 0;
>> +
>> +				drmModeFreePropertyBlob(edid_blob);
>> +			}
>> +		}
>> +		igt_assert_f(found, "No output with the correct EDID
>> was found\n");
>> +
>> +		free(unigraf_edid);
>> +		unigraf_close_device(unigraf_dev);
>> +	}
>> +
>> +	igt_fixture {
>> +		unigraf_deinit();
>> +	}
>> +}
>>
>> ---
>> base-commit: a5f980e11a5540c1c079cc6fceb2b2d889b5a460
>> change-id: 20250425-unigraf-integration-11ed330755d5
>>
>> Best regards,
> 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


