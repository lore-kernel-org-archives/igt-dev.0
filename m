Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7F1C04FFE
	for <igt-dev@archiver.kernel.org>; Tue, 14 May 2024 17:26:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF0610E062;
	Tue, 14 May 2024 17:26:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O5dBeMWq";
	dkim-atps=neutral
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350DE10E062
 for <igt-dev@lists.freedesktop.org>; Tue, 14 May 2024 17:26:20 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5723edf0ae5so487369a12.0
 for <igt-dev@lists.freedesktop.org>; Tue, 14 May 2024 10:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715707578; x=1716312378; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=hMbfR7yP2Irj9jEpeGpRvbkHc70kJCrXokCtLmBh0M8=;
 b=O5dBeMWqGiM0+wkTRnPhV9WninH9XQTZdG3hXxzHZyBv2G1v2tCKNOVjUwz/VNgVEP
 69L7s0KtCkrS+xu+F56Jy0suroS491PXt3on14B+HDgh4NwOl2kLCQGp9RS+mYBcjPvR
 fFChHPHJYpjEHDM8DaYjWwRRJ4dLf86clfUZlZ20XlaCXo8qvz1u/Y4U/riJUh329GVB
 C717ugwV/Oog/5o1jL9lkTtKZ7JRQirwQghkoI3J+vi182pfTvHkIokPsBc/Oh2dPypb
 Bx78exn4c2eKQENj2f9S1DJVC8LPPaaZL3vqFz+JbKzual2TrocoVNMya+8uk3pnZA+h
 jHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715707578; x=1716312378;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hMbfR7yP2Irj9jEpeGpRvbkHc70kJCrXokCtLmBh0M8=;
 b=eywo9SkTtqH2+fvnk7CKLHVZP7zcrdhqxO1ioXqM+bnFmmHa1rDif/dS/j7ryAj+Nf
 kdlWnGCj5M+GeFAlKa6dfFVp7a13SFchLSI5Fws+Y7sSKkf2yjVt/CAws0HV/mwNngcO
 h1bjTI5tH5QHdxnOVgIrUZuFMNVZ5T5/s9Hap8ZlSDFRRQDxrC+q/xZEdndpeghnMb9P
 keMbuadVBCXCXMNnkzFnDczj8oP9b06V2ZIdNgB2XtFaDTneLjaVpYvRcegi4Y6CjHzP
 dJTAETTF6B1t3vEm1XHyHH7pHaZUHd3b9Y6oAg3ewOFzdO+oATVqFqJGUV/LQrLs2nun
 P0qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5TqsORdcmii7WfXvdh69EqwtbkPjbDj4PtASRZ7GpUxxjFZ76grbjKgP4797he7sMGgGG8nkVjG/ets+oTevXsXprECQLuxkdm49QLQ==
X-Gm-Message-State: AOJu0YwioMRPZpRu0S+zcd/TaB9/glo85K0SR/2oj8ovok3dsw48+pch
 lFxbvuCPMPOOh9INbu0V7LyYZfsb6yiahSIlCBE9lpq7iunotfX7
X-Google-Smtp-Source: AGHT+IEnIWfeMi748WTQcSIWBaBT+2ndEYVpSnVRXgjQSL3lBq+OSwW2TivzwEAyFjtVX7OjIm2QBg==
X-Received: by 2002:a50:9f8f:0:b0:572:a23d:7912 with SMTP id
 4fb4d7f45d1cf-5734d5c2584mr8893698a12.13.1715707578271; 
 Tue, 14 May 2024 10:26:18 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.87])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5733c2c7e25sm7672991a12.61.2024.05.14.10.26.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 10:26:17 -0700 (PDT)
Message-ID: <bc4cf013-9e90-4834-92ad-96aac9f3c548@gmail.com>
Date: Tue, 14 May 2024 20:26:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 08/11] lib/intel_cmds_info: Introduce render
 tilings
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240509053359.449885-1-zbigniew.kempczynski@intel.com>
 <20240509053359.449885-9-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240509053359.449885-9-zbigniew.kempczynski@intel.com>
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

