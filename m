Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFA5C27C79
	for <igt-dev@archiver.kernel.org>; Mon, 17 Jun 2024 11:16:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB3510E35C;
	Mon, 17 Jun 2024 11:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TpalqPLP";
	dkim-atps=neutral
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC65310E35C
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2024 11:16:24 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2ebeefb9a6eso45364941fa.1
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2024 04:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718622983; x=1719227783; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=QgHjazRY5wPF7TRhnUaqI37aObRnrY+e1baIBQ081h4=;
 b=TpalqPLPIA9WRLdpj6hxBKhUEMBK7h4NWtJIJvW8pa4uQrY6oPU/SGAhFLLrvQqFHA
 Je053IMXP5IXCm3Lw6SIXdD1t4Apn1kJy1+596s4QM86fxhXJvMayNKuTdk+WmNMZegN
 HhYeda+0Dak7nt9yqOXtc/cOR24o/it+dv7stM1r3c8Izacfr9HL56xQUAalGe4SorvS
 /8909CtAypCiki1pOfH0LuJwXnxPb0t3eKlU5lU5Dp6dtCUUbAa4cQbHlcdxITS4MY+j
 w/EjqZxM0oXTfde/zpAckWgA9wOGgpAW2ox3V6QN1BSWZig+rZgQo5HIcH72LDr+VYkf
 7Jqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718622983; x=1719227783;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QgHjazRY5wPF7TRhnUaqI37aObRnrY+e1baIBQ081h4=;
 b=Revakr6y5VN4AFHvcZAsfBkAyj2qFLst7L6gEn/52SXS4LZb+UAiYVSrASRXKqKjL3
 8J6G2VPCOHZnfUiSoINEEYpCycQ9Byobjx3W8ifHZMw+618e10uSPADPzMKTK47VmN7/
 MaY8cba5bloM+b7njMwBD+qDs/+vSAGTKjyBcN8MMeXQmJGdNxUKDIhzSTeSMGfLJ/UG
 N273h2rLkaLESNeFUQgtHlGL3nxCqDg5wRWuv9yy17dlmcYuyE22dAsS7mNZNx+sD8US
 SdNFviicsONzZotHcH7RVcEugDKP7S7hFnuyPOj5JnvLj2U3C2iW9URbJt1gQDBqflMP
 8pHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSwI5GiHvoYV125kmnzgfHzEof0vsGWESWaFvsRwnLz3R0j1LeC5AfnSVSX1Be09fWqJzVozTX7+CaL9iSPvMCvYMzBKwQtWW4sT19Jw==
X-Gm-Message-State: AOJu0YxXkN6fFuOiuKL4eJY6DFmANR4nahd4obi8sSHTQ+TwfKQ1P9gF
 G1iKizoDjHFy2Mvhd12WAM8+M6rhTSgOJKHX0jL/m/f8EWYymefh
X-Google-Smtp-Source: AGHT+IE4KrCyXeZhIOiXXougrQJU/mtua7uIXGYTvXK4sZZ3Wiiqei+M4UrMbQkR/O879CjjMwCDGQ==
X-Received: by 2002:a2e:9198:0:b0:2eb:ebcd:fc1c with SMTP id
 38308e7fff4ca-2ec0e47c1femr62859881fa.26.1718622982658; 
 Mon, 17 Jun 2024 04:16:22 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4229207d1a7sm115506945e9.1.2024.06.17.04.16.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 04:16:22 -0700 (PDT)
Message-ID: <f958a0bd-4c4d-4e6e-96f0-c1bf70763c24@gmail.com>
Date: Mon, 17 Jun 2024 14:16:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 03/12] lib/intel_bufops: Add linear-to-none copy path
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240527073345.54729-1-zbigniew.kempczynski@intel.com>
 <20240527073345.54729-4-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240527073345.54729-4-zbigniew.kempczynski@intel.com>
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

