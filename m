Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B22C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 25 Apr 2024 13:08:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F7E10E511;
	Thu, 25 Apr 2024 13:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CCpXSABi";
	dkim-atps=neutral
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3006E10E511
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2024 13:08:40 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2dac77cdf43so11049051fa.2
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2024 06:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714050518; x=1714655318; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=sUONf9sPXrTCwFTWqx30bLlpgy27kSjLQoao01lCHJ0=;
 b=CCpXSABi3GiM0k0xnYbfY1RJ1gHFo0883sTdD8HrxNYRm6qXFo6bLCGZ323kJeXfZh
 abTUF+4bXnfDP+b8s213/OnKosvlER1spk7sUnUTFj4VW2tDQxUeKkSbhhCqGsrX/1Ca
 Bq6aSk/O973MncWVcb/2S/6Pk8RBFTB3oIcyQ3YIWWeKPQhx2VmZpbSIy1BOFyBhehLa
 JMlzWY5rwSNbGexmaujYeaHvW4ZRJoly1lmyJWYm6IhrFazGVusHcbeBQk9j3qP9lswn
 l4C/wzAYlAa3KsGY2xamHWKrqIbES2N1qnYPpHxyRGp1k1ouzs/vUzyuw1rt03jdVDJx
 q+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714050518; x=1714655318;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sUONf9sPXrTCwFTWqx30bLlpgy27kSjLQoao01lCHJ0=;
 b=lFMXv0o9Guenr+by+Why+yyPaGhDAkTuGlGR4kcfzRQvdKk6ueh7gtQCbZOk9LI/54
 PjbLDDER8CGqQqwv/i+tEDQDCtBlUXf4ZIeCNC2Z4AdcoTKIu6tPDGl38z6tomzHkLZ/
 /VLM4GJa5CFmLLINTuIdpnHGW+HowxSCbjvl8qRGbMp+AEEEaZtpvsMHZ41hG0Ktk0QG
 HUVtpCjKk7Ah4D56LjR3zgllvwOnqtVNRB9KLqcokcIdMn1xkl0L5aHdeiSfkv5jHGpO
 /z++yGwsm3QQbhrPqr4oltfD+z0xI/+WX/NmM157LXWHIs2K2BFfDjy6Rb4sCKjxkXsi
 q4lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHQJVPcp86YftV5B8jknzC4YLGD3zT2gTBDFWT+o6Tt7MCYxyMq8QlVkfATMr/hdQM7wzhpCsVRkLad3/35uI8AsRftcDt8msv5oZNKA==
X-Gm-Message-State: AOJu0YwebV+xbG6Lo/piGW9Xj/jfxFy8Doq0RFkHWVHablB4CP+VESTc
 zkfVFh4F1zcTaCf7oRRlP/ZAsDmehFZHReZKCskYlo0M27z1RBmtlcNc3GPUnJI=
X-Google-Smtp-Source: AGHT+IHtkmjWCO4jd7cPb2zl8kMH9gIgHQmMHgHH8i/n582QQXBeHcB1q5KJx3BnfiQQaYbIHRdbow==
X-Received: by 2002:a2e:7d11:0:b0:2d8:408c:3f5b with SMTP id
 y17-20020a2e7d11000000b002d8408c3f5bmr3988382ljc.5.1714050517960; 
 Thu, 25 Apr 2024 06:08:37 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.71])
 by smtp.googlemail.com with ESMTPSA id
 fc9-20020a05600c524900b0041ac5f19213sm9036227wmb.8.2024.04.25.06.08.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 06:08:37 -0700 (PDT)
Message-ID: <64cd3b16-55b8-42e5-8aa7-f417ecb4d5ec@gmail.com>
Date: Thu, 25 Apr 2024 16:08:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/7] lib/intel_bufops: Drop tilings restrictions
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240425104721.52376-1-zbigniew.kempczynski@intel.com>
 <20240425104721.52376-5-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240425104721.52376-5-zbigniew.kempczynski@intel.com>
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

On 25.4.2024 13.47, Zbigniew Kempczyński wrote:
> Different platforms supports different tilings so instead of asserting
> on buffer creation path move responsibility of passing valid data
> to the test. It can use intel_cmds_info to iterate over supported
> tilings so this is better extendible and requires fewer changes.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>   lib/intel_bufops.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> index 007ccdb953..b96275e485 100644
> --- a/lib/intel_bufops.c
> +++ b/lib/intel_bufops.c
> @@ -898,9 +898,6 @@ static void __intel_buf_init(struct buf_ops *bops,
>   
>   	if (compression) {
>   		igt_require(bops->intel_gen >= 9);
> -		igt_assert(req_tiling == I915_TILING_Y ||
> -			   req_tiling == I915_TILING_Yf ||
> -			   req_tiling == I915_TILING_4);

I'm wondering if it would make sense to flip this assert around instead 
of removing it? I mean would check here will not arrive linear and 
x-tile? I didn't check but I assume this compression flag will not be 
enabled for xe2?

/Juha-Pekka

>   		/*
>   		 * On GEN12+ we align the main surface to 4 * 4 main surface
>   		 * tiles, which is 64kB. These 16 tiles are mapped by 4 AUX

