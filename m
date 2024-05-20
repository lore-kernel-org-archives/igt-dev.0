Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F80DC25B79
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 16:04:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F4810E1B1;
	Mon, 20 May 2024 16:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G8z42im5";
	dkim-atps=neutral
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE27710E1B1
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 16:04:40 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4202c0d316cso13713745e9.1
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 09:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716221079; x=1716825879; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=xYT2GwX3I6xGwl5F4nPaKaCSBTFNOUIuqM8MEQMVclE=;
 b=G8z42im5+23mnhZztG25gKRmgYQOJhbNBXSC71AwfUZgt6QNkoWCSES+pYlOy1TuEF
 mZoL3MJfm8d9ec4F6fXavyOwqdWXDRJ67Sz8s5OXkHYeaozGPngqZWna8wFP4fVOzqnP
 li1B+YU5pdhPiuPQFenBi+ui5uzIySqv9Co/BRubO9PSI9s4W6TBiUeRoh401O9uBlTb
 rJ2EII4kEjC3SndQxuCnxp6eoRGH/YliOXNAqF74/9hEdD75+AkVWdGHMCi/B828m3Gx
 MJS+aW4cpNLlQr5mMaeXG79DL0msnC8DUzCVifYvCzkdOuvRdkBuWh36Rshry/0RKftI
 aUaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716221079; x=1716825879;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xYT2GwX3I6xGwl5F4nPaKaCSBTFNOUIuqM8MEQMVclE=;
 b=DurWQUgOSArQKKNMNObiihaLsRR2f/K8FhsXx+xw7pEc7ux6ubIU8YCtcorU/2OnHt
 5Mc2S0NSLCjy9+wXHGIRUxyRsA5tJWg/6iXz8gmZVSd1TXL2YKZoZ2ymTfKFVL9NTrmM
 06Fq6jTkTbKMaYY/k2ErnFuLGoUEOmj8N3QsHcMBVU/m+SCoSVKTSvb7Fm6l56NYXDzM
 QBN1SDo+pGg1IHTOZBB+FqQbA5NbMUD2WK7B8Ew24gJXJeD3QXx8Nk2jdWDdTQ33d1y2
 kplmzYfPgBigaGX8cqmHkhmerdhmGv4tZsDAnnCeRXnyDC5QJi4dJxXN2coAONwPOWN1
 11Nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAu2AS5nmNIIOfTj14XCHR2Zd2QBXNFq6PkASYsGj+n+s0/Z5/GufATGhOWWuHiVpqpmsrEneOFJSjXVWHwCyFTAV8UEB/dMBS/oBdLg==
X-Gm-Message-State: AOJu0YwvRqUOIvAZ6uniybYYtNNE02VjmGTgXBXbnlwl3yVtlAWV62kA
 6nsVbzmImTc+haSVXqZ28BJ0/K6PPF2/CirmjPH7vioOV9M33Gh8
X-Google-Smtp-Source: AGHT+IGiYuxc6SbfOY/+2zm10ww8cHXvni0V0fMBxf+YH+F6U8HCVwuZ33Lo+VMthRXjRPKjNQBYFA==
X-Received: by 2002:a5d:4484:0:b0:34c:e0d6:bea6 with SMTP id
 ffacd0b85a97d-354b8e3733bmr6023693f8f.29.1716221078458; 
 Mon, 20 May 2024 09:04:38 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.78])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3502baad04dsm29534100f8f.81.2024.05.20.09.04.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 May 2024 09:04:38 -0700 (PDT)
Message-ID: <7797e287-dfc1-4eb1-a852-806863acd58c@gmail.com>
Date: Mon, 20 May 2024 19:04:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms: Move kms_plane_scaling to intel directory
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Mark Yacoub <markyacoub@chromium.org>
References: <20240520064150.2519210-1-bhanuprakash.modem@intel.com>
 <20240520082217.agl3fz6d6d25jyhu@kamilkon-DESK.igk.intel.com>
 <50dbfa55-b7ff-42cf-88b7-ac5a73ad846b@gmail.com>
 <0c319f00-57de-4ed7-a9ef-65877a67c232@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <0c319f00-57de-4ed7-a9ef-65877a67c232@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On 20.5.2024 15.00, Modem, Bhanuprakash wrote:
