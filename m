Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9360CC54731
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 17:20:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1010210E3C0;
	Tue, 27 Aug 2024 17:20:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cGWPoRVN";
	dkim-atps=neutral
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B98C310E3C0
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 17:20:33 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-53345dcd377so7694272e87.2
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 10:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724779232; x=1725384032; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=NyonOvIalQ6mrIwkHb/AUP1h/dxsFNHvUu7YoHUBIBg=;
 b=cGWPoRVNH2S+f1PimITmx2J6oYWu+vDUsMYg9TmvnZW4pQhzFaJSfUlcy9CIp1vu/Q
 2R0oG7mbnWAbLa9IqwIPS4enLMeVaONdISpl4x6dco5oL2M/HKGUN97SW39v1wJIMD7L
 2npG1KmpKAnZ1fOP4vEiDLShRPSjFLL7ELJxfkCw/U0MpgB8gecJARnJBd+jElhwgvDe
 PsnXqEgrnUQwRe/6sriX/gHfXMs2+bSONHhYi0oaHh/tOgRLUnAsDSc2+rQY1kfBcNwe
 YmAtdx1WVOkXQzFziZEnIycr88hsmKRaa7No3MYfA/8Uc4mftKMJrszP5tKaYyMG7mKY
 rSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724779232; x=1725384032;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NyonOvIalQ6mrIwkHb/AUP1h/dxsFNHvUu7YoHUBIBg=;
 b=LNN1BO63QPLKg34UWciw0nyAvzKV8tI93/G72n3Ut1Yc8AKIdoG3cjccv5HltmxDDr
 3sJKLguskh11gsPKZA+0JCzKGsDJuZDS0e1DGQCIWH85FsHCKQPevhv5sXB3pDaYqvWw
 uXAmA3Cs2NK0L0qm7jsy3VKc9fuhSAcYhjLfoMZ/5/As1gvqRsJ6abquUIxbTpvfHmwi
 VUx2hs8/xPTVpTd6ScFJVZYEOMUsSis6RoObfS7A7MdQ7+30WKoAIV8ciWWcIRFlAK1Z
 zRnDQKMp1/0u3927JbmFZjJRYKu8xz4bb7kZRtnG1D4Bl01GzjslxdWICB+9+JB2PrpA
 0k+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCURowq1uSjLtSD5wor1wXHaNm4dK298NHNEdnjOp6p/8ziuGbQ3wUgi+CEMu+DRFSnvZ3DntmFk@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTHJyhpkqS6znI0zccwV/2n74qAKZ4+SwW9jLzrxX55Y/6Oq8e
 XY+ugwnxZGGUnym/AEkdFopUdsGtpykN6vmu5odWWrTHdE4fETfY
X-Google-Smtp-Source: AGHT+IH5vbmJhBQ6g8sW90LIdFsGoAUtvQ1Mm29oBssucuPYUJyAXfsoFeKziBhc9lL7e1JvepvCFA==
X-Received: by 2002:a05:6512:1390:b0:533:c9d:a01b with SMTP id
 2adb3069b0e04-5343878403emr10519820e87.29.1724779231461; 
 Tue, 27 Aug 2024 10:20:31 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.137.72])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-5334ea89814sm1917190e87.293.2024.08.27.10.20.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 10:20:30 -0700 (PDT)
Message-ID: <2f8d301b-aa5b-44d0-890e-4f5aa600f2b2@gmail.com>
Date: Tue, 27 Aug 2024 20:20:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 27/37] lib/vebox: Add support for fp16 RGB formats
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
 <20240702232817.31147-28-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240702232817.31147-28-ville.syrjala@linux.intel.com>
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
> Support VEBOX copies with fp16 RGB formats.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/veboxcopy_gen12.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/veboxcopy_gen12.c b/lib/veboxcopy_gen12.c
> index 44c914e7f2bf..af52a96578d9 100644
> --- a/lib/veboxcopy_gen12.c
> +++ b/lib/veboxcopy_gen12.c
> @@ -32,6 +32,7 @@
>   #define R8G8B8A8_UNORM	8
>   #define PACKED_444_16	9
>   #define PLANAR_420_16	12
> +#define R16G16B16A16	13
>   
>   struct vebox_surface_state {
>   	struct {
> @@ -165,6 +166,8 @@ static uint32_t compression_format(int format, struct intel_buf *buf)
>   		return 0;
>   
>   	switch (format) {
> +	case R16G16B16A16:
> +		return 0x1;
>   	case R8G8B8A8_UNORM:
>   		return 0xa;
>   	case PLANAR_420_8:
> @@ -344,8 +347,9 @@ void gen12_vebox_copyfunc(struct intel_bb *ibb,
>   					      R8G8B8A8_UNORM;
>   		break;
>   	case 64:
> -		igt_assert(!src->format_is_yuv_semiplanar && src->format_is_yuv);
> -		format = PACKED_444_16;
> +		igt_assert(!src->format_is_yuv_semiplanar);
> +		format = src->format_is_yuv ? PACKED_444_16 :
> +					      R16G16B16A16;
>   		break;
>   	default:
>   		igt_assert_f(0, "Unsupported bpp: %u\n", src->bpp);

