Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12549C10F1A
	for <igt-dev@archiver.kernel.org>; Tue,  7 May 2024 14:07:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD94010E28D;
	Tue,  7 May 2024 14:07:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N7YfjdU5";
	dkim-atps=neutral
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA8C10E28D
 for <igt-dev@lists.freedesktop.org>; Tue,  7 May 2024 14:07:32 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-34e0d47bd98so3134020f8f.0
 for <igt-dev@lists.freedesktop.org>; Tue, 07 May 2024 07:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715090851; x=1715695651; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=RBVzESNlt2qgQ9swzUGKUH+aG9EjwULxZaDfyja1Ub8=;
 b=N7YfjdU5Cc4gUG9bxwyLfuBT4ehmRT8ehgLSzyZuh2tckvf/2IrmKM11GwgVS0CHb6
 25XuZXjACeA6pzZCDV4xup0m3IEPpzEY2nxiana4vjMbHwrRwimzM44iVnQj/QR057g5
 CKDvAxwfg0cd6Hs4XVmXySdajMviH68DWum77MdQilTHsOjFZmNzkMW334gsCnWsEl5i
 febYK2pvr/GdPCkYjEcGo9w8POc+mIUD3PVOM1sac3RMoP4jnsRFRJite2lIkSmWq4pu
 AW7LUKK9zCSxaTKcxo6TQareQ12kD8OwbxbeVGLY8zMs5lSFQoRcj1/n5enpQaCqfoG4
 ys+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715090851; x=1715695651;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RBVzESNlt2qgQ9swzUGKUH+aG9EjwULxZaDfyja1Ub8=;
 b=JtVQs45LYmSo9M7ITrvRHh0UVKZ676weATe3hcENQbXK/Em0wgykhrLtrZlYPcV4cS
 oumtt6V3hrNZppDgsa67Q4fYKho0vR+fZEZWmLVqnAt4yX7TVpoauW+EB+vO+hAf7X4h
 qzGQfCfpy5fgcz1jhczYF1h13nd7eC50NcgpNaQit9vzmGJQRvgkqBTw91hqP6avi5as
 85ZZWOzeRcxZh+7s5+R2vssY+v2Iq0s0Pw8Dq1ePAb6Vzu7yg3319r24Rq5QOvHWduA3
 ETnuF+z6Lxkn27AVeqb9ATtb9cyU4ac9qjDT4kcPzgb6bFIkvWc4JcUdUa43ZNhD3vE8
 rktw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLe0gNb440hoKn2pPufxYPVoWrOhi/VAWxgJwdktm+3m2Foa9RRva9bqDQnTjXlrPSUQ0DPnuSVqorlujAauhMaSY/wzDb02Xpqr1Y4A==
X-Gm-Message-State: AOJu0YxFTv9OuUtomgv4PyH8syxX+KYdjsPkTYYzIeCRxTFWkGhXlF0q
 3NZfIY/QX918KgSySjf3MgrE7QBRAw9Dbap6aTDJvsBISd5BHchm
X-Google-Smtp-Source: AGHT+IEJWc3B1Eu3HxxI5ow2Udi7ylusWxXFpxGuiZf81nk5erTtS/QWK/CAxr5TajXcYiKRfkEfeA==
X-Received: by 2002:a05:6000:10f:b0:34c:78dd:9348 with SMTP id
 o15-20020a056000010f00b0034c78dd9348mr2735136wrx.23.1715090851051; 
 Tue, 07 May 2024 07:07:31 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.78])
 by smtp.googlemail.com with ESMTPSA id
 o10-20020a5d47ca000000b0034d9e5411ebsm13123166wrc.45.2024.05.07.07.07.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 May 2024 07:07:30 -0700 (PDT)
Message-ID: <fec0ddfb-5940-4752-83ea-6b820a0fb6a1@gmail.com>
Date: Tue, 7 May 2024 17:07:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 04/11] lib/intel_bufops: Restrict tilings on
 non-flatccs platforms
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240507075836.259581-1-zbigniew.kempczynski@intel.com>
 <20240507075836.259581-5-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240507075836.259581-5-zbigniew.kempczynski@intel.com>
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

On 7.5.2024 10.58, Zbigniew Kempczyński wrote:
> JP noticed after last changes introduced in bufops we keep unnecessary
> two conditions instead of pack them to single one. This is refactor,
> no functional change.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Suggested-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   lib/intel_bufops.c | 19 ++++++++-----------
>   1 file changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> index 43d6dd5b43..7118272e5f 100644
> --- a/lib/intel_bufops.c
> +++ b/lib/intel_bufops.c
> @@ -896,7 +896,9 @@ static void __intel_buf_init(struct buf_ops *bops,
>   
>   	size = buf->surface[0].size = buf->surface[0].stride * aligned_height;
>   
> -	if (compression) {
> +	if (compression && !HAS_FLATCCS(buf_ops_get_devid(bops))) {
> +		int aux_width, aux_height;
> +
>   		igt_require(bops->intel_gen >= 9);
>   		igt_assert(req_tiling == I915_TILING_Y ||
>   			   req_tiling == I915_TILING_Yf ||
> @@ -907,17 +909,12 @@ static void __intel_buf_init(struct buf_ops *bops,
>   		 * CCS units, that is 4 * 64 bytes. These 4 CCS units are in
>   		 * turn mapped by one L1 AUX page table entry.
>   		 */
> +		aux_width = intel_buf_ccs_width(bops->intel_gen, buf);
> +		aux_height = intel_buf_ccs_height(bops->intel_gen, buf);
>   
> -		if (!HAS_FLATCCS(intel_get_drm_devid(bops->fd))) {
> -			int aux_width, aux_height;
> -
> -			aux_width = intel_buf_ccs_width(bops->intel_gen, buf);
> -			aux_height = intel_buf_ccs_height(bops->intel_gen, buf);
> -
> -			buf->ccs[0].offset = buf->surface[0].stride * ALIGN(height, 32);
> -			buf->ccs[0].stride = aux_width;
> -			size = buf->ccs[0].offset + aux_width * aux_height;
> -		}
> +		buf->ccs[0].offset = buf->surface[0].stride * ALIGN(height, 32);
> +		buf->ccs[0].stride = aux_width;
> +		size = buf->ccs[0].offset + aux_width * aux_height;
>   	}
>   
>   	/* Store buffer size to avoid mistakes in calculating it again */

