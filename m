Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D39FA375E
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 15:44:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC7610E292;
	Fri, 13 Sep 2024 15:44:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IysUaqES";
	dkim-atps=neutral
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01AD010E292
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 15:44:25 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a8a7b1c2f2bso355657966b.0
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 08:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726242264; x=1726847064; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ohwnkiDTgqmgvsoQWMo9qa3mcCj/dybd6MjpyckkTQI=;
 b=IysUaqESaIel1pE6GdzO3ZvpfQ8yFQ0cUVJkG0XGH4f1CjahpoCxh2FKJ+Axy+bpSo
 2HWD8qqmH00o1qfBrsHnLFhEtFqGCBdf7iXj8TzkFnWeE9uS2cYW61QK+ffanq80WIj7
 25pqkdVqFiqvKFsR1hep+dXEhd8YWhlnRZbX9MNjCvw+jTgHe6mJ5/eADKXUfSgoK3eO
 sw4ZAsZhzrHmWMtzYdEtIukbcr4RyGX4OCV32fvl0C/gB6Ys3GXXya1WvRwxXoWVIWK6
 c3/jEQCMBDR3oDv4wNRYac3swpIiPi51FqnvP/28W/TfaLfAfuP0DY4LqUlhcyvHI/Uv
 IwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726242264; x=1726847064;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ohwnkiDTgqmgvsoQWMo9qa3mcCj/dybd6MjpyckkTQI=;
 b=cg+jSKFSm6yNZaSh30+oZlhSQoyA5o9F84SDi6aPaiCfHth1QyQfMGgIHEMrOcZo4l
 uawrvC3ZbGfy8Bzrjw0weqY49k7VKMYMWd1ny3TsjHgzyoLCaH3+BBZixZC6NSp6fljh
 Xr05rQgrDl84aN6Q6VyNbXoABUAsm/3xvf76esKdGbxESreph7GkCr51l2MdhdRqXStU
 VcgMP6NZpmBYcbEAtdXuM0yiMxZn5q6Vkye2jBJ9BQmzYW6eoehDMgg4wZM7BKqNM+AK
 sVJRekOWleq/DrGbvZSmXW7RGtOpGLfmqtg0XXt3p0eRMdLJLzBJ2D0tE6Gg79mZlsDI
 py4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWV72JvbhL2yMYSvb9Azif/FLP74I6xHcGzS4HkoM05AxgZYI+ehhKKjcn83U+M7r9y8fXRCF0I@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVqnbq1fiGaHy11DAbNGYStk+OFNeCaZ/VqWTjugDROVeks1FU
 G448UX2Wee9ohRHGeWjPnvOQ2zL1mzO91OLYlsgFOdvLuAnx28yq
X-Google-Smtp-Source: AGHT+IGCYSsvYDd2NG/NNbQSGmiM+0o2UgOGVLM4XLmnbhQWyH+uTWImYt0bv1BrjSSL5FOWvb9OSQ==
X-Received: by 2002:a17:906:fd88:b0:a8d:3998:2d2 with SMTP id
 a640c23a62f3a-a9029730f33mr734661566b.58.1726242263998; 
 Fri, 13 Sep 2024 08:44:23 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.137.72])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a8d25cea395sm889918466b.144.2024.09.13.08.44.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 08:44:23 -0700 (PDT)
Message-ID: <c66768b7-b22f-4771-b59b-b4be5fcf0c85@gmail.com>
Date: Fri, 13 Sep 2024 18:44:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_fb: fix stride calculation for
 igt_fb_get_fnv1a_crc()
To: Esha Bharadwaj <quic_ebharadw@quicinc.com>, igt-dev@lists.freedesktop.org
Cc: adrinael@adrinael.net, quic_abhinavk@quicinc.com, arek@hiler.eu,
 kamil.konieczny@linux.intel.com, bhanuprakash.modem@intel.com,
 ashutosh.dixit@intel.com, robdclark@chromium.org, quic_jesszhan@quicinc.com
References: <20240911210058.477513-1-quic_ebharadw@quicinc.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240911210058.477513-1-quic_ebharadw@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Esha,

your change look ok. Those ci failures you got are some noise, they're 
not relating to your change.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 12.9.2024 0.00, Esha Bharadwaj wrote:
> fb->strides is assigned to the value returned by
> calc_plane_stride() only if it was previously not set by the
> caller. In the case of dumb buffer allocation, this is already
> assigned by the driver.
> 
> Respect the stride requested by the driver in such cases by
> using fb->strides[0] as this is assigned correctly in
> calc_fb_size() only if it was previously not set by the driver.
> 
> Signed-off-by: Esha Bharadwaj <quic_ebharadw@quicinc.com>
> ---
>   lib/igt_fb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index ab162a5b7..ed016f07d 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -4814,7 +4814,7 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc)
>   	void *map;
>   	char *ptr;
>   	int x, y, cpp = igt_drm_format_to_bpp(fb->drm_format) / 8;
> -	uint32_t stride = calc_plane_stride(fb, 0);
> +	uint32_t stride = fb->strides[0];
>   
>   	if (fb->num_planes != 1)
>   		return -EINVAL;

