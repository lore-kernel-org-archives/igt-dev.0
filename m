Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925B0E9A743
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 09:37:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F6F10E115;
	Tue, 24 Mar 2026 09:37:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="zLWqTXHC";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C7610E110
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 09:37:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id BEE7CC58095;
 Tue, 24 Mar 2026 09:37:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 891D76011D;
 Tue, 24 Mar 2026 09:37:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DE36E10450D32; Tue, 24 Mar 2026 10:37:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774345037; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=k5LbSLq2X5zqyxA1vkDJmwI6qnBw8xqlBkWMR169Xsg=;
 b=zLWqTXHCP6swdDQohcrRf87vPoFjqzZf6/EwTFpjI394PKSAZM55fCmCHWQPZ3xgGmLpt4
 KSnmyPspWU2MO+az3ofhJA61/vEJ+X7qVXGj5tKLthy33L1QCSTimk9rG7D4OJCQ52psnO
 uhSaJ+0/736sAtrfbHwmQa3cscQyo5uml8/PsDJ4hUzqARE1nTzsEjVpDFt4mT8gCLPGNF
 F+K0+gqRuCeA44GpcUIcyDvchdf7ZQDNaFepe0Fz/lHGSdA9ERJuO4vlMkjKCfYNmLfiJO
 0w3XsQjUqs++Gaol4dm9wQ6SzKGZjchP6BWgjBGdUa4wifUZZysL0jemZ5BNcA==
Message-ID: <3b9d04a6-3cab-4a2a-b48f-fd7d437588cc@bootlin.com>
Date: Tue, 24 Mar 2026 10:37:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v9 20/49] lib/unigraf: Initial Unigraf support
To: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
 <20260316-unigraf-integration-v9-20-a01dffc3b0cb@bootlin.com>
 <066263f2-9ff2-48ef-8193-eed5b320a4dc@intel.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <066263f2-9ff2-48ef-8193-eed5b320a4dc@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 3/24/26 09:19, Naladala, Ramanaidu wrote:
