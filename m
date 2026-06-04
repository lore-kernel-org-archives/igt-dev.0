Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D43CD6E75
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jun 2026 18:03:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A8A311290B;
	Thu,  4 Jun 2026 18:03:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GKcpB3/M";
	dkim-atps=neutral
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com
 [74.125.82.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B567911290B
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jun 2026 18:03:35 +0000 (UTC)
Received: by mail-dy1-f177.google.com with SMTP id
 5a478bee46e88-307263ad0cbso1287451eec.0
 for <igt-dev@lists.freedesktop.org>; Thu, 04 Jun 2026 11:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780596215; x=1781201015; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LdEQ2xVHcRjM4dn91iNCTY9c4jRxzUjsHXQhjYN0xjQ=;
 b=GKcpB3/Mx0VBy44s/Vr77qJJf+RIzw+xATFPs+7qp1C+JotSnKWv8y38THPotEQyE9
 8hTiKwDeH2UmutmGj7c5Xh64sIRWfzDP5n+ylUg9ogZj7EbGIAQxQZ0AgVTKkf2v4xrC
 wY/TsVHGLn5CtbZk8jvLOs5efUfty5PKmL1kPQqNY07VLtkq7VmXfnqGOHV2QmfJdwqX
 TMA5rQdl4eXvK1Ql2itJgfZCAJ1cHzeqzppd8qcEaAeTaVOvoqgTOkJG9fJjiov1DTcu
 60mjlz4EtueGaPZQqPlMEGHbqjJB6ZHGLnozM6V/xrC7p41U/6bvnAX++lEqdovvN+jD
 o6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780596215; x=1781201015;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LdEQ2xVHcRjM4dn91iNCTY9c4jRxzUjsHXQhjYN0xjQ=;
 b=H8WEOFWIxJ+nQEIV1FPLBGyxaork6zn2WBUbDN3i9h9jtxvZjBxbvFa4IMP0SgsBgp
 O2ZK/E6CsiiNoYyXdQqUHTc2Vp4Aflz1+WRNePN5VByoHlyLtdC48RidVOGCOloC7s/7
 82rdjruQ1ZbdsR/TWlx8HB5FOGoLGAcnR1APXsBxP3UpesiPEGxwYSWOpyGMrbCIASUm
 fjtYXZr2Ic0fb6j4AyWNO4qIkpk5ovs8JYjh8MHEk3tqtRBSjT8EYKtyTjEI6RkSvOb6
 GxBITvHlb7a1d02O05c6jBq31Wdc1rz4EISM82dQMnMq00ZqsE2D+f+FuYKGDVdIv/Jw
 1UNQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/3yFecL4od/bpZ4iCnGNcuFAhSH08jLVvgwU+cumCFnTicmUkB59NDWUfkG5OdoJljsqgGoHWr@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvRn7XvnURhTLMNQkc52D2xBlQR/rn8b4L6+ScncV/CUxBQ6OT
 iRwgFIrt8uPrwwB+zyxcplISVvqCf85xMk17EJZ7irzgD51b3JHP9ynzzvENQZB6
X-Gm-Gg: Acq92OHWKyUrSn621g0SSY6wQliEapcAu7LOFur67rQ96WkvbybPgGlX50uAU0M5Ks6
 VJBEblCi3rl5oyhEHpMcjN5AdCgp7xZ++3c4wvN/+acVdpJwTYQ0cFtvZnj48Bk1o2df/KKs+No
 7iFep2vbD65NrkYWFT977TUZCzCyiEgVZoU8B26TByyLL1FsGBhkm+UIRBr+SyzWYCzMjTLHxex
 e6G7bleKnr+5/k3U1DJczML3U4UuhY9GFXghNwOFxTDm8HMizlagfDtH3E6q3ee2eu7z/AEGYjb
 eSyPHk7zTCMi+z6khk1hZr6OCipXm6FpVGOWs2R2rJ5270wPMgzkb3KD3z1zqIqvDsWLWGnh9mc
 vVszdBGxKEWl9RkveBgSAd//CfgMZNbNAnbajjIeIfd7hK7m0F2K1M8M7L8ZV+tLEgr4ycM1O+C
 r6OqPsLrHYt7l/7cA++2//g9P/YNuU2fa9UeaGxU+gwKelV97c0NwlSpMLNXeWchRJ5Dk4uxpXE
 606
X-Received: by 2002:a05:693c:69c4:b0:307:6e47:f881 with SMTP id
 5a478bee46e88-3076e47f93dmr887708eec.16.1780596214679; 
 Thu, 04 Jun 2026 11:03:34 -0700 (PDT)
Received: from [192.55.54.43] ([192.55.54.43])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3074dfa3a2asm7777422eec.31.2026.06.04.11.03.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2026 11:03:33 -0700 (PDT)
Message-ID: <ffd43b04-5128-4dc9-a197-4ccb92efcef3@gmail.com>
Date: Thu, 4 Jun 2026 21:03:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 17/25] lib/kms: Add helpers to query
 igt_format_mods
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260512122143.11013-18-ville.syrjala@linux.intel.com>
 <20260604141835.18012-1-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20260604141835.18012-1-ville.syrjala@linux.intel.com>
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

