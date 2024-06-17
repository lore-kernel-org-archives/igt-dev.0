Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4BB4C2BA18
	for <igt-dev@archiver.kernel.org>; Mon, 17 Jun 2024 11:17:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DCA510E35A;
	Mon, 17 Jun 2024 11:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nWh761LU";
	dkim-atps=neutral
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F5610E35A
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2024 11:17:05 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-36087277246so1400386f8f.3
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2024 04:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718623023; x=1719227823; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=VhCdTlsVqQ2Z0fE1HE1dvMj6P/fvTFGG2+XsHHcizcg=;
 b=nWh761LUqJwMBUwFAOF+dj5uzQliqu/4Poq1J23eLpiCOFlvLJXAvcTDLzJWsTXPuP
 AMVOd6dK8pMrN4XLuFHasu9jXbCvII/uUUM4S9YO2pCsAf5oegW86ZpIUshjnJfVx/qy
 IB9Fo0YrG43f5+PQHXaRModLeKzOb2gaOCQ9kG9xXeHi+cd6nzckFdukprqnBGDJTKCy
 WTJZAMSLQs93jr6jL/6tKnIEmDhRnQrYo2pXmUkgqYJ2kY4cJkDRboLxWgwUfV51L4ld
 qMk3M0j51wM0JRq08sj0h+1h9EAcIqygOfmP6h6/nF7FTvCKl2OwDnoa+5mIDVHPOMxu
 Kw4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718623023; x=1719227823;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VhCdTlsVqQ2Z0fE1HE1dvMj6P/fvTFGG2+XsHHcizcg=;
 b=SE8/CE/3jiCEa8Jw4+bEd2huFyOsBA5BTSupZGRLqiepSr0g4fZqPHUK00S+5x6u5n
 Dl4Bm4qdkbzPM9eH/dy5qzr+CURnQoLi6u/Gs5I8l+pxjIR/H0ehgurgmondoM7z7Bkz
 rPL1B4YUSVvONdIc4uNL7labFGVPUBE2mvYLkqjrbLov4xttPMSOmdc6iD52OepVx5nD
 g9+WpjCbrOlFKvV+Ee1EF3xgXfODVrXE/rTnotAH1vPzRtQWchasX9SbSCioJpc8wWsd
 a7t7vTcL2vw7iyK//SxECz7bPTry5+TAWglYR3l66zgrQP/S7JzmdxRc9hjF19DdVaIm
 TunQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUp4jOYnYnXcbACFnjS97Tkv/lcilbD2vGxCXwQNFwKdYO+Z6sUjlQKNqnmgLqP4kO84mitoOBEwLL8FI0L+wieW6ooYTkhYQRWOmWPDw==
X-Gm-Message-State: AOJu0Yzf7uQAHM8v1g2e9bJG/AdjtnR0lJA2CZuHhtpBqJhKR3ItYEXk
 0SKL+xHfv0qqWRHG2X27440Zvg9s8KXba3M88/SY5T67cyrM6qgf62WsACha
X-Google-Smtp-Source: AGHT+IEBt1Wn2V9NxW2X+/zBn/A7Ld6g3F+bDlsl3/bldWZAPLQxy6uEiAob5Peq33Zgpvct41bNOQ==
X-Received: by 2002:a5d:6248:0:b0:35f:f6c:b971 with SMTP id
 ffacd0b85a97d-3607a7c31cfmr7415434f8f.38.1718623023569; 
 Mon, 17 Jun 2024 04:17:03 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3607509c8d8sm11663613f8f.32.2024.06.17.04.17.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 04:17:03 -0700 (PDT)
Message-ID: <c8086199-6915-4eee-83b1-73ea2eac6201@gmail.com>
Date: Mon, 17 Jun 2024 14:17:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 09/12] lib/intel_bufops: Preparation for adding
 software tiling for Tile64
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240527073345.54729-1-zbigniew.kempczynski@intel.com>
 <20240527073345.54729-10-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240527073345.54729-10-zbigniew.kempczynski@intel.com>
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

On 27.5.2024 10.33, Zbigniew Kempczyński wrote:
> Preliminary patch which adds necessary definitions for Tile64 in
> bufops.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   lib/intel_bufops.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> index 70f70bfa9e..eb367be2f3 100644
> --- a/lib/intel_bufops.c
> +++ b/lib/intel_bufops.c
> @@ -93,6 +93,7 @@
>   #undef TILE_Yf
>   #undef TILE_Ys
>   #undef TILE_4
> +#undef TILE_64
>   
>   #define TILE_DEF(x) (1 << (x))
>   #define TILE_NONE   TILE_DEF(I915_TILING_NONE)
> @@ -101,6 +102,7 @@
>   #define TILE_Yf     TILE_DEF(I915_TILING_Yf)
>   #define TILE_Ys     TILE_DEF(I915_TILING_Ys)
>   #define TILE_4      TILE_DEF(I915_TILING_4)
> +#define TILE_64     TILE_DEF(I915_TILING_64)
>   
>   #define CCS_OFFSET(buf) (buf->ccs[0].offset)
>   #define CCS_SIZE(gen, buf) \
> @@ -143,6 +145,7 @@ static const char *tiling_str(uint32_t tiling)
>   	case I915_TILING_Yf:   return "Yf";
>   	case I915_TILING_Ys:   return "Ys";
>   	case I915_TILING_4:    return "4";
> +	case I915_TILING_64:   return "64";
>   	default:               return "UNKNOWN";
>   	}
>   }