> Hi Louis Chauvet,
> 
> On 3/16/2026 9:47 PM, Louis Chauvet wrote:
>> This introduce the basic boilerplate to connect to a unigraf device.
>>
>> This integration currently only supports one device opened to simplify
>> its usage and cleanup.
>>
>> The functions unigraf_open_device and unigraf_require_device will 
>> register
>> a handler to do proper cleanup on IGT exit.
>>
>> Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>> ---
>>   lib/meson.build       |  10 +++++
>>   lib/unigraf/unigraf.c | 120 ++++++++++++++++++++++++++++++++++++++++ 
>> ++++++++++
>>   lib/unigraf/unigraf.h |  43 ++++++++++++++++++
>>   meson.build           |  14 ++++++
>>   4 files changed, 187 insertions(+)
>>
>> diff --git a/lib/meson.build b/lib/meson.build
>> index cd03e8f634e4..268f3238cbfa 100644
>> --- a/lib/meson.build
>> +++ b/lib/meson.build
>> @@ -151,6 +151,13 @@ lib_deps = [
>>       zlib
>>   ]
>> +if libtsi.found()
>> +    lib_deps += libtsi
>> +    lib_sources += [
>> +        'unigraf/unigraf.c'
>> +    ]
>> +endif
>> +
>>   if libdrm_nouveau.found()
>>       lib_deps += libdrm_nouveau
>>       lib_sources += [
>> @@ -232,6 +239,9 @@ endif
>>   if chamelium.found()
>>       lib_deps += chamelium
>>       lib_sources += [ 'igt_chamelium.c', 'igt_chamelium_stream.c' ]
>> +endif
>> +
>> +if chamelium.found() or libtsi.found()
>>       lib_sources += 'monitor_edids/monitor_edids_helper.c'
>>   endif
>> diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
>> new file mode 100644
>> index 000000000000..df18ab178e16
>> --- /dev/null
>> +++ b/lib/unigraf/unigraf.c
>> @@ -0,0 +1,120 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Google
>> + *
>> + * Authors:
>> + *   Louis Chauvet <louis.chauvet@bootlin.com>
>> + */
>> +
>> +#include "igt_core.h"
>> +#include <stdint.h>
>> +
>> +#include "unigraf.h"
>> +#include "TSI.h"
>> +#include "TSI_types.h"
>> +
>> +#define unigraf_debug(fmt, ...)    igt_debug("TSI:%p: " fmt, 
>> unigraf_device, ##__VA_ARGS__)
>> +
>> +static TSI_HANDLE unigraf_device;
>> +static char *unigraf_default_edid;
>> +static char *unigraf_connector_name;
>> +
>> +static void unigraf_close_device(void)
>> +{
>> +    if (!unigraf_device)
>> +        return;
>> +
>> +    unigraf_debug("Closing...\n");
>> +    unigraf_assert(TSIX_DEV_CloseDevice(unigraf_device));
>> +    TSI_Clean();
>> +    unigraf_device = NULL;
>> +    free(unigraf_default_edid);
>> +    free(unigraf_connector_name);
>> +}
>> +
>> +/**
>> + * unigraf_exit_handler - Handle the exit signal and clean up unigraf 
>> resources.
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
>> +    unigraf_close_device();
>> +}
> 
> Unigraf sub test is Success. But the exit handler still asserts due to 
> invalid argument during unigraf_close_device().
> 
> Subtest unigraf-connect-edid: SUCCESS (43.200s)
> (unigraf_connectivity:5625) igt_core-DEBUG: Exiting with status code 0
> (unigraf_connectivity:5625) unigraf/unigraf-DEBUG: TSI:0x6010b136c010: 
> Closing...
> (unigraf_connectivity:5625) unigraf/unigraf-CRITICAL: Test assertion 
> failure function unigraf_close_device, file ../lib/unigraf/unigraf.c:97:
> (unigraf_connectivity:5625) unigraf/unigraf-CRITICAL: Failed assertion: 
> false
> (unigraf_connectivity:5625) unigraf/unigraf-CRITICAL: Last errno: 22, 
> Invalid argument
> (unigraf_connectivity:5625) unigraf/unigraf-CRITICAL: unigraf error: -50 
> (Invalid device handle.)
> Stack trace:
>    #0 ../lib/igt_core.c:2108 __igt_fail_assert()
>    #1 ../lib/unigraf/unigraf.c:97 unigraf_exit_handler()
>    #2 ../lib/igt_core.c:2994 igt_atexit_handler()
>    #3 ./stdlib/exit.c:119 __run_exit_handlers()
>    #4 [exit+0x1e]
>    #5 ../lib/igt_core.c:2419 igt_exit()
>    #6 [main+0x32]
>    #7 ../sysdeps/nptl/libc_start_call_main.h:74 __libc_start_call_main()
>    #8 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
>    #9 [_start+0x25]

I saw it yesterday while checking the default_dectect_timeout values, it 
was not the case in the few first iterations of the series. I am 
currently looking to understand what happen.

My current guess is that unigraf_exit_handler is maybe called twice, 
because the function itself works well in my tiny C programs.

>> +
>> +static void unigraf_init(void)
>> +{
>> +    int ret;
>> +
>> +    unigraf_debug("Initialize unigraf...\n");
>> +    ret = TSI_Init(TSI_CURRENT_VERSION);
>> +    unigraf_assert(ret);
>> +    igt_install_exit_handler(unigraf_exit_handler);
>> +}
>> +
>> +/**
>> + * unigraf_device_count() - Return the number of scanned devices
>> + *
>> + * Must be called after a unigraf_rescan_devices().
>> + */
>> +static unsigned int unigraf_device_count(void)
>> +{
>> +    return unigraf_assert(TSIX_DEV_GetDeviceCount());
>> +}
>> +
>> +/**
>> + * unigraf_open_device() - Search and open a device.
>> + * @drm_fd: File descriptor of the currently used drm device
>> + *
>> + * Returns: true if a device was found and initialized, otherwise false.
>> + *
>> + * This function searches for a compatible device and opens it.
>> + */
>> +bool unigraf_open_device(int drm_fd)
>> +{
>> +    TSI_RESULT r;
>> +    int device_count;
>> +    int chosen_device = 0;
>> +    int chosen_role = 0;
>> +    int chosen_input = 0;
>> +
>> +    assert(igt_can_fail());
>> +
>> +    if (unigraf_device)
>> +        return true;
>> +
>> +    unigraf_init();
>> +
>> +    unigraf_assert(TSIX_DEV_RescanDevices(0, 
>> TSI_DEVCAP_VIDEO_CAPTURE, 0));
>> +
>> +    device_count = unigraf_device_count();
>> +    if (device_count < 1) {
>> +        unigraf_debug("No device found.\n");
>> +        return false;
>> +    }
>> +
>> +    unigraf_device = TSIX_DEV_OpenDevice(chosen_device, &r);
>> +    unigraf_assert(r);
>> +    igt_assert(unigraf_device);
>> +    unigraf_debug("Successfully opened the unigraf device %d.\n", 
>> chosen_device);
>> +
>> +    unigraf_assert(TSIX_DEV_SelectRole(unigraf_device, chosen_role));
>> +    unigraf_assert(TSIX_VIN_Select(unigraf_device, chosen_input));
>> +    unigraf_assert(TSIX_VIN_Enable(unigraf_device, chosen_input));
>> +
>> +    return true;
>> +}
>> +
>> +/**
>> + * unigraf_require_device() - Search and open a device.
>> + * @drm_fd: File descriptor of the currently used drm device
>> + *
>> + * This is a shorthand to reduce test boilerplate when a unigraf 
>> device must be present.
>> + */
>> +void unigraf_require_device(int drm_fd)
>> +{
>> +    igt_require(unigraf_open_device(drm_fd));
>> +}
>> diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
>> new file mode 100644
>> index 000000000000..c08ce62894c5
>> --- /dev/null
>> +++ b/lib/unigraf/unigraf.h
>> @@ -0,0 +1,43 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Google
>> + *
>> + * Authors:
>> + *   Louis Chauvet <louis.chauvet@bootlin.com>
>> + */
>> +
>> +#ifndef UNIGRAF_H
>> +#define UNIGRAF_H
>> +
>> +#include <stdbool.h>
>> +#include <stdint.h>
>> +
>> +/**
>> + * unigraf_assert: Helper macro to assert a TSI return value and 
>> retrieve a detailed error message.
>> + * @result: libTSI return value to check
>> + *
>> + * This macro checks the return value of a libTSI function call. If 
>> the return value indicates an
>> + * error, it retrieves a detailed error message and asserts with that 
>> message.
>> + * If retrieving the error description fails, it asserts with a 
>> generic error message.
>> + */
>> +#define unigraf_assert(result)                                    \
>> +({                                                \
>> +    char msg[256];                                        \
>> +    TSI_RESULT __r = (result);                                \
>> +    if (__r < TSI_SUCCESS) {                                \
>> +        TSI_RESULT __r2 = TSI_MISC_GetErrorDescription(__r, msg, 
>> sizeof(msg));        \
>> +        if (__r2 < TSI_SUCCESS)                                \
>> +            igt_assert_f(false,                            \
>> +                     "unigraf error: %d (get error description 
>> failed: %d)\n",    \
>> +                     __r, __r2);                        \
>> +        else                                        \
>> +            igt_assert_f(false, "unigraf error: %d (%s)\n", __r, 
>> msg);        \
>> +    }                                            \
>> +    (__r);                                            \
>> +})
>> +
>> +bool unigraf_open_device(int drm_fd);
>> +
>> +void unigraf_require_device(int drm_fd);
>> +
>> +#endif // UNIGRAF_H
>> diff --git a/meson.build b/meson.build
>> index 57849648a377..127abbf62024 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -166,6 +166,12 @@ libpci = dependency('libpci', required : true)
>>   libudev = dependency('libudev', required : true)
>>   glib = dependency('glib-2.0', required : true)
>> +libtsi = cc.find_library('TSI', required : false)
>> +
>> +if libtsi.found()
>> +    config.set('HAVE_UNIGRAF', 1)
>> +endif
>> +
>>   xmlrpc = dependency('xmlrpc', required : false)
>>   xmlrpc_util = dependency('xmlrpc_util', required : false)
>>   xmlrpc_client = dependency('xmlrpc_client', required : false)
>> @@ -290,6 +296,7 @@ amdgpudir = join_paths(libexecdir, 'amdgpu')
>>   msmdir = join_paths(libexecdir, 'msm')
>>   panfrostdir = join_paths(libexecdir, 'panfrost')
>>   panthordir = join_paths(libexecdir, 'panthor')
>> +unigrafdir = join_paths(libexecdir, 'unigraf')
>>   v3ddir = join_paths(libexecdir, 'v3d')
>>   vc4dir = join_paths(libexecdir, 'vc4')
>>   vkmsdir = join_paths(libexecdir, 'vkms')
>> @@ -372,6 +379,12 @@ if get_option('use_rpath')
>>           vmwgfx_rpathdir = join_paths(vmwgfx_rpathdir, '..')
>>       endforeach
>>       vmwgfx_rpathdir = join_paths(vmwgfx_rpathdir, libdir)
>> +
>> +    unigraf_rpathdir = '$ORIGIN'
>> +    foreach p : unigrafdir.split('/')
>> +        unigraf_rpathdir = join_paths(unigraf_rpathdir, '..')
>> +    endforeach
>> +    unigraf_rpathdir = join_paths(unigraf_rpathdir, libdir)
>>   else
>>       bindir_rpathdir = ''
>>       libexecdir_rpathdir = ''
>> @@ -383,6 +396,7 @@ else
>>       vc4_rpathdir = ''
>>       vkms_rpathdir = ''
>>       vmwgfx_rpathdir = ''
>> +    unigraf_rpathdir = ''
>>   endif
>>   build_testplan = get_option('testplan')
>>

