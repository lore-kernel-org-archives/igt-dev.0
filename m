Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B35D3A662
	for <igt-dev@archiver.kernel.org>; Tue, 29 Oct 2024 14:44:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A05F10E284;
	Tue, 29 Oct 2024 14:44:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lhrHM2iY";
	dkim-atps=neutral
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD94E10E284
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Oct 2024 14:44:27 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a9a0c7abaa6so669797266b.2
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Oct 2024 07:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730213066; x=1730817866; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=h2FPN6MqVoSksmWF1dyZnH+p6hfxtiqX/48NnJkgrr4=;
 b=lhrHM2iYyucxf/+P4RlXqox3W28fotA5yp9vlnxcuGnAsSQ6dFDytpjKLGF3AR/unY
 aBTulgxq/3jj/uWB4XwFIPU9/m0HeKcTdxOISw+wnZ74LeiK1KFTwS0xC7f2Y2yzXUs4
 sOShNwAz8N6fRUf6fQBOAgcZNwE51jvvnlomEm1RYuFcw75uoKK2mu/SMwqEJAJ5wuSB
 Z21M1y5UUzJlUQ4N5CrKpS//nW+CQoFsugsN1ulC0uWuQlUNxwNrRfhgjBshNctGQCLz
 /ONICDQ4raOdTNEiYGRHbs1nSaNWyCGPw0fMNh+CIKDPxir5Y8qW+Bwxvx1zsGlpQjbJ
 HfOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730213066; x=1730817866;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h2FPN6MqVoSksmWF1dyZnH+p6hfxtiqX/48NnJkgrr4=;
 b=WhUKTViMlh9U0dbw2UWdQQWt3wO+Ob9eaEFet346NBsVDcGxiQ5nSCfK+KzqC2HFqR
 B3aMguNVx0MRLAj/dkh30W2iKPX2rYes1oFvLCHlN05gMlckr7LNlRYa7maNuZCfMSjq
 +tBEbfaw15WvqbcMQKKSpHBKwL1L0EZlBmfcXpJAc064Ik8gNaqcCSddKk+OTfn4L9gP
 E/7lkgPYUhZZBWCUim1Y18jGFFHfV94QvL6oxyhCF8LycfcPBgl2NG3PiwOrqAwI2F8t
 O7OR7FvXVDQfO/COHAlx+uA3V59R3CqLkGNukUuKQIbxrpm1f18NTjcj8MCuFPaKaz3q
 EZYQ==
X-Gm-Message-State: AOJu0YyVMYvrGb6ljGwGAorSxe8tE/gxJJQuWMmeF07njYQ8S/5Q0KSl
 8ZuuLN0jWR4dhwWJf9xGVwblmlwcp9gSH/Zty31JPYrnVeKPs6c+fe42LxJdS6kljg==
X-Google-Smtp-Source: AGHT+IHZMnu4fXzozd4bcsetkOEb3vVobq0l8Mw4+fPaeh6iVGqr6aihKslcTGvDGOXjm/AkRHNMGg==
X-Received: by 2002:a17:906:f59a:b0:a9d:e022:38d8 with SMTP id
 a640c23a62f3a-a9de615ae47mr1066525166b.51.1730213065463; 
 Tue, 29 Oct 2024 07:44:25 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.69])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a9b1f29a430sm482045966b.139.2024.10.29.07.44.23
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 07:44:25 -0700 (PDT)
Message-ID: <bd9f4a70-940b-44ac-9db3-cbd7f972584e@gmail.com>
Date: Tue, 29 Oct 2024 16:44:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 01/14] lib/igt_draw: Use void* where appopriate
To: igt-dev@lists.freedesktop.org
References: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
 <20241004104121.32750-2-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20241004104121.32750-2-ville.syrjala@linux.intel.com>
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
> Use void* instead of uint32_t* when we don't care about the
> element size.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/igt_draw.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_draw.c b/lib/igt_draw.c
> index 97a7e6b375fb..3ebfaad6ef31 100644
> --- a/lib/igt_draw.c
> +++ b/lib/igt_draw.c
> @@ -446,7 +446,7 @@ static void draw_rect_ptr_tiled(void *ptr, uint32_t stride, uint32_t tiling,
>   static void draw_rect_mmap_cpu(int fd, struct buf_data *buf, struct rect *rect,
>   			       uint32_t tiling, uint32_t swizzle, uint32_t color)
>   {
> -	uint32_t *ptr;
> +	void *ptr;
>   
>   	gem_set_domain(fd, buf->handle, I915_GEM_DOMAIN_CPU,
>   		       I915_GEM_DOMAIN_CPU);
> @@ -481,7 +481,7 @@ static void draw_rect_mmap_cpu(int fd, struct buf_data *buf, struct rect *rect,
>   static void draw_rect_mmap_gtt(int fd, struct buf_data *buf, struct rect *rect,
>   			       uint32_t color)
>   {
> -	uint32_t *ptr;
> +	void *ptr;
>   
>   	gem_set_domain(fd, buf->handle, I915_GEM_DOMAIN_GTT,
>   		       I915_GEM_DOMAIN_GTT);
> @@ -497,7 +497,7 @@ static void draw_rect_mmap_gtt(int fd, struct buf_data *buf, struct rect *rect,
>   static void draw_rect_mmap_wc(int fd, struct buf_data *buf, struct rect *rect,
>   			      uint32_t tiling, uint32_t swizzle, uint32_t color)
>   {
> -	uint32_t *ptr;
> +	void *ptr;
>   
>   	if (is_i915_device(fd)) {
>   		gem_set_domain(fd, buf->handle, I915_GEM_DOMAIN_GTT,

