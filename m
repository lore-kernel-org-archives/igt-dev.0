Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A75C6FD1F
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 15:10:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9DF810F027;
	Tue, 26 Mar 2024 15:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SmSPsML1";
	dkim-atps=neutral
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A484710F027
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 15:10:47 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4141156f245so38192985e9.2
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 08:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711465846; x=1712070646; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=vHsTYkBB7fOmFkvFI4wzTPmyTuq4e723c/z5t7VMKVk=;
 b=SmSPsML1CVefo0Rn+lT9EbWxBkcwnH1hk+v4Co5t4G+zv1LljvjYJ5yfy/oe1PnBw7
 w7An6OVD2wKTVQToNNaW80yV/2WZzVAb6b7d8oJWplmO4XU4O79w71FMGB7aCwHOl/iw
 NpjDgUPnD8MY0VnVdjTC5QnV1ck0C+bTuDd7pcciann/9YdVt3Wq6KMcSos2Gtsqcn5i
 18Cwv6WxLVyyqDYIAWmb3k5LhoE5YemtW3MQNJF9NyLzz2RwoObA4avUMOiexKd1EyY5
 j6Cpvo+Y3o7NKH7Wa7wMIoYlEZaChr8iN1ISo5OEfng8/tEiBUDrk3kNvjd74E8qT4fh
 DfLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711465846; x=1712070646;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vHsTYkBB7fOmFkvFI4wzTPmyTuq4e723c/z5t7VMKVk=;
 b=a7xkXhZfv13Btg45hohWvO4lkWmq9tuYvV8ksp0n5J4aDUF7qot/tfY4Uy9IfixBDw
 T3zYh/ltMPiu+2E0WWm5yEngVzPbgSnIUdsfoomzZklYzkHJDCAIgPW12Th1qXszJDI4
 r5/RM7V99TqXXsPx7dKIQlGxsoD/FyEPEY/X3ExNlXQDXzV3x0mYuJVM2UXk8wNN/4fE
 u732TGfFh8/qVW6tb2LtidkLh38Tb+zCBFGMJ2hvdhV2daDEmEU+7ksa1TDUEJ5cQBln
 dQnNVI2VhyVlRARWG1Je8BiqWpqIgkGNyACTyJdMIBlIxw0tgTcNuCm3ZeXkVsArGvTH
 7nGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxbL6FpBimnfqAzqMXYU95rbCn2AI8TnCBrRARhf80ix4tZ3E3lU+HQfmWuYtiiI1aMLEW7pwZKczmMshjqI6fXPbgGA+JxQBNn9NSlQ==
X-Gm-Message-State: AOJu0YyabQCf1X99UkeQOj7C7cjPS4KK5uB2hYqXGP6X8VheyvCC60K3
 M/R8kaVZn1fCE8gobGY2rIsuKhtCmi/Ux7vRFCrBSpk7KbWXxawciRaTbGTQZ2g=
X-Google-Smtp-Source: AGHT+IGRSGaJ9Wvw3+Fze6Vy8sEYzf7grYQldEnebbJjsD4nMXk3KnkriGH/At7RaSrx3poh7JxZSg==
X-Received: by 2002:a05:600c:4505:b0:412:e50f:acaf with SMTP id
 t5-20020a05600c450500b00412e50facafmr6964568wmo.24.1711465845480; 
 Tue, 26 Mar 2024 08:10:45 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.71])
 by smtp.googlemail.com with ESMTPSA id
 u15-20020a05600c00cf00b00414041032casm1003915wmm.1.2024.03.26.08.10.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Mar 2024 08:10:45 -0700 (PDT)
Message-ID: <bbb9bb08-89d1-44e3-8684-30357ba2cc36@gmail.com>
Date: Tue, 26 Mar 2024 17:10:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_fb: fix intel modifiers for fb copying on
 xe driver
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240322120914.205342-1-juhapekka.heikkila@gmail.com>
 <df8ea083-6c18-41cf-9912-7f0a80d648da@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <df8ea083-6c18-41cf-9912-7f0a80d648da@intel.com>
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

