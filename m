Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D25C54731
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 17:04:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26EAA10E3BF;
	Tue, 27 Aug 2024 17:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EkC0R1jE";
	dkim-atps=neutral
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6282610E3BF
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 17:04:48 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-371893dd249so3101613f8f.2
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 10:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724778286; x=1725383086; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=G935Z0YGL9LfT6MgeZQTkLOvf1vJ2QhDwUsFzb+1SN0=;
 b=EkC0R1jEeweAC6GqUTWPLmuIB9xowTRA8k0dSu5slHT1b4irUyPAamjPnfN0Pi0TuW
 thh2/dxQUdhyu/lAwzLrIKSiF+TEMPn9DRU/QBK9+Vp8FbmG1No8MEPoduf3cxCR7eFT
 b+azQiXf0lUvmtkZXIrf2rP+0mPrMFZGd6VrJLP3iOfXfq52g1SxDDdebqHUs2vovMmO
 VSUa6rKJL6b8jgHN+7C2mh72KQpFTORqAy3tzhd2+1sjGP1iBCn9TEnAOvhpLIiwieZf
 OTAYYcrpy0nDGapdRXYgULFcDddnUlMQhPrn/BIu3Gtjusb+m8iEivx5Nm/Xq7eHH0qc
 AkSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724778286; x=1725383086;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G935Z0YGL9LfT6MgeZQTkLOvf1vJ2QhDwUsFzb+1SN0=;
 b=kmPmOA6uDcirmR2ODopIh8LMyEoBZHloy/lluuiWNwM+8WzWOTwN1UXgOrhcOQBPsY
 21zPHwAaNzgBaEC1J2LL3D1kvzobnkLSmnMsQceBO0YFg/4Xlf7U3umLyGy4Mq2AWyGQ
 CKHrIu7NAzxm2W8l0a9MW//7t37mjlDfHDw+40ZpW6s2ZOE54w+rb9gwyCucM4Lc/MfP
 HlOgagn2DiamqphxHCEATduf7MiZPnuTxAdxRcY0U0LUDPAZTi1TJ4VSbRBpw4YdM+ZR
 FBL8ABLdKe2Zzd7iqjkCxmFzdoAPL9CZlLnYdTeiVIBhherZU4wXV6xWVDFPUAD6uCXV
 DdKA==
X-Gm-Message-State: AOJu0YwpwNqYA+ym8AtbmK8ixSR5abzO6ji79Fd41Gfj2TyAyEYJD+B0
 h8Q7gdQlTyD+Vh/AWdmHelURp8a76a3p5qi3VMl5pHrEzLJmPHo3vJgXcZ97cEM=
X-Google-Smtp-Source: AGHT+IFWrYKqJq3rCTxijfUs7aSVsde6rnNz3MKF1VHxwbriygVy6sXR9bfw5qh7wrKy1S0yudTL3A==
X-Received: by 2002:a05:6000:1f89:b0:371:8ca0:4d20 with SMTP id
 ffacd0b85a97d-37311862ce1mr11084703f8f.27.1724778286097; 
 Tue, 27 Aug 2024 10:04:46 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-373081ff63esm13539201f8f.87.2024.08.27.10.04.44
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 10:04:45 -0700 (PDT)
Message-ID: <0e49a924-f92e-4f16-ba05-ef402d021252@gmail.com>
Date: Tue, 27 Aug 2024 20:04:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 25/37] lib/igt_fb: Try to fix block copy media
 compression handling
To: igt-dev@lists.freedesktop.org
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
 <20240702232817.31147-26-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240702232817.31147-26-ville.syrjala@linux.intel.com>
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

