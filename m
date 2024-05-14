Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2864CC04FFE
	for <igt-dev@archiver.kernel.org>; Tue, 14 May 2024 17:25:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F9610E062;
	Tue, 14 May 2024 17:25:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YR377ELE";
	dkim-atps=neutral
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51C7A10E062
 for <igt-dev@lists.freedesktop.org>; Tue, 14 May 2024 17:25:37 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2e1fa1f1d9bso103457401fa.0
 for <igt-dev@lists.freedesktop.org>; Tue, 14 May 2024 10:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715707535; x=1716312335; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Z/dE4WRV2LUPT3Up5709WWUXgi9gKfddLILC/bDP5PM=;
 b=YR377ELEqtT+XcroM5dIk7hgqca5SswXX/thI+0QQBp0oRN+Ox2695WH08qQrsWRWF
 qYElWFwxO2CUwdfgr/IE6pYg/qC1Ix8VQUmbACj1vuX2E9LuRQwqmI3Rq1ZlObt+9DSb
 mvi8XZXY+a2uzVV1oraCpThDf/mkVZDQTGVQrIddKk7IwS6Qm69H5eHRyM7lqf9Q6lhe
 EdVwDFZEyZoGOEI9t08QCicvLoN3PIW6FuNIGq4ffbC3TSvASm+nSo9jSJN6eh2UGLaV
 /Q+2N934o0jo5HkZ647z+BJBWJcWJa01KFaDDV+iejAAxV1956kAAl527fUtEeP5d+FC
 DjRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715707535; x=1716312335;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z/dE4WRV2LUPT3Up5709WWUXgi9gKfddLILC/bDP5PM=;
 b=uvIUFhqJWX566N51y+wpAhbSZFGgycWLyuPHQO9XTg6t8BbDPUBjuXL9lSAdXDEq/o
 d649FqTKuM1a6eAVyHGE8ldIcL52FrwsZSNUPghuvTpharFt0m7y8x0vModobFd767g7
 Orp2FexLuZeBpRpW8w5npjWa/l2eBRJHvQHLvWsf8hTnZC941gwVlx0S3NvwUGQ1kPhN
 GmA8/gysGGWTWmOXTQsayJgSQXSdIyO802hfBnLtWvWfZbe5GzGRYZMeG49nea7ugaBi
 Hlq277owmf0h2pDFwkbSfVRdFWAPYJE2gvK7amkyyaC9ZA5gkHCd3iVbSMMVWRN8EbZW
 QaPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpaWSR6oaefEHGPC57VNzv6nAer85xKkTBHX04uENhvXIKPsQrbJoft0kMpsGW+fGDNHHja+eLdfqNqTIXWUfL4KFa6lpkKV2YoDmE8A==
X-Gm-Message-State: AOJu0YxMCgY7/EjG0/fKUfpNZ1fl9ipkCxZbzl50uRJWtU2GwhNkMbF/
 7BLP+hJkoBZ0ZNFuISan5+M5e/B88XwNH2Qquo+pElhs6YYO1Tqr
X-Google-Smtp-Source: AGHT+IGdfXdwCdSmD8hxbcPw+DFEpMUybRwSiettht9D6FtX8ZBckyuiS7jk9UCsbEastxuw73VwtA==
X-Received: by 2002:a05:651c:2114:b0:2e1:cb0f:4e1e with SMTP id
 38308e7fff4ca-2e51fc34061mr124247301fa.2.1715707534803; 
 Tue, 14 May 2024 10:25:34 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.87])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a5a8ab75812sm60570466b.158.2024.05.14.10.25.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 10:25:34 -0700 (PDT)
