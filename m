Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DD8C25B5F
	for <igt-dev@archiver.kernel.org>; Tue,  7 May 2024 14:27:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D07BF10F5C5;
	Tue,  7 May 2024 14:27:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CcLhEFf4";
	dkim-atps=neutral
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D4710F5C5
 for <igt-dev@lists.freedesktop.org>; Tue,  7 May 2024 14:27:49 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2db101c11beso40483891fa.0
 for <igt-dev@lists.freedesktop.org>; Tue, 07 May 2024 07:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715092067; x=1715696867; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=TmAxzv9No9NB5Kti/NuNlvtDWgT7FAGQafMNK4ITKp0=;
 b=CcLhEFf4TefTpujeP58p7wQIf5LsWZ715vpENgSznCvGXPCgGdy0M/vN47abi4nZZn
 2c4FWfPXRYtwe+50LgJwEROn3mKOrpkInp6lAXvv0/EWGky15UXBLmj9dPnclDeyBzQ3
 kbcDQiKqFmZW1lvLGDu3iEqDeoG5tO+U9poi0xcHRaML0vyShD+/CgMqJKJgxC+Orm96
 5Y0Ds//Oa2Z9KSMKVO6SMm0rMEDNYPbIjMmS5AifBovpveMyLOwWalUOmbv9t7xvUYk6
 a5VvhgR8pU77c3gyUTm6+Uc3zr3kMho+MH2igTuXw1/0gn/8u7NRX09ucFGBfujiZeB+
 yWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715092067; x=1715696867;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TmAxzv9No9NB5Kti/NuNlvtDWgT7FAGQafMNK4ITKp0=;
 b=mMxga13fwGoM1uZe+gFXqi26MdalTHZNMB99yK638R5ds22dwMsxp8LQN2rYIpiRH9
 /JIOisDgEBW+GfaqTnfl5nH3tXZc5cng8vzGpgxSeCG7ZkCxhv5+Nun2tPxJD1rO3CLc
 EUoKUJMAr8dRvsHq5kspiOaHSlNLZWmPBg475VLOyKMsiIYRiMPtCmJJhIPooLBUJwmL
 o4cTSLodREchvqXFhXIzAxutUV6lF26BTIhh+FzZmcPCppw56J3sFsfmROE4NJGY3tg2
 ce0HIVQmPg22Z3mOvz6jYSB1xUyKjNQ3i1vVHh0EQaVkn6ZHyw3OhG8gVP+7bxocg00y
 qBFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhv24dHo1i5UgmPeqV8dcw5hCzRWAIxiekhUquPfuHkXzPKNfa+1dmGOQ0UaPGOSIzCCh5WiLOA4vmvA+lTwzbJqmMqOgXtBpWc+h1cw==
X-Gm-Message-State: AOJu0Yx6o2yrhde0Nxbsgq1NC+ROl4aktmF38ew76S+XMFVw/ASO/x+Y
 AZ6WLn/0cGQgUjNXp9k2+lITS5JK6VNPqzn8tAFbeDjSTa31drU24geAMo5K2U0wiQ==
X-Google-Smtp-Source: AGHT+IEjjDhhU1v/KuQHI3tKN/u52jB1UC+BEftj0/uusKELsIrPxD58HfWzx5Sc0v+SG7/ReY6dJA==
X-Received: by 2002:a2e:9687:0:b0:2e1:bdfd:ce70 with SMTP id
 q7-20020a2e9687000000b002e1bdfdce70mr8675305lji.6.1715092066648; 
 Tue, 07 May 2024 07:27:46 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.78])
 by smtp.googlemail.com with ESMTPSA id
 n19-20020a05600c4f9300b0041c14061c71sm19668348wmq.15.2024.05.07.07.27.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 May 2024 07:27:46 -0700 (PDT)
Message-ID: <cb5485b2-21ec-40a4-9df8-d9db860c9e86@gmail.com>
Date: Tue, 7 May 2024 17:27:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 07/11] lib/intel_cmds_info: Define tiling macros
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240507075836.259581-1-zbigniew.kempczynski@intel.com>
 <20240507075836.259581-8-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240507075836.259581-8-zbigniew.kempczynski@intel.com>
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

