Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB7EC25B10
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 16:46:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21CE310E865;
	Mon, 13 May 2024 16:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fm+Jy2Bz";
	dkim-atps=neutral
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9507010E865
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 16:46:06 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4200ee47de7so15701495e9.2
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 09:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715618765; x=1716223565; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=OqDw17A+dRPeYXV7WfW1QT8txHfwsnCN5Dw7DTG/lS0=;
 b=Fm+Jy2BzoHsIxfxUQbO5gUuzF2sFynRVZu05+iL+rnnJHgYioqPVtr7YdS86yTWVRH
 6iyoURQu9ALovbgB2Zlf9+6OATZVIhMzdF50R6wudEdJNYJWNMCdFjVm4PQVXsmzpb18
 GqyRyItABdnw4NL6QLHAHoVXln6PL8pzbS7Q16wQdRrG0Ns3VckiIySRTBqIp10QUkvD
 FmepoOy6r/uk98nrIGoHoxknrbCRzRe/Ciejct7HoNLU/mUTjblnyG29jX6OHjrBAUGA
 Bs0xKFYfA83KYqffVQJMqtq7fnPdDXxp6JuxZkN9hzPwKfhWLrM3k8xAY47/7O+7q3Vp
 LiEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715618765; x=1716223565;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OqDw17A+dRPeYXV7WfW1QT8txHfwsnCN5Dw7DTG/lS0=;
 b=GgEjJUvTSzM5V9zSKnGCEu15w85oGDqwupLAbZ7XnIOho0sjBDgZg7Fx9tUebyEhqt
 lVypJPsv588PoAw3n0UrsZkVDYkh1ZPjjq9uO24QrNoVL1VcyaKdvtM1rJiFdFaYqdjv
 Dqf9YN4kDLeU3QScZLF4mkFqYgWV2iXiE/BBHU5nKlkhX4xVsWPCl1002KNeqLdETdR3
 ZXdecAmjD5YNqZdjVhLXUWrMDf6d8nFAiHZgpNAZCFLKXI2jwwiJCXchh71Xs2Gdr7lA
 xf8ecSLT3Xzfmwv09ZjOn+rFXSJCgB4kRFTO9ZQVRJeS7rSFIHv/VcJiQkYLOypBEBgX
 bQNQ==
X-Gm-Message-State: AOJu0YxTePpSkzM757Wj1+bAv52OWHrL1DlIVJJ+03IkTEPbZ1LHnBlH
 TF8sUK9r9lZQyHkNw8WgWY+pqLGhpeuh++AvtUXORvpNY7rJRB7s
X-Google-Smtp-Source: AGHT+IE29QpXyDxlG7hq3ocm4tYigaFo9wjgvZ6Jlq/WfnsNP9LOdF9u7PrAv3HeFNUWiPEt41G5PQ==
X-Received: by 2002:a05:600c:4c09:b0:41b:bb90:4bf with SMTP id
 5b1f17b1804b1-41feab40b88mr80470725e9.18.1715618764345; 
 Mon, 13 May 2024 09:46:04 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.137.87])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-41fd491c712sm91242125e9.0.2024.05.13.09.46.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 May 2024 09:46:03 -0700 (PDT)
Message-ID: <fc2d9a47-6fc3-4940-89f7-d761f7a760d3@gmail.com>
Date: Mon, 13 May 2024 19:46:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/6] lib/igt_fb: fix intel modifiers for fb
 copying on xe driver
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
References: <20240430162939.272990-1-juhapekka.heikkila@gmail.com>
 <20240430162939.272990-2-juhapekka.heikkila@gmail.com>
 <20240509094706.ibg5mpunk7p4sl2h@zkempczy-mobl2>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240509094706.ibg5mpunk7p4sl2h@zkempczy-mobl2>
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

On 9.5.2024 12.47, Zbigniew Kempczyński wrote:
> On Tue, Apr 30, 2024 at 07:29:34PM +0300, Juha-Pekka Heikkila wrote:
>> mc ccs need to go to vebox copy, blitter doesn't do mc ccs hence
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
> 
> If I'm not wrong this will switch to vebox copy on TGL and DG1
> are other platforms also touched? TGL works both on i915/xe
> whereas if I'm not wrong DG1 is i915 only.

On i915 there was already vebox in use for tgl/dg1/dg2. What I get with 
this along with those other changes is mc ccs and will go to vebox on xe 
and x-tile will go to rendercopy instead of fastblit path on xe when 
have legacy blitter.

> 
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
> 
> I've taken a look at the code and blitcopy() which does:
> 
> 	if (is_xe)
> 		do_block_copy(src_fb, dst_fb, mem_region, i, ahnd,
> 			      bb, bb_size, xe_ctx, NULL);
> 
> uses implicit assumptions regarding mc ccs established in blitter_ok()
> and use_enginecopy(). Do you see an option to migrate some
> tiling/formats/etc selection logic to intel_cmds_info? I mean I would
> like to use some centralized place to keep all the knowledge about
> that instead hardcoding conditions around the code.

This is definitely something that would make things better. As is these 
blitter/engine copy selection should be further cleaned in any case. 
Here in igt_fb.c these rules are very messy in current state.

> 
> Anyway, I see no objections to merge as it is, as such refactoring
> is time consuming and not necessary at the moment. But if you would
> consider to do that in the future it would be great.
> 
>  From me at the moment:
> 
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Thanks! I'll merge this one patch because this is bug fix and Jani 
wanted to have this merged. Those other patches I'll fix, include that 
change Kamil did wanted to see and have another round.

> --
> Zbigniew
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
>>   
>>   		linear->map = xe_bo_mmap_ext(fd, linear->fb.gem_handle,
>>   					     linear->fb.size, PROT_READ | PROT_WRITE);
>> -- 
>> 2.25.1
>>

