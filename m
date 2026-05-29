Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3E7CD6E4A
	for <igt-dev@archiver.kernel.org>; Fri, 29 May 2026 12:09:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800DA10FE1D;
	Fri, 29 May 2026 12:09:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="rjASfAFI";
	dkim-atps=neutral
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C62810FE0F
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 12:08:52 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-c70c112cb61so10596695a12.0
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 05:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780056532; x=1780661332; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wnhn9EINF+/1wFJUv8RT1q/uPzagaJcX78hE7Su36c0=;
 b=rjASfAFIvqqHP1FrB1yProPz3fuc2jNh2tQ+/pHDElH0/TXDS4bToQcxg+mxCiUDjr
 hvIxUQ1y3f4rfxOyTWjPqT+6RdLFBlyffULny0YQgSOYE9FKxDi2zl6FN/sMOmz4nINp
 XTwWZQVErROoLjhDjMPbXg+7Ig6oWV31j3gQhF13DdC0TJHRKhf0/E7xGRlLI6P83fyS
 r31zGwyf1i7VQ9KYvgX1XK43dxBysRTvhZwDFaxdJcfgMyAV07Vy8sF/EbeMXglwoqLo
 yuoe7moIWnG7zQ/Z/9eXMyANUbrU7CuO8W3pb9yshcwga9IzomN6vOneXStRgmxLgEd5
 z/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780056532; x=1780661332;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wnhn9EINF+/1wFJUv8RT1q/uPzagaJcX78hE7Su36c0=;
 b=Kr/iqszUbblWSt0GKlOEVxcv9WrrnzpFYgr2DkFJeWCjthG4/M1MJN3tU09Dp/OHLz
 ppwMixwFQ8hShl2iI05vKS2nHfoS+gkOQhTpkILS3T26+9k0NjMx8rdLL1IxC3umRX/Q
 geLi96NxxN5mjMsf9lTj33CUCXJM8lyrljbZv+vRvrAycqynDmvdG0QWCiQjLrg+SpBY
 DIg4tqUGqOWinvQ439SrdiCwP7AYx2Fx8C8GEYLbheTZKtZmSYA5e738F011kL3uKmtS
 S/+xEoABA/tKqORWzz/WBPDx2h5EG58Ps4q8l9aARdM2kdCDvZ24KLdVumI6scW/h2QU
 ZoUg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8ig12+e3GREfULMSA19T3LRww6UGxl2vEZnhHn8ixO/TAVE3bLuDuUTpopdVC/uWC5s1EZF+ys@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZAriEYQoJC5oPiWjonnyF6h4UupVewF5ZuXcrULIds+fsztLX
 SEEEIbRuIMy67vkRz9nq/d+PfBuKDTjzgPIUvdloQa0nRarVWDIAzskW
X-Gm-Gg: Acq92OEcukSAvmx9pvGlMcSFQ5RFFBgqI3EhrbKFD7PQ2VU3HlPWpvajuj5HA9+i8nb
 OANAPViQxdBHFb8Zw2bu19/a9RabVR2/GWUXSv5jY4gsoeKB4W+JQ3TeI7fuYCuER/ey9uVdjMy
 kr5zK8Ai1DPjjU7OlMnuKKiLjXauH8/bYmFsu3oGWKmMDGke1RiDsPgD0zFRHMWNetjQ8bKhwzs
 5NF6ZXxfWj5uNd23ZvB9c0sOTjLxmf6GP23HVJzeDAI1q8I3jwiTxXwVE2nuNqJSdGlgztXmlIu
 JtR3RLuK5sq3AiylRz2A4u9tAGJ38Toj51GqWZ0hC1EoRqLTM5+mg1Xt/GVYM7sL5uWe8Uch9Ny
 JU89mYCuWRu7nHu4MDU3z6BvnjjWxjIg4jRsDa3DuBUgQvCROAk0Zqf2ni0x7QK8TpHRME5ZRgE
 O2/K81Qg51YOJdpi5MgTLvnWTrRisfWmaedHseujASam9xbxlXFoQI0/alEco9bse+aWZfwhgt9
 DbRw+SFZQ==
X-Received: by 2002:a05:6a20:9f07:b0:3b3:31f0:24b6 with SMTP id
 adf61e73a8af0-3b411de9875mr3169747637.22.1780056531877; 
 Fri, 29 May 2026 05:08:51 -0700 (PDT)
Received: from [134.134.137.76] ([134.134.137.76])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c85772d5ebasm1580174a12.27.2026.05.29.05.08.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 05:08:51 -0700 (PDT)
Message-ID: <bd3c799a-4e25-49f4-9751-cffe7bca8624@gmail.com>
Date: Fri, 29 May 2026 15:08:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 18/25] tests/chamelium/kms_chamelium_frames: Use
 for_each_format_and_modifier()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
 <20260512122143.11013-19-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20260512122143.11013-19-ville.syrjala@linux.intel.com>
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 12/05/2026 15.21, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Replace the open coded for_each_format_and_modifier() with the real
> thing.
> 
> igt_plane_for_each_format() would be a better fit here since we
> don't need the modifier in the loop, but the test keeps track of
> the index and stores that in a yet another array in order to
> then pick a format+modifier combination in random. There's probably
> a less convoluted way to implement this, but meh for now.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   tests/chamelium/kms_chamelium_frames.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/chamelium/kms_chamelium_frames.c b/tests/chamelium/kms_chamelium_frames.c
> index 3a59c2b51a9b..d1d76f26d6a0 100644
> --- a/tests/chamelium/kms_chamelium_frames.c
> +++ b/tests/chamelium/kms_chamelium_frames.c
> @@ -305,14 +305,15 @@ static void randomize_plane_setup(chamelium_data_t *data, igt_plane_t *plane,
>   	uint32_t idx[plane->format_mods.count];
>   	unsigned int count = 0;
>   	unsigned int i;
> +	uint32_t f;
> +	uint64_t m;
>   
>   	/* First pass to count the supported formats. */
> -	for (i = 0; i < plane->format_mods.count; i++) {
> -		uint32_t f = plane->format_mods.formats[i];
> -
> +	for_each_format_and_modifier(&plane->format_mods, f, m) {
>   		if (igt_fb_supported_format(f) &&
>   		    (allow_yuv || !igt_format_is_yuv(f)))
>   			idx[count++] = i;
> +		(void)m;
>   	}
>   
>   	igt_assert(count > 0);

