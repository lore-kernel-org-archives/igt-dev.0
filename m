Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E2FC04FFE
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 11:53:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F7810F092;
	Wed,  8 May 2024 11:53:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VnLZYrBy";
	dkim-atps=neutral
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E9810F092
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 11:53:06 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-34dc8d3fbf1so3139042f8f.1
 for <igt-dev@lists.freedesktop.org>; Wed, 08 May 2024 04:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715169184; x=1715773984; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=4KOBDrO4veviN4SdssfCmo1+2cBD9X7e82XvRs+LIq8=;
 b=VnLZYrByuGJah16ZPU1609yYpVLZvJhcA/yyimgTs76GOlZoFAnEJzYeAZTTFLIyZU
 cPIxiuKNmsOyfyu/PIRr+dEJpRLWKoxF9LdrY5/qSnSQBDE8py8a0IUKPft2sdJKo8WE
 +SkAUSz1aJ27bOm0sxzruLtNe7tkZkQ7000o2XWspOJAh1P30DUqrvSzY9/jYISTuzys
 Qo4neJJOQ+EtM8fjKI9LCg92PFicseGCfkBV8BIyKzCnRb6854hvOkk6ASqfCAZfTcBu
 6ku1RXh1hJU7umvao2wrq22GNuToYpmq5fcrSWccFj2izAwXMDZHTczIETIeS/y5SnRB
 I91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715169184; x=1715773984;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4KOBDrO4veviN4SdssfCmo1+2cBD9X7e82XvRs+LIq8=;
 b=gS0BEVw7s6nqEKEmp15tGz8V4IL+YtPPaTvU1BvHMuYnV7FE8HPUR1I6S/bkZdsdoA
 /9KV7lUDeA6sIUjRgc3KBltWcWDZO1uC/p2iHyS09Ime2ijC7rzqr5nC1JDir1N5RWGU
 AX7OKZk33L0G9Apk3B19xcHlW+QAePi/F9LZWl08IL6u97IpKM+BGCCyL32XiLjnb/W9
 toLv/4CYrAghHl1Sl/SbK2FDU43eZFmi9B9B7mAQhqNp9iWKekSQ9H8k81ulNpHvloho
 YhWTsA+KXz6HUtLZd4Y3qM5b4bXs8DWd4Lzs9TeIOGWHzmc+EuUrEmEF+I2b6QfOqP9K
 RPWQ==
X-Gm-Message-State: AOJu0YwBDp7eq9pskbOunbEoYTYCXt7CxLXGs5ILB+R05HlzieARh6Jl
 wJTuTKfgfGbjdsUXO27JfLH+I+3hBy/P8rn7jykRt7lDU3JxC2dsszZnVyOqhIPybg==
X-Google-Smtp-Source: AGHT+IGZStGdq/HvcxyMKhR9nf18UKdulJe7fEXUyT7s+xbHmSFWOhwaw6xUyYvI1DzSEvD/89zVCw==
X-Received: by 2002:a05:6000:548:b0:34d:b73d:c62e with SMTP id
 ffacd0b85a97d-34fca80ea2cmr1624675f8f.63.1715169184217; 
 Wed, 08 May 2024 04:53:04 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.86])
 by smtp.googlemail.com with ESMTPSA id
 l7-20020a5d5267000000b0034dd13d7a5esm15153393wrc.65.2024.05.08.04.53.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 May 2024 04:53:03 -0700 (PDT)
Message-ID: <ee641ab8-041b-4f39-8e09-4be2aed1a17e@gmail.com>
Date: Wed, 8 May 2024 14:53:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 07/11] lib/intel_cmds_info: Define tiling macros
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
References: <20240507075836.259581-1-zbigniew.kempczynski@intel.com>
 <20240507075836.259581-8-zbigniew.kempczynski@intel.com>
 <cb5485b2-21ec-40a4-9df8-d9db860c9e86@gmail.com>
 <20240508071346.rl4rgfilnlwaehuk@zkempczy-mobl2>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240508071346.rl4rgfilnlwaehuk@zkempczy-mobl2>
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

