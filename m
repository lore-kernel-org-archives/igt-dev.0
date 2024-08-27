Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85092C54731
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 17:47:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2492310E0C1;
	Tue, 27 Aug 2024 17:47:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bnzgKX6o";
	dkim-atps=neutral
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC3C10E0C1
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 17:47:08 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-371b2e95c34so3401255f8f.3
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 10:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724780826; x=1725385626; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=T9G/hoRHa2KZT72TS3NBzTbiQw2LsclC/TuN44J7Kw8=;
 b=bnzgKX6o8GPq866ksUGmXDsNM1rK98Gx18EMI7NGFozUv9cLXlfOdPgrib9T+2IoVZ
 AYdN3ohiYxL6jJNg7iPwr3CDCu+ZosGrPes5Sh4zweEQZa7gobu7h7LCyK2GaCmD7Snv
 hVFDboOc+Mbo6u4BX/Dy/xXsSwMmLrdtclKpQzZI38JmQyPUFxZ040BtFzyJq7bYwJNi
 BbXwlMDu+VETEBtfGb0mYlMU0qD89A+89xKKpA2OphV+v45C0scTy6pa+45lJjo9JK7b
 fAPxlfDg4eQcAsxU+PI0ceAccNVfieKFBnZXQQSMxHYc+YhytrUR90JiKixkKLq30Ajt
 jpUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724780826; x=1725385626;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T9G/hoRHa2KZT72TS3NBzTbiQw2LsclC/TuN44J7Kw8=;
 b=Mbne2BAYP24i+VU5KF8fXwnLJNZtL3V6bnV38N+fI+Yq1iQqh6/aOkMylePJ0DbvpG
 OyJCvTUnUnSLN0wCjCvY5t98KY1HOtLb+8iSi6TGEE87TQOQ42aixUNyM1nSHbm31UKv
 w7PYZ4SCRGqP9W79hWrctMrWby+BGGJxfAKWdG7F4Omeb7hf/N3NwjCXM0QEmXM5nySw
 wGZIHC5HKbm/Easlz6WTCQJAEkBJnf6mrKh51Bk6C0cvgr66T+N3tksq6ZoBQKbS5Ufc
 yIWiGNUfqZY9obS0VrCV57IiuaujYMTnH0n1ArmKlineHuOTHciJslNF0PzY9Q79Mfh5
 PvdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUU0Je5GmpJBcOD14sWnPDap3HcoxFKWftg9GMAv6w+C4tt/7uyaRZ4gN7YtxgL1oaMS+X4NDeK@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgGJYslMIoaF1TDckWPhvTpiKB/m9PKP7t8UdDwTR+nnYIMOV5
 YxuybNKKGiegp+y35gnWKvOxth9h7kyt8sruLOMFIN7gq9mLYrrvZ461/lt6K1I=
X-Google-Smtp-Source: AGHT+IEmm5otJoAJm4NsTY4IztBsvDcTkFiMkWHe0PMD3qkYOQs2eQITj5ojR7AnJd7zVeSfae9yig==
X-Received: by 2002:a5d:4249:0:b0:368:37d0:c4ca with SMTP id
 ffacd0b85a97d-3748c7cdbabmr2806600f8f.24.1724780826329; 
 Tue, 27 Aug 2024 10:47:06 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3730810ff83sm13591258f8f.17.2024.08.27.10.47.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 10:47:05 -0700 (PDT)
Message-ID: <f3f9a5be-19bd-4324-9369-c6dcbdbc26c6@gmail.com>
Date: Tue, 27 Aug 2024 20:47:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 32/37] tests/kms_ccs: Reuse
 igt_fb_is_gen12_rc_ccs_cc_modifier()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
 <20240702232817.31147-33-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240702232817.31147-33-ville.syrjala@linux.intel.com>
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
> Replace the hand rolled version of igt_fb_is_gen12_rc_ccs_cc_modifier()
> with the real thing.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   tests/intel/kms_ccs.c | 11 ++---------
>   1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index c91370a9abe7..30b61f132834 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -277,13 +277,6 @@ create_fb_prepare_add(int drm_fd, int width, int height,
>   	addfb_init(fb, f);
>   }
>   
> -static bool is_ccs_cc_modifier(uint64_t modifier)
> -{
> -	return modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC ||
> -	       modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC ||
> -	       modifier == I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC;
> -}
> -
>   /*
>    * The CCS planes of compressed framebuffers contain non-zero bytes if the
>    * engine compressed effectively the framebuffer. The actual encoding of these
> @@ -752,7 +745,7 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
>   		srand(data->seed);
>   		fill_fb_random(data->drm_fd, fb);
>   	} else {
> -		bool do_fast_clear = is_ccs_cc_modifier(data->ccs_modifier);
> +		bool do_fast_clear = igt_fb_is_gen12_rc_ccs_cc_modifier(data->ccs_modifier);
>   		bool do_solid_fill = do_fast_clear || data->plane;
>   		int c = !!data->plane;
>   
> @@ -850,7 +843,7 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
>   				      data->ccs_modifier))
>   		return false;
>   
> -	if (is_ccs_cc_modifier(data->ccs_modifier) &&
> +	if (igt_fb_is_gen12_rc_ccs_cc_modifier(data->ccs_modifier) &&
>   	    data->format != DRM_FORMAT_XRGB8888 &&
>   	    data->format != DRM_FORMAT_XRGB2101010)
>   		return false;

