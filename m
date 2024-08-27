Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB1AC54731
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 15:24:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3026810E0DE;
	Tue, 27 Aug 2024 15:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YmhmYLBE";
	dkim-atps=neutral
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A2F210E0DE
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 15:24:48 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-42ab880b73eso50794995e9.0
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 08:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724772286; x=1725377086; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ORJEjPXVC1tnYYf+Iw7ywlTVwNlBrV+z4t8RXqsT8sc=;
 b=YmhmYLBEFzo/8rrPOVZYDfnhpat7xcIf0etGe3pt1OEnnRgwz3co0BeuqqFMG2uqzw
 AGKsHU+rh6Tutavjgw/K4p4DnhwCLvrqxyoOtjIvbvYttmIB0GP7+mEq7blDiA0kG7IL
 sUmqdIlX7RxpMyOMTd3BOi13A4tnZ29Kz1BL2q+eob6AavVWXcZ/IuYxgJeChD1dhNB8
 OEz3SJdLYIqB5rjNPw8PmloBothox62R8Y8vMEDQ1jTDK+3iF5CutHM2m56gafUkeppN
 a9VVYxXQXjg2EAv1Vxeo/x0GnXo9iEpUUsl8FGfndWFobHtXTFJcB6gtsb0GB1j7Oq6J
 fMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724772286; x=1725377086;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ORJEjPXVC1tnYYf+Iw7ywlTVwNlBrV+z4t8RXqsT8sc=;
 b=haokOICZPblfPnxUMVSRs9hAUqHAf9mh1mJLGc/qieNadi1afQiTURNgFXD5By5bav
 MkaDyvDYmEJ2j7WuFwvbc1GwFiSK3auh6sLF3y+x6Y807UEUPDLKTdAKNeMAKshBQ6Ip
 njCKoNOEnNsO9PjL4QY/B+VWmIdjwinhU2xlvTn7KItnMCj0LHdw639Z6fI2/Hhm1SlY
 kDs+gJ4lzg+Z/mhkChXqX8ips1xrtK8ZWA7H0w2r4xsPn1wl0G/eA6leQcade3J+jlwN
 uCm74GayAGxiR5qDU/tV3xx7Q8u+51/PTZA+rjkZK4ToljJQ57nnliuBsEpRoP3WwAOX
 x9og==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdvLd9nzvmRf9agr1IpL77b9eLROkjqqfgv7NjGekVR+VK88MtWY8fbu8wsA4gzsIM2uWnzqtF@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+OHm0F9ErX/9/te1YRSmdn1aU7sWkcECNPUigC5jF2a1y2jqF
 uuDm7gwf+XjW4URH3974AEpB7ITYeYjA/WBVs+nvfMxx7zCdosgF+52/Dv2QUEE=
X-Google-Smtp-Source: AGHT+IEzXxQeDNLITUxoyRJpkpZWCXYwWHHRVwtLTKn5L7df58xX9Xuuq+yMAFVcgKHsKEz2gAK1SA==
X-Received: by 2002:a05:600c:4fc5:b0:427:ffa4:32d0 with SMTP id
 5b1f17b1804b1-42b9ae2422emr22453695e9.28.1724772286121; 
 Tue, 27 Aug 2024 08:24:46 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.137.72])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-37308161042sm13400369f8f.59.2024.08.27.08.24.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 08:24:45 -0700 (PDT)
Message-ID: <9f5d52ca-281f-402f-98d6-04914f8851b6@gmail.com>
Date: Tue, 27 Aug 2024 18:24:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 10/37] lib/rendercopy: Extract {dg2,
 lnl}_compression_format()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
 <20240702232817.31147-11-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240702232817.31147-11-ville.syrjala@linux.intel.com>
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

On 3.7.2024 2.27, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Extract the code to determine the SURFACE_STATE compression
> format for dg2/lnl+ into helper. We'll need more formats here
> soon.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/rendercopy_gen9.c | 41 ++++++++++++++++++++++++++---------------
>   1 file changed, 26 insertions(+), 15 deletions(-)
> 
> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> index 11f456a70d2f..eafdf50581d3 100644
> --- a/lib/rendercopy_gen9.c
> +++ b/lib/rendercopy_gen9.c
> @@ -146,6 +146,28 @@ static const uint32_t xe2_render_copy[][4] = {
>   	{ 0x8010c031, 0x00000004, 0x58000c24, 0x00c40000 },
>   };
>   
> +static uint32_t lnl_compression_format(const struct intel_buf *buf)
> +{
> +	switch (buf->bpp) {
> +	case 32:
> +		return 0x2; /* CMF_R8_G8_B8_A8 */
> +	default:
> +		igt_assert(0);
> +		return 0;
> +	}
> +}
> +
> +static uint32_t dg2_compression_format(const struct intel_buf *buf)
> +{
> +	switch (buf->bpp) {
> +	case 32:
> +		return 0x8;
> +	default:
> +		igt_assert(0);
> +		return 0;
> +	}
> +}
> +
>   /* Mostly copy+paste from gen6, except height, width, pitch moved */
>   static uint32_t
>   gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
> @@ -272,21 +294,10 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
>   			ss->ss7.dg2.disable_support_for_multi_gpu_partial_writes = 1;
>   			ss->ss7.dg2.disable_support_for_multi_gpu_atomics = 1;
>   
> -			if (AT_LEAST_GEN(ibb->devid, 20)) {
> -				/*
> -				 * For Xe2+ R8G8B8A8 best compression ratio is
> -				 * achieved with compression format = '2'
> -				 */
> -				ss->ss12.lnl.compression_format = 2;
> -			} else {
> -				/*
> -				 * For now here is coming only 32bpp rgb format
> -				 * which is marked below as B8G8R8X8_UNORM = '8'
> -				 * If here ever arrive other formats below need to be
> -				 * fixed to take that into account.
> -				 */
> -				ss->ss12.dg2.compression_format = 8;
> -			}
> +			if (AT_LEAST_GEN(ibb->devid, 20))
> +				ss->ss12.lnl.compression_format = lnl_compression_format(buf);
> +			else
> +				ss->ss12.dg2.compression_format = dg2_compression_format(buf);
>   		}
>   	}
>   