On 27.5.2024 10.33, Zbigniew Kempczyński wrote:
> At first glance copying linear to linear (none) is not necessary
> as ordinary memcpy() may be used. But adding this makes iterating
> over all possible tilings much easier.
> 
> In the upcoming patch I'm going to introduce tiling detection tool
> which iterates over all tilings where linear copy is also exercised.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   lib/intel_bufops.c | 35 ++++++++++++++++++++++++++++++++++-
>   1 file changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> index b4ccf4c093..30ba2547dc 100644
> --- a/lib/intel_bufops.c
> +++ b/lib/intel_bufops.c
> @@ -292,6 +292,17 @@ static unsigned long swizzle_addr(void *ptr, uint32_t swizzle)
>   	}
>   }
>   
> +static void *linear_ptr(void *ptr,
> +			unsigned int x, unsigned int y,
> +			unsigned int stride, unsigned int cpp)
> +{
> +	int pos;
> +
> +	pos = (stride/cpp * y + x) * cpp;

I was for a while thinking about this .. but I'd expect gcc will be able 
to take out that division and on source level we can keep this as is.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

> +
> +	return ptr + pos;
> +}
> +
>   static void *x_ptr(void *ptr,
>   		   unsigned int x, unsigned int y,
>   		   unsigned int stride, unsigned int cpp)
> @@ -418,6 +429,9 @@ static tile_fn __get_tile_fn_ptr(int tiling)
>   	tile_fn fn = NULL;
>   
>   	switch (tiling) {
> +	case I915_TILING_NONE:
> +		fn = linear_ptr;
> +		break;
>   	case I915_TILING_X:
>   		fn = x_ptr;
>   		break;
> @@ -598,6 +612,13 @@ static void __copy_linear_to(int fd, struct intel_buf *buf,
>   	munmap(map, buf->surface[0].size);
>   }
>   
> +static void copy_linear_to_none(struct buf_ops *bops, struct intel_buf *buf,
> +				uint32_t *linear)
> +{
> +	DEBUGFN();
> +	__copy_linear_to(bops->fd, buf, linear, I915_TILING_NONE, 0);
> +}
> +
>   static void copy_linear_to_x(struct buf_ops *bops, struct intel_buf *buf,
>   			     uint32_t *linear)
>   {
> @@ -655,6 +676,13 @@ static void __copy_to_linear(int fd, struct intel_buf *buf,
>   	munmap(map, buf->surface[0].size);
>   }
>   
> +static void copy_none_to_linear(struct buf_ops *bops, struct intel_buf *buf,
> +				uint32_t *linear)
> +{
> +	DEBUGFN();
> +	__copy_to_linear(bops->fd, buf, linear, I915_TILING_NONE, 0);
> +}
> +
>   static void copy_x_to_linear(struct buf_ops *bops, struct intel_buf *buf,
>   			     uint32_t *linear)
>   {
> @@ -1653,13 +1681,14 @@ static struct buf_ops *__buf_ops_create(int fd, bool check_idempotency)
>   		  bops->driver == INTEL_DRIVER_I915 ? "i915" : "xe");
>   
>   	if (bops->driver == INTEL_DRIVER_XE) {
> +		bops->linear_to = copy_linear_to_none;
> +		bops->to_linear = copy_none_to_linear;
>   		bops->linear_to_x = copy_linear_to_x;
>   		bops->x_to_linear = copy_x_to_linear;
>   		bops->linear_to_y = copy_linear_to_y;
>   		bops->y_to_linear = copy_y_to_linear;
>   		bops->linear_to_tile4 = copy_linear_to_tile4;
>   		bops->tile4_to_linear = copy_tile4_to_linear;
> -
>   		bops->linear_to_yf = NULL;
>   		bops->yf_to_linear = NULL;
>   		bops->linear_to_ys = NULL;
> @@ -1869,6 +1898,10 @@ bool buf_ops_set_software_tiling(struct buf_ops *bops,
>   	}
>   
>   	switch (tiling) {
> +	case I915_TILING_NONE:
> +		igt_debug("-> use SW on tiling NONE\n");
> +		break;
> +
>   	case I915_TILING_X:
>   		if (use_software_tiling) {
>   			bool supported = buf_ops_has_tiling_support(bops, tiling);

