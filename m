Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D0B9C5472F
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 17:45:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02CE88984C;
	Tue, 27 Aug 2024 17:45:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JjBBd+ex";
	dkim-atps=neutral
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E69F38984C
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 17:45:05 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-428e0d18666so49920185e9.3
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 10:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724780704; x=1725385504; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=0c6VXCSQTwJJjQ605tdC9bRwuFFOjrsat9H6Cq0rno8=;
 b=JjBBd+ex704PhOstWBuQFHK65aRbWy5JIExVYMZuraaCpAjoxKg7iG9YPthfwow1vD
 ybCoR0F26XasEJfbQACaMiqlkxgsUKc7y+YSVlfweBks90gHP1HI9e7lx7d7Jb6RyAK+
 tnWhNC6EuC7sFZFmiaVlB6ZFNB5GCq8YJ2sf6lyJbnVrXoJOPatRKobDRQwUQA/zqth1
 sqVUV55sQzR86N7hfN26w0FDyQuvIxWDSqbxVeREJafiY+VCewom0rsDxa6vxkGuWs/E
 YUpUsXnEF+b8fMaKzNisVEHzaGmOLc49mO5yXbyjYedLTnaLR1+orHXtOkdrvmqoAy17
 +z6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724780704; x=1725385504;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0c6VXCSQTwJJjQ605tdC9bRwuFFOjrsat9H6Cq0rno8=;
 b=cKZAGfmQdforBpH443VUQnpsW0HAZFTq8lO53y400ZPOtjV0ZnHwtlAR/G3kpL4dVm
 uGr23/ULuRJlDo4OrPXM33Oj1Sn38h+ehrUjoGD6UxVNPIR02b+6RO1pJnWPvrMzXjih
 sU/AZS8iSoybmQwEtGoyqRboFfHf7/zDwB3ve45dEqDFB0xjRn+g55v/Tq2CllWVz857
 +fqDGzorP3wd9E8FedGPHOc+Yn+DqcMUSlxTyKZugJ0SAWyE1EvKM6Rz8Koa6KfzcPlP
 CDTOsaGzUu9Ke9SiIoiRDW/2CrSW5qLTDjXYle8AhR80sM/xP5sWmerXpJKBkCm1nki3
 x0dA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7Sfd+d2ltkqWoVNdS+fMkBnR3st2OqxHCoL3bcp+ratwd2F8WyVchR8clnoCP+grtQYb0H4o1@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8+cnleEmtLodHAlaNHg35jWV47LTGJ+E4cGWy0odtkdZKjBjR
 qVnXT9yy2b7O+RLcg5oQDhjMdsIohICu9ycqvHJcZOBSsEgyYilRt33cEjolRMU=
X-Google-Smtp-Source: AGHT+IH6Ts1uSKN7eapIqh/6912KOKELsNP5HYDCvp5kAAlTcc/ew5Q5sZxMV1IeRzfXjkDdZKM6UA==
X-Received: by 2002:a5d:6085:0:b0:367:340e:d6e6 with SMTP id
 ffacd0b85a97d-3748c81a0d0mr2352310f8f.41.1724780704001; 
 Tue, 27 Aug 2024 10:45:04 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3730817ae1fsm13705825f8f.65.2024.08.27.10.45.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 10:45:03 -0700 (PDT)
Message-ID: <74a5de24-0807-43eb-8210-9be3cfa4d369@gmail.com>
Date: Tue, 27 Aug 2024 20:44:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 30/37] tests/kms_plane: Extract skip_format_mod()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
 <20240702232817.31147-31-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240702232817.31147-31-ville.syrjala@linux.intel.com>
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
> We have a few different cases why format/modifier combos
> need to be skipped. Pull the code to determine that into
> a helper.
> 
> This also gives better debug logging for the msm UBWC case,
> as previously there was none.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   tests/kms_plane.c | 56 ++++++++++++++++++++++++++++-------------------
>   1 file changed, 33 insertions(+), 23 deletions(-)
> 
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index aac8e3ef01f1..8b6fc1cf6aa4 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -1002,6 +1002,31 @@ static void check_allowed_plane_size_64x64(data_t *data, igt_plane_t *plane,
>   	igt_remove_fb(data->drm_fd, &test_fb);
>   }
>   
> +static bool skip_format_mod(data_t *data,
> +			    uint32_t format, uint64_t modifier,
> +			    struct igt_vec *tested_formats)
> +{
> +	/* igt doesn't know how to sw generate UBWC: */
> +	if (is_msm_device(data->drm_fd) &&
> +	    modifier == DRM_FORMAT_MOD_QCOM_COMPRESSED)
> +		return true;
> +
> +	/* test each format "class" only once in non-extended tests */
> +	if (!data->extended && modifier != DRM_FORMAT_MOD_LINEAR) {
> +		struct format_mod rf = {
> +			.format = igt_reduce_format(format),
> +			.modifier = modifier,
> +		};
> +
> +		if (igt_vec_index(tested_formats, &rf) >= 0)
> +			return true;
> +
> +		igt_vec_push(tested_formats, &rf);
> +	}
> +
> +	return false;
> +}
> +
>   static bool test_format_plane(data_t *data, enum pipe pipe,
>   			      igt_output_t *output, igt_plane_t *plane, igt_fb_t *primary_fb)
>   {
> @@ -1075,33 +1100,18 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
>   			.modifier = plane->modifiers[i],
>   		};
>   
> -		/* igt doesn't know how to sw generate UBWC: */
> -		if (is_msm_device(data->drm_fd) &&
> -		    f.modifier == DRM_FORMAT_MOD_QCOM_COMPRESSED)
> -			continue;
> -
>   		if (f.format == ref.format &&
>   		    f.modifier == ref.modifier)
>   			continue;
>   
> -		/* test each format "class" only once in non-extended tests */
> -		if (!data->extended && f.modifier != DRM_FORMAT_MOD_LINEAR) {
> -			struct format_mod rf = {
> -				.format = igt_reduce_format(f.format),
> -				.modifier = f.modifier,
> -			};
> -
> -			if (igt_vec_index(&tested_formats, &rf) >= 0) {
> -				igt_debug("Skipping format " IGT_FORMAT_FMT " / modifier "
> -					IGT_MODIFIER_FMT " on %s.%u\n",
> -					IGT_FORMAT_ARGS(f.format),
> -					IGT_MODIFIER_ARGS(f.modifier),
> -					kmstest_pipe_name(pipe),
> -					plane->index);
> -				continue;
> -			}
> -
> -			igt_vec_push(&tested_formats, &rf);
> +		if (skip_format_mod(data, f.format, f.modifier, &tested_formats)) {
> +			igt_debug("Skipping format " IGT_FORMAT_FMT " / modifier "
> +				  IGT_MODIFIER_FMT " on %s.%u\n",
> +				  IGT_FORMAT_ARGS(f.format),
> +				  IGT_MODIFIER_ARGS(f.modifier),
> +				  kmstest_pipe_name(pipe),
> +				  plane->index);
> +			continue;
>   		}
>   
>   		if (f.format == DRM_FORMAT_C8) {

