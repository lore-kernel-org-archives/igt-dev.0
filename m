Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F545C5472F
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 15:17:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD2A10E34A;
	Tue, 27 Aug 2024 15:17:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UZ+XRNz+";
	dkim-atps=neutral
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F84E10E34A
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 15:17:15 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-428243f928fso62691945e9.0
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 08:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724771834; x=1725376634; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=7G8ueVrDw0w8vvWms5Gr8981eZFOQxWwCtLp+KE1Ni8=;
 b=UZ+XRNz+7KRREDFiBpc9ZV/xquaABYrrHNAFhmx0Bk79rUhXh79clCiM+aRXo35E2a
 Jja4YNj5x4UED5ASOHu0jj2cnOFckJChQI4eclkPCQW6cOXzJcGCimfrZOPJ+JlxuZAt
 P51WjIxotywqw7tmS8wQeHFR2Z3dmrdn9etS3eJOMf4dU4YKOoU88Fj0rdcba98VvClJ
 3yNAjxSDbopsIK/y+7vFnwd7QY3Lh0Nl0c5J2C0cWrzQZKwo5Mvv1zp66OP5eT7dwh6A
 oNzOg7xcqm/PHNvfSGUc5kiKKknv6vFXNIyUQ9GayrGI+Ad1etIx/+XFEA+wYH2rpvea
 efgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724771834; x=1725376634;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7G8ueVrDw0w8vvWms5Gr8981eZFOQxWwCtLp+KE1Ni8=;
 b=j3qW02bmPdBIAEmEf71oK3W8iaTMX5KXNrK8jw+xDP8KpSzKKZWDWE9uTzT26sGuDn
 PHhOqYXrXbGO05UNVuOhX53Bci0y04sXKlQDJu5UQHlog1dk/puU7svyQRQWiuk30wsL
 lruSl7aWVucltAQ8CrPZjLuWzuq2ECxOeAAyjGnllOtkDHP7U2XmFp1gnmiuVeflT1yS
 nLotE+peLkCix/ip56ivad1F7MspckkyfRHzQIwOiwUxM68JxgbAEjqjf35wMN0MS6Bm
 ZfVMDYXH+JOI3xjoIX6xhN4bZ3mR8jQoJlc0lQIbdVxDwKbThZcodO5Lm9IWSq+jCyr+
 6JSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVu4YYWyTpTz2cED4CFNN3shPO6nyEtSrznjrdU1b0/FZS28cysssSSykrZMUKop2sNzaM5ogVV@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpSutznC2rns57hHv5fO1lzLsoonS1H6M19LfpaGMahSmDFHe3
 Iono1IYETsNP2w/1xk4xLS/MxoKVV9Q6FBHmAkLp+9kgAc5b3GEIqHG5yIE6DYw=
X-Google-Smtp-Source: AGHT+IFqdYlKVdkMDfuDOzEccc0MrAksRUMZoLIS84vIv87bpXD9alnQqXMUa+JkxBfLjLfqjzmAMQ==
X-Received: by 2002:a05:600c:4746:b0:426:5269:982c with SMTP id
 5b1f17b1804b1-42acd5dcccbmr116787305e9.28.1724771833622; 
 Tue, 27 Aug 2024 08:17:13 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.137.72])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42ac516252asm188239855e9.26.2024.08.27.08.17.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 08:17:13 -0700 (PDT)
Message-ID: <2e007015-957c-4c88-854d-f0c70257c7f1@gmail.com>
Date: Tue, 27 Aug 2024 18:17:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 04/37] tests/kms_frontbuffer_tracking: Use
 igt_create_fb()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
 <20240702232817.31147-5-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240702232817.31147-5-ville.syrjala@linux.intel.com>
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
> Calling igt_calc_fb_size() and igt_create_fb_with_bo_size() like
> this back to back is the same as just calling igt_create_fb().
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   tests/intel/kms_frontbuffer_tracking.c | 11 ++---------
>   1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index e45d17dd692d..da593c3aacc7 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -1630,8 +1630,7 @@ static void create_fb(enum pixel_format pformat, int width, int height,
>   		      enum tiling_type tiling, int plane, struct igt_fb *fb)
>   {
>   	uint32_t format;
> -	uint64_t size, modifier;
> -	unsigned int stride;
> +	uint64_t modifier;
>   
>   	switch (pformat) {
>   	case FORMAT_RGB888:
> @@ -1665,13 +1664,7 @@ static void create_fb(enum pixel_format pformat, int width, int height,
>   
>   	igt_warn_on(plane == PLANE_CUR && tiling != TILING_LINEAR);
>   
> -	igt_calc_fb_size(drm.fd, width, height, format, modifier, &size,
> -			 &stride);
> -
> -	igt_create_fb_with_bo_size(drm.fd, width, height, format, modifier,
> -				   IGT_COLOR_YCBCR_BT709,
> -				   IGT_COLOR_YCBCR_LIMITED_RANGE,
> -				   fb, size, stride);
> +	igt_create_fb(drm.fd, width, height, format, modifier, fb);
>   }
>   
>   static uint32_t pick_color(struct igt_fb *fb, enum color ecolor)

