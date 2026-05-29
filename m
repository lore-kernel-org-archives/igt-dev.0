Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31993CD6E45
	for <igt-dev@archiver.kernel.org>; Fri, 29 May 2026 09:31:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7DAF10FBCA;
	Fri, 29 May 2026 09:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jphguXwc";
	dkim-atps=neutral
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com
 [74.125.82.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC9110FBCE
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 09:31:17 +0000 (UTC)
Received: by mail-dy1-f173.google.com with SMTP id
 5a478bee46e88-3042a388168so4810819eec.1
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 02:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780047077; x=1780651877; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XO24kbkzdBfBNiFt8kXhIqcLJbOYwhiYnwaspSsxF6M=;
 b=jphguXwcv8rgUIBXreLyZmPPp+aKge8R8FsmSbzG09R9Av3C0/waYEu+uJP4EDXHMl
 A6fsAslk60uBy1czMXVne/l8542IBq/i2XT3GbTZD7R1UAQTVXud2doHNFhA3XqJx4uJ
 ulg4ijzM0uOFoTxhOvWdCKfIFjSfvPU8WYHL0Y09arZB+lrDDkc2+ZUNqMXYpyOndgYF
 RrpzEo1hEPxRP1r9hkOaB1ct+LeYpUE8SnY33wxReeKlmbNlwfV+3W6jF4Xz4H1XrfIp
 EB+MIl2geIgY2C5HOLvCxWsKjfTYy90/o+pqqABVecIYCc3GhGM09Zkp6k3ggj7lm0Ib
 ACww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780047077; x=1780651877;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XO24kbkzdBfBNiFt8kXhIqcLJbOYwhiYnwaspSsxF6M=;
 b=HY7FYnplBMBK96xUM0zUA+Fm/L3CJuS0CCQ9Pvoh7iz4XLB56Cq/WapDhu0FVW7xa6
 rbdXqKnJJmKA1uItJfQRlnZDkfK4oKUOKygKdZgXgFZkvYT8OnRxhFIDHoxrR3f7dnCY
 PCL4PtPJTBlg9Bpu5ngbkplj66AnALYfp3mRQ4WjR3Xn2PFQbfU4ATRbF6288jpeoXEu
 V2C5n/FRKhigIgxhIaF+QMEpMcYoCX/AVTRjVNg/TVVIPHGVBT7KacN8zc+zJgF3aI8K
 alf/5X+kvWTe6i2nYnM/W9ExX44Cssj0KPlPlzMqDDJ/Ar8jKrcG86yuhcUHT1msHTjH
 Duxw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9mOExLWMP0s33mUWrPBSW0Facg+IYay+ri3zjt5f1Hi01gHJtUXLk/IdUJta6rr33i9G5HVf/k@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFu5rmtklQ24g9657Ba4IMqv9HHdgWvIpqU3xNxz6dZLzaVJey
 FDgws/2rvFolygmqreU1waQtVLWpFe5M/gv3WNYLiK6pRRNtqHVsFQzvq0o2WQ3f
X-Gm-Gg: Acq92OGZ0ITukSWPy9dUNBgFJRaaSi6ntSKX1cvnhXN0OHxDJnbV3AGGU8+KX60c/A2
 gtINWiBn1mUMeA2N/KRxxUCtWmx6r+S9k7g4p9X4pMgcErQ6kXu0myvxzkZrpq8jxLascFOsEZU
 hhbKMm/f3HPLnLVmpQo7xcjK2ACLVvytiRf0zMckZBgrUSex93BeKJxU8A3sRutNzSV8XHsC3f6
 R2t5J3dppZB1wiLSjLde2ERIGnZZpefYyi0yu4lG7wU18b0CvEkhmQqMgJb3ZznUP/8rT1un2Oz
 S7Uf3OcL89cGsqeDtl+rZFI581+BUvk5cyEXWL8WzuNvKDIogj5XeVBkgzO475M3Tvk7ijjJ4lu
 5bbaVbQ9rQTkCTWNIrLnPGwgAdAc/FyYI2iYPMcI78C2EmarNuTXKxqKf92SmmV2fthTIwszMly
 nExqNObU+TRJ4zQaJqE1BpFTIseAcq/H4l8TFUAHSdW+rVsfjyi/gQo4+4R9EW6/NA4mp6qKtdF
 d3o
X-Received: by 2002:a05:7301:1288:b0:304:ad0:e91 with SMTP id
 5a478bee46e88-304eb4734bfmr750632eec.4.1780047076581; 
 Fri, 29 May 2026 02:31:16 -0700 (PDT)
Received: from [192.55.54.47] ([192.55.54.47])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ed130dafsm981005eec.0.2026.05.29.02.31.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 02:31:16 -0700 (PDT)
Message-ID: <fe3b738e-1dd1-422e-8308-efc282065a10@gmail.com>
Date: Fri, 29 May 2026 12:31:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 06/25] lib/kms: Extract
 fill_plane_default_format_mods()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
 <20260512122143.11013-7-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20260512122143.11013-7-ville.syrjala@linux.intel.com>
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
> Extract the code that fills the format+modifier arrays when
> the plane doesn't have the IN_FORMATs blob. I plan to reuse
> this to also fill the async format+modifier list.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/igt_kms.c | 33 ++++++++++++++++++---------------
>   1 file changed, 18 insertions(+), 15 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index b39cba8ae5e1..b3ee8a61683e 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6220,28 +6220,31 @@ static void igt_parse_format_mod_blob(const struct drm_format_modifier_blob *blo
>   	igt_assert_eq(idx, format_mods->count);
>   }
>   
> +static void fill_plane_default_format_mods(igt_plane_t *plane,
> +					   struct igt_format_mods *format_mods)
> +{
> +	drmModePlanePtr p = plane->drm_plane;
> +
> +	format_mods_alloc(format_mods, p->count_formats);
> +
> +	/*
> +	 * We don't know which modifiers are
> +	 * supported, so we'll assume linear only.
> +	 */
> +	for (int i = 0; i < plane->format_mods.count; i++) {
> +		format_mods->formats[i] = p->formats[i];
> +		format_mods->modifiers[i] = DRM_FORMAT_MOD_LINEAR;
> +	}
> +}
> +
>   static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane)
>   {
>   	const struct drm_format_modifier_blob *blob_data;
>   	drmModePropertyBlobPtr blob;
>   	uint64_t blob_id;
> -	int count = 0;
>   
>   	if (!igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS)) {
> -		drmModePlanePtr p = plane->drm_plane;
> -
> -		count = p->count_formats;
> -
> -		format_mods_alloc(&plane->format_mods, count);
> -
> -		/*
> -		 * We don't know which modifiers are
> -		 * supported, so we'll assume linear only.
> -		 */
> -		for (int i = 0; i < count; i++) {
> -			plane->format_mods.formats[i] = p->formats[i];
> -			plane->format_mods.modifiers[i] = DRM_FORMAT_MOD_LINEAR;
> -		}
> +		fill_plane_default_format_mods(plane, &plane->format_mods);
>   
>   		return;
>   	}