Hi Zbigniew,

On 7.5.2024 10.58, Zbigniew Kempczyński wrote:
> Blitter tilings don't always matches supported render tilings so
> it is necessary to add separate fields for this purpose. To avoid
> multiple lines where supported tiling is glued with BIT(tiling)
> it is worth to predefine them, especially they will be used in next
> patch related to supported render copy tilings.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> 
> ---
> v3: Predefine single tiling first, then complex (Karolina)
> ---
>   lib/intel_cmds_info.c | 110 +++++++++++++++++-------------------------
>   1 file changed, 45 insertions(+), 65 deletions(-)
> 
> diff --git a/lib/intel_cmds_info.c b/lib/intel_cmds_info.c
> index 669d3e5006..e7aabf6bfb 100644
> --- a/lib/intel_cmds_info.c
> +++ b/lib/intel_cmds_info.c
> @@ -20,75 +20,59 @@
>   		.flags = _flags, \
>   	}
>   
> -static const struct blt_cmd_info src_copy = BLT_INFO(SRC_COPY, BIT(T_LINEAR));
> -static const struct blt_cmd_info
> -		pre_gen6_xy_src_copy = BLT_INFO(XY_SRC_COPY,
> -						BIT(T_LINEAR) |
> -						BIT(T_XMAJOR));
> -static const struct blt_cmd_info
> -		gen6_xy_src_copy = BLT_INFO(XY_SRC_COPY,
> -					    BIT(T_LINEAR) |
> -					    BIT(T_XMAJOR) |
> -					    BIT(T_YMAJOR));
> -static const struct blt_cmd_info
> -		gen11_xy_fast_copy = BLT_INFO(XY_FAST_COPY,
> -					      BIT(T_LINEAR)  |
> -					      BIT(T_YMAJOR)  |
> -					      BIT(T_YFMAJOR) |
> -					      BIT(T_TILE64));
> -static const struct blt_cmd_info
> -		gen12_xy_fast_copy = BLT_INFO(XY_FAST_COPY,
> -					      BIT(T_LINEAR) |
> -					      BIT(T_YMAJOR) |
> -					      BIT(T_TILE4)  |
> -					      BIT(T_TILE64));
> -static const struct blt_cmd_info
> -		dg2_xy_fast_copy = BLT_INFO(XY_FAST_COPY,
> -					    BIT(T_LINEAR) |
> -					    BIT(T_XMAJOR) |
> -					    BIT(T_TILE4)  |
> -					    BIT(T_TILE64));
> -static const struct blt_cmd_info
> -		pvc_xy_fast_copy = BLT_INFO(XY_FAST_COPY,
> -					    BIT(T_LINEAR) |
> -					    BIT(T_TILE4)  |
> -					    BIT(T_TILE64));
> -
> -static const struct blt_cmd_info
> -		gen12_xy_block_copy = BLT_INFO(XY_BLOCK_COPY,
> -					       BIT(T_LINEAR) |
> -					       BIT(T_YMAJOR));
> -static const struct blt_cmd_info
> -		dg2_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY,
> -						 BIT(T_LINEAR) |
> -						 BIT(T_XMAJOR) |
> -						 BIT(T_TILE4)  |
> -						 BIT(T_TILE64),
> +#define TILE_4		BIT(T_TILE4)
> +#define TILE_64		BIT(T_TILE64)
> +#define TILE_L		BIT(T_LINEAR)
> +#define TILE_X		BIT(T_XMAJOR)
> +#define TILE_Y		BIT(T_YMAJOR)
> +#define TILE_Yf		BIT(T_YFMAJOR)
> +
> +#define TILE_L_4_64	(TILE_L | TILE_4 | TILE_64)
> +#define TILE_L_X	(TILE_L | TILE_X)
> +#define TILE_L_X_Y	(TILE_L | TILE_X | TILE_Y)
> +#define TILE_L_X_4_64	(TILE_L | TILE_X | TILE_4 | TILE_64)
> +#define TILE_L_Y	(TILE_L | TILE_Y)
> +#define TILE_L_Y_4_64	(TILE_L | TILE_Y | TILE_4 | TILE_64)