> Hi JP,
> 
> On 20-05-2024 04:19 pm, Juha-Pekka Heikkila wrote:
>> I didn't see why this test would need Intel HW? I see Intel hw is 
>> handled with special casing, normally test uses linear tiling and 
>> checks if Intel specific tiling can be used. What did I miss?
> 
> If you check the helper function "get_num_scalers()", that returns 0 for 
> non-Intel cases, which causes the skips.

But that's a bug in library and not in the test, something Swati 
probably overlooked as she did use only Intel HW. I hope you are not 
thinking Intel HW is only HW supporting scaling?

/Juha-Pekka

>>
>> On 20.5.2024 11.22, Kamil Konieczny wrote:
>>> Hi Bhanuprakash,
>>> On 2024-05-20 at 12:11:50 +0530, Bhanuprakash Modem wrote:
>>>> As kms_plane_scaling is limited to run on Intel hw only,
>>>> move this test to tests/intel directory.
>>>>
>>>> Cc: Mark Yacoub <markyacoub@chromium.org>
>>>> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>>>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>>
>>> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>>
>>>> ---
>>>>   tests/{ => intel}/kms_plane_scaling.c | 6 ++----
>>>>   tests/meson.build                     | 2 +-
>>>>   2 files changed, 3 insertions(+), 5 deletions(-)
>>>>   rename tests/{ => intel}/kms_plane_scaling.c (99%)
>>>>
>>>> diff --git a/tests/kms_plane_scaling.c 
>>>> b/tests/intel/kms_plane_scaling.c
>>>> similarity index 99%
>>>> rename from tests/kms_plane_scaling.c
>>>> rename to tests/intel/kms_plane_scaling.c
>>>> index acb4a1da1..620dba911 100644
>>>> --- a/tests/kms_plane_scaling.c
>>>> +++ b/tests/intel/kms_plane_scaling.c
>>>> @@ -1291,10 +1291,9 @@ igt_main_args("", long_opts, help_str, 
>>>> opt_handler, &data)
>>>>       enum pipe pipe;
>>>>       igt_fixture {
>>>> -        data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>>>> +        data.drm_fd = drm_open_driver_master(DRIVER_INTEL | 
>>>> DRIVER_XE);
>>>>           igt_display_require(&data.display, data.drm_fd);
>>>> -        data.devid = is_intel_device(data.drm_fd) ?
>>>> -            intel_get_drm_devid(data.drm_fd) : 0;
>>>> +        data.devid = intel_get_drm_devid(data.drm_fd);
>>>>           igt_require(data.display.is_atomic);
>>>>       }
>>>> @@ -1464,7 +1463,6 @@ igt_main_args("", long_opts, help_str, 
>>>> opt_handler, &data)
>>>>           for (int index = 0; index < ARRAY_SIZE(intel_paramtests); 
>>>> index++) {
>>>>               igt_describe("Test for validating max source size.");
>>>> igt_subtest_with_dynamic(intel_paramtests[index].testname) {
>>>> -                igt_require_intel(data.drm_fd);
>>>>                   for_each_pipe(&data.display, pipe) {
>>>>                       for_each_valid_output_on_pipe(&data.display, 
>>>> pipe, output) {
>>>>                           drmModeModeInfo *mode = NULL;
>>>> diff --git a/tests/meson.build b/tests/meson.build
>>>> index 758ae090c..c53e3bc3c 100644
>>>> --- a/tests/meson.build
>>>> +++ b/tests/meson.build
>>>> @@ -47,7 +47,6 @@ test_progs = [
>>>>       'kms_plane_cursor',
>>>>       'kms_plane_lowres',
>>>>       'kms_plane_multiple',
>>>> -    'kms_plane_scaling',
>>>>       'kms_prime',
>>>>       'kms_prop_blob',
>>>>       'kms_properties',
>>>> @@ -262,6 +261,7 @@ intel_kms_progs = [
>>>>       'kms_legacy_colorkey',
>>>>       'kms_mmap_write_crc',
>>>>       'kms_pipe_b_c_ivb',
>>>> +    'kms_plane_scaling',
>>>>       'kms_pm_backlight',
>>>>       'kms_pm_dc',
>>>>       'kms_pm_lpsp',
>>>> -- 
>>>> 2.43.2
>>>>
>>

