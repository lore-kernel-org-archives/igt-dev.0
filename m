Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE65CD6E43
	for <igt-dev@archiver.kernel.org>; Fri, 29 May 2026 11:46:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ECF510FD6A;
	Fri, 29 May 2026 11:46:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="pYSSgi91";
	dkim-atps=neutral
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com
 [74.125.82.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6F110FD49
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 11:46:33 +0000 (UTC)
Received: by mail-dy1-f170.google.com with SMTP id
 5a478bee46e88-304b8ced372so4364020eec.0
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 04:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780055192; x=1780659992; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Z5LLVUTyyu7t0hJ9gVIr8cCogukWllZmh3+9NEb4mLc=;
 b=pYSSgi91xuKtMXt1BianOy8Bk7TayCnWjce5cQA3T8JjF6kEiu/shb1tUY/NVXKjh3
 Nse3ljVNJHtwEUVnuxxLj0JYeiCMyq2qDv3uvzBQ69C61sp012qKSyTr2zw1SPb4G094
 mONeteFLn1GjubRc1ZY1NNna4SviwN5LEvCzAAMx2AHMtcgG5hYFluzLb05Cq+c7MfJt
 pDDVRdZrczXwpNJWiUBmRr1v8GW67JEIct6Efa67G/DSj2rUvhojCzN1SLPl6RYL+8Lo
 vJebG+4UFYi6Jp7ZsV9uEFEbHrlo1J8KvrLBvbzucE8lPf0tJSRY/DmmTlc3r/LIb3E2
 ZdAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780055192; x=1780659992;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z5LLVUTyyu7t0hJ9gVIr8cCogukWllZmh3+9NEb4mLc=;
 b=Q2OItbO7MamTyIzMcbPSSeW6ArZLa048xJsvcvA2PijtGXhkdVkFejudzvz9sRac4z
 UsR5INURwiYY8kNnVV51tF9YrsSlbdnmC1lAl8nanzFTlunvSrZg1uygLj6tKiWSKuwO
 ZeDJgsONlgXa8A3rK/zgUvX9fzMWkV02xWQe/FomxLJj0z1hk3c8v9oXCJsyOyYDj6Nn
 qyu1xKPopycvwVVMM6YG7ySltntANgzwvBlWLBvEJTaageH8Pzl9cMBiMYjUJTn7fz2N
 etu3GMJU62zLhoCKqfmoZOKc76aLw7CrsaZ4UXEAO1r5O980yRB2cRT/BLCRlfx3azf+
 cpyg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8wvNtJMSn8s8dYMqvtuvAWsu+HJW9gnOx01BU08/2B+VHVKD6jesplRGIwMlEFGLQGpFVfEU+K@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy91Dn1MFr2A3QAUYTCna1d2OvVYFWSuQdWmEd4Klfg80h7aEXN
 fgfVTAZUzkLGvAvCCwXPnSDWy1lh3ce8RE5/EYyX/FdBZIWIqFV+k7umvuoEEFc/
X-Gm-Gg: Acq92OEAbFdcKirZjeimRIID2d8g+1XwahWWFA3RGNUOwb7cAecZ+DxAbA7EP1hAjU7
 +p5OJAWWpki+Ei7nKiW12/dU1pNC3T3ZmIJ79eXrwA8Li0LgPwTpndo/svtCdPlOW9Ga1LMNEQR
 MP857LTNoQPc0xN6SekwbcfAI/9ypWLtVbT3uN7u0nvGn2+H4tus+4KZ2ji3REU3Nd4lR6FYIN6
 JBsobcL+EyQlrzcv8DWvhiyk43jgfhFszEox6wCxS8pYHzN0IZcFSVpV7iDRjcfcIHAkHUL6Wiv
 6Yj4RCgGoX2sHJAKqztDggjcjjdLXWyu5UB3szukSsTpQJXAghhog9VnZv5+vxLWxQPXSYYpvC1
 NHFU/L14aKTqlgzjtST55psVI9d59mVwom9QWxdP8tRr+q3Nj2kGd1/AATzytCMFQOfIVngyyOg
 E7bdZXP2VxB+ERfvxhwvjCDi8B0ojkG8zcAEOrRs71dHq6OVNBMVNjNjTzLwj3BaryNdKKHZmqS
 REc
X-Received: by 2002:a05:7301:4186:b0:304:dc05:607e with SMTP id
 5a478bee46e88-304eb0e3b1dmr1194941eec.14.1780055192218; 
 Fri, 29 May 2026 04:46:32 -0700 (PDT)
Received: from [192.55.54.41] ([192.55.54.41])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ed53f002sm1227264eec.18.2026.05.29.04.46.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 04:46:31 -0700 (PDT)
Message-ID: <b569f6a5-0b53-46ae-8852-d1801459399b@gmail.com>
Date: Fri, 29 May 2026 14:46:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 11/25] lib/kms: Move and rename
 igt_count_display_format_mod()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
 <20260512122143.11013-12-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20260512122143.11013-12-ville.syrjala@linux.intel.com>
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
> igt_count_display_format_mod() is a tightly coupled counterpart
> of display_format_mods_union(). They both have to implement the
> exact same loop over crtcs+planes or things will fall apart.
> 
> Move the pair next to each other and name them similarly to keep
> the relationship clear.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/igt_kms.c | 34 ++++++++++++++++------------------
>   1 file changed, 16 insertions(+), 18 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index ac0917d907a0..0d604bc76910 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6299,23 +6299,6 @@ bool igt_plane_has_format_mod(igt_plane_t *plane, uint32_t format,
>   						       format, modifier);
>   }
>   
> -static int igt_count_display_format_mod(igt_display_t *display)
> -{
> -	igt_crtc_t *crtc;
> -	int count = 0;
> -
> -	for_each_crtc(display, crtc) {
> -		igt_plane_t *plane;
> -
> -		for_each_plane_on_crtc(crtc,
> -				       plane) {
> -			count += plane->format_mods.count;
> -		}
> -	}
> -
> -	return count;
> -}
> -
>   static void
>   format_mods_append(struct igt_format_mods *format_mods,
>   		   uint32_t format, uint64_t modifier)
> @@ -6344,6 +6327,21 @@ format_mods_union(struct igt_format_mods *format_mods_dst,
>   				   format_mods_src->modifiers[i]);
>   }
>   
> +static int display_format_mods_count(igt_display_t *display)
> +{
> +	igt_crtc_t *crtc;
> +	int count = 0;
> +
> +	for_each_crtc(display, crtc) {
> +		igt_plane_t *plane;
> +
> +		for_each_plane_on_crtc(crtc, plane)
> +			count += plane->format_mods.count;
> +	}
> +
> +	return count;
> +}
> +
>   static void display_format_mods_union(igt_display_t *display,
>   				      struct igt_format_mods *format_mods)
>   {
> @@ -6359,7 +6357,7 @@ static void display_format_mods_union(igt_display_t *display,
>   
>   static void igt_fill_display_format_mod(igt_display_t *display)
>   {
> -	int count = igt_count_display_format_mod(display);
> +	int count = display_format_mods_count(display);
>   
>   	if (!count)
>   		return;

