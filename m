Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55347C54731
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 15:16:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1074210E34B;
	Tue, 27 Aug 2024 15:16:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RaBsa4Uc";
	dkim-atps=neutral
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0ACC10E34A
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 15:16:56 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-42819654737so48302585e9.1
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 08:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724771815; x=1725376615; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=2YKdUmo0AynzTd7C43bIu6jfBq6h+uPWqTTT5yLsGrc=;
 b=RaBsa4Uc5toRRQTOkVrX1c+uLYx/fiyOuQTzlAa+knoo2R8CpGI3lSKykyczEunKG2
 EazwsEYf58TGeuXi0SjdL0gknLt1fKFIlh1vLmRxDpBimekHR749ir8KVxl5VCXP6qx+
 SlQJNwDzf6qJuHEVFCN7HHL/0fxAR3dPeAoIlMKeR+fW1FBZlJmfmPGxMgxZTioreqJ7
 I/3kjmW5wQt+X5Uk6wNiK/zPZ4IWcNrLsu7QBf1FzRZRyFXp75sSFfklrYrutGmrCRpA
 UVbBnMW9kUawhk/cU3Krcm6XKOZP0eU3m4o2DpEUPiOPdyyd0CEIK3w/kmwpbvVbL1fW
 3DJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724771815; x=1725376615;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2YKdUmo0AynzTd7C43bIu6jfBq6h+uPWqTTT5yLsGrc=;
 b=EeBJ8cmO73GH8z+fBoMRtKdWsW+j/cvUS1YnRkkInynSZ+iFUWgx5gRnqKp0ALfpXj
 TSxhlC13jfllgz5kDseNZtiZQibQ4sKUgC+cALnB+nCr5IkDv2sgsH6ti4kDwx4oq72C
 pe3pOD6WKcrgB6QCXvqouM9OkxyuDh+ZYgBtbAh/MIvX0crP0x/hjzhKissrPAAQov/C
 2gS7NfD9hWLrOQiDZL6Jvn2llzgK0opatfjDtXPyXGCJOfUXJHoNlxAaWIkdSHeNN/y8
 DZkguFISyTb9r2eYTyRQVl1s7D1/L0OaOAJV2BEtn1Sf49nCyN2x3rD0ko1XP0R9wCcu
 MVDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyYM9UQVfxBtlq2p2h3jRdAF2TzNQ3BjxlHh6GNNKLy8YCJ3grdExP5sJ4W9Ld2JLWGmsxfNJ/@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0swu7vA0S0SauemrpyifxpaLP8zELTT+4U5z8EjMahpmCDRo6
 oon0LNHgaSxmuau6JYVzB9F2nN+nyXhjYjejQfBKPAvy7KGeDG7PozCIXUd7oD4=
X-Google-Smtp-Source: AGHT+IEbbVEj3MxEKLHVM5MY//NukxfN5LkQmozkeTLYik5jfNmN6n+sGDDHKjfUO0JwjxoAWSdzjw==
X-Received: by 2002:a05:600c:46cc:b0:426:5440:8541 with SMTP id
 5b1f17b1804b1-42acd5d9cd2mr83039865e9.27.1724771814616; 
 Tue, 27 Aug 2024 08:16:54 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.137.72])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42abef8175fsm223975405e9.25.2024.08.27.08.16.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 08:16:54 -0700 (PDT)
Message-ID: <aab44ff2-6e5f-4cd9-8c56-601eb74234c7@gmail.com>
Date: Tue, 27 Aug 2024 18:16:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 07/37] lib/rendercopy: Don't skip clearcolor on flat
 CCS
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
 <20240702232817.31147-8-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240702232817.31147-8-ville.syrjala@linux.intel.com>
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
> We always need to tell the hardware about the clear
> color buffer, otherwise if we sample from a fast cleared
> buffer we get complete garbage.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/rendercopy_gen9.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> index f0757a8e6b78..57b64dad1b1d 100644
> --- a/lib/rendercopy_gen9.c
> +++ b/lib/rendercopy_gen9.c
> @@ -249,7 +249,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
>   			ss->ss11.aux_base_addr_hi = (address + buf->ccs[0].offset) >> 32;
>   		}
>   
> -		if (fast_clear || (buf->cc.offset && !HAS_FLATCCS(ibb->devid))) {
> +		if (buf->cc.offset) {
>   			igt_assert(buf->compression == I915_COMPRESSION_RENDER);
>   
>   			ss->ss10.clearvalue_addr_enable = 1;