On 26.3.2024 12.07, Modem, Bhanuprakash wrote:
> 
> On 22-03-2024 05:39 pm, Juha-Pekka Heikkila wrote:
>> legacy blitter doesn't handle x-tile well so use rendercopy instead.
>> mc ccs need to go to vebox copy, blitter doesn't do mc ccs hence
>> on all platforms with ccs modifiers use engine copy for those.
> 
> Do we need to split this patch into two (1: x-tile, 2: mc ccs)?

I don't know does that make much sense as the changes are at the very 
same locations.

> 
> Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

I'll still need to see why those fails happened, not sure was this all 
correct.

> 
> - Bhanu
> 
>>
>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> ---
>>   lib/igt_fb.c | 25 ++++++++++++++++++-------
>>   1 file changed, 18 insertions(+), 7 deletions(-)
>>
>> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
>> index cc70cb91c..9557492cf 100644
>> --- a/lib/igt_fb.c
>> +++ b/lib/igt_fb.c
>> @@ -2508,11 +2508,13 @@ static bool blitter_ok(const struct igt_fb *fb)
>>       if (!is_intel_device(fb->fd))
>>           return false;
>> -    if ((is_ccs_modifier(fb->modifier) &&
>> -         !HAS_FLATCCS(intel_get_drm_devid(fb->fd))) ||
>> -         is_gen12_mc_ccs_modifier(fb->modifier))
>> +    if (is_ccs_modifier(fb->modifier))
>>           return false;
>> +    if (!blt_uses_extended_block_copy(fb->fd) &&
>> +        fb->modifier == I915_FORMAT_MOD_X_TILED)
>> +        return false;
>> +
>>       if (is_xe_device(fb->fd))
>>           return true;
>> @@ -2551,8 +2553,9 @@ static bool use_enginecopy(const struct igt_fb *fb)
>>           return false;
>>       return fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
>> -           (!HAS_FLATCCS(intel_get_drm_devid(fb->fd)) && 
>> is_ccs_modifier(fb->modifier)) ||
>> -           is_gen12_mc_ccs_modifier(fb->modifier);
>> +           is_ccs_modifier(fb->modifier) ||
>> +           (!blt_uses_extended_block_copy(fb->fd) &&
>> +           fb->modifier == I915_FORMAT_MOD_X_TILED);
>>   }
>>   static bool use_blitter(const struct igt_fb *fb)
>> @@ -3062,7 +3065,12 @@ static void free_linear_mapping(struct 
>> fb_blit_upload *blit)
>>           igt_nouveau_delete_bo(&linear->fb);
>>       } else if (is_xe_device(fd)) {
>>           gem_munmap(linear->map, linear->fb.size);
>> -        blitcopy(fb, &linear->fb);
>> +
>> +        if (blit->ibb)
>> +            copy_with_engine(blit, fb, &linear->fb);
>> +        else
>> +            blitcopy(fb, &linear->fb);
>> +
>>           gem_close(fd, linear->fb.gem_handle);
>>       } else {
>>           gem_munmap(linear->map, linear->fb.size);
>> @@ -3142,7 +3150,10 @@ static void setup_linear_mapping(struct 
>> fb_blit_upload *blit)
>>           linear->map = igt_nouveau_mmap_bo(&linear->fb, PROT_READ | 
>> PROT_WRITE);
>>       } else if (is_xe_device(fd)) {
>> -        blitcopy(&linear->fb, fb);
>> +        if (blit->ibb)
>> +            copy_with_engine(blit, &linear->fb, fb);
>> +        else
>> +            blitcopy(&linear->fb, fb);
>>           linear->map = xe_bo_mmap_ext(fd, linear->fb.gem_handle,
>>                            linear->fb.size, PROT_READ | PROT_WRITE);

