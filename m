Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE77CF9C5B
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 09:53:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B3BC10E3C4;
	Mon, 23 Sep 2024 09:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CS93GZOW";
	dkim-atps=neutral
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D974610E3C4
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 09:53:02 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a8d2b4a5bf1so599002966b.2
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 02:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727085181; x=1727689981; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=3iMhqi4yDLSH8fmAgh2a2Mm2vym0AHSqFbaX2y4CP5g=;
 b=CS93GZOWSjwMujfrIB/fddWN+bHkhFRp7A0HCP/CNoX+AIW5TkKBiBZ0RICUTnglFN
 tzrDWxPlGtzURE/EaKdvpzC6qZs8mZ1epM02DXq8UptngZhn5KudLHaH9rps5+hyiJAF
 EYUtalkFVqIc4fLZmY30bopAWhB461LIv2+fdx5GeJvsTlGovSm1qp14qxWElSHcurH4
 pB1nQka+sURNp+a6+tbp/SFf7mIFcpqe24tn9rkDIsqX6Yx0WSnHRCHxSm+GQXiXATK6
 fp2CMg+cZWxKinx2Nrp4IRsJbAZePCXpZD1It4UsRaO7g0x2ucuyaSxBF1mbQBMe8XZt
 Z8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727085181; x=1727689981;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3iMhqi4yDLSH8fmAgh2a2Mm2vym0AHSqFbaX2y4CP5g=;
 b=o5FGhN9m7CYwfapzY3ASVwbE0gDsUqvZuHlG4fUIkcPEH9h4M72Wj6SFod0tV1EUGx
 kjbkASV9Ik5IcyJpR79fqRa1DeDmm5zmoTcnjalru11dShNz/ZMEMR11eJ3AJxFLX891
 L16net/Yhe2fWhra9pqsyee1o7KxmLzG+R74kuCnEfpy6CMTcIFu1j12nbJDRQtnoG8C
 WM+zDLAsFY2jRTYUugob+8ef/EacS+M/qdncCsP9Ur7zmiTVUHzMbcIbMFS++sOoncvF
 PnHpCx5NwLBd9Z5Ey/hymK6q2b+yiKAkwXgw0USI9+lOsayTp52GslFuwg8nKsqD+bt9
 M9fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyzvrufxBFB4i+hjoaQ3qyEy2YZJdYD6B8wFek6kE2uy1xKSMKAWy96xMMsqD1l+uLmVM8gEMi@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8Ff08OHEpraK33FCSaYr3e/hcgGLPdW+1EHo6svWY856+p38M
 hni3+yjWxipkA66dzXJ/CYnNbBr0Id+PjrIcsACuLfEBDIDGBN1Q8TEIqvFwq9k=
X-Google-Smtp-Source: AGHT+IE+s4UD2FggCcbw7++j4nk4ju9qT+DJslwEkOHR76OK1Qi7YmZNNP5OVSrhlCGaCls3tqxX4Q==
X-Received: by 2002:a17:907:efdc:b0:a8d:592d:f5c with SMTP id
 a640c23a62f3a-a90d510a2damr1119816066b.43.1727085181007; 
 Mon, 23 Sep 2024 02:53:01 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.69])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a90612df4dfsm1205301566b.143.2024.09.23.02.52.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 02:53:00 -0700 (PDT)
Message-ID: <1cf2a7fd-bbfa-4892-9e1b-ea85c70cdd08@gmail.com>
Date: Mon, 23 Sep 2024 12:52:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 10/18] tests/kms_ccs: Skip 10bpc formats with
 media compression
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240918120518.30258-1-ville.syrjala@linux.intel.com>
 <20240918120518.30258-11-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240918120518.30258-11-ville.syrjala@linux.intel.com>
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
> The VEBOX just hangs if we try to use a 10bpc format.
> Skip 10bpc with media compression as that would require
> using the VEBOX.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   tests/intel/kms_ccs.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index 06f40e2c2175..7cda79412d94 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -845,6 +845,11 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
>   	    data->format != DRM_FORMAT_XRGB2101010)
>   		return false;
>   
> +	/* VEBOX just hangs with an actual 10bpc format */
> +	if (igt_fb_is_gen12_mc_ccs_modifier(data->ccs_modifier) &&
> +	    data->format == DRM_FORMAT_XRGB2101010)
> +		return false;
> +
>   	if ((fb_flags & FB_MISALIGN_AUX_STRIDE) ||
>   	    (fb_flags & FB_SMALL_AUX_STRIDE))
>   		fb_width = max(fb_width, 1536);

