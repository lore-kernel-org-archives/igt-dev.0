Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1973CC54E67
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 13:13:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C4C10E42F;
	Wed, 20 Mar 2024 13:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Tb1l+7wV";
	dkim-atps=neutral
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D0A10E42F
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 13:13:05 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4146f2bf8ecso1081035e9.3
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 06:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710940384; x=1711545184; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=xXNrSp9twj2awuh81KaWwXsn2iAztPvZiPXI039xi6Q=;
 b=Tb1l+7wVMXEjn3EcmKwm9Q1dQUuWbrk2Vzb55NHV9lVJd4uOBr1lNxWTntvh8tMglT
 cxlovIMeJRvZd0AwGIllaOhCnOkT0TI/iMsD6UnOkP040DETlrHO1x/LKO02Zo0Cr4JO
 FGkLlBju0Bw+N5j9AjBsS/rzkx28nM6gBAQUvu68zrt3TL7k+Ivmr/cP0Ft50C18GdsB
 AKzGErN2hVH827hrvCiF2PIioqn2Gf2QZIlxHYPZ8ntX8T2giKi1MgGfRmhxLEA/J0Rk
 h0axBbbQiPBcCc519VAkmS7V4GdNLmET4AtYvTR/zmQqXy9JRtXoXBa2zMPiQpAUzJ86
 19sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710940384; x=1711545184;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xXNrSp9twj2awuh81KaWwXsn2iAztPvZiPXI039xi6Q=;
 b=kFT/anNjEYMrQV4hu+dwtw0NKHkfV6yOIUTv4Z06Hvase9ppyRJLRXi9yTNFl//kja
 9f1ul+kD/CQvb6fJmZYytyZ/Dq+0IPpI01VFAYvHq0TVIGS4YdBD+g3anhrNUZLhLI28
 Fgz3z4yYiox/fiQ9ef+tYJM0Q3UuKW60xttjtjfJ3c3RFzn9c981/4CLkHbiC7erDObP
 pr4dl4r/WrqhHqae84T+1gIH1o0wVoPOhgUFwI2gQbMmPzU3iSO2n2wD32UtiofjUjoj
 x5B9Ii2+1kijiNUbSMgIWPpdy8lum4z9sJMgEkx1rwf0rBooiyOkHCv3gkm2gLzbSYag
 GRrw==
X-Gm-Message-State: AOJu0Yyi7LnXneoPkwjYq90vCgq5rzi/IEnA8U4Z8Z/9Kx+9dxAn7CG2
 ehdsLrANNcaDHpv8AamRJSpmyL0hqJN6dO5Z0RWZwn41uptzn3T7AHbXZWMyWFriWg==
X-Google-Smtp-Source: AGHT+IELeS4/puIFgWbQq8DfHhbg9+cV/IRWrjtY1DJi30fPnDFBudguzLnqiVTr76kGnBTV93l+9Q==
X-Received: by 2002:a05:600c:1d09:b0:414:48f:a7ab with SMTP id
 l9-20020a05600c1d0900b00414048fa7abmr10240462wms.30.1710940383657; 
 Wed, 20 Mar 2024 06:13:03 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.137.85])
 by smtp.googlemail.com with ESMTPSA id
 e13-20020a05600c218d00b00412cfdc41f7sm1255113wme.0.2024.03.20.06.13.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 06:13:03 -0700 (PDT)
Message-ID: <e2e3c8a4-3b1b-4ead-8764-14c47f7545d6@gmail.com>
Date: Wed, 20 Mar 2024 15:12:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_ccs: add access to control surface
 on xe2
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
References: <20240318114758.108006-1-juhapekka.heikkila@gmail.com>
 <20240320084652.gyd4w5sc6fufqf2u@zkempczy-mobl2>
 <3bda2e06-b7b9-4e8a-a959-2cf8ed5d0d05@gmail.com>
 <20240320113457.7zc3jngv2x3faejx@zkempczy-mobl2>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240320113457.7zc3jngv2x3faejx@zkempczy-mobl2>
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

On 20.3.2024 13.34, Zbigniew Kempczyński wrote:
> On Wed, Mar 20, 2024 at 12:07:39PM +0200, Juha-Pekka Heikkila wrote:
> 
> <cut>
> 
>>>> +	bb_size = xe_bb_size(fb->fd, SZ_4K);
>>>> +	bb1 = xe_bo_create(fb->fd, 0, bb_size, sysmem, 0);
>>>> +	blt_set_batch(&surf.bb, bb1, bb_size, sysmem);
>>>> +	blt_ctrl_surf_copy(fb->fd, surf_ctx, NULL, surf_ahnd, &surf);
>>>> +	intel_ctx_xe_sync(surf_ctx, true);
>>>> +
>>>> +	ccsmap = xe_bo_map(fb->fd, ccs, surf.dst.size);
>>>> +
>>>> +	if (verify_compression) {
>>>> +		for (int i = 0; i < surf.dst.size / sizeof(uint32_t); i++) {
>>>> +			if (ccsmap[i] != 0)
>>>> +				goto ccs_vefiried;
> 
> Problem I see for noise data in fb ccsmap[] will contain only zeros
> so we catch assert below.
> 

but this part is on the other side of if() like this

+	if (verify_compression) {
+		for (int i = 0; i < surf.dst.size / sizeof(uint32_t); i++) {
+			if (ccsmap[i] != 0)
+				goto ccs_vefiried;
+		}
+		igt_assert_f(false, "framebuffer was not compressed!\n");
+	} else {
+		for (int i = 0; i < surf.dst.size / sizeof(uint32_t); i++)
+			ccsmap[i] = rand();
+	}

that verify_compression flag is set only when coming here from 
xe2_ccs_blit() where on fb is always supposing to be compressed test 
image. I made it this way just to avoid duplicating all the above code.

>>>
>>> That's minor nit, s/vefiried/verified/g.
>>>
>>> Second doesn't reside in this code, it is in the test itself:
>>>
>>> static void fill_fb_random(int drm_fd, igt_fb_t *fb)
>>> {
>>> ...
>>> 	for (i = 0; i < fb->size; i++)
>>> 		p[i] = rand();
>>> ...
>>>
>>> Randomized data might lead your surface won't be surprised at all (data
>>> are noise). I experimented with this some time ago when I played with
>>> ctrl-surf-copy. Noise wasn't compressible so I think you should less
>>> random data in case you want to check the ccs data.
>>
>> Idea of this test is exatcly as you described above. Throw completely random
>> data at control surface (same way as is done in aux ccs version of this
>> test) and see nothing breaks, ie. no hw hangs, no unexpected display
>> behaviors etc. Plan with this test is not to behave correctly towards hw but
>> just see hw survived unexpected situation.
>>
>> /Juha-Pekka
>>
>>>> +		}
>>>> +		igt_assert_f(false, "framebuffer was not compressed!\n");
> 
> I mean this one. So if I'm not wrong on some noise you may be catched
> on assertion when fb won't be compressed due to data are not
> compressible. Really assertion is your intention?

When this side of that if() is being run we're coming from 
xe2_ccs_blit() and on framebuffer is supposing to be compressed test 
image. If there's no compression information it mean blit didn't 
compress image hence assert as we have non-compressed test image.

/Juha-Pekka
