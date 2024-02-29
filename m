Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47147C48BF6
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 17:06:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3AA10E1B9;
	Thu, 29 Feb 2024 17:06:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gbC4Eqin";
	dkim-atps=neutral
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 380E210E1B9
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Feb 2024 17:06:55 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-412bf3d52d7so5420345e9.2
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Feb 2024 09:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709226413; x=1709831213; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=yVF3yOl1ZF+ruRBYYzujLh/xYGAVfYyvr2Qs4P4Vlko=;
 b=gbC4EqintKLoYJirCSAuEk1DeK6SdyM8kLIH9gnSiVfXda+XzglJmwxPZGZO6tYzOc
 sULJkT620beNu9nheJ0bnqo31A+9pL6o+yA9ahp6aG0KzynyTRkm5hyxNQ/L4vyM9/kF
 AaBKP67geLyDM+eCYYjvnuq8MbMx+oZ3D/Cr9mw+UIK77vPBMtyQ2AgugGKT6hlV7y3t
 OpSr3CKBpXxCndkDgB7WMXFokV6F/HasU7fQLOWIrYIdQ9e3NzbRF+SSNjywDGYiiM3f
 6f/dxK8xYmfNrMsvTkOtRpuZv112q+aikFeUaTdZk4XhRSf4RMwIbHLlAx/xacoCEm0v
 JFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709226413; x=1709831213;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yVF3yOl1ZF+ruRBYYzujLh/xYGAVfYyvr2Qs4P4Vlko=;
 b=Iorudk7Pi4ew5CDqHV6bJeNmn0gMuguEHOQWFMp0I8WME05Osl1p8XHUDtT8hvZgt7
 i2L29lnJ1eiEsWIHjzANSaEqN/G+AmtsLl+UVzbYk8gg/jsreyDr6UCix39Y1xv0nlOx
 /RGJ6e4NeZFxFSUXm/MB4KEd8vbwNa8O61vI/dgbKoBj4cW+uyB0HpmV44FFQA/rRHhH
 zyecdguyyIj/knRcqZNMEgEyx38Pv9JqvaSCqoX1IyEnK+lfGHEszY1rmHFUwuNW0svp
 i7mU2A0Sf4coghCVYD3OzDnCDD9XO3jG7gRHQ6qsNOo3BIu8EohjuHeJxOOIo612Bc0W
 xs/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhHqBweExiZdTjhOwq/cMszRGqdMrpyQq0eTSEeBFWUivJ+xWaGUo+ITYv2n4cZc7/3oLEmzeuiQoUh0j4xpneJRsYiR5jeXpcjb7h0A==
X-Gm-Message-State: AOJu0Yww4I9lmpl28eSDpIdpsv+oGoDSa1+7o+NEwLBBG/d/4LX1aOnY
 YlVuaCZGu+Kt0LOipL0bUaQLwvLgBuvGXg0thpkpOCL57CYwI7o3
X-Google-Smtp-Source: AGHT+IERjfxhXFkC+7WIOAkUHAFtmGuueQeLKOoUWrTyi7NSIUJij1CL8pvMlGXcPWy5hZ3qXRSmSA==
X-Received: by 2002:a05:600c:5105:b0:412:a6b:f3a5 with SMTP id
 o5-20020a05600c510500b004120a6bf3a5mr2301360wms.5.1709226413031; 
 Thu, 29 Feb 2024 09:06:53 -0800 (PST)
Received: from [0.0.0.0] ([134.134.139.84])
 by smtp.googlemail.com with ESMTPSA id
 l21-20020a05600c4f1500b004101543e843sm5911383wmq.10.2024.02.29.09.06.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 09:06:52 -0800 (PST)
Message-ID: <367b3870-47cb-4d02-b836-06d0ed662868@gmail.com>
Date: Thu, 29 Feb 2024 19:06:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/rendercopy: Fix Xe2 pixel shader
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
References: <20240226114511.51753-1-zbigniew.kempczynski@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240226114511.51753-1-zbigniew.kempczynski@intel.com>
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

I was all evening reading the spec and comparing code but I didn't also 
find place which would point this change in spec. I suspect it relate to 
that simd mode change when compare to those older shaders. I agree with 
the change as the code works but I'll still try to figure out where this 
is coming from.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 26.2.2024 13.45, Zbigniew Kempczyński wrote:
> On Xe2 start and coefficient for barycentric positions are passed
> in different location of grf register (r6). I wasn't able to find
> this information explicitly in the documentation so I've dumped
> all registers involved in the operation and deduce r6 values
> meaning. This means I may be wrong but tests which are previously
> failing on render-copy now are working fine.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> ---
>   lib/i915/shaders/ps/gen20_render_copy.asm | 4 ++--
>   lib/rendercopy_gen9.c                     | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/i915/shaders/ps/gen20_render_copy.asm b/lib/i915/shaders/ps/gen20_render_copy.asm
> index 330417966d..48057f441e 100644
> --- a/lib/i915/shaders/ps/gen20_render_copy.asm
> +++ b/lib/i915/shaders/ps/gen20_render_copy.asm
> @@ -1,7 +1,7 @@
>   L0:
> -(W)     mad (16|M0)              acc0.0<1>:f   r6.3<0;0>:f      r1.0<1;1>:f       r6.0<0>:f
> +(W)     mad (16|M0)              acc0.0<1>:f   r6.0<0;0>:f      r1.0<1;1>:f       r6.6<0>:f
>   (W)     mad (16|M0)              r113.0<1>:f   acc0.0<1;1>:f    r1.0<1;1>:f       r6.1<0>:f
> -(W)     mad (16|M0)              acc0.0<1>:f   r6.7<0;0>:f      r1.0<1;1>:f       r6.4<0>:f
> +(W)     mad (16|M0)              acc0.0<1>:f   r6.3<0;0>:f      r1.0<1;1>:f       r6.4<0>:f
>   (W)     mad (16|M0)              r114.0<1>:f   acc0.0<1;1>:f    r2.0<1;1>:f       r6.5<0>:f
>   (W)     send.smpl (16|M0)        r12      r113  null:0  0x0            0x04420001           {F@1,$0} // wr:2+0, rd:4; simd16 sample:u+v+r+ai+mlod using sampler index 0
>   (W)     send.rc (16|M0)          null     r12   null:0  0x0            0x08031400           {EOT,$0} // wr:4+0, rd:0; full-precision render target write SIMD16; last render target to surface 0
> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> index a4220d78da..dd5f1dd448 100644
> --- a/lib/rendercopy_gen9.c
> +++ b/lib/rendercopy_gen9.c
> @@ -138,9 +138,9 @@ static const uint32_t gen12p71_render_copy[][4] = {
>   };
>   
>   static const uint32_t xe2_render_copy[][4] = {
> -	{ 0x8010005b, 0x200002a0, 0x020a0634, 0x06040105 },
> +	{ 0x8010005b, 0x200002a0, 0x020a0604, 0x06640105 },
>   	{ 0x8010005b, 0x710402a8, 0x020a2001, 0x06140105 },
> -	{ 0x8010005b, 0x200002a0, 0x020a0674, 0x06440105 },
> +	{ 0x8010005b, 0x200002a0, 0x020a0634, 0x06440105 },
>   	{ 0x8010005b, 0x720402a8, 0x020a2001, 0x06540205 },
>   	{ 0x80122031, 0x0c240000, 0x20027114, 0x00800000 },
>   	{ 0x8010c031, 0x00000004, 0x58000c24, 0x00c40000 },

