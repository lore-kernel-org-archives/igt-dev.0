Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A565C04FFE
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 19:18:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915E0112930;
	Wed,  8 May 2024 19:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WN2m7LO3";
	dkim-atps=neutral
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75765112930
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 19:18:00 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a59c0a6415fso21848266b.1
 for <igt-dev@lists.freedesktop.org>; Wed, 08 May 2024 12:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715195878; x=1715800678; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=VEnUsI5DxZzGpkV3VgP9K3bYVVIEk29uNg4FiTDxt2U=;
 b=WN2m7LO3VMsR1mM/r2L8ruN18lVejZE0Lek1Q/tj7zbNnPN7BxTFMlSylvzvHjK8Xk
 4qzZCG5veJg+QTvPpbDPdrULSmn17BTryudHL3tqscBolIVizEdQ961o1MsftZRYhnRj
 b+zkDzZIzAxZtNdCCEv/YzP/RCw/nOIj9gAOR6BUIRoz+OwFdD/eo/SDw3tHyTCDQnGG
 4vVBc0BLTDNArCgKzDtrhwljSoSYqpsS/rDwehVYZmi2i5H8AmBTXog0MuNoYp/37mpX
 YnOkuaa/o1ivjnW1nEe73oP+tRnTJPDC3DKQDGPelAK3CinPwBWRELKN9e8hzrwSwqVW
 NfJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715195878; x=1715800678;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VEnUsI5DxZzGpkV3VgP9K3bYVVIEk29uNg4FiTDxt2U=;
 b=eX3jFj6kKk79+hJ73C9ccFGWiTwKkN6YdcwScJx8jU0xYgDpaGZdTKAvjkRyv3CqJA
 8g2fRRhE/nG6bJT9jVJuzLJIzSbWEdMhlPX3b60lrnLr0HRcv7KSpXiDDA6uVM173tam
 WbpsGdB5HMWdAt9Zx6Q6E4JOhG/TKvtu+cPHGnDGC+ofkRzamS1f9OJvvdPpKc5qVzRg
 OST8ugcNYCYt7HTH0aKdzKJrSrZo2MZGvyKCFguaLmfFkrj5OwQ6WjAHK+cZmUUO31Pu
 BS7m/X2L9hrAPoXWDJefMLO3+qZjMARhUDnoTni5UWkxQspkqM7Wc68lYOHl/AJVKAjr
 jwyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXg0RWeyE75Ck87wHQY17Axf8c0RWEjJI0PPVdLWpTgz4AKYizwCsxBEK6JCWV/ORWTWH0qUp89zWAd60E1FBvebuxa7hkKYvwIq6O3JQ==
X-Gm-Message-State: AOJu0Yzp+p1jPXk0bZKJ+ZwNjSlIunu13ybIl4dR182z3xBpTrCBdlgq
 I3K+eAkHrjlg0EnyQcxif7qeBSZdRjQZGM2HcU2dRAdCOcGSjGF2EfdX+ohHEy6VAA==
X-Google-Smtp-Source: AGHT+IGNKTz+cAEqpeq1HXk/EVdswhPQGx5kQVSvQz9o5Plw83AUEGOw30EiuouMQBJwzrdWh0vk7Q==
X-Received: by 2002:a17:907:10d9:b0:a59:f098:3a2e with SMTP id
 a640c23a62f3a-a59fb95a1aamr214815766b.33.1715195878140; 
 Wed, 08 May 2024 12:17:58 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.78])
 by smtp.googlemail.com with ESMTPSA id
 y17-20020a17090668d100b00a59bacd35ddsm5033058ejr.98.2024.05.08.12.17.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 May 2024 12:17:57 -0700 (PDT)
Message-ID: <1eb0f28c-76cf-4760-bce2-1ad04e547578@gmail.com>
Date: Wed, 8 May 2024 22:17:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/6] lib/igt_fb: fix intel modifiers for fb
 copying on xe driver
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240430162939.272990-1-juhapekka.heikkila@gmail.com>
 <20240430162939.272990-2-juhapekka.heikkila@gmail.com>
 <20240508145401.y6mng4gxv4rbsle7@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240508145401.y6mng4gxv4rbsle7@kamilkon-DESK.igk.intel.com>
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