I was wondering if this is intentional or a bug? I see this was already 
so in previous implementation so I guess it work.. but on above line is 
set bits for linear, y, 4 and 64tile. I think those y and 4 will never 
exist in same device? Should here 4 be x instead?

I see this is used for gen12_xy_fast_copy, could this play part in those 
failures I had with blitter on adlp w/ x-tile?

> +#define TILE_L_Y_Yf_64	(TILE_L | TILE_Y | TILE_Yf | TILE_64)
> +
> +static const struct blt_cmd_info src_copy = BLT_INFO(SRC_COPY, TILE_L);
> +static const struct blt_cmd_info
> +		pre_gen6_xy_src_copy = BLT_INFO(XY_SRC_COPY, TILE_L_X);
> +
> +static const struct blt_cmd_info
> +		gen6_xy_src_copy = BLT_INFO(XY_SRC_COPY, TILE_L_X_Y);
> +
> +static const struct blt_cmd_info
> +		gen11_xy_fast_copy = BLT_INFO(XY_FAST_COPY, TILE_L_Y_Yf_64);
> +
> +static const struct blt_cmd_info
> +		gen12_xy_fast_copy = BLT_INFO(XY_FAST_COPY, TILE_L_Y_4_64);
> +
> +static const struct blt_cmd_info
> +		dg2_xy_fast_copy = BLT_INFO(XY_FAST_COPY, TILE_L_X_4_64);
> +
> +static const struct blt_cmd_info
> +		pvc_xy_fast_copy = BLT_INFO(XY_FAST_COPY, TILE_L_4_64);
> +
> +static const struct blt_cmd_info
> +		gen12_xy_block_copy = BLT_INFO(XY_BLOCK_COPY, TILE_L_Y);
> +
> +static const struct blt_cmd_info
> +		dg2_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY, TILE_L_X_4_64,
>   						 BLT_CMD_EXTENDED |
>   						 BLT_CMD_SUPPORTS_COMPRESSION);
>   
>   static const struct blt_cmd_info
> -		xe2_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY,
> -						 BIT(T_LINEAR) |
> -						 BIT(T_XMAJOR) |
> -						 BIT(T_TILE4)  |
> -						 BIT(T_TILE64),
> +		xe2_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY, TILE_L_X_4_64,
>   						 BLT_CMD_EXTENDED |
>   						 BLT_CMD_SUPPORTS_COMPRESSION);
>   
>   static const struct blt_cmd_info
> -		mtl_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY,
> -						 BIT(T_LINEAR) |
> -						 BIT(T_XMAJOR) |
> -						 BIT(T_TILE4)  |
> -						 BIT(T_TILE64),
> +		mtl_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY, TILE_L_X_4_64,
>   						 BLT_CMD_EXTENDED);
>   
>   static const struct blt_cmd_info
> -		pvc_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY,
> -						 BIT(T_LINEAR) |
> -						 BIT(T_TILE4)  |
> -						 BIT(T_TILE64),
> +		pvc_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY, TILE_L_4_64,
>   						 BLT_CMD_EXTENDED);
>   
>   static const struct blt_cmd_info
> @@ -102,17 +86,13 @@ static const struct blt_cmd_info
>   				       BIT(M_MATRIX));
>   
>   static const struct blt_cmd_info
> -		pre_gen6_xy_color_blt = BLT_INFO(XY_COLOR_BLT,
> -						 BIT(T_LINEAR) |
> -						 BIT(T_XMAJOR));
> +		pre_gen6_xy_color_blt = BLT_INFO(XY_COLOR_BLT, TILE_L_X);
>   
>   static const struct blt_cmd_info
> -		gen6_xy_color_blt = BLT_INFO_EXT(XY_COLOR_BLT,
> -						 BIT(T_LINEAR) |
> -						 BIT(T_YMAJOR) |
> -						 BIT(T_XMAJOR),
> +		gen6_xy_color_blt = BLT_INFO_EXT(XY_COLOR_BLT, TILE_L_X_Y,
>   						 BLT_CMD_EXTENDED);
>   
> +
>   const struct intel_cmds_info pre_gen6_cmds_info = {
>   	.blt_cmds = {
>   		[SRC_COPY] = &src_copy,

