Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905ADC27C79
	for <igt-dev@archiver.kernel.org>; Mon, 17 Jun 2024 11:16:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B52710E360;
	Mon, 17 Jun 2024 11:16:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m3uqvStx";
	dkim-atps=neutral
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 139E310E360
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2024 11:16:31 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ec17eb4493so43393811fa.2
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2024 04:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718622990; x=1719227790; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=NUEkv0gLANp33Zh1NLw/zHAEMRZtCrkZRi2aWSx6VR4=;
 b=m3uqvStxrfK9yo+VE6gx6jnz/q2b09vwDuDscAsoRFVpNHUK+mPWfRNpWT+OPLLssf
 Rnvqx8itXv+RS5xXwEFSXQfXr1BHI/62Evwgfi0RLBu7tjEW7mglAs+nHnQtPB9g4Qku
 44nNx4AkUUiPD85tVTsW6oT4T5AVjIYNIYy8Mro2NYs3YYEXdbxzm1w78LOfgMubqyft
 YfeMCndsybwBWRNJtD/wPqx5MWu9xCvylFmTwCp8myaUwExDkUq3fcbEoX69mC6v7WI8
 YqTIAabwzf1SmFuPQAyMWqAb9tMv1Y3WbaYQMIGIDP0E+Vvv2YETxpDF/PZ4Qtc2l59V
 8bTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718622990; x=1719227790;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NUEkv0gLANp33Zh1NLw/zHAEMRZtCrkZRi2aWSx6VR4=;
 b=hMhaJoSiLwBCosEUm8YaL/g86775pA71pcvl3FBuVF8ssP9lwFY04y59imAXay6ldw
 l10BFU6dwE1PDwcfQGLADaLoCxUEyC1ItgSKs1wf4NOc611CtjMO7FmHC81fNnwhfXHW
 l7ArnnybA0aGfi9+4j7h4En+l1FsS2/5zdb4HilMHn5jGFHVaORGbyJC2aImp3Xh8dPF
 uthP/9RVvDRq5NSRbuqQ9EoE3FHVflnChrxTk6eThafhbhc9VqOrwgYmrITWGDCmDvs4
 0mj/rkO8ylvpPhHMbZt+O0gikH46jRxbpFT6Qtd8JJAWkF36aldyutS3IZ0D/A+w6UEK
 Fxmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHRKNYQ95l+b5IJxyPeUpDWHaIq8h7XWEZKMFGcH9iEKo4T4WWQogO1zArrKl5al+VgeGGWFWXa0rAsrnCbcw2z4I98k6hZ19AWAlU9w==
X-Gm-Message-State: AOJu0Yw5qtd08cTEMyoStG8pPP5MTm9Sv99bIe8aFOkstRItKUgyHiow
 S1y0h3fuOUHhsgHOINWeHXXZIzCycgemhmHSL8kAkUGzMz1JW2Bqqx+Zayz5
X-Google-Smtp-Source: AGHT+IH1vBMGzgJhXxVyaiT8UA4neCk8NVAvGn+Y7lF8R0HaRtwRhNqr0/tT3zrgCdRFrpmo5ZVygg==
X-Received: by 2002:a2e:87da:0:b0:2ec:1dee:4a24 with SMTP id
 38308e7fff4ca-2ec1dee4c45mr46321201fa.44.1718622989747; 
 Mon, 17 Jun 2024 04:16:29 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4229207d1a7sm115506945e9.1.2024.06.17.04.16.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 04:16:29 -0700 (PDT)
Message-ID: <922e2354-b083-461f-a32a-17eeb54b2078@gmail.com>
Date: Mon, 17 Jun 2024 14:16:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 05/12] lib/intel_bufops: Add Yf tiling
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240527073345.54729-1-zbigniew.kempczynski@intel.com>
 <20240527073345.54729-6-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240527073345.54729-6-zbigniew.kempczynski@intel.com>
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

On 27.5.2024 10.33, Zbigniew Kempczyński wrote:
> Start supporting Yf tiling in xe as detection reveals it is Yf, not
> Tile4.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   lib/intel_bufops.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> index 56e37d2da7..36b9aa2a8c 100644
> --- a/lib/intel_bufops.c
> +++ b/lib/intel_bufops.c
> @@ -1697,8 +1697,6 @@ static struct buf_ops *__buf_ops_create(int fd, bool check_idempotencopy_linear_to_ycy)
>   		bops->y_to_linear = copy_y_to_linear;
>   		bops->linear_to_tile4 = copy_linear_to_tile4;
>   		bops->tile4_to_linear = copy_tile4_to_linear;
> -		bops->linear_to_yf = NULL;
> -		bops->yf_to_linear = NULL;
>   		bops->linear_to_ys = NULL;
>   		bops->ys_to_linear = NULL;
>   
> @@ -1954,6 +1952,10 @@ bool buf_ops_set_software_tiling(struct buf_ops *bops,
>   		igt_debug("-> use SW on tiling 4\n");
>   		break;
>   
> +	case I915_TILING_Yf:
> +		igt_debug("-> use SW on tiling Yf\n");
> +		break;
> +
>   	default:
>   		igt_warn("Invalid tiling: %d\n", tiling);
>   		was_changed = false;