On 3.7.2024 2.28, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> The media compression format handling for the block
> copy seems to be very broken.
> 
> Empirical findings from dg2:
> - the compression format needs to be based on bspec's
>    render compression format list even when doing media
>    compression
> - 0x8/B8G8G8A8 doesn't work correctly for XYUV8888 for
>    some reason, but using 0x18/R8 does seem to work
> - YUYV/etc. packed formats don't work any which way
> - planar formats can be handled as R8/R8G8/etc.
> - RGB+media compression is a lost cause (black turns white
>    when you try it)
> 
> This is all based on very cursory testing, so no idea if any
> of it is actually correct. Doesn't actually matter currently
> as we take the enginecopy path for media compression always.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/igt_fb.c | 30 ++++++++++++++++++------------
>   1 file changed, 18 insertions(+), 12 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 3b2077910349..5a1f3d5d8207 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2872,23 +2872,29 @@ static enum blt_color_depth blt_get_bpp(const struct igt_fb *fb,
>   
>   const struct {
>   	uint32_t format;
> +	int color_plane;
>   	enum blt_compression_type type;
>   	uint32_t return_value;
>   } compression_mappings[] = {
> -	{ DRM_FORMAT_XRGB16161616F, COMPRESSION_TYPE_3D, 0x5 },
> -	{ DRM_FORMAT_XRGB2101010, COMPRESSION_TYPE_3D, 0xc },
> -	{ DRM_FORMAT_XRGB8888, COMPRESSION_TYPE_3D, 0x8 },
> -	{ DRM_FORMAT_XRGB8888, COMPRESSION_TYPE_MEDIA, 8 },
> -	{ DRM_FORMAT_XYUV8888, COMPRESSION_TYPE_MEDIA, 9 },
> -	{ DRM_FORMAT_NV12, COMPRESSION_TYPE_MEDIA, 9 },
> -	{ DRM_FORMAT_P010, COMPRESSION_TYPE_MEDIA, 8 },
> +	{ DRM_FORMAT_XRGB16161616F, 0, COMPRESSION_TYPE_3D, 0x5 }, /* R16G16B16A16_FLOAT */
> +	{ DRM_FORMAT_XRGB2101010, 0, COMPRESSION_TYPE_3D, 0xc }, /* B10G10R10A2_UNORM */
> +	{ DRM_FORMAT_XRGB8888, 0, COMPRESSION_TYPE_3D, 0x8 }, /* B8G8R8A8_UNORM */
> +
> +	/* FIXME why doesn't 0x8/B8G8R8A8_UNORM work here? */
> +	{ DRM_FORMAT_XYUV8888, 0, COMPRESSION_TYPE_MEDIA, 0x18 }, /* R8_UNORM */
> +
> +	{ DRM_FORMAT_NV12, 0, COMPRESSION_TYPE_MEDIA, 0x18 }, /* R8_UNORM */
> +	{ DRM_FORMAT_NV12, 1, COMPRESSION_TYPE_MEDIA, 0xa },  /* R8G8_UNORM */
> +	{ DRM_FORMAT_P010, 0, COMPRESSION_TYPE_MEDIA, 0x14 }, /* R16_UNORM */
> +	{ DRM_FORMAT_P010, 1, COMPRESSION_TYPE_MEDIA, 0x6 },  /* R16G16_UNORM */
>   };
>   
> -static uint32_t get_compression_return_value(uint32_t format,
> +static uint32_t get_compression_return_value(uint32_t format, int color_plane,
>   					     enum  blt_compression_type type)
>   {
>   	for (int i = 0; i < ARRAY_SIZE(compression_mappings); i++) {
>   		if (compression_mappings[i].format == format &&
> +		    compression_mappings[i].color_plane == color_plane &&
>   		    compression_mappings[i].type == type) {
>   			return compression_mappings[i].return_value;
>   		}
> @@ -2898,13 +2904,13 @@ static uint32_t get_compression_return_value(uint32_t format,
>   }
>   
>   static uint32_t blt_compression_format(const struct blt_copy_object *obj,
> -				       const struct igt_fb *fb)
> +				       const struct igt_fb *fb, int color_plane)
>   {
>   	if (obj->compression == COMPRESSION_DISABLED)
>   		return 0;
>   
>   	return get_compression_return_value(igt_reduce_format(fb->drm_format),
> -					    obj->compression_type);
> +					    color_plane, obj->compression_type);
>   }
>   
>   static void setup_context_and_memory_region(const struct igt_fb *fb, uint32_t *ctx,
> @@ -2990,12 +2996,12 @@ static void do_block_copy(const struct igt_fb *src_fb,
>   
>   	if (blt_uses_extended_block_copy(src_fb->fd)) {
>   		blt_set_object_ext(&ext.src,
> -				   blt_compression_format(&blt.src, src_fb),
> +				   blt_compression_format(&blt.src, src_fb, i),
>   				   src_fb->plane_width[i], src_fb->plane_height[i],
>   				   SURFACE_TYPE_2D);
>   
>   		blt_set_object_ext(&ext.dst,
> -				   blt_compression_format(&blt.dst, dst_fb),
> +				   blt_compression_format(&blt.dst, dst_fb, i),
>   				   dst_fb->plane_width[i], dst_fb->plane_height[i],
>   				   SURFACE_TYPE_2D);
>   		pext = &ext;

