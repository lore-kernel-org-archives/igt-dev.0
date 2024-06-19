Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA67CC2BA15
	for <igt-dev@archiver.kernel.org>; Wed, 19 Jun 2024 11:32:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC6910EC55;
	Wed, 19 Jun 2024 11:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OYSNxGhI";
	dkim-atps=neutral
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA26010EC53
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Jun 2024 11:32:16 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2ebdfe26242so73441391fa.0
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Jun 2024 04:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718796734; x=1719401534; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=kffNSrd6dFCUZRuYH+QyTQ5qJx63zjMMW6KA9F4R0rE=;
 b=OYSNxGhIYZctpSM5wZnbKVrkTM3hWB5no1DKDxVbJatbZLZr8m3bXVUBJhD/fFdRfY
 0pHGu7gA/SmBafbXvWrcNhggjznZOX4yKin/8RVFjC4XO364Sd9Gc4ieo70sZqIEA1y7
 zR2TK3WJXBvqrsgCdMrbKiV9i8jHMSUFGhoY5hQQFwEXssbmrH9vReWV9DqqoRgaFO7Q
 YX2N+68z3/6WQIH3fxwWJWcW5CvWMO13uPNsmVpIk7N6KjQ2woB2GCAUVXi5Gpy7AVI8
 5xF8nU9p/8RcqawjKojJDMsxfNyjavRFpIQ2KWWc4XAQ2Pz7InQibGFi98Upoa3QYcA2
 c2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718796734; x=1719401534;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kffNSrd6dFCUZRuYH+QyTQ5qJx63zjMMW6KA9F4R0rE=;
 b=iYFccopdNjZpqwY2jTemklKXRZIdCD3fI5QmhdRUntaDu8/ST8TG6P+VfBGlrt2tLB
 8BBJ9GUhmeU1E2/IQ99NjS3oKY71CZJSznfqAKN07Ldtxu08g4bGeMMOlahjHtUX8oRO
 TIkvYvw458u/aNB1LXba4PcNZtMA23c2CxbnEb1xgPB3LIiuhyN1xPIUisqdlZH2VogO
 UJ5W0BzEW1uu7ldA4RsDtOOhHAMaqjGcMuaacQr5BWK9Lso/2ffkmCd/8HXyMi/l2iWN
 bmxm5njTTQYJPye7nisxKoV138jnb5OUKXcYMGUTjPH9LSr5cvApeMmBgtLWDQ12vdEL
 B6wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6FPk5JQsJvgQdTuufLK1U0FuMNMrHIR9YKM4NKVDcw7puxV8DqIyZr/tXqdJdPeXH0IawGZTvjMVodqPRQtiYoVZ36a1ioT1SVN7/pg==
X-Gm-Message-State: AOJu0Ywi6rc0ltB+NJsmZDZiw8ia6EyqrdX4/mrnIcSFaLc4N11tCu03
 5RJXdkpkqdvP+DBY8l7FtZRYWC/t/DMS7CMUzJRped9nVR+bRCLB
X-Google-Smtp-Source: AGHT+IGSWa4XfNXPTe8jBSVb5gqH1iZoLIDaV9XQLBB1j4gGEldAioKgGmcQ+mKEO0KXOIsDCE5ikw==
X-Received: by 2002:a2e:a415:0:b0:2eb:f86c:9d69 with SMTP id
 38308e7fff4ca-2ec3ced182amr16726461fa.29.1718796734161; 
 Wed, 19 Jun 2024 04:32:14 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.77])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42286fe919bsm260832055e9.19.2024.06.19.04.32.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 04:32:13 -0700 (PDT)
Message-ID: <95ecfbd3-a8fc-4937-92c5-5369e7ad5302@gmail.com>
Date: Wed, 19 Jun 2024 14:32:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/api_intel_bb: Fix render-ccs subtest hang
 on DG2
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240619051801.229442-1-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240619051801.229442-1-zbigniew.kempczynski@intel.com>
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

