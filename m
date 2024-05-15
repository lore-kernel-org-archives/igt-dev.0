Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63ABC25B75
	for <igt-dev@archiver.kernel.org>; Wed, 15 May 2024 13:20:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802A710E83D;
	Wed, 15 May 2024 13:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aShXbiOQ";
	dkim-atps=neutral
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F9810E83D
 for <igt-dev@lists.freedesktop.org>; Wed, 15 May 2024 13:20:12 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-34dc8d3fbf1so5655712f8f.1
 for <igt-dev@lists.freedesktop.org>; Wed, 15 May 2024 06:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715779210; x=1716384010; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=OhgtcP9DGHIq8Qbviz+/SaVSpmFq6LPzIVPbB2aKQQY=;
 b=aShXbiOQAncCsQXn9nEK//aiE9u7mAxB/VqoXG0XNPXeVilAEkN6ddGDMErc1Dhg+R
 gi/jYNN3j5FR922F031UXHhXIj5a4sFXPxOVSoVQImC/9m3y3skdaV8VV7jmXxANKfXB
 +LnQF+0JSSAsiBgx+q7c4CLOq7b1AfV3m/4eJm7S5TE2urw2Y4W0gf8yyEpagKKcshHf
 PPAsPg3VGidH5HGl7c9++WVupQfl8KAQbiHQ8HVYCqEfcPY79KbEuXjwfdZfSwp0fTg5
 0qdk85ye9xjObVTcR1rGOpc/sBfYVkOaSXEYI9vKn8YMQl8I9y6LUbxQSe6AfT+Yyze5
 fxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715779210; x=1716384010;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OhgtcP9DGHIq8Qbviz+/SaVSpmFq6LPzIVPbB2aKQQY=;
 b=aysZWwVCzLin+sKSNZ4d00JoHE/e9xKcX/mRfqePg6Eqwwa6VLw5/4zoNafmImgXZz
 mKkM2QhuH+NK974Dr/7Ehi4hoNXwWF1UarbHfWWFOy6qr6Y3HrrUdxFw6aLeF+Ss6/i1
 +RsyHqAoAGKys9Ch3GBruFBjW3UQ5I1f7inv8Nu1Yq89FrAucP8r3oj20qoddy8QbAwG
 cXAIYVAGVe+5I+UqSY/1oz+GaaeBlibHKb/7tz70Ieh/zm4i9r3ECEaZXY9L3X9/P/Gj
 fZyIyset1xHGHaz7GSVJaShtfdQ4Zrn+TeHp3NeLHmbosaxmme7DIFm6epfmk2fcn0d4
 c/5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBs+1lJGfIPzeIYneXqp1QVzOyySHjtBRvod+T9yZbmCovs0PTUgbIapFfJke+znJ9pro7EDeCR4QgOeyr8AccSa5gb/xjF5f/XbU1NQ==
X-Gm-Message-State: AOJu0YxAGpL6GoQFjkQEdn0p79Ydw1d5Bh9AMAxZ7+KydP8X7zfWmyy0
 /vwT44fFcth/eJyN9UnN1A9QbL7UpFQRAcHmF2SZbxcxabPLj6QN
X-Google-Smtp-Source: AGHT+IFuyM+8CY6kXQ/MCEiiSDdos4mzcUiZT8x4srkyI/a8Qb3GB12JN/GDqK7DHGuGtTUnk6kqTw==
X-Received: by 2002:adf:eb87:0:b0:34f:5d07:ebcd with SMTP id
 ffacd0b85a97d-3504a954ec6mr11486685f8f.55.1715779210166; 
 Wed, 15 May 2024 06:20:10 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.137.89])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-351d21c8106sm146855f8f.60.2024.05.15.06.20.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 06:20:09 -0700 (PDT)
Message-ID: <fd50d789-c6ef-4421-ac73-506644857ccd@gmail.com>
Date: Wed, 15 May 2024 16:20:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 6/9] lib/intel_cmds_info: Introduce render tilings
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240515121949.245280-1-zbigniew.kempczynski@intel.com>
 <20240515121949.245280-7-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240515121949.245280-7-zbigniew.kempczynski@intel.com>
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

On 15.5.2024 15.19, Zbigniew Kempczyński wrote:
> Due to hardware differences between blitter and render regarding
> supported tilings and compression add new fields in cmds-info
> to identify available tilings via render engine.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> 
> ---
> v6: Fix tilings for gen12 (JP)
> ---
>   lib/intel_cmds_info.c | 31 +++++++++++++++++++++++++++----
>   lib/intel_cmds_info.h |  6 ++++++
>   2 files changed, 33 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/intel_cmds_info.c b/lib/intel_cmds_info.c
> index e7aabf6bfb..1416e02cd4 100644
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
> +		render_tiling_gen12 = RENDER_TILING(TILE_L_X_Y, TILE_Y);
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