On 9.5.2024 8.33, Zbigniew Kempczyński wrote:
> Due to hardware differences between blitter and render regarding
> supported tilings and compression add new fields in cmds-info
> to identify available tilings via render engine.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>   lib/intel_cmds_info.c | 31 +++++++++++++++++++++++++++----
>   lib/intel_cmds_info.h |  6 ++++++
>   2 files changed, 33 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/intel_cmds_info.c b/lib/intel_cmds_info.c
> index e7aabf6bfb..3f04f24f3c 100644
> --- a/lib/intel_cmds_info.c
> +++ b/lib/intel_cmds_info.c
> @@ -27,8 +27,10 @@
>   #define TILE_Y		BIT(T_YMAJOR)
>   #define TILE_Yf		BIT(T_YFMAJOR)
>   
> +#define TILE_4_64	(TILE_4 | TILE_64)
>   #define TILE_L_4_64	(TILE_L | TILE_4 | TILE_64)
>   #define TILE_L_X	(TILE_L | TILE_X)
> +#define TILE_L_X_4	(TILE_L | TILE_X | TILE_4)
>   #define TILE_L_X_Y	(TILE_L | TILE_X | TILE_Y)
>   #define TILE_L_X_4_64	(TILE_L | TILE_X | TILE_4 | TILE_64)
>   #define TILE_L_Y	(TILE_L | TILE_Y)
> @@ -93,6 +95,23 @@ static const struct blt_cmd_info
>   						 BLT_CMD_EXTENDED);
>   
>   
> +#define RENDER_TILING(_tiling, _compress_tiling)  { \
> +		.supported_tiling = _tiling, \
> +		.supported_compressed_tiling = _compress_tiling, \
> +	}
> +
> +static const struct render_tiling_info
> +		render_tiling_gen12 = RENDER_TILING(TILE_L_X_4, TILE_4);

Is this correct? I'm thinking for gen12 here would say 
RENDER_TILING(TILE_L_X_Y, TILE_Y); ?

> +
> +static const struct render_tiling_info
> +		render_tiling_mtl = RENDER_TILING(TILE_L_X_4_64, TILE_4);
> +
> +static const struct render_tiling_info
> +		render_tiling_dg2 = RENDER_TILING(TILE_L_X_4_64, TILE_4_64);
> +
> +static const struct render_tiling_info
> +		render_tiling_xe2 = RENDER_TILING(TILE_L_X_4_64, TILE_L_X_4_64);
> +
>   const struct intel_cmds_info pre_gen6_cmds_info = {
>   	.blt_cmds = {
>   		[SRC_COPY] = &src_copy,
> @@ -130,7 +149,8 @@ const struct intel_cmds_info gen12_cmds_info = {
>   		[XY_FAST_COPY] = &gen12_xy_fast_copy,
>   		[XY_BLOCK_COPY] = &gen12_xy_block_copy,
>   		[XY_COLOR_BLT] = &gen6_xy_color_blt,
> -	}
> +	},
> +	.render_tilings = &render_tiling_gen12,
>   };
>   
>   const struct intel_cmds_info gen12_dg2_cmds_info = {
> @@ -139,14 +159,16 @@ const struct intel_cmds_info gen12_dg2_cmds_info = {
>   		[XY_FAST_COPY] = &dg2_xy_fast_copy,
>   		[XY_BLOCK_COPY] = &dg2_xy_block_copy,
>   		[XY_COLOR_BLT] = &gen6_xy_color_blt,
> -	}
> +	},
> +	.render_tilings = &render_tiling_dg2,
>   };
>   
>   const struct intel_cmds_info gen12_mtl_cmds_info = {
>   	.blt_cmds = {
>   		[XY_FAST_COPY] = &dg2_xy_fast_copy,
>   		[XY_BLOCK_COPY] = &mtl_xy_block_copy,
> -	}
> +	},
> +	.render_tilings = &render_tiling_mtl,
>   };
>   
>   const struct intel_cmds_info gen12_pvc_cmds_info = {
> @@ -164,7 +186,8 @@ const struct intel_cmds_info xe2_cmds_info  = {
>   		[XY_BLOCK_COPY] = &xe2_xy_block_copy,
>   		[MEM_COPY] = &pvc_mem_copy,
>   		[MEM_SET] = &pvc_mem_set,
> -	}
> +	},
> +	.render_tilings = &render_tiling_xe2,
>   };
>   
>   const struct blt_cmd_info *blt_get_cmd_info(const struct intel_cmds_info *cmds_info,
> diff --git a/lib/intel_cmds_info.h b/lib/intel_cmds_info.h
> index 0a83b6a446..6f7d655083 100644
> --- a/lib/intel_cmds_info.h
> +++ b/lib/intel_cmds_info.h
> @@ -43,8 +43,14 @@ struct blt_cmd_info {
>   #define BLT_CMD_SUPPORTS_COMPRESSION   (1 << 1)
>   };
>   
> +struct render_tiling_info {
> +	uint32_t supported_tiling;
> +	uint32_t supported_compressed_tiling;
> +};
> +
>   struct intel_cmds_info {
>   	struct blt_cmd_info const *blt_cmds[__BLT_MAX_CMD];
> +	struct render_tiling_info const *render_tilings;
>   };
>   
>   extern const struct intel_cmds_info pre_gen6_cmds_info;

