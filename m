Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9BCC54731
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 16:37:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5959A10E388;
	Tue, 27 Aug 2024 16:37:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QvXOWxQF";
	dkim-atps=neutral
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C91610E388
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 16:37:19 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-42809d6e719so50329425e9.3
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 09:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724776638; x=1725381438; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=FGQg7x4yRYcUy45aBehFXGkebm2c+puWR5k0zpqs0l8=;
 b=QvXOWxQFhsq0BUH4IpJQYtfi0hzxuJfLxpJO0Qi/SvcUJMfeoJxx8XA0w7+vfIH1g0
 W2/73Gbk4XZmItsrTlwPbkSfbsM0lAw9FN7YYSuf/Z/IS0D0NaRwnIsfIspjhfqxR3GR
 TuDc/yPHz0NKLQ+UBijOgwbhYRoOASN1djnUgIMeF2BwLpyDHyzelBbDSwxI8occqBwp
 xOsLSyx9kBY4Z55e/qqDKmC5n4m2k1dLjkBHAhN4sVS9IxMpxZJu4kjOOe8qGfOKZ8Me
 Zlu7DiXjnxW7X9yJWHm4nNZNgsfg9Wbv5CfSTxoCrFQ3xHGdtuhqBi+wnJFFhNGI6EzY
 ectg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724776638; x=1725381438;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FGQg7x4yRYcUy45aBehFXGkebm2c+puWR5k0zpqs0l8=;
 b=jLeQC1pC8VR4uZN+gW+Pg3RGQ1uC8q4orm4+hEXYEhSwK3j6T18kalRTfqu7LrBZF8
 uWA9t0pYarJTkCKZZpzvoAhdS0nB7tjVOIcO0HbDa81EwhRzh76Mg8Vh6HQDnvt/L/If
 n24eXlYIODxw8OL5VKBz1+HsmMzabvbxTW9cDiz4xP/eXB/tgRonGgv1qVmZMtkPr8yW
 2nuhzM/5GNKeOS+L0m/4ZoalfMP5pCHPO2j3rVxhC+2lW4xVGw7hGBkfu+6g72oVFBZ9
 mdLUGZoWLr0m9OoJQ1lfNoczaTZ8a7L6n+yrgeBnrTOD5SxtdeFc7Y2XcPc19aOqiCNi
 TO1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmr6c4M5aP/wobERjjRsmPZ088YM+c8hDesp28r8C0S0M9x1Dx2LKwBEYoOK5lT0hTp5mkKx0T@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyob9CRa6K8kFAsgD9DEG7aPZ/2rpeuX1M5Q5izEKoLMGB0tdw9
 4zdKZoYG7dfx7ua7WJ4df8zNW2Nv1vFPukgbajIAoCofvndJRaSro6BAn67ItfU=
X-Google-Smtp-Source: AGHT+IGC/cF/IfCAxfL+GGKdb4D77iwM2jouKZGwQF3hMoHVRRYfQCBazidp1b3U7kUSqQGzrlGBaw==
X-Received: by 2002:a05:600c:19ca:b0:426:6220:cb57 with SMTP id
 5b1f17b1804b1-42b8a5d84b7mr76251105e9.25.1724776637602; 
 Tue, 27 Aug 2024 09:37:17 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42ac5159450sm191316195e9.17.2024.08.27.09.37.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 09:37:17 -0700 (PDT)
Message-ID: <bf310491-b5c6-4742-8c30-7ab0391bbe7b@gmail.com>
Date: Tue, 27 Aug 2024 19:37:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 16/37] lib/igt_fb: Require enginecopy for clear color
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
 <20240702232817.31147-17-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240702232817.31147-17-ville.syrjala@linux.intel.com>
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

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 3.7.2024 2.27, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> The blitter code can't currently do clear color (looks like there
> is some hardware support for it in the block copy comand, but
> not currently implemented). Require the use of enginecopy for
> clear color modifiers.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/igt_fb.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 6c9b4b7f3107..80e3c0a48bda 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2496,6 +2496,9 @@ static bool block_copy_ok(const struct igt_fb *fb)
>   
>   static bool ccs_needs_enginecopy(const struct igt_fb *fb)
>   {
> +	if (is_gen12_rc_ccs_cc_modifier(fb->modifier))
> +		return true;
> +
>   	if (is_gen12_mc_ccs_modifier(fb->modifier))
>   		return true;
>   

