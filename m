Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FEBD3A66B
	for <igt-dev@archiver.kernel.org>; Tue, 29 Oct 2024 15:02:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4396710E680;
	Tue, 29 Oct 2024 15:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F8njOLEA";
	dkim-atps=neutral
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF9E10E680
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Oct 2024 15:02:42 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5c935d99dc5so6354800a12.1
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Oct 2024 08:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730214160; x=1730818960; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=17cr4X08oavRQYkaNNk6a8k5YlUVWNYpcdctmVG560g=;
 b=F8njOLEAMeefMsp21JS/rIow2OK9tsgfvU00mlCiHFn2tCA46QnN13CJX3XMekROW6
 BV1GXGEKq4jnFZ4bIqft/LSkQLxHegZgYjgMx/NZzE6mJPJp+3BUWvdV3uKwer8F+f1t
 vFrmabFwUvQIs4X0RhTjmPDafHWW+RRbEvkDa4cEFCvgfPZf8v8jR50sU83pUEOMpjDo
 OUB/De/N/c46JigP0n68HVFRGMfaJYVIEuLXhvG4rpvjeNSs5QL9QAE8z2DVRklPNTFt
 3EEfBVkvy8bkz8SEJdureCFjeWnEkeaCmbovKLHgC/xZ3aIbMylKF/7TcDa6ZfnJagTx
 +X9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730214160; x=1730818960;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=17cr4X08oavRQYkaNNk6a8k5YlUVWNYpcdctmVG560g=;
 b=eZNvSJ2rjKNV3BAOcOQOcmRzYdpsMHy1na5/7HfFiO2HhJYBQQoGFv5biVMrRBAKdA
 WdUEiYqpP5I5NE1/cgPSxlabVhwOpl8HaWEoeIJMKgMKESUqTg7hTRVR/+UXClRG0Rtz
 OHwu0doiRQdCc1LKJavHeX0ofn5FY4KRk3EAZNPiiT5ze9ST4gZWO8SCyfgiKvlzj1s1
 qz+AFb5b7/D8S1y1OGirh+okAvN6nn+0HyXUa14GCJW2KL97aUXPIBcypi8k1lOfgBsr
 4JVGJ595WpaQ3W3385TNd/2/TsSumF4kHJPRAScdB+oUsEmWndnRab2h7ijrOm8uGc4a
 jdPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5ImaERC2Toh4AhWFQJWa3TKPpqcGT3Jf+WcYZOAT+CTosapZFNE0lxDgRynvSGMPfTvUviVbj@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymcKyuvA635TPeiqTBf61R8uVSuFo2Nt3k+z/mCR2OAstJKHDB
 8D9YyZzvRJOJOCIjieVF4RyI/N7o8fo7DT/28npKrQ85xz/45Its
X-Google-Smtp-Source: AGHT+IFmmWzj/BClIRZajQVunNkIikuUpptQ70z5HIKp4j0XJfS3PwNj7DdXTzyKBCmGTEl6BBxH2g==
X-Received: by 2002:a17:907:6d0d:b0:a9a:147d:fe9c with SMTP id
 a640c23a62f3a-a9de61d5d59mr1187907266b.43.1730214160065; 
 Tue, 29 Oct 2024 08:02:40 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.69])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a9b1f298319sm475601066b.105.2024.10.29.08.02.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 08:02:39 -0700 (PDT)
Message-ID: <fd63c0e9-ad41-41f4-b5df-bfc20f0ad84a@gmail.com>
Date: Tue, 29 Oct 2024 17:02:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 07/14] lib/igt_draw: Add 64bpp support to the
 XY_FAST_COLOR_BLT path
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
 <20241004104121.32750-8-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20241004104121.32750-8-ville.syrjala@linux.intel.com>
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

On 4.10.2024 13.41, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> XY_FAST_COLOR_BLT supports 64bpp natively. Simply enable it.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/igt_draw.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_draw.c b/lib/igt_draw.c
> index 93924ece8250..2312a0c71030 100644
> --- a/lib/igt_draw.c
> +++ b/lib/igt_draw.c
> @@ -789,7 +789,8 @@ static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
>   			blt_cmd_depth = 2 << 19;
>   			break;
>   		case 64:
> -			/* Not used or supported yet */
> +			blt_cmd_depth = 3 << 19;
> +			break;
>   		default:
>   			igt_assert(false);
>   		}
> @@ -824,7 +825,7 @@ static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
>   					   dst->addr.offset);
>   		intel_bb_out(ibb, 0);	/* TODO: Pass down enough info for target memory hint */
>   		intel_bb_out(ibb, color);
> -		intel_bb_out(ibb, 0);	/* 64 bit color */
> +		intel_bb_out(ibb, color >> 32);	/* 64 bit color */
>   		intel_bb_out(ibb, 0);	/* 96 bit color */
>   		intel_bb_out(ibb, 0);	/* 128 bit color */
>   		intel_bb_out(ibb, 0);	/* clear address */

