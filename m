Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3938C25B75
	for <igt-dev@archiver.kernel.org>; Mon,  3 Jun 2024 12:36:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1968510E0C8;
	Mon,  3 Jun 2024 12:36:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hdij/eUK";
	dkim-atps=neutral
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711AF10E341
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Jun 2024 12:36:50 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-35dceef4227so3043973f8f.0
 for <igt-dev@lists.freedesktop.org>; Mon, 03 Jun 2024 05:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717418208; x=1718023008; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=+Pfx2XjpAsjurWo3KBCKHBw/4ATD/dUpXW1wKc6+qno=;
 b=hdij/eUKvG2QtpJiUurssEewG8OBh4ANFOlFm/b0Hao9aBG32l9VPW3GoIwbH5WQyt
 O0qIHWTYzCX4ASpJY2oe1RLuj5At9/ErTMw6EBK/JDi33eu2fP5lbSlF6eZbekBeT8T0
 cnjsG4WMwTitLcq4ri6aT0dcKwmZT9Wl1dw6oWecXcOWymENMmajWfWrGxHmO4PWLvq1
 7HuwhoPWxwKS1nEHZJsPFDa2SKZkiPu6FIQ59EyuLYye07jiQmRAy8d4kUIdy3kl4+80
 JsIl7mbTPm72294swDdG6K1keLrv4+C37aVutPwCiJtRUs54pjdiEik0timfXDs0v7+W
 kYxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717418208; x=1718023008;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+Pfx2XjpAsjurWo3KBCKHBw/4ATD/dUpXW1wKc6+qno=;
 b=VepOlEn4f+lwgf/R8IWkNh2pTOGSbpvxGFe53oyWzus9Ob29SzKaJir8C+vK4t8Usn
 VYQXX4F0qiwHJaaQlxaoCWeWf+DgFmhD56hnzx7EO+kBd5DnKb2t+45/EDbg7L6Mp4Xa
 1KtcMqeXJMdhBFzeiA4y3CoBfSXhHkhn7Ju5oObc2TSKwZvZzBRSLoKtmzMz7CaNkT0m
 +Is3OkwABbC/9+oZV0zou/E8in6S3sS2xQ32A4jf28j9zvqwn6SiT2ywwHHbrtGDSHux
 SeEpEUzV1ZmtBk4YyRsbvzcpnfkHahxEehIjbKg28vpcC+jQZUQCj1ledK6g87BcwIsi
 ao6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUF/CTweS1uFbajqJ0UkK02YHtO++iGrlmPMdwCoBdjz9OIx7LHe16d89TaprXfUdKAozPUQnj2Lu2wKaXn6JQMf45V9ORVnGCQd1P//w==
X-Gm-Message-State: AOJu0Yz3GuUJkeTOkK9NbWjB6QBywMhA7CkBm6fYuIBr8WOPqH/lBt8I
 FbPqrXg0ME3hU5k7DD1mV6NE732nZiN5zDZ5Gfww2ktWv2LYOFRHwyiZNuCaBmP66w==
X-Google-Smtp-Source: AGHT+IE9jqk/jEZsfSNhO5mhFm4NqwKPgLsqGDgTQp/tHW8ZGTFq3DMKazzFu72VBi25rjW3eeGrjQ==
X-Received: by 2002:adf:e5ce:0:b0:34d:b549:9465 with SMTP id
 ffacd0b85a97d-35e0f289785mr6660098f8f.32.1717418208133; 
 Mon, 03 Jun 2024 05:36:48 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.77])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-35e537da921sm4255175f8f.17.2024.06.03.05.36.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jun 2024 05:36:47 -0700 (PDT)
Message-ID: <47031532-5102-4969-a00a-cd70a295217f@gmail.com>
Date: Mon, 3 Jun 2024 15:36:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/2] tests/kms_plane: Reduce CI logging
To: Pranay Samala <pranay.samala@intel.com>, igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, jeevan.b@intel.com, sameer.lattannavar@intel.com,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
References: <20240531060622.489881-1-pranay.samala@intel.com>
 <20240531060622.489881-2-pranay.samala@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240531060622.489881-2-pranay.samala@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