On 04/06/2026 17.18, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Add three new helpers for igt_format_mods:
> - igt_format_mods_has_format_and_modifier()
> - igt_format_mods_has_format()
> - igt_format_mods_has_modifier()
> 
> These should be useful to some tests, avoiding for the tests
> to iterate the igt_format_mods directly.
> 
> v2: Fix _modifier type in igt_format_mods_*()
> v3: Add some docs (Juha-Pekka)
>      Drop bogus igt_plane_has_modifier() prototype
> 
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/igt_kms.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++++--
>   lib/igt_kms.h |  7 +++++++
>   2 files changed, 61 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 75f7ca2d64e0..0268d71d5eca 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6285,8 +6285,16 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
>   	}
>   }
>   
> -static bool igt_format_mods_has_format_and_modifier(const struct igt_format_mods *format_mods,
> -						    uint32_t format, uint64_t modifier)
> +/**
> + * igt_format_mods_has_format_and_modifier:
> + * @format_mods: a pointer to an #igt_format_mods structure
> + * @format: Pixel format
> + * @modifier: Modifier
> + *
> + * Returns: True if @format_mods includes the given @format/@modifier tuple, else false
> + */
> +bool igt_format_mods_has_format_and_modifier(const struct igt_format_mods *format_mods,
> +					     uint32_t format, uint64_t modifier)
>   {
>   	uint64_t _modifier;
>   	uint32_t _format;
> @@ -6299,6 +6307,50 @@ static bool igt_format_mods_has_format_and_modifier(const struct igt_format_mods
>   	return false;
>   }
>   
> +/**
> + * igt_format_mods_has_format:
> + * @format_mods: a pointer to an #igt_format_mods structure
> + * @format: Pixel format
> + *
> + * Returns: True if @format_mods includes the given @format, else false
> + */
> +bool igt_format_mods_has_format(const struct igt_format_mods *format_mods,
> +				uint32_t format)
> +{
> +	uint64_t _modifier;
> +	uint32_t _format;
> +
> +	for_each_format_and_modifier(format_mods, _format, _modifier) {
> +		if (_format == format)
> +			return true;
> +		(void)_modifier;
> +	}
> +
> +	return false;
> +}
> +
> +/**
> + * igt_format_mods_has_modifier:
> + * @format_mods: a pointer to an #igt_format_mods structure
> + * @modifier: Modifier
> + *
> + * Returns: True if @format_mods includes the given @modifier, else false
> + */
> +bool igt_format_mods_has_modifier(const struct igt_format_mods *format_mods,
> +				  uint64_t modifier)
> +{
> +	uint64_t _modifier;
> +	uint32_t _format;
> +
> +	for_each_format_and_modifier(format_mods, _format, _modifier) {
> +		if (_modifier == modifier)
> +			return true;
> +		(void)_format;
> +	}
> +
> +	return false;
> +}
> +
>   /**
>    * igt_plane_has_format_mod:
>    * @plane: Target plane
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 2f4526407aa2..b81a7c1ac646 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1204,6 +1204,13 @@ bool igt_connector_event_detected(struct udev_monitor *mon, uint32_t conn_id,
>   void igt_flush_uevents(struct udev_monitor *mon);
>   void igt_cleanup_uevents(struct udev_monitor *mon);
>   
> +bool igt_format_mods_has_format_and_modifier(const struct igt_format_mods *format_mods,
> +					     uint32_t format, uint64_t modifier);
> +bool igt_format_mods_has_format(const struct igt_format_mods *format_mods,
> +				uint32_t format);
> +bool igt_format_mods_has_modifier(const struct igt_format_mods *format_mods,
> +				  uint64_t modifier);
> +
>   bool igt_display_has_format_mod(igt_display_t *display, uint32_t format, uint64_t modifier);
>   bool igt_plane_has_format_mod(igt_plane_t *plane, uint32_t format, uint64_t modifier);
>   