On 8.5.2024 17.54, Kamil Konieczny wrote:
> Hi Juha-Pekka,
> On 2024-04-30 at 19:29:34 +0300, Juha-Pekka Heikkila wrote:
>> mc ccs need to go to vebox copy, blitter doesn't do mc ccs hence
> - ^^^^^^
> Could you decipher here (or even better as a comment in source and
> here) what does 'mc ccs' mean?

It hasn't been common practice to explain any framebuffer modifiers in 
detail at this level because they are comprehensively documented in 
include/drm-uapi/drm_fourcc.h which is copy from kernel sources.

Leaving comment here now could cause confusion if there come changes, 
it's better they're documented in same place where they are defined.

>> on all platforms with ccs modifiers use engine copy for those.
>> Use render engine for x-tile on legacy platforms where x-tile
>> would otherwise endup on fastblit patch which is known to have
>> limitations.
>>
>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> ---
>>   lib/igt_fb.c | 22 +++++++++++++++++-----
>>   1 file changed, 17 insertions(+), 5 deletions(-)
>>
>> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
>> index cc70cb91c..5df5cb08f 100644
>> --- a/lib/igt_fb.c
>> +++ b/lib/igt_fb.c
>> @@ -2508,9 +2508,12 @@ static bool blitter_ok(const struct igt_fb *fb)
>>   	if (!is_intel_device(fb->fd))
>>   		return false;
>>   
>> -	if ((is_ccs_modifier(fb->modifier) &&
>> -	     !HAS_FLATCCS(intel_get_drm_devid(fb->fd))) ||
>> -	     is_gen12_mc_ccs_modifier(fb->modifier))
>> +	if ((!HAS_FLATCCS(intel_get_drm_devid(fb->fd)) &&
>> +	    is_ccs_modifier(fb->modifier)) ||
>> +	    is_gen12_mc_ccs_modifier(fb->modifier) ||
>> +	    (!blt_uses_extended_block_copy(fb->fd) &&
>> +	    fb->modifier == I915_FORMAT_MOD_X_TILED &&
>> +	    is_xe_device(fb->fd)))
>>   		return false;
>>   
>>   	if (is_xe_device(fb->fd))
>> @@ -2551,6 +2554,7 @@ static bool use_enginecopy(const struct igt_fb *fb)
>>   		return false;
>>   
>>   	return fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
>> +	       fb->modifier == I915_FORMAT_MOD_X_TILED ||
>>   	       (!HAS_FLATCCS(intel_get_drm_devid(fb->fd)) && is_ccs_modifier(fb->modifier)) ||
>>   	       is_gen12_mc_ccs_modifier(fb->modifier);
>>   }
>> @@ -3062,7 +3066,12 @@ static void free_linear_mapping(struct fb_blit_upload *blit)
>>   		igt_nouveau_delete_bo(&linear->fb);
>>   	} else if (is_xe_device(fd)) {
>>   		gem_munmap(linear->map, linear->fb.size);
>> -		blitcopy(fb, &linear->fb);
>> +
>> +		if (blit->ibb)
>> +			copy_with_engine(blit, fb, &linear->fb);
>> +		else
>> +			blitcopy(fb, &linear->fb);
>> +
>>   		gem_close(fd, linear->fb.gem_handle);
>>   	} else {
>>   		gem_munmap(linear->map, linear->fb.size);
>> @@ -3142,7 +3151,10 @@ static void setup_linear_mapping(struct fb_blit_upload *blit)
>>   
>>   		linear->map = igt_nouveau_mmap_bo(&linear->fb, PROT_READ | PROT_WRITE);
>>   	} else if (is_xe_device(fd)) {
>> -		blitcopy(&linear->fb, fb);
>> +		if (blit->ibb)
>> +			copy_with_engine(blit, &linear->fb, fb);
>> +		else
>> +			blitcopy(&linear->fb, fb);
> 
> This is repeated code, what about a function like:
> 
> copy_with_engine_or_blit(blit, &linear->fb, fb);

That's good idea, this type restructuring will go into a new patch. Most 
of this set already is just about restructuring blitter path to be more 
readable. But scope of this patch is about fixing mc ccs and x-tile path 
on all platforms.

/Juha-Pekka

> 
>>   
>>   		linear->map = xe_bo_mmap_ext(fd, linear->fb.gem_handle,
>>   					     linear->fb.size, PROT_READ | PROT_WRITE);
>> -- 
>> 2.25.1
>>