On 8.5.2024 10.13, Zbigniew Kempczyński wrote:
> On Tue, May 07, 2024 at 05:27:42PM +0300, Juha-Pekka Heikkila wrote:
>> Hi Zbigniew,
>>
>> On 7.5.2024 10.58, Zbigniew Kempczyński wrote:
>>> Blitter tilings don't always matches supported render tilings so
>>> it is necessary to add separate fields for this purpose. To avoid
>>> multiple lines where supported tiling is glued with BIT(tiling)
>>> it is worth to predefine them, especially they will be used in next
>>> patch related to supported render copy tilings.
>>>
>>> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>>>
>>> ---
>>> v3: Predefine single tiling first, then complex (Karolina)
>>> ---
>>>    lib/intel_cmds_info.c | 110 +++++++++++++++++-------------------------
>>>    1 file changed, 45 insertions(+), 65 deletions(-)
>>>
>>> diff --git a/lib/intel_cmds_info.c b/lib/intel_cmds_info.c
>>> index 669d3e5006..e7aabf6bfb 100644
>>> --- a/lib/intel_cmds_info.c
>>> +++ b/lib/intel_cmds_info.c
>>> @@ -20,75 +20,59 @@
>>>    		.flags = _flags, \
>>>    	}
>>> -static const struct blt_cmd_info src_copy = BLT_INFO(SRC_COPY, BIT(T_LINEAR));
>>> -static const struct blt_cmd_info
>>> -		pre_gen6_xy_src_copy = BLT_INFO(XY_SRC_COPY,
>>> -						BIT(T_LINEAR) |
>>> -						BIT(T_XMAJOR));
>>> -static const struct blt_cmd_info
>>> -		gen6_xy_src_copy = BLT_INFO(XY_SRC_COPY,
>>> -					    BIT(T_LINEAR) |
>>> -					    BIT(T_XMAJOR) |
>>> -					    BIT(T_YMAJOR));
>>> -static const struct blt_cmd_info
>>> -		gen11_xy_fast_copy = BLT_INFO(XY_FAST_COPY,
>>> -					      BIT(T_LINEAR)  |
>>> -					      BIT(T_YMAJOR)  |
>>> -					      BIT(T_YFMAJOR) |
>>> -					      BIT(T_TILE64));
>>> -static const struct blt_cmd_info
>>> -		gen12_xy_fast_copy = BLT_INFO(XY_FAST_COPY,
>>> -					      BIT(T_LINEAR) |
>>> -					      BIT(T_YMAJOR) |
>>> -					      BIT(T_TILE4)  |
>>> -					      BIT(T_TILE64));
>>> -static const struct blt_cmd_info
>>> -		dg2_xy_fast_copy = BLT_INFO(XY_FAST_COPY,
>>> -					    BIT(T_LINEAR) |
>>> -					    BIT(T_XMAJOR) |
>>> -					    BIT(T_TILE4)  |
>>> -					    BIT(T_TILE64));
>>> -static const struct blt_cmd_info
>>> -		pvc_xy_fast_copy = BLT_INFO(XY_FAST_COPY,
>>> -					    BIT(T_LINEAR) |
>>> -					    BIT(T_TILE4)  |
>>> -					    BIT(T_TILE64));
>>> -
>>> -static const struct blt_cmd_info
>>> -		gen12_xy_block_copy = BLT_INFO(XY_BLOCK_COPY,
>>> -					       BIT(T_LINEAR) |
>>> -					       BIT(T_YMAJOR));
>>> -static const struct blt_cmd_info
>>> -		dg2_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY,
>>> -						 BIT(T_LINEAR) |
>>> -						 BIT(T_XMAJOR) |
>>> -						 BIT(T_TILE4)  |
>>> -						 BIT(T_TILE64),
>>> +#define TILE_4		BIT(T_TILE4)
>>> +#define TILE_64		BIT(T_TILE64)
>>> +#define TILE_L		BIT(T_LINEAR)
>>> +#define TILE_X		BIT(T_XMAJOR)
>>> +#define TILE_Y		BIT(T_YMAJOR)
>>> +#define TILE_Yf		BIT(T_YFMAJOR)
>>> +
>>> +#define TILE_L_4_64	(TILE_L | TILE_4 | TILE_64)
>>> +#define TILE_L_X	(TILE_L | TILE_X)
>>> +#define TILE_L_X_Y	(TILE_L | TILE_X | TILE_Y)
>>> +#define TILE_L_X_4_64	(TILE_L | TILE_X | TILE_4 | TILE_64)
>>> +#define TILE_L_Y	(TILE_L | TILE_Y)
>>> +#define TILE_L_Y_4_64	(TILE_L | TILE_Y | TILE_4 | TILE_64)
>>
>> I was wondering if this is intentional or a bug? I see this was already so
>> in previous implementation so I guess it work.. but on above line is set
>> bits for linear, y, 4 and 64tile. I think those y and 4 will never exist in
>> same device? Should here 4 be x instead?
> 
> Looking at spec I see only Linear and Y are supported on TGL. I miss
> tool which verifies what tile format are supported on given platform.
> Unfortunately linear -> <intermediate surface> -> linear only proves
> that operation is reversible, but we're not sure really what tiling
> exists in <intermediate> surface.
> 
> I've checked for fast-copy and on TGL technically we should have
> L/X/Y/4/64 (Y/4 are switched by Dword1 bit[31]). But I can't prove at
> the moment is it correct.
> 

