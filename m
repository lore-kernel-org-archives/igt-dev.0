Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FD0C25B75
	for <igt-dev@archiver.kernel.org>; Tue,  7 May 2024 12:35:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE0410E747;
	Tue,  7 May 2024 12:35:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AkEreD1h";
	dkim-atps=neutral
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECBCC10E747
 for <igt-dev@lists.freedesktop.org>; Tue,  7 May 2024 12:35:06 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-41b782405d5so32627045e9.2
 for <igt-dev@lists.freedesktop.org>; Tue, 07 May 2024 05:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715085305; x=1715690105; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=+4DKpZ+ZjsToL7alaPio4Xl9d6NtrGiJfoZc2BWEGK8=;
 b=AkEreD1hlZYNRGsplRqi1flHRrLMhlKnQnDfV2o3vNsY5gGK3HoUFhmwqa2EL06KZL
 r4sf5Q49F90g/nnSak2S1yj0R6MQbzYBiJjjfJVscyv81xUm77QbYPstzs90JlcQrMIM
 PlD5MCPSBsgs/ZLoJTOWhpjuVemKFcVIWcB+Z2cG5l6mcpKCxZHWeFsan8CMWyMPYoxh
 +iCWNPoXbMAVVfuGRa75DVCKyrk9YeIs33IR7z4tcFcVpd3VuDnkIZKx4jj5i58G25qZ
 bmQjVlxpxWUpS7haI/PucqsxZYbuXVR7ke7Ass3iMHxxTPFzCaJseGFPRfhRBcWgDwDT
 Nh7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715085305; x=1715690105;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+4DKpZ+ZjsToL7alaPio4Xl9d6NtrGiJfoZc2BWEGK8=;
 b=nvO+lMvidMQQaXLYH7szrpZg9MaQntcpM+63ciBoIlIEsrQJ4wgEjzdGH5Zxgp6OyI
 vtK1C5OOIMfRPAUVI5yrHaoCo3kcsbqW/1fdElE9QzWc+eqjelfA/fmrS69jHvsR9399
 tO/My0SE0Wg3LwncUpz7y0KMo8BPP3YO0XeqdtyJEqTJJt6JaidwyRQWuhJRpZH7OMH2
 5Oisezm4VyfcImBN1xd4DwHUPIRDfaWyWmV33+agzK5lX2Jy5K/m3G8WoMTWwleM+m+k
 D62QXvFgcFA1ELLleSliqyh7MMhqSD6rOQTmJsA4QXvWes+Jw4odJJseiX/jd9IdieI6
 k6UA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfNHBeyCRHZ+A5ujkrLiIuPA4PgI88nF3tAi6JAYuLDQJnuZwBj5sVHfltFo/p8HGBr8w5uj7sgWyfCKU4FEbK+vNwA2Clek67EtDWJA==
X-Gm-Message-State: AOJu0Ywc3ZPEPpuLB973Lk2oig+sRRDDZlcyv2pJ4pB/DTD/sT4eNUzP
 3HGyWouSLQ7fgmdRge5iZlgcFdSBm0IWkg2QIuU5IXuFVdw7TTWj
X-Google-Smtp-Source: AGHT+IE6welxEpETPOo1is3fz8FOmVNQJ7c/J7fbdfYsAW7qi8ZoAv1vQsEHzOgIPGOb8PuEgKmlaA==
X-Received: by 2002:a05:600c:46ce:b0:41c:2313:da8d with SMTP id
 q14-20020a05600c46ce00b0041c2313da8dmr13639925wmo.0.1715085304685; 
 Tue, 07 May 2024 05:35:04 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.78])
 by smtp.googlemail.com with ESMTPSA id
 r12-20020a05600c458c00b0041bfa2171efsm19672644wmo.40.2024.05.07.05.35.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 May 2024 05:35:04 -0700 (PDT)
Message-ID: <def81b7d-2443-4d39-8724-752d30a55090@gmail.com>
Date: Tue, 7 May 2024 15:34:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_big_fb: Fix width calculation while
 creating the intel buf
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: bhanuprakash.modem@intel.com, juha-pekka.heikkila@intel.com,
 jani.saarinen@intel.com
References: <20240507123026.57575-1-vinod.govindapillai@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240507123026.57575-1-vinod.govindapillai@intel.com>
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

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 7.5.2024 15.30, Vinod Govindapillai wrote:
> From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>   lib/igt_draw.c           | 2 +-
>   tests/intel/kms_big_fb.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_draw.c b/lib/igt_draw.c
> index 2c01d7b02..97a7e6b37 100644
> --- a/lib/igt_draw.c
> +++ b/lib/igt_draw.c
> @@ -650,7 +650,7 @@ static struct intel_buf *create_buf(int fd, struct buf_ops *bops,
>   	uint64_t region = driver == INTEL_DRIVER_XE ? vram_if_possible(fd, 0) : -1;
>   	uint64_t size = from->size;
>   
> -	width = from->width;
> +	width = from->stride / (from->bpp / 8);
>   	height = from->height;
>   	if (driver == INTEL_DRIVER_XE)
>   		size = ALIGN(size, xe_get_default_alignment(fd));
> diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
> index f7f303d41..1e45d8e42 100644
> --- a/tests/intel/kms_big_fb.c
> +++ b/tests/intel/kms_big_fb.c
> @@ -199,7 +199,7 @@ static struct intel_buf *init_buf(data_t *data,
>   	tiling = igt_fb_mod_to_tiling(fb->modifier);
>   	bpp = fb->plane_bpp[0];
>   	size = fb->size;
> -	width = fb->width;
> +	width = fb->strides[0] / (bpp / 8);
>   	height = fb->height;
>   
>   	name = gem_flink(data->drm_fd, fb->gem_handle);

