Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B75BCF9C6F
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 16:53:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E71110E1A9;
	Mon, 23 Sep 2024 16:53:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J9wN0vBe";
	dkim-atps=neutral
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D205B10E1A9
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 16:53:11 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a8b155b5e9eso680223066b.1
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 09:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727110390; x=1727715190; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=M4mvNh0bBWvwEmpL3XFatdAOzbU8p3lX2ekt1LYieGo=;
 b=J9wN0vBe7Zo8z1cqs5N54x72mD8J4qx+idEPQ2LqoOkbXfxYT6Wdu6o31LUc2bYfIE
 upAUnxJIV6jJk8SMUoDXYBydCBx9F0TgEUV0/KeeRriWt3/WmgAw7FA3XtfhkaJxbVIC
 NvMhDG7zvkavhREgHoqPdMHUOFa71czHVpeKQLBVFIIIVDPNxaSx8XxMeJqSYfyxcGQI
 LVi0y24oGFXXoti436QEbqNUwPM6d3wpdcgA5NfKKfyeI9JStUugezwTtRrgIPB4tmhe
 l1H2TBXH4ZKDl664qgyy5vP89SMAkFLN9jST4KFRljwfhSQqw3+kziPonxPs+pYSI39l
 679w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727110390; x=1727715190;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M4mvNh0bBWvwEmpL3XFatdAOzbU8p3lX2ekt1LYieGo=;
 b=S627H1vplTGDE96pQLTgkHW+THu969/wW/NUiIQss4sgYM1ZmZE3129j4x0DG2Lb+1
 k0ULnvUY/2jJ5P4t1CnMssFyzWx/dACQqaxYxDtSP+pF8Y+ykEBJgNk+G3Qhf2nU4zA+
 FBc1OAF6tdQUOrCdda2umiA1jlweMbgviPAhmqh+qSzAzXUgELvldYM9gTEso7rIvXVa
 uJ8uFoV+QRpIF2j8hOg4+fojqSnDaEskRpuOUC4e5x9DQ7fPwpkMTW722VNkd4SAei5g
 ML/PPOGAd9vyf+HILLhF+CgpjggAUOtw4s9SrUDAAymGCPLp9SaJTwDN6nBGxVXfoFTI
 72FA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFe4/njaY5jF7yn5r1oVRzeeF5xfhY3TNb+zqdfKUp+6aAnhxw5uE8KzPkfCdVa/NL/Of+lXAR@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJbKsgfNLoF4Hwopd8o8qyN9+CDmrMWwhJjuP3b+oIyy0Jnj+6
 MMMhYFtPj0D9vzIHCvp6ODRB9qj0YlYcR8qbi35+0ghIZdj2t37efw7KeBTFapI=
X-Google-Smtp-Source: AGHT+IE0Hfo9h44aap5e4G8Mrx6DLPepk4p7QTV9dc8Nt50bnpYBvkeZM2u/KUL73xH1Qk0F5Qji4Q==
X-Received: by 2002:a17:907:1c1b:b0:a80:f6a9:c311 with SMTP id
 a640c23a62f3a-a90d4dfbf8dmr1279497366b.0.1727110389862; 
 Mon, 23 Sep 2024 09:53:09 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.137.74])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a906132fa97sm1249547066b.199.2024.09.23.09.53.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 09:53:09 -0700 (PDT)
Message-ID: <315dfc86-52e2-405f-bae9-dd84d23c5119@gmail.com>
Date: Mon, 23 Sep 2024 19:53:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 16/18] tests/kms_ccs: Fix planar blits for xe2
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240918120518.30258-1-ville.syrjala@linux.intel.com>
 <20240918120518.30258-17-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240918120518.30258-17-ville.syrjala@linux.intel.com>
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

On 18.9.2024 15.05, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Try to handle each color plane of planar formats
> correctly in the xe2 blitter code.
> 
> TODO: combine with the blitter code in igt_fb.c
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   tests/intel/kms_ccs.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index 971d9fe0fcae..bb18784e6fac 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -629,9 +629,10 @@ static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
>   	return blt;
>   }
>   
> -static enum blt_color_depth blt_get_bpp(const struct igt_fb *fb)
> +static enum blt_color_depth blt_get_bpp(const struct igt_fb *fb,
> +					int color_plane)
>   {
> -	switch (fb->plane_bpp[0]) {
> +	switch (fb->plane_bpp[color_plane]) {
>   	case 8:
>   		return CD_8bit;
>   	case 16:
> @@ -706,18 +707,18 @@ static void xe2_ccs_blit(data_t *data, struct igt_fb *fb, struct igt_fb *temp_fb
>   		dst = blt_fb_init(dst_fb, i, mem_region, intel_get_pat_idx_wt(dst_fb->fd));
>   
>   		blt_copy_init(src_fb->fd, &blt);
> -		blt.color_depth = blt_get_bpp(src_fb);
> +		blt.color_depth = blt_get_bpp(src_fb, i);
>   		blt_set_copy_object(&blt.src, src);
>   		blt_set_copy_object(&blt.dst, dst);
>   
>   		blt_set_object_ext(&ext.src,
>   				blt_compression_format(&blt, src_fb),
> -				src_fb->width, src_fb->height,
> +				src_fb->plane_width[i], src_fb->plane_height[i],
>   				SURFACE_TYPE_2D);
>   
>   		blt_set_object_ext(&ext.dst,
>   				blt_compression_format(&blt, dst_fb),
> -				dst_fb->width, dst_fb->height,
> +				dst_fb->plane_width[i], dst_fb->plane_height[i],
>   				SURFACE_TYPE_2D);
>   
>   		pext = &ext;

