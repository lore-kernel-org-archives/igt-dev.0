Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD865CCD183
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 08:40:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D2C10E2E7;
	Thu, 16 Oct 2025 08:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="lf+rs90J";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1099510E2E7
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 08:40:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id AAACF1A140D
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 08:40:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7F6D36062C;
 Thu, 16 Oct 2025 08:40:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2E713102F22F1; 
 Thu, 16 Oct 2025 10:40:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760604035; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
 bh=FiNq7N6AdzvBWMBBzD6wtA1OR91r+XXwH2mZzD2Sr9U=;
 b=lf+rs90JEwEu6ZAuhtbwskVThAGWoSH3yqOLnxRfYrUexDj2wmPEVw2I0gOODIFGePTDmr
 IQ5GNaP8/UrdYPphaeppKf6maD6WZs8fHUwAJtYXcWe7bmEhw6arVNqdVRq9nteVNxXBCT
 WCise/9iY3zH70MnQGo4cZSk6sYgDYerl0YQibnf0zdYJ6G2Ahf+mcolx1cxmtUtsfUXRz
 dae1lWFrnOlkYpQ4NhU62qCW1wwnJVWScz6nj/VFdLa7vfKg7Ojrbg5ivcupW+L5Y3ekDx
 DYR0zWUl8Ya9pRTOWiRmRWxyV4LAqA6w8WsOZ2AM2ewV8GEw4gqkl/pks/PCnQ==
Message-ID: <d67971d5-8bc5-4a4d-becf-59696631f21d@bootlin.com>
Date: Thu, 16 Oct 2025 10:40:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/drmtest: Remove VKMS from Exclusion list
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mark Yacoub <markyacoub@google.com>, igt-dev@lists.freedesktop.org,
 juhapekka.heikkila@gmail.com, =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?=
 <jose.exposito89@gmail.com>
References: <20251008160209.463702-1-markyacoub@google.com>
 <20251009164600.btzj5kiscl5ftdl7@kamilkon-DESK.igk.intel.com>
 <CAC0gqY7ZeCZPP8WHPq8uS-sOZVGpi8Fnzn-uDsWdt4jW72B8RA@mail.gmail.com>
 <20251015181649.ca7psctqj2vj2dt2@kamilkon-DESK.igk.intel.com>
Content-Language: en-US, fr
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20251015181649.ca7psctqj2vj2dt2@kamilkon-DESK.igk.intel.com>
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



Le 15/10/2025 à 20:16, Kamil Konieczny a écrit :
> Hi Mark,
> On 2025-10-09 at 12:53:24 -0400, Mark Yacoub wrote:
>> Hi Kamil,
>>
>> Thanks for your feedback. I'd like to elaborate on my use case to provide
>> more context about the problem I'm trying to solve.
>>
>> I am building IGT for Android, and the same build system is deployed on
>> both physical hardware and virtual machines. On the hardware, the
>> appropriate hardware driver is correctly detected, so there are no issues
>> there. However, on the VM, VKMS is running, but it's currently excluded
>> from `DRIVER_ANY`, which prevents the tests from running against it. I need
>> the tests to execute on VKMS in this scenario.
>>
>> Using `IGT_FORCE_DRIVER` would require me to fork the build processes for
>> hardware and VM, which I would prefer to avoid. My goal is to maintain a
> 
> You do not need to fork it nor recompile, this is env var for
> CI run with tests, it uses the same igt binaries only makes them
> using a forced driver when opening card. Now it do not work as
> no user before needed to force it into vgem or VKMS.
> 
> In theory you could define it like: export IGT_FORCE_DRIVER=vkms
> and then all kms tests and core_ ones should honor it.

+CC: José

Hi,

I had the same issue this week, but IGT_FORCE_DRIVER is not enough: all 
the tests using DRIVER_ANY are skipped.

