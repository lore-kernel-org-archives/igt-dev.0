Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F23C5472F
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 16:53:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D3C710E3AD;
	Tue, 27 Aug 2024 16:53:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BP7JwxqU";
	dkim-atps=neutral
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB7010E3AD
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 16:53:31 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-42809d6e719so50473195e9.3
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 09:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724777609; x=1725382409; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=OnUqrMbP60ka6bgzoNFeHJq2qC4KFg4qCys9GE4GlWA=;
 b=BP7JwxqULtn9n3sXw6+UumTe8VoXyFwhctObAYBXxpeyWoSrDw+R3JYdoE8fsuh+3f
 oClOEp3Vc+kDj3oA94IJo6ZB7jxI8D9NTW0nIco7p+VOn+AvoPrXXNGtNMrvzp5OubyP
 I74INMwqlFwWCDC3vaqoTjarE1B+vtq+U44IYXdnqcc13gdA5moyr/U9vanHKRM7C48k
 VF12tDyz2FMVB2AonyQqgcqmnRldpHJF5US0XtdKUqud9/l3e4gjhVvFqv6htnH6FtPu
 6Xn5e34L6Vdt0Meb5+lT+UxLofX2kBB8Us83Vnmy0u7fR02LWDvthnlP+/WchbiWQ8aw
 HvGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724777609; x=1725382409;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OnUqrMbP60ka6bgzoNFeHJq2qC4KFg4qCys9GE4GlWA=;
 b=tqNxrUIeDXscQ/YtmbaIoQ7dU/BmaPXe+rXlVjzB710tOxJR4UOGRVWWUU4eeEgeTj
 kEub5cO1F+yll32plFXfoKBrbSLl5ADXDK5c8lEK/6pNqXOkB+ulCNLZ1eaUd90zjcq8
 EMOJDB6VBS/w6+1yL0ntGr8Q76uEKJ4X0swO3Yn9HvHdUxtKLRTz4XotGo6sPffGfahk
 bkgBswOgAEWtVrE3VosAJMEigegWXWxEMBMH0HTbY6aLM9cSPyGMZC9SA0q8NyNITGVR
 XCbeqsLFwPocionTyng1oivp44aKCleACeP47z4/ZAhK3/qfJPL0aAhvgFDTgs95Ar2t
 JVow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjpxhs7Of1VyUA9rFsyRwyU+xPWD1CRtTBf7adZVORkQtI7smot1EwqwEHksDN3LzYcP8jhzjV@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyw5cjYb9H6RFeUlX0o9ZKwR9hujlCn0yjrXd3UNdARI3zbK71e
 wg9vN/P/01j5dIl21gY/UnO/xKyraTUKgOd9CaTmV6p7Kho/piOB
X-Google-Smtp-Source: AGHT+IHjKQ6IWd5xaVom8l3eCdMgcefuESCKK6nF0v4l+APdOJC/Ky8X39iYou6+38A73Qi+7dkKeQ==
X-Received: by 2002:a05:600c:3c89:b0:427:b995:5bd0 with SMTP id
 5b1f17b1804b1-42acc8ff81emr95733695e9.23.1724777609359; 
 Tue, 27 Aug 2024 09:53:29 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42ac5162347sm189937725e9.23.2024.08.27.09.53.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 09:53:28 -0700 (PDT)
Message-ID: <5084803e-c07a-4094-9d25-3c53ce742636@gmail.com>
Date: Tue, 27 Aug 2024 19:53:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 22/37] lib/igt_fb: Add 16bpc compression format for
 the blitter
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
 <20240702232817.31147-23-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240702232817.31147-23-ville.syrjala@linux.intel.com>
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
> Pick the correct compression format for the block copy when
> using an fp16 pixel format.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/igt_fb.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index e120ee9dcf70..c0b157ee44fa 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2879,6 +2879,7 @@ const struct {
>   	enum blt_compression_type type;
>   	uint32_t return_value;
>   } compression_mappings[] = {
> +	{ DRM_FORMAT_XRGB16161616F, COMPRESSION_TYPE_3D, 0x5 },
>   	{ DRM_FORMAT_XRGB2101010, COMPRESSION_TYPE_3D, 0xc },
>   	{ DRM_FORMAT_XRGB8888, COMPRESSION_TYPE_3D, 0x8 },
>   	{ DRM_FORMAT_XRGB8888, COMPRESSION_TYPE_MEDIA, 8 },