look ok to me

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 31.5.2024 9.06, Pranay Samala wrote:
> Replacing igt_info with igt_debug to reduce CI logging.
> 
> v3: Cleared the indentation issues with "--strict" parameter (Juha-pekka)
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> 
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/kms_plane.c | 45 +++++++++++++++++++++++++--------------------
>   1 file changed, 25 insertions(+), 20 deletions(-)
> 
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 406aecc04..7a17b700c 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -275,8 +275,8 @@ test_plane_position_with_output(data_t *data,
>   	drmModeModeInfo *mode;
>   	igt_crc_t crc, crc2;
>   
> -	igt_info("Testing connector %s using pipe %s plane %d\n",
> -		 igt_output_name(output), kmstest_pipe_name(pipe), plane);
> +	igt_debug("Testing connector %s using pipe %s plane %d\n", igt_output_name(output),
> +		  kmstest_pipe_name(pipe), plane);
>   
>   	igt_output_set_pipe(output, pipe);
>   
> @@ -285,8 +285,8 @@ test_plane_position_with_output(data_t *data,
>   	sprite = igt_output_get_plane(output, plane);
>   
>   	if (primary->drm_plane->plane_id > sprite->drm_plane->plane_id) {
> -		igt_info("primary plane ID (%d) > sprite plane ID (%d), skipping plane %d\n",
> -				primary->drm_plane->plane_id, sprite->drm_plane->plane_id, plane);
> +		igt_debug("primary plane ID (%d) > sprite plane ID (%d), skipping plane %d\n",
> +			  primary->drm_plane->plane_id, sprite->drm_plane->plane_id, plane);
>   		return;
>   	}
>   
> @@ -415,8 +415,8 @@ test_plane_panning_with_output(data_t *data,
>   	mode = igt_output_get_mode(output);
>   	primary = igt_output_get_plane(output, 0);
>   
> -	igt_info("Testing connector %s using pipe %s, mode %s\n",
> -		 igt_output_name(output), kmstest_pipe_name(pipe), mode->name);
> +	igt_debug("Testing connector %s using pipe %s, mode %s\n", igt_output_name(output),
> +		  kmstest_pipe_name(pipe), mode->name);
>   
>   	create_fb_for_mode_panning(data, mode, &primary_fb);
>   	igt_plane_set_fb(primary, &primary_fb);
> @@ -889,9 +889,9 @@ static bool test_format_plane_rgb(data_t *data, enum pipe pipe,
>   				  igt_crc_t ref_crc[],
>   				  struct igt_fb *fb)
>   {
> -	igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
> -		 IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
> -		 kmstest_pipe_name(pipe), plane->index);
> +	igt_debug("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
> +		  IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
> +		  kmstest_pipe_name(pipe), plane->index);
>   
>   	return test_format_plane_colors(data, pipe, plane,
>   					format, modifier,
> @@ -927,11 +927,13 @@ static bool test_format_plane_yuv(data_t *data, enum pipe pipe,
>   						     igt_color_range_to_str(r)))
>   				continue;
>   
> -			igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " (%s, %s) on %s.%u\n",
> -				 IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
> -				 igt_color_encoding_to_str(e),
> -				 igt_color_range_to_str(r),
> -				 kmstest_pipe_name(pipe), plane->index);
> +			igt_debug("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT
> +				" (%s, %s) on %s.%u\n", IGT_FORMAT_ARGS(format),
> +				IGT_MODIFIER_ARGS(modifier),
> +				igt_color_encoding_to_str(e),
> +				igt_color_range_to_str(r),
> +				kmstest_pipe_name(pipe),
> +				plane->index);
>   
>   			result &= test_format_plane_colors(data, pipe, plane,
>   							   format, modifier,
> @@ -1043,9 +1045,9 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
>   
>   	igt_pipe_crc_start(data->pipe_crc);
>   
> -	igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
> -		 IGT_FORMAT_ARGS(ref.format), IGT_MODIFIER_ARGS(ref.modifier),
> -		 kmstest_pipe_name(pipe), plane->index);
> +	igt_debug("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
> +		  IGT_FORMAT_ARGS(ref.format), IGT_MODIFIER_ARGS(ref.modifier),
> +		  kmstest_pipe_name(pipe), plane->index);
>   
>   	check_allowed_plane_size_64x64(data, plane, &width, &height, ref.format);
>   
> @@ -1089,9 +1091,12 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
>   			};
>   
>   			if (igt_vec_index(&tested_formats, &rf) >= 0) {
> -				igt_info("Skipping format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
> -					 IGT_FORMAT_ARGS(f.format), IGT_MODIFIER_ARGS(f.modifier),
> -					 kmstest_pipe_name(pipe), plane->index);
> +				igt_debug("Skipping format " IGT_FORMAT_FMT " / modifier "
> +					IGT_MODIFIER_FMT " on %s.%u\n",
> +					IGT_FORMAT_ARGS(f.format),
> +					IGT_MODIFIER_ARGS(f.modifier),
> +					kmstest_pipe_name(pipe),
> +					plane->index);
>   				continue;
>   			}
>   