# export IGT_DEVICE=drm:/dev/dri/card0
# export IGT_FORCE_DRIVER=vkms
# export IGT_LOG_LEVEL=debug
# /usr/libexec/igt-gpu-tools/kms_plane
(kms_plane:125) igt_core-DEBUG: Notice: using IGT_DEVICE env:
(kms_plane:125) igt_core-DEBUG: [drm:/dev/dri/card0]
[IGT] kms_plane: executing
IGT-Version: 2.2-g6d82d231ced6 (x86_64) (Linux: 
6.17.0-rc6-01217-g1ddd2876eeb9 x86_64)
Using IGT_SRANDOM=1760602572 for randomisation
(kms_plane:125) drmtest-DEBUG: Looking for devices to open using filter 
0: drm:/dev/dri/card0
(kms_plane:125) drmtest-DEBUG: Filter matched /dev/dri/card0 |
(kms_plane:125) igt_kmod-DEBUG: Module vkms already inserted
Test requirement not met in function drm_open_driver, file 
../igt/lib/drmtest.c:735:
Test requirement: !(fd<0)
No known gpu found for chipset flags 0x4294965755 (any)
Last errno: 2, No such file or directory
Subtest pixel-format: SKIP (0.000s)
Subtest pixel-format-source-clamping: SKIP (0.000s)
Subtest plane-position-covered: SKIP (0.000s)
Subtest plane-position-hole: SKIP (0.000s)
Subtest plane-position-hole-dpms: SKIP (0.000s)
Subtest plane-panning-top-left: SKIP (0.000s)
Subtest plane-panning-bottom-right: SKIP (0.000s)
Subtest plane-panning-bottom-right-suspend: SKIP (0.000s)
Subtest planar-pixel-format-settings: SKIP (0.000s)
[IGT] kms_plane: exiting, ret=77
(kms_plane:125) igt_core-DEBUG: Exiting with status code 77

José suggested this fix, it seems to properly use vkms if 
IGT_FORCE_DRIVER is set:

diff --git a/lib/drmtest.c b/lib/drmtest.c
index a1fb0b5ba..f630bc157 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -350,7 +350,7 @@ int __drm_open_device(const char *name, unsigned int 
chipset)

         modulename_to_chipset(dev_name, &chip);

-       if ((chipset & chip) == chip) {
+       if ((chipset & chip) == chip || (forced && strcmp(forced, 
dev_name) == 0)) {
                 log_opened_device_path(name);
                 return fd;
         }

@Mark, is it enough for you?
@José, do you want to send the proper patch?


Hav a nice day,
Louis Chauvet

> Regards,
> Kamil
> 
>> unified build system and allow IGT to run on whatever driver is present. Is
>> there a way to achieve this?
>>
>> I understand that the current code prioritizes the hardware driver, which
>> is a desirable behavior. I'm trying to understand the potential issues that
>> might arise if VKMS were not excluded in other contexts.
>>
>> Thank you!
>> Mark
>>
>>
>> On Thu, Oct 9, 2025 at 12:46 PM Kamil Konieczny <
>> kamil.konieczny@linux.intel.com> wrote:
>>
>>> Hi Mark,
>>> On 2025-10-08 at 12:02:09 -0400, Mark Yacoub wrote:
>>>> [Why]
>>>> VKMS (Virtual VKMS) is typically running on a virtual machine where it's
>>>> expected to be without a contention with a hardware driver.
>>>> When it's there, we would like to run IGT on it.
>>>>
>>>> [How]
>>>> Delete VKMS from DRIVER_ANY's exclusion list to allow IGT to be picked
>>>> up.
>>>>
>>>> Tested: Ran kms_bw on Android's VM with VKMS enabled.
>>>>
>>>> Change-Id: Ib13ad9261b8c2617370c02d0ffb5aa878bf3d8f8
>>>> Signed-off-by: Mark Yacoub <markyacoub@google.com>
>>>> ---
>>>>   lib/drmtest.h | 4 +---
>>>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>>>
>>>> diff --git a/lib/drmtest.h b/lib/drmtest.h
>>>> index 8416aa491..ab991da57 100644
>>>> --- a/lib/drmtest.h
>>>> +++ b/lib/drmtest.h
>>>> @@ -63,10 +63,8 @@ int __get_drm_device_name(int fd, char *name, int
>>> name_size);
>>>>    * on a system with them as well as a supported driver, you can end up
>>>>    * with a near-100% skip rate if you don't explicitly specify the
>>> device,
>>>>    * depending on device-load ordering.
>>>> - *
>>>> - * Exclude VKMS to prefer hardware drivers.
>>>>    */
>>>> -#define DRIVER_ANY   ~(DRIVER_VGEM | DRIVER_VKMS | DRIVER_VIRTIO)
>>>> +#define DRIVER_ANY   ~(DRIVER_VGEM | DRIVER_VIRTIO)
>>>
>>> Nak, this is bad as there could be vkms module also on host.
>>>
>>> Let me work on improving IGT_FORCE_DRIVER.
>>>
>>> Regards,
>>> Kamil
>>>
>>>>
>>>>   /*
>>>>    * Compile friendly enum for i915/xe.
>>>> --
>>>> 2.51.0.740.g6adb054d12-goog
>>>>
>>>

-- 
--
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

