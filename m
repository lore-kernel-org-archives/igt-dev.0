Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E21C04FFE
	for <igt-dev@archiver.kernel.org>; Tue, 14 May 2024 17:23:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 092F010E062;
	Tue, 14 May 2024 17:23:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DqeCnqHc";
	dkim-atps=neutral
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ACAD10E062
 for <igt-dev@lists.freedesktop.org>; Tue, 14 May 2024 17:23:56 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a59a5f81af4so51150666b.3
 for <igt-dev@lists.freedesktop.org>; Tue, 14 May 2024 10:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715707434; x=1716312234; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=NRuWYMOtddKCsI77lLF30v2PUR4noQUOwpOOAp6T+5o=;
 b=DqeCnqHccNf/9jORRTJJPu07JE91ellrfTIUbKdNw/+bV6FMb+p4xJQMnq+3+bUm1m
 1vFMNn5S077QKQq9Vrdw+yEQ5/7PwFbARq/aoaAovVRw5IA/R/53HWx/rf40d6yzfkes
 DYkHGaw9hbUOhuKxgtdjOdAkMUEs5apu32WI8FLcydCJZj3wE0YvNnQ5pYBT6eChtchp
 jXMOpWvR5bJ0BQIv65EVuhXYEtzJRu4ssp1rO55fcSctTbaxKzbJQ0QnC1Tlbnt7ImBC
 enVn1ohKKt72TknS+Qd1iLhglDMPA3fe5WuJ3mfw1B7Mr1LmvSiWWM+bNYlZLr82J7yf
 Z3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715707434; x=1716312234;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NRuWYMOtddKCsI77lLF30v2PUR4noQUOwpOOAp6T+5o=;
 b=YAfpccpk/ugscZTc9eM8ljJdqzt2ax2Pb1NrbY7D1Ii905OHaDwIiqRfjxr6/NgonR
 GXQwPdLqE8x7/yYBv+JBouR20G1hIi7KvAfLnaZhZ7pYcPB6uOKMgkJ2P7W8NwXT/wal
 nrI/FMm7vq70O12y2aFXJWD3oHe9kN2Om8WT4a2G3ci33UCpSEx4fd5ifGR+1QRywbYQ
 lmmGnsIR1z4p3EsLhkI2cKhSkNWM73xP8b8JK3fwcL7K3gjuXBE+hmodQMI97ZbOmlmG
 nEKEeIax/aoQbp3fU9PsFJt+gRpuRoqnUXZGBErLkdyBhiBGzbN3/q5LL3W65QjBli+w
 4A5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxclV5qKIwVnxEWiMo1gaL9K9RYXChcPaoF6dEOfyJXKiPt2smQPHgsJ7U9WpOoQUhgJpkV++IdnXGSA0urXz04hkwMJapDs6TJTfD2w==
X-Gm-Message-State: AOJu0YyhwY/MN6uS9jFwphQaVwv7GVRYv77zhyVjR/L+pifc7ZlchqXM
 HUxW1wzLjjTuW4iWJ5+b+Ocz7h3TIg8bf/zbCASXmoU/UOx9NcAV
X-Google-Smtp-Source: AGHT+IG630VG0LHfYn8okZ139hSwQ5cBX5CQcfLdItQMwkFL4eWNd55dn95b9XwG6J6L3BnWvuz9+Q==
X-Received: by 2002:a17:907:9705:b0:a5a:7cd3:b2e7 with SMTP id
 a640c23a62f3a-a5a7cd3b463mr333437566b.11.1715707434106; 
 Tue, 14 May 2024 10:23:54 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.87])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a5a1787c686sm740827266b.47.2024.05.14.10.23.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 10:23:53 -0700 (PDT)
Message-ID: <9aa71d91-ebd5-4fa9-8bc9-dafecc07ef82@gmail.com>
Date: Tue, 14 May 2024 20:23:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 05/11] lib/intel_bufops: Start supporting
 compression on Xe2+
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240509053359.449885-1-zbigniew.kempczynski@intel.com>
 <20240509053359.449885-6-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240509053359.449885-6-zbigniew.kempczynski@intel.com>
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

