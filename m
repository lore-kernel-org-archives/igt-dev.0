Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5EDC5472F
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 17:48:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242D410E0C4;
	Tue, 27 Aug 2024 17:48:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g549Uykk";
	dkim-atps=neutral
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1DD010E0C4
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 17:48:43 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4280ca0791bso52181385e9.1
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 10:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724780922; x=1725385722; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ve/37MeNDHoaMO4em/GLWWHsCRTsg/w5cStWe7yQXSM=;
 b=g549Uykk2ulvJT8qybYEspiIjhYqRlYQTZCaYRDNZWlWSMFBQNKqJZS2C3ybz51ou/
 wl7skLaeHyKaEgwAo3K9Bd1h9iFgyFD7rNsJ5pmFn/Ijmk/Y1pgkwfpfDCd6Utnjkfj0
 0ZMLOlzpvpTcxTbhXDUXH3gJA0ss8nNocTrS9jDkFJ9MVsmKhqHTbaSuotL8i+ACq+Mi
 qAtYJ09L6DT1XLRtgAqSjVL9GQZ1hC8rB1T9pppRHxVR32/rjTW8+t91ei8DzavFpg8S
 FjPZzPfpjWamhQ+YYswVPuWH7V/a344HKAZmnmrFFINebN2rmMQFGXuDdph4qF5VExwG
 uUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724780922; x=1725385722;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ve/37MeNDHoaMO4em/GLWWHsCRTsg/w5cStWe7yQXSM=;
 b=I71Tbxcd+8oELE+0nuiuscmJWLyc0vHO0fvF99NnYLrK4CKNNQeg+Ztk3nMF0aQsCA
 9JJow8syVZbLMW1Jnfd7HPqzzwQIHn/fhDrXSLXWK8JzI40HXVA3kHtgUT39b2z1HHQY
 n7RJIcTjeGKwHcFv8YTo4b1OTmw9iIcOFy0af9fw9OKTrjUQdLcPwunLUxhWIKi3ietQ
 X5Q+8QDQ32GUcVUCsowlpIlz5VIq16VhN6xSYITBXc4Ag+Asd23I9+Q7LvcmgP09YYUt
 v3ZcWOGdnws59CbEwNcWOCW9i68kh/i3r2t8Dze2BFAmWJ3v7Jp/5sK8MsG5e9fI4Jh9
 HpnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXp3XGsgG+fZRwN9hWmf38Io+1/QOcEY8LNPlV2rTm6RCeeOaUjy1AncL8pyVIkSMSGYip+GpmH@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLHWldGsazbNVA/U9mhq9vF3/jsTeQi4PnKO8iHuT71iBUOLtN
 Xp2ppScSLHhPmMFQe1If7nnLlE0nT9vCbG6HHbwy87IRSJUQJvdOQ/e7Kd7ZJ4M=
X-Google-Smtp-Source: AGHT+IH8a+dEy0+rVbaoCdrFgJAyshq3ehrIDp6GT8NWMJLwE46OWEotUkiQpe/OwHEW2Z5dh5MFNw==
X-Received: by 2002:a05:600c:470c:b0:429:a3e:c785 with SMTP id
 5b1f17b1804b1-42b9adf1e85mr24162055e9.21.1724780921904; 
 Tue, 27 Aug 2024 10:48:41 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42ac517a614sm194047185e9.30.2024.08.27.10.48.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 10:48:41 -0700 (PDT)
Message-ID: <0f95634b-d4e3-4d0b-a2b2-bddf6bc8d6b5@gmail.com>
Date: Tue, 27 Aug 2024 20:48:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 33/37] tests/kms_ccs: Correctly check clear color
 for 10bpc formats
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
 <20240702232817.31147-34-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240702232817.31147-34-ville.syrjala@linux.intel.com>
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
> The hardware generated clear color will be in the native
> pixel format. Generate the reference correctly for 10bpc
> formats.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   tests/intel/kms_ccs.c | 22 +++++++++++++++++-----
>   1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index 30b61f132834..4c1c78ee4e58 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -321,7 +321,7 @@ static void check_ccs_cc_plane(int drm_fd, igt_fb_t *fb, int plane, const float
>   		uint32_t d;
>   	} *cc_p;
>   	void *map;
> -	uint32_t native_color;
> +	uint32_t native_color = 0;
>   
>   	if (is_i915_device(drm_fd)) {
>   		gem_set_domain(drm_fd, fb->gem_handle, I915_GEM_DOMAIN_CPU, 0);
> @@ -336,10 +336,22 @@ static void check_ccs_cc_plane(int drm_fd, igt_fb_t *fb, int plane, const float
>   		   cc_color[2] == cc_p[2].f &&
>   		   cc_color[3] == cc_p[3].f);
>   
> -	native_color = (uint8_t)(cc_color[3] * 0xff) << 24 |
> -		       (uint8_t)(cc_color[0] * 0xff) << 16 |
> -		       (uint8_t)(cc_color[1] * 0xff) << 8 |
> -		       (uint8_t)(cc_color[2] * 0xff);
> +	switch (fb->drm_format) {
> +	case DRM_FORMAT_XRGB8888:
> +		native_color = (uint32_t)(cc_color[3] * 0xff) << 24 |
> +			(uint32_t)(cc_color[0] * 0xff) << 16 |
> +			(uint32_t)(cc_color[1] * 0xff) << 8 |
> +			(uint32_t)(cc_color[2] * 0xff);
> +		break;
> +	case DRM_FORMAT_XRGB2101010:
> +		native_color = (uint32_t)(cc_color[3] * 0x3) << 30 |
> +			(uint32_t)(cc_color[0] * 0x3ff) << 20 |
> +			(uint32_t)(cc_color[1] * 0x3ff) << 10 |
> +			(uint32_t)(cc_color[2] * 0x3ff);
> +		break;
> +	default:
> +		break;
> +	}
>   
>   	igt_assert(native_color == cc_p[4].d);
>   