Message-ID: <d4c7df91-0eef-42fc-9653-4159e9300759@gmail.com>
Date: Tue, 14 May 2024 20:25:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 06/11] lib/rendercopy_gen9: Separate xe and xe2
 compression format
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240509053359.449885-1-zbigniew.kempczynski@intel.com>
 <20240509053359.449885-7-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240509053359.449885-7-zbigniew.kempczynski@intel.com>
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
> Xe and beyond differ how compression format is handled. For Xe it
> is 5-bit long whereas for Xe2+ this is 4-bit long field. Instead of
> artifically packing 0-15 into 5-bit field lets separate this structures
> to conform with the documentation.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   lib/gen9_render.h     | 31 +++++++++++++++++++++----------
>   lib/rendercopy_gen9.c | 24 ++++++++++++++++--------
>   2 files changed, 37 insertions(+), 18 deletions(-)
> 
> diff --git a/lib/gen9_render.h b/lib/gen9_render.h
> index 8ed60a2a54..4c1ed4726a 100644
> --- a/lib/gen9_render.h
> +++ b/lib/gen9_render.h
> @@ -154,16 +154,27 @@ struct gen9_surface_state {
>   		uint32_t aux_base_addr_hi;
>   	} ss11;
>   
> -	struct {
> -		/*
> -		 * compression_format is used only dg2 onward.
> -		 * prior to dg2 full ss12 is used for the address
> -		 * but due to alignments bits 0..6 will be zero
> -		 * and asserted in code to be so
> -		 */
> -		uint32_t compression_format:5;
> -		uint32_t pad0:1;
> -		uint32_t clear_address:26;
> +	union {
> +		struct {
> +			/*
> +			 * compression_format is used only dg2 onward.
> +			 * prior to dg2 full ss12 is used for the address
> +			 * but due to alignments bits 0..6 will be zero
> +			 * and asserted in code to be so
> +			 */
> +			uint32_t compression_format:5;
> +			uint32_t pad0:1;
> +			uint32_t clear_address:26;
> +		} xe;
> +
> +		struct {
> +			/*
> +			 * On Xe2+ compression format is 4-bit long.
> +			 */
> +			uint32_t compression_format:4;
> +			uint32_t mip_region_depth_in_log:4;
> +			uint32_t pad0:24;
> +		} xe2;

I'd prefer here use same naming convention as with rest of the 
structure. Ie. xe would become dg2 as commented above and xe2 I figure 
is likely lnl.

otherwise everything look ok, with those fixed

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

>   	} ss12;
>   
>   	struct {
> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> index 7c7563d50c..35d79acbab 100644
> --- a/lib/rendercopy_gen9.c
> +++ b/lib/rendercopy_gen9.c
> @@ -264,7 +264,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
>   			igt_assert(__builtin_ctzl(address + buf->cc.offset) >= 6 &&
>   				   (__builtin_clzl(address + buf->cc.offset) >= 16));
>   
> -			ss->ss12.clear_address = (address + buf->cc.offset) >> 6;
> +			ss->ss12.xe.clear_address = (address + buf->cc.offset) >> 6;
>   			ss->ss13.clear_address_hi = (address + buf->cc.offset) >> 32;
>   		}
>   
> @@ -274,13 +274,21 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
>   			ss->ss7.dg2.disable_support_for_multi_gpu_partial_writes = 1;
>   			ss->ss7.dg2.disable_support_for_multi_gpu_atomics = 1;
>   
> -			/*
> -			 * For now here is coming only 32bpp rgb format
> -			 * which is marked below as B8G8R8X8_UNORM = '8'
> -			 * If here ever arrive other formats below need to be
> -			 * fixed to take that into account.
> -			 */
> -			ss->ss12.compression_format = 8;
> +			if (AT_LEAST_GEN(ibb->devid, 20)) {
> +				/*
> +				 * For Xe2+ R8G8B8A8 best compression ratio is
> +				 * achieved with compression format = '2'
> +				 */
> +				ss->ss12.xe2.compression_format = 2;
> +			} else {
> +				/*
> +				 * For now here is coming only 32bpp rgb format
> +				 * which is marked below as B8G8R8X8_UNORM = '8'
> +				 * If here ever arrive other formats below need to be
> +				 * fixed to take that into account.
> +				 */
> +				ss->ss12.xe.compression_format = 8;
> +			}
>   		}
>   	}
>   

