Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D6AC27C79
	for <igt-dev@archiver.kernel.org>; Mon, 17 Jun 2024 16:43:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 485F710E462;
	Mon, 17 Jun 2024 16:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Tz6OTPis";
	dkim-atps=neutral
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 571DF10E462
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2024 16:43:45 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-421b9068274so40648315e9.1
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2024 09:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718642623; x=1719247423; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Ve14bbgFIjGjtLCaVW3AC4DyIQKTmAjBDmqQrsjslSI=;
 b=Tz6OTPiskeb5EVvIzrwOUma7xyGaegxYc9fJx+uZA5ZtX4srQ/cPHLQYQwh+dELfuW
 VJ38Z4uYyzCFShg5Pwwjb1B+FOW8tk9DGMSW8wfLRnd2a/gPrGUFu6C54VvNWYj28d/d
 vJVU8CfYEInxg9zbKxrPTQGsMZlszlA3yjzk2WRafl9hRW8WsJVMQ/DZdHoCcPZMAUW/
 sOuu/s/W2ZN2U/MRjAUthIqe2wOXwBLF10ZaiDvhC8R4WwdnydfmE8UYbzROFiW+Gphv
 WZvnHPvwfXSQ6564XTyAmE/jQeijUeMxcnQkCqqBzA79Ig9jl5fifab0lSeDBpu63REn
 +fNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718642623; x=1719247423;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ve14bbgFIjGjtLCaVW3AC4DyIQKTmAjBDmqQrsjslSI=;
 b=r7uLFRUw/u+3CeJYgW3mgrIRyv0jYIQpCOGSkXVEc7kjjcK9EO0/vFRWcGQntYcfL/
 CRHcz1JEprpnHug61epWVI3r+CO6xkMhwkGvYy8Me5gv1/mS4yJ7axOmjOQwsGrPevuP
 p9uPwJ3VBkFCfny9MOwp76NKLCqABNalSG3vOF4kKjDXfNARHNd8P0jkn1DMDwY0xtsv
 16L6N2eiBD8Y9lAyQ2ysWyHoan1S8zfa7gSsBp/k3m28x3LiOHCWFtMgFBBmjtomYyvJ
 ABIu+zn5p6YPKyHw4cvnhFT2FSdp4L/a16qrkReacPsJAfMriwxs9APariRcJT/Cqr63
 fMmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBUv3B/zNqvmcDsXEZTCrNoZR2CnQF5J+NJU1qvNqUOtWgDhZJxi/rBqOTGkRogMpGHHO+F6a2qcAWKWDytAyUmMfhvU6MBwEV0dkIiA==
X-Gm-Message-State: AOJu0YwkPxR7JhZ50H7FgPzo2Q3yPAkBt6uR9Ig5spchgY4BMkQsXwkc
 DG3rcSITftB5xHMnQbz4Le8Pl0aSFeh40ar74YD+VgranlHWFnxJ
X-Google-Smtp-Source: AGHT+IHGxi+axm8AZEptV3fCw/EGqX/piZIB7gFMzKg/nwY7A1LHNbdpdK5/3vdvr5QrKh1pVasEWQ==
X-Received: by 2002:a5d:6d8c:0:b0:360:9708:6820 with SMTP id
 ffacd0b85a97d-360970868ecmr2487416f8f.7.1718642623245; 
 Mon, 17 Jun 2024 09:43:43 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-36075093a1esm12173764f8f.24.2024.06.17.09.43.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 09:43:42 -0700 (PDT)
Message-ID: <8a5640de-c39f-46e8-ab47-c66b741b8466@gmail.com>
Date: Mon, 17 Jun 2024 19:43:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 11/12] lib/intel_bufops: Don't disable x and y on
 platforms without swizzling
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240527073345.54729-1-zbigniew.kempczynski@intel.com>
 <20240527073345.54729-12-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240527073345.54729-12-zbigniew.kempczynski@intel.com>
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
> Upcoming tiling detection tool wants to produce X and Y surfaces
> in software so we can't disable X and Y in supported tilings,
> otherwise there's no possibility to generate reference tiled surface.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   lib/intel_bufops.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> index d0f6ab481f..1dfc12bf45 100644
> --- a/lib/intel_bufops.c
> +++ b/lib/intel_bufops.c
> @@ -1720,7 +1720,7 @@ static struct buf_ops *__buf_ops_create(int fd, bool check_idempotency)
>   		bool supported = probe_hw_tiling(bops, I915_TILING_X,
>   						 &swizzling_supported);
>   
> -		if (!swizzling_supported) {
> +		if (!swizzling_supported && bops->intel_gen < 12) {
>   			igt_debug("Swizzling for X is not supported\n");
>   			bops->supported_tiles &= ~TILE_X;
>   		}
> @@ -1738,7 +1738,7 @@ static struct buf_ops *__buf_ops_create(int fd, bool check_idempotency)
>   		bool supported = probe_hw_tiling(bops, I915_TILING_Y,
>   						 &swizzling_supported);
>   
> -		if (!swizzling_supported) {
> +		if (!swizzling_supported && bops->intel_gen < 12) {
>   			igt_debug("Swizzling for Y is not supported\n");
>   			bops->supported_tiles &= ~TILE_Y;
>   		}

