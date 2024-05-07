Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3914C25B4F
	for <igt-dev@archiver.kernel.org>; Tue,  7 May 2024 14:05:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 485E810EE26;
	Tue,  7 May 2024 14:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="C3gI1mod";
	dkim-atps=neutral
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617F210EE26
 for <igt-dev@lists.freedesktop.org>; Tue,  7 May 2024 14:05:42 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-41ebcf01013so14048305e9.0
 for <igt-dev@lists.freedesktop.org>; Tue, 07 May 2024 07:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715090740; x=1715695540; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=y/Irjtnh9cyRI4BTpJgOidODdEiXZX2FuTu3PMZ0HNc=;
 b=C3gI1modSGFlpz2osxxGdlPoveN5hWM7acV2zQRLBiWE5xN32rszj8XkFfpenUeoFL
 6t3wMJo0CH2HaRAHLkl/vn0Zqu9ZotzOxKPbPPraInYhRSeLdN1g1QGtOiHOeOf96EYR
 VyU7euMpVdMXMJh5WY0GWm8t6Qg4Si495SGSV7LP4glnlT6I9DEbCOjU3pIgnXLFbtuw
 Uy0DwfCWDeCh2EGWI5G12dE/K4dqXi55vLLFHjuTetEhy1E1w/mYvWgKuRcjmuRDF1Qu
 Ss7dQPlIZrGEr8kPMhOw007HzGQFWAlCcywy2E61wLgofWxTkgK1xvoC+r/CCY21DMHA
 MKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715090740; x=1715695540;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y/Irjtnh9cyRI4BTpJgOidODdEiXZX2FuTu3PMZ0HNc=;
 b=IFUBRT0QKE9+P56yLn6PIGexVadhMYVUslhfBrasE3OkusSKPQAT+HckwjO4GWJ/zU
 8MwSTfmgDV0J3LBgOGkzxl+5NNjn6cRxXVAJDiILUJJRbF4aesdKSi9HY7e10PYs2JJ/
 D8m2yftMHZt2LTBEM+dl5pXQFdiEQCQmPWW37/8xIocKQEE00breMaMGXu8AGrCv6tsK
 /Uinif2cUsjf5tC8y3VkQ0nO6+HEXlTSZJuZ80hYXCkTgiY5MIBtt9PBl3t17b9rP0XU
 a9rr9H+Rkd1V/mNFsSc6aJoNId0tKs75mT9rdVu3GdsyOh4xpsBAeuVYDHfH2F+UIhSm
 SZpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV65Xpm1JIG1fD12kG2Ej5hSqJsFeZ3Xqbnvek97HB7+RP/kZaPzwpzDAhqiDTLZDsK6hshg+b8C/tlhqUq4m4FZqGz7n81rTzIZ8fbMQ==
X-Gm-Message-State: AOJu0Yxyalplo3VSgYqPr/ebS83QVonKqelGV2KrIzfsM4yHrjgwJ9E2
 BAdTFJpAFiLMKZCYAz88AdGdAe0AEAfFbtOakNnswSIwtdKcaQij
X-Google-Smtp-Source: AGHT+IH9/KL5g5WN8Lgpsb6Om+MjrPo8girx4B9cK0/9/BR3usYwm3Xt6Wathu6//rttiWiogkkclw==
X-Received: by 2002:a05:600c:35c5:b0:41b:f24a:b590 with SMTP id
 5b1f17b1804b1-41f2d440065mr25226695e9.3.1715090740226; 
 Tue, 07 May 2024 07:05:40 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.78])
 by smtp.googlemail.com with ESMTPSA id
 k5-20020a05600c1c8500b0041bab13cd74sm19775087wms.17.2024.05.07.07.05.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 May 2024 07:05:39 -0700 (PDT)
Message-ID: <c6340afd-59be-4ea6-a048-8b1dc32da715@gmail.com>
Date: Tue, 7 May 2024 17:05:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 01/11] lib/intel_bufops: Store devid on buffer
 ops creation
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240507075836.259581-1-zbigniew.kempczynski@intel.com>
 <20240507075836.259581-2-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240507075836.259581-2-zbigniew.kempczynski@intel.com>
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

On 7.5.2024 10.58, Zbigniew Kempczyński wrote:
> As I need devid to diverge intel-buf init code lets store it in
> bufops structure. This field is commonly used so add function which
> returns it.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>   lib/intel_bufops.c | 20 +++++++++++++++++---
>   lib/intel_bufops.h |  1 +
>   2 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> index 51fdf50adb..43d6dd5b43 100644
> --- a/lib/intel_bufops.c
> +++ b/lib/intel_bufops.c
> @@ -114,6 +114,7 @@ struct buf_ops {
>   	int gen_start;
>   	int gen_end;
>   	unsigned int intel_gen;
> +	uint32_t devid;
>   	uint32_t supported_tiles;
>   	uint32_t supported_hw_tiles;
>   	uint32_t swizzle_x;
> @@ -1499,12 +1500,11 @@ static bool probe_hw_tiling(struct buf_ops *bops, uint32_t tiling,
>   {
>   	uint64_t size = 256 * 256;
>   	uint32_t handle, buf_tiling, buf_swizzle, phys_swizzle;
> -	uint32_t devid, stride;
> +	uint32_t stride;
>   	int ret;
>   	bool is_set = false;
>   
> -	devid =  intel_get_drm_devid(bops->fd);
> -	stride = get_stride(devid, tiling);
> +	stride = get_stride(bops->devid, tiling);
>   	handle = gem_create(bops->fd, size);
>   
>   	/* Single shot, if no fences are available we fail immediately */
> @@ -1616,6 +1616,7 @@ static struct buf_ops *__buf_ops_create(int fd, bool check_idempotency)
>   
>   	bops->fd = fd;
>   	bops->intel_gen = generation;
> +	bops->devid = devid;
>   	bops->driver = is_i915_device(fd) ? INTEL_DRIVER_I915 :
>   					    is_xe_device(fd) ? INTEL_DRIVER_XE : 0;
>   	igt_assert(bops->driver);
> @@ -1785,6 +1786,19 @@ int buf_ops_get_fd(struct buf_ops *bops)
>   	return bops->fd;
>   }
>   
> +/**
> + * buf_ops_get_devid
> + * @bops: pointer to buf_ops
> + *
> + * Returns: device id
> + */
> +uint32_t buf_ops_get_devid(struct buf_ops *bops)
> +{
> +	igt_assert(bops);
> +
> +	return bops->devid;
> +}
> +
>   /**
>    * buf_ops_get_driver
>    * @bops: pointer to buf_ops
> diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
> index b959a8cc8e..84e71d41a2 100644
> --- a/lib/intel_bufops.h
> +++ b/lib/intel_bufops.h
> @@ -118,6 +118,7 @@ struct buf_ops *buf_ops_create(int fd);
>   struct buf_ops *buf_ops_create_with_selftest(int fd);
>   void buf_ops_destroy(struct buf_ops *bops);
>   int buf_ops_get_fd(struct buf_ops *bops);
> +uint32_t buf_ops_get_devid(struct buf_ops *bops);
>   enum intel_driver buf_ops_get_driver(struct buf_ops *bops);
>   
>   bool buf_ops_set_software_tiling(struct buf_ops *bops,