On 9.5.2024 8.33, Zbigniew Kempczyński wrote:
> Xe2+ uses unified compression where PAT index determines using
> compressed pages so lets add support of that to intel-buf. It is
> necessary to run render-copy with compression on those platforms.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>   lib/intel_bufops.c | 31 +++++++++++++++++++++++++++----
>   1 file changed, 27 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> index 7118272e5f..52a5f322ea 100644
> --- a/lib/intel_bufops.c
> +++ b/lib/intel_bufops.c
> @@ -934,8 +934,14 @@ static void __intel_buf_init(struct buf_ops *bops,
>   			if (__gem_create_in_memory_regions(bops->fd, &buf->handle, &bo_size, region))
>   				igt_assert_eq(__gem_create(bops->fd, &bo_size, &buf->handle), 0);
>   		} else {
> +			uint16_t cpu_caching = __xe_default_cpu_caching(bops->fd, region, 0);
> +
> +			if (AT_LEAST_GEN(bops->devid, 20) && compression)
> +				cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
> +
>   			bo_size = ALIGN(bo_size, xe_get_default_alignment(bops->fd));
> -			buf->handle = xe_bo_create(bops->fd, 0, bo_size, region, 0);
> +			buf->handle = xe_bo_create_caching(bops->fd, 0, bo_size, region, 0,
> +							   cpu_caching);
>   		}
>   	}
>   
> @@ -970,11 +976,16 @@ void intel_buf_init(struct buf_ops *bops,
>   		    uint32_t tiling, uint32_t compression)
>   {
>   	uint64_t region;
> +	uint8_t pat_index = DEFAULT_PAT_INDEX;
> +
> +	if (compression && AT_LEAST_GEN(bops->devid, 20))
> +		pat_index = intel_get_pat_idx_uc_comp(bops->fd);
>   
>   	region = bops->driver == INTEL_DRIVER_I915 ? I915_SYSTEM_MEMORY :
>   						     system_memory(bops->fd);
>   	__intel_buf_init(bops, 0, buf, width, height, bpp, alignment,
> -			 tiling, compression, 0, 0, region, DEFAULT_PAT_INDEX,
> +			 tiling, compression, 0, 0, region,
> +			 pat_index,
>   			 DEFAULT_MOCS_INDEX);
>   
>   	intel_buf_set_ownership(buf, true);
> @@ -991,8 +1002,14 @@ void intel_buf_init_in_region(struct buf_ops *bops,
>   			      uint32_t tiling, uint32_t compression,
>   			      uint64_t region)
>   {
> +	uint8_t pat_index = DEFAULT_PAT_INDEX;
> +
> +	if (compression && AT_LEAST_GEN(bops->devid, 20))
> +		pat_index = intel_get_pat_idx_uc_comp(bops->fd);
> +
>   	__intel_buf_init(bops, 0, buf, width, height, bpp, alignment,
> -			 tiling, compression, 0, 0, region, DEFAULT_PAT_INDEX,
> +			 tiling, compression, 0, 0, region,
> +			 pat_index,
>   			 DEFAULT_MOCS_INDEX);
>   
>   	intel_buf_set_ownership(buf, true);
> @@ -1053,10 +1070,16 @@ void intel_buf_init_using_handle_and_size(struct buf_ops *bops,
>   					  uint32_t req_tiling, uint32_t compression,
>   					  uint64_t size)
>   {
> +	uint8_t pat_index = DEFAULT_PAT_INDEX;
> +
>   	igt_assert(handle);
>   	igt_assert(size);
> +
> +	if (compression && AT_LEAST_GEN(bops->devid, 20))
> +		pat_index = intel_get_pat_idx_uc_comp(bops->fd);
> +
>   	__intel_buf_init(bops, handle, buf, width, height, bpp, alignment,
> -			 req_tiling, compression, size, 0, -1, DEFAULT_PAT_INDEX,
> +			 req_tiling, compression, size, 0, -1, pat_index,
>   			 DEFAULT_MOCS_INDEX);
>   }
>   