ack. Let's go with this and if there later come ideas we'll take another 
look at this.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

>>
>> I see this is used for gen12_xy_fast_copy, could this play part in those
>> failures I had with blitter on adlp w/ x-tile?
>>
>>> +#define TILE_L_Y_Yf_64	(TILE_L | TILE_Y | TILE_Yf | TILE_64)
>>> +
>>> +static const struct blt_cmd_info src_copy = BLT_INFO(SRC_COPY, TILE_L);
>>> +static const struct blt_cmd_info
>>> +		pre_gen6_xy_src_copy = BLT_INFO(XY_SRC_COPY, TILE_L_X);
>>> +
>>> +static const struct blt_cmd_info
>>> +		gen6_xy_src_copy = BLT_INFO(XY_SRC_COPY, TILE_L_X_Y);
>>> +
>>> +static const struct blt_cmd_info
>>> +		gen11_xy_fast_copy = BLT_INFO(XY_FAST_COPY, TILE_L_Y_Yf_64);
>>> +
>>> +static const struct blt_cmd_info
>>> +		gen12_xy_fast_copy = BLT_INFO(XY_FAST_COPY, TILE_L_Y_4_64);
>>> +
>>> +static const struct blt_cmd_info
>>> +		dg2_xy_fast_copy = BLT_INFO(XY_FAST_COPY, TILE_L_X_4_64);
>>> +
>>> +static const struct blt_cmd_info
>>> +		pvc_xy_fast_copy = BLT_INFO(XY_FAST_COPY, TILE_L_4_64);
>>> +
>>> +static const struct blt_cmd_info
>>> +		gen12_xy_block_copy = BLT_INFO(XY_BLOCK_COPY, TILE_L_Y);
>>> +
>>> +static const struct blt_cmd_info
>>> +		dg2_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY, TILE_L_X_4_64,
>>>    						 BLT_CMD_EXTENDED |
>>>    						 BLT_CMD_SUPPORTS_COMPRESSION);
>>>    static const struct blt_cmd_info
>>> -		xe2_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY,
>>> -						 BIT(T_LINEAR) |
>>> -						 BIT(T_XMAJOR) |
>>> -						 BIT(T_TILE4)  |
>>> -						 BIT(T_TILE64),
>>> +		xe2_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY, TILE_L_X_4_64,
>>>    						 BLT_CMD_EXTENDED |
>>>    						 BLT_CMD_SUPPORTS_COMPRESSION);
>>>    static const struct blt_cmd_info
>>> -		mtl_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY,
>>> -						 BIT(T_LINEAR) |
>>> -						 BIT(T_XMAJOR) |
>>> -						 BIT(T_TILE4)  |
>>> -						 BIT(T_TILE64),
>>> +		mtl_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY, TILE_L_X_4_64,
>>>    						 BLT_CMD_EXTENDED);
>>>    static const struct blt_cmd_info
>>> -		pvc_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY,
>>> -						 BIT(T_LINEAR) |
>>> -						 BIT(T_TILE4)  |
>>> -						 BIT(T_TILE64),
>>> +		pvc_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY, TILE_L_4_64,
>>>    						 BLT_CMD_EXTENDED);
>>>    static const struct blt_cmd_info
>>> @@ -102,17 +86,13 @@ static const struct blt_cmd_info
>>>    				       BIT(M_MATRIX));
>>>    static const struct blt_cmd_info
>>> -		pre_gen6_xy_color_blt = BLT_INFO(XY_COLOR_BLT,
>>> -						 BIT(T_LINEAR) |
>>> -						 BIT(T_XMAJOR));
>>> +		pre_gen6_xy_color_blt = BLT_INFO(XY_COLOR_BLT, TILE_L_X);
>>>    static const struct blt_cmd_info
>>> -		gen6_xy_color_blt = BLT_INFO_EXT(XY_COLOR_BLT,
>>> -						 BIT(T_LINEAR) |
>>> -						 BIT(T_YMAJOR) |
>>> -						 BIT(T_XMAJOR),
>>> +		gen6_xy_color_blt = BLT_INFO_EXT(XY_COLOR_BLT, TILE_L_X_Y,
>>>    						 BLT_CMD_EXTENDED);
>>> +
>>>    const struct intel_cmds_info pre_gen6_cmds_info = {
>>>    	.blt_cmds = {
>>>    		[SRC_COPY] = &src_copy,
>>

