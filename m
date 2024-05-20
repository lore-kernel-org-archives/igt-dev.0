Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384AFC04FFE
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 10:49:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D0610E067;
	Mon, 20 May 2024 10:49:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nsGlXdAV";
	dkim-atps=neutral
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED38F10E067
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 10:49:20 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-352129e3c8eso2190294f8f.2
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 03:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716202159; x=1716806959; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=qthErZHBTW9i2p34yL0jpjn4PdV4VipoY9PILrRy31s=;
 b=nsGlXdAV2srl+dbt2R49PPZ2zUaooLJ2+CllTicoQJ3EG0O7HVCnB6RWw3LKfHvoXg
 FcGlmb+5aia8Zuo37sUhfKvHWPuDZKybOt/IfQISm5N2S39+ziU6R95Ypx76rxlFFxek
 msTnRYxqlD/RAKokVrIGjTBp6qJSRP+47yvbAb9iuUmCEd/IX0Uk1d3aFhNDsqBWQgpR
 gyFjAVlYxtMsmeKxOF9ZQaxAWJb09i4TjsmVZ9oVPGs6y1DY49dTcgxA+ET317uKdqHf
 nv8IMQOQnL5ZF+vy44SFnQ99CDhOUCkvcEAcFYO2hhk8ULgdkfkA3aEFM+I8dEYfV4bd
 IITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716202159; x=1716806959;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qthErZHBTW9i2p34yL0jpjn4PdV4VipoY9PILrRy31s=;
 b=Qd36UZ1JLgWMqrKYZPaybclxtOmeVza60KzxMImEeW2Gk5aiyIJ/J+C5lsZ8Ag8/nY
 33IEbvjPl8Nhbphce5SWhajTVWcznuk9+8YnvMzHFMiv3ErYqsrLkAjL4RhX0ihIBNeB
 ZzKXqPwtRtUKX5nmuP8rZvCABU5+jKzklaByAt9cbAPK/l2TiMyFnSQhukiPcHQJs+z0
 G3DrfRgKsDrDETMZSIAW+KzK5ZFG9qh18CxaX6wtpIvsROA0nOgPY/a8WjkmTj8xfMSX
 k1zNg1oN+krPMu4o3C2rO8+6CJrGrji2aclDEwKL4+UtfsJNpkxHPFtq+uA13wxZvpl3
 9ZKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtzx1MAqeYTCBzm7d73KzbCFXUyBsW5VGB0TNQLbMol52sFxpbQG8yMuFpqMdz2XbNb8iB63lsrN52MXFb5eF0Fyzthwer0bxP4J6bDQ==
X-Gm-Message-State: AOJu0YwHydQ+Ii9dR2OUzBH3TjiWD1MwSefrXFNEriF2KdAnhhoMZNKs
 6LWiv4rBprE50snYouhP8Om+q4j9w3fdpjYYerQg/D3hj2xUOxXf
X-Google-Smtp-Source: AGHT+IG2TFBejLCFjC1jcRrUf5dRm58O2DLyvVgRVL8zLSIkXhJLXAeyrcSte11xA9yzIOL6IY8Ksg==
X-Received: by 2002:adf:fc89:0:b0:34d:9d2c:d9e2 with SMTP id
 ffacd0b85a97d-3504a96a650mr22984299f8f.53.1716202158800; 
 Mon, 20 May 2024 03:49:18 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.78])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3502b79bc83sm28836739f8f.16.2024.05.20.03.49.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 May 2024 03:49:17 -0700 (PDT)
Message-ID: <50dbfa55-b7ff-42cf-88b7-ac5a73ad846b@gmail.com>
Date: Mon, 20 May 2024 13:49:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms: Move kms_plane_scaling to intel directory
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Mark Yacoub <markyacoub@chromium.org>
References: <20240520064150.2519210-1-bhanuprakash.modem@intel.com>
 <20240520082217.agl3fz6d6d25jyhu@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240520082217.agl3fz6d6d25jyhu@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

I didn't see why this test would need Intel HW? I see Intel hw is 
handled with special casing, normally test uses linear tiling and checks 
if Intel specific tiling can be used. What did I miss?

/Juha-Pekka

On 20.5.2024 11.22, Kamil Konieczny wrote:
> Hi Bhanuprakash,
> On 2024-05-20 at 12:11:50 +0530, Bhanuprakash Modem wrote:
>> As kms_plane_scaling is limited to run on Intel hw only,
>> move this test to tests/intel directory.
>>
>> Cc: Mark Yacoub <markyacoub@chromium.org>
>> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> 
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
>> ---
>>   tests/{ => intel}/kms_plane_scaling.c | 6 ++----
>>   tests/meson.build                     | 2 +-
>>   2 files changed, 3 insertions(+), 5 deletions(-)
>>   rename tests/{ => intel}/kms_plane_scaling.c (99%)
>>
>> diff --git a/tests/kms_plane_scaling.c b/tests/intel/kms_plane_scaling.c
>> similarity index 99%
>> rename from tests/kms_plane_scaling.c
>> rename to tests/intel/kms_plane_scaling.c
>> index acb4a1da1..620dba911 100644
>> --- a/tests/kms_plane_scaling.c
>> +++ b/tests/intel/kms_plane_scaling.c
>> @@ -1291,10 +1291,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>>   	enum pipe pipe;
>>   
>>   	igt_fixture {
>> -		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>> +		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>>   		igt_display_require(&data.display, data.drm_fd);
>> -		data.devid = is_intel_device(data.drm_fd) ?
>> -			intel_get_drm_devid(data.drm_fd) : 0;
>> +		data.devid = intel_get_drm_devid(data.drm_fd);
>>   		igt_require(data.display.is_atomic);
>>   	}
>>   
>> @@ -1464,7 +1463,6 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>>   		for (int index = 0; index < ARRAY_SIZE(intel_paramtests); index++) {
>>   			igt_describe("Test for validating max source size.");
>>   			igt_subtest_with_dynamic(intel_paramtests[index].testname) {
>> -				igt_require_intel(data.drm_fd);
>>   				for_each_pipe(&data.display, pipe) {
>>   					for_each_valid_output_on_pipe(&data.display, pipe, output) {
>>   						drmModeModeInfo *mode = NULL;
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 758ae090c..c53e3bc3c 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -47,7 +47,6 @@ test_progs = [
>>   	'kms_plane_cursor',
>>   	'kms_plane_lowres',
>>   	'kms_plane_multiple',
>> -	'kms_plane_scaling',
>>   	'kms_prime',
>>   	'kms_prop_blob',
>>   	'kms_properties',
>> @@ -262,6 +261,7 @@ intel_kms_progs = [
>>   	'kms_legacy_colorkey',
>>   	'kms_mmap_write_crc',
>>   	'kms_pipe_b_c_ivb',
>> +	'kms_plane_scaling',
>>   	'kms_pm_backlight',
>>   	'kms_pm_dc',
>>   	'kms_pm_lpsp',
>> -- 
>> 2.43.2
>>

