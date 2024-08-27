Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C415C5472F
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 16:04:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55EB310E36D;
	Tue, 27 Aug 2024 16:04:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OfdhP6y+";
	dkim-atps=neutral
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B39710E36D
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 16:04:24 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-371a13c7c80so3880925f8f.0
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 09:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724774662; x=1725379462; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=OwSydXCwL7a9Mm9/vHG/fkX9xmwfe0ftN9eeoPjgp0U=;
 b=OfdhP6y+1gVKrhOPJWrOKhb7OEAf51qLaTgOsIfRCGPJb1azmXV+Za/jtTmkk2BIl3
 /XExks85rSaplFQm3If/wjpmBfdIKBkYXuDpVz8PMhx0k+MsBnMOZUVyK0XnfPgaow58
 m6MXFzk+Roaxyv7pSpfI/U4d4nkuCIhht82Ii+YvNZSezl0HTRIqMC7f4Hp52mcDnHuO
 DCa62QGxNTU+INukrLZ9SwNmnYG9V3dTSn9iONSJIp51tbRQJRa3TkKjXmGR871A1qs/
 pLmLVDi5x08Cp2yqJY9h5qsolRWNcAW0w7NwPoKlvSaf93DS2TvejHFi1rrFMuvxKKEf
 hrcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724774662; x=1725379462;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OwSydXCwL7a9Mm9/vHG/fkX9xmwfe0ftN9eeoPjgp0U=;
 b=QzEXMH5susFu/8gN1HKIfKkSPSuy3tMukNsEQHs08ZexZJfr9i4GwlyY75wRddS76S
 20hfk1Lp77lSADy2F9zQ5EGwTF6JgAKafweG50ZlaJw3BTpxK5JsIQh3yEcvAd9LqtA7
 x6e4Lp3PpHYJeTFtcTL9MDZCARgCEQGP77Hlzc2rlM+yQFrIYbr41ocTTMIo8CgvpFLd
 shY/W+mD/vcNSOk+lZVTd4cotb80LfoI83T+C0R7Yf6TaEXloDNZrYt73thL0M2D8vfh
 OEnVen2AoYVOI6g2mpOWvIa4Dc7e+3Klo+p8ydASwAFKo6huDV4XyHYt7UHtah87w+x9
 I9wQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVR0YMLeJQlePxJfVK3zphjo987Fx5mkwvqmc+Wmwt3lRT0PSr4mn2grhhus5OErNbqw8VC6igH@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwICpzQG8Amj7UUVNV+d5u8EWv1X56KAdrMr+uIhos9REG5oTYY
 4LPU31n8aXkuu45kridqtP37JoXUCqPTVaeaU2NwZ4MWfbEIOcypgpQWa/J5mP4=
X-Google-Smtp-Source: AGHT+IECUM+wnK7gB2ZaC8WmI9s1z/ARzhdHHDJiHlwkxPVjU8e1XYJuHuQ7UT9+ttXPyMF6e216DA==
X-Received: by 2002:adf:e30e:0:b0:367:895f:619e with SMTP id
 ffacd0b85a97d-3748c8442a7mr2064822f8f.11.1724774662031; 
 Tue, 27 Aug 2024 09:04:22 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42abeffe3e9sm226758575e9.43.2024.08.27.09.04.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 09:04:21 -0700 (PDT)
Message-ID: <f3323969-c9e5-45ca-8d87-0ecc7ef3991f@gmail.com>
Date: Tue, 27 Aug 2024 19:04:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 12/37] lib/rendercopy: Use the proper compression
 format for 10bpc on dg2/lnl+
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
 <20240702232817.31147-13-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240702232817.31147-13-ville.syrjala@linux.intel.com>
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
> Setup the dg2/lnl+ compression format correctly for 10bpc formats.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/rendercopy_gen9.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> index 4014100a23b5..b871a4b3dae1 100644
> --- a/lib/rendercopy_gen9.c
> +++ b/lib/rendercopy_gen9.c
> @@ -150,7 +150,10 @@ static uint32_t lnl_compression_format(const struct intel_buf *buf)
>   {
>   	switch (buf->bpp) {
>   	case 32:
> -		return 0x2; /* CMF_R8_G8_B8_A8 */
> +		if (buf->depth == 30)
> +			return 0x3; /* CMF_R10_G10_B10_A2 */
> +		else
> +			return 0x2; /* CMF_R8_G8_B8_A8 */
>   	default:
>   		igt_assert(0);
>   		return 0;
> @@ -161,7 +164,10 @@ static uint32_t dg2_compression_format(const struct intel_buf *buf)
>   {
>   	switch (buf->bpp) {
>   	case 32:
> -		return 0x8;
> +		if (buf->depth == 30)
> +			return 0xc;
> +		else
> +			return 0x8;
>   	default:
>   		igt_assert(0);
>   		return 0;

