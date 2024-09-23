Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6AA0CF9C72
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 16:40:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9AF10E42F;
	Mon, 23 Sep 2024 16:40:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Pm/4RMm7";
	dkim-atps=neutral
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38DC810E435
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 16:40:02 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a8d0d0aea3cso632109366b.3
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 09:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727109600; x=1727714400; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=mrAqgOitREHBvztgVZUneCOVLQLlYQU0PNPGBn0eEag=;
 b=Pm/4RMm7a7XOcjryoW63CNFkglfQTbGIJ682TfHj7IgxaWEFPpfkzXo20xl5gurFIn
 wkIh36dM7NwxWdXaXSQhvymsiyprIl48xI07j7I30U0u0ZKDZDZIGVh1py3hmrkfqRvP
 JhvFofl8let9PhCJP9QxQt1ohwtzonuta4ofrm60lKALDZmkP5DYdWZKo8Lh1SnCYDxd
 FDcsjA4pIveUwVL952YGyfuhLFg5cWVeXKoi0B+OjYjh8Ng6s2TgdEdywZ+qq2Nfb3n8
 SFhjCg/DjRYnmwJaK1ubXwduF47ASXzSZ0pZ5pVq1yIEen/GYNZP5p65NTqieMVGbYGx
 pfdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727109600; x=1727714400;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mrAqgOitREHBvztgVZUneCOVLQLlYQU0PNPGBn0eEag=;
 b=cMwY1QKXa+/R/bY9PavdaBTmp3Mfsi0H2sNRq/xyZws20Mx76jdRkgO2gnccMiyKLs
 UYGYfggtshFmwuV5LMob2wd8roEsEFe9grTX9Cv0f+qK7s36ReaJstu7vti/RS+x8JYe
 yaslrzTMDzu/AvrtVcSWlH23iJ58n32z5W5RLri4KN3Waz+FL/8BkM61bq4YLEVfNkp0
 A9F8nzlEnsNSHFChwszJ+z+k63ai+kUt62ugF+12FuPyaXA7fuwq0PiXDxDK/ty+Cm7E
 FiUcVrJAVo/VkYLKzCIJlJE35UY2JyTbilgFAH/oLd0tWv9Q6Ho1d+xNDPVdNKbhHJhH
 yWrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUj/F1UIJMj82KUwX0NfZIxd4vznD4NPyL4C+PuAlsmrWL9e7Qkj3zTZdeY+yaeZ+0jOcoVaYsX@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDFAMuNM1UwqyMF0Pc/LskwMFMo7IaYHgiVpZL9i2w4LgG830D
 qmkclT8ttEGOg3KH9a20+7G+RkH2ca4J4C5vmIY+G4ZwNH8nHoEC/efc0elA3j4=
X-Google-Smtp-Source: AGHT+IGz4XmYfwMAXfJ1rN/nO+A45rXQ0UQc6qTHI1pRLFqJU69yeK2B0zCYI3KlsM5CQWcbHpI65A==
X-Received: by 2002:a17:907:9282:b0:a7a:af5d:f312 with SMTP id
 a640c23a62f3a-a90d514a9b4mr1130183466b.46.1727109600234; 
 Mon, 23 Sep 2024 09:40:00 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.75])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a90610967a5sm1257013266b.21.2024.09.23.09.39.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 09:39:59 -0700 (PDT)
Message-ID: <ff0b9873-db03-4d7a-8ff5-35acf4cadf5d@gmail.com>
Date: Mon, 23 Sep 2024 19:39:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 15/18] tests/kms_ccs: Correctly check clear color
 for fp16 formats
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240918120518.30258-1-ville.syrjala@linux.intel.com>
 <20240918120518.30258-16-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240918120518.30258-16-ville.syrjala@linux.intel.com>
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
> The hardware generated clear color will be in the native
> pixel format. Generate the reference correctly for fp16
> formats.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   tests/intel/kms_ccs.c | 23 +++++++++++++++++------
>   1 file changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index 68e925382bd6..971d9fe0fcae 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -35,6 +35,7 @@
>    */
>   
>   #include "igt.h"
> +#include "igt_halffloat.h"
>   
>   #include "i915/gem_create.h"
>   #include "intel_pat.h"
> @@ -200,6 +201,7 @@ static const uint32_t formats[] = {
>   	DRM_FORMAT_XYUV8888,
>   	DRM_FORMAT_XRGB8888,
>   	DRM_FORMAT_XRGB2101010,
> +	DRM_FORMAT_XBGR16161616F,
>   	DRM_FORMAT_YUYV,
>   	DRM_FORMAT_NV12,
>   	DRM_FORMAT_P012,
> @@ -324,7 +326,8 @@ static void check_ccs_cc_plane(int drm_fd, igt_fb_t *fb, int plane, const float
>   		uint32_t d;
>   	} *cc_p;
>   	void *map;
> -	uint32_t native_color = 0;
> +	uint32_t native_color[2] = {};
> +	uint16_t half[4];
>   
>   	if (is_i915_device(drm_fd)) {
>   		gem_set_domain(drm_fd, fb->gem_handle, I915_GEM_DOMAIN_CPU, 0);
> @@ -341,25 +344,32 @@ static void check_ccs_cc_plane(int drm_fd, igt_fb_t *fb, int plane, const float
>   
>   	switch (fb->drm_format) {
>   	case DRM_FORMAT_XRGB8888:
> -		native_color = (uint32_t)(cc_color[3] * 0xff) << 24 |
> +		native_color[0] = (uint32_t)(cc_color[3] * 0xff) << 24 |
>   			(uint32_t)(cc_color[0] * 0xff) << 16 |
>   			(uint32_t)(cc_color[1] * 0xff) << 8 |
>   			(uint32_t)(cc_color[2] * 0xff);
>   		break;
>   	case DRM_FORMAT_XRGB2101010:
> -		native_color = (uint32_t)(cc_color[3] * 0x3) << 30 |
> +		native_color[0] = (uint32_t)(cc_color[3] * 0x3) << 30 |
>   			(uint32_t)(cc_color[0] * 0x3ff) << 20 |
>   			(uint32_t)(cc_color[1] * 0x3ff) << 10 |
>   			(uint32_t)(cc_color[2] * 0x3ff);
>   		break;
> +	case DRM_FORMAT_XBGR16161616F:
> +		igt_float_to_half(cc_color, half, 4);
> +
> +		native_color[1] = (uint64_t)half[3] << 16 | (uint64_t)half[2];
> +		native_color[0] = (uint64_t)half[1] << 16 | (uint64_t)half[0];
> +		break;
>   	default:
>   		break;
>   	}
>   
> -	igt_assert_eq_u32(native_color, cc_p[4].d);
> +	igt_assert_eq_u32(native_color[0], cc_p[4].d);
> +	igt_assert_eq_u32(native_color[1], cc_p[5].d);
>   
>   	igt_assert_eq(0, gem_munmap(map, fb->size));
> -};
> +}
>   
>   static void check_all_ccs_planes(int drm_fd, igt_fb_t *fb, const float *cc_color, bool check_cc_plane)
>   {
> @@ -854,7 +864,8 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
>   
>   	if (igt_fb_is_gen12_rc_ccs_cc_modifier(data->ccs_modifier) &&
>   	    data->format != DRM_FORMAT_XRGB8888 &&
> -	    data->format != DRM_FORMAT_XRGB2101010)
> +	    data->format != DRM_FORMAT_XRGB2101010 &&
> +	    data->format != DRM_FORMAT_XBGR16161616F)
>   		return false;
>   
>   	/* VEBOX just hangs with an actual 10bpc format */