On 19.6.2024 8.18, Zbigniew Kempczyński wrote:
> Avoid hang by use appropriate compression tiling (Tile4) on DG2.
> Compressed surfaces also need to reside in vram for discrete so
> adjust this placement either.
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10380
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   tests/intel/api_intel_bb.c | 40 ++++++++++++++++++++++++--------------
>   1 file changed, 25 insertions(+), 15 deletions(-)
> 
> diff --git a/tests/intel/api_intel_bb.c b/tests/intel/api_intel_bb.c
> index 4158fa06c8..6cb5d4f9e9 100644
> --- a/tests/intel/api_intel_bb.c
> +++ b/tests/intel/api_intel_bb.c
> @@ -849,10 +849,15 @@ static void scratch_buf_init(struct buf_ops *bops,
>   			     uint32_t req_tiling,
>   			     enum i915_compression compression)
>   {
> +	int fd = buf_ops_get_fd(bops);
>   	int bpp = 32;
> +	uint32_t region = REGION_SMEM;
>   
> -	intel_buf_init(bops, buf, width, height, bpp, 0,
> -		       req_tiling, compression);
> +	if (compression && gem_has_lmem(fd))
> +		region = REGION_LMEM(0);
> +
> +	intel_buf_init_in_region(bops, buf, width, height, bpp, 0,
> +				 req_tiling, compression, region);
>   
>   	igt_assert(intel_buf_width(buf) == width);
>   	igt_assert(intel_buf_height(buf) == height);
> @@ -1419,6 +1424,7 @@ static void render_ccs(struct buf_ops *bops)
>   	uint32_t compressed = 0;
>   	uint32_t devid = intel_get_drm_devid(i915);
>   	igt_render_copyfunc_t render_copy = NULL;
> +	int tiling = IS_DG2(devid) ? I915_TILING_4 : I915_TILING_Y;
>   
>   	ibb = intel_bb_create(i915, PAGE_SIZE);
>   	if (debug_bb)
> @@ -1426,9 +1432,9 @@ static void render_ccs(struct buf_ops *bops)
>   
>   	scratch_buf_init(bops, &src, width, height, I915_TILING_NONE,
>   			 I915_COMPRESSION_NONE);
> -	scratch_buf_init(bops, &dst, width, height, I915_TILING_Y,
> +	scratch_buf_init(bops, &dst, width, height, tiling,
>   			 I915_COMPRESSION_RENDER);
> -	scratch_buf_init(bops, &dst2, width, height, I915_TILING_Y,
> +	scratch_buf_init(bops, &dst2, width, height, tiling,
>   			 I915_COMPRESSION_RENDER);
>   	scratch_buf_init(bops, &final, width, height, I915_TILING_NONE,
>   			 I915_COMPRESSION_NONE);
> @@ -1459,21 +1465,25 @@ static void render_ccs(struct buf_ops *bops)
>   		    0, 0);
>   
>   	intel_bb_sync(ibb);
> -
> -	fails = compare_bufs(&src, &final, true);
> -	compressed = count_compressed(ibb->gen, &dst);
> -
>   	intel_bb_destroy(ibb);
>   
> -	igt_debug("fails: %u, compressed: %u\n", fails, compressed);
> +	fails = compare_bufs(&src, &final, true);
> +	if (!HAS_FLATCCS(devid)) {
> +		compressed = count_compressed(ibb->gen, &dst);
> +		igt_debug("fails: %u, compressed: %u\n", fails, compressed);
> +	} else {
> +		igt_debug("fails: %u\n", fails);
> +	}
>   
>   	if (write_png) {
> -		intel_buf_write_to_png(&src, "render-ccs-src.png");
> -		intel_buf_write_to_png(&dst, "render-ccs-dst.png");
> -		intel_buf_write_to_png(&dst2, "render-ccs-dst2.png");
> -		intel_buf_write_aux_to_png(&dst, "render-ccs-dst-aux.png");
> -		intel_buf_write_aux_to_png(&dst2, "render-ccs-dst2-aux.png");
> -		intel_buf_write_to_png(&final, "render-ccs-final.png");
> +		intel_buf_raw_write_to_png(&src, "render-ccs-src.png");
> +		intel_buf_raw_write_to_png(&dst, "render-ccs-dst.png");
> +		intel_buf_raw_write_to_png(&dst2, "render-ccs-dst2.png");
> +		intel_buf_raw_write_to_png(&final, "render-ccs-final.png");
> +		if (!HAS_FLATCCS(devid)) {
> +			intel_buf_write_aux_to_png(&dst, "render-ccs-dst-aux.png");
> +			intel_buf_write_aux_to_png(&dst2, "render-ccs-dst2-aux.png");
> +		}
>   	}
>   
>   	intel_buf_close(bops, &src);

