Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8DCC25B78
	for <igt-dev@archiver.kernel.org>; Mon, 27 May 2024 15:58:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 613E010F100;
	Mon, 27 May 2024 15:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iG32K8Ai";
	dkim-atps=neutral
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B49110F1D6
 for <igt-dev@lists.freedesktop.org>; Mon, 27 May 2024 15:58:48 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4210c9d1df6so19994735e9.2
 for <igt-dev@lists.freedesktop.org>; Mon, 27 May 2024 08:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716825527; x=1717430327; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=0q4V4LSljQWONb8C138a8XGxZaNQQfaU7pCdFucRz4g=;
 b=iG32K8AiSYRQedCsrrpcJG3VEsST+4szV/OzkOqC1JRlsO5BfNoZgJBToCyxvoQZ4F
 gOxT74vmoY5Q9N9OXpeNRWtp/0bPFzTZJizqJAz6lafR+loky/0IQVjpQHwXm7KclXnA
 g8hnHSbufGjDM1NVRrouMZ/i4gFKsQWPy26b/ZsuDemF7c0ushheNiJ6GCHmA41bptCI
 ZhK7Pk9eJe5EbPlvW8eonMBGC5BQ5jK4xAZjtusOZ4UZ4azc7FwS43XkA65GQZ+t7ADe
 +eFPaENSsh7ixsTHXDmhNNtpUP2Q+lscLhO8xUqRCBvwtnVBCbA0zS28X8Z8Lnm2g+2b
 54Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716825527; x=1717430327;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0q4V4LSljQWONb8C138a8XGxZaNQQfaU7pCdFucRz4g=;
 b=l+4CNhoIb71jhaMkBMg0GOHeeOlc4lD+80bu+ZLteZgqVl8/Ob049pFxbiPboYs72G
 g//MHtQR4zrzgahzHkzNuix5erAHsJzJRZsEaeOYJgyXHWD2blG8h01NY1PdfRA0OZiH
 CrX4u/BhuQ2yAPbXZKSwN7hqjb4+ImtTlQDTnUktoR5LZsQaNiKZNtC4d5EeAopob9PU
 AdxjvIrpF3k/CiEWdoWopX/LGkg42gkmJ9ibguC7CU4WA/PMzeoWUZRg9aDqUbam70w4
 7PKvw4+ZejDcWWnhTQIQ+qQD6kIGCysQwqlwhNMTzwU9cSa7AH4r6YvaCNLGsyPPYVRi
 cZ9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk9g9b+3KiU2IpnFGwWsTDaSu1Sdv8ZjufTTr5UVMgtKajTXpHvB3VOIFgxk/6CCmAQsPCHM9UfBDc3c54yChhkqa7wu/D5dFgD+gXtQ==
X-Gm-Message-State: AOJu0Yxpr5r/l0qyCHq8N41fLpxP/2JgEZyOFXgKyEDs2gYUyz7cNSjc
 f5ZZnNWalss75mmbDp5XRyREzioYFE1YVpa22lDn6oYvFUqqhuHp
X-Google-Smtp-Source: AGHT+IE7v0SxPOM+FPkQavFcdoX+/f/zVBsU2QPml0VxiLEh/phn3jc6+yWn1BuD0Tk+MNKqQH15sw==
X-Received: by 2002:a05:600c:581a:b0:41f:f957:96ac with SMTP id
 5b1f17b1804b1-421089d9dc3mr79382795e9.13.1716825526414; 
 Mon, 27 May 2024 08:58:46 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.87])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3557a1c9379sm9295533f8f.73.2024.05.27.08.58.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 08:58:46 -0700 (PDT)
Message-ID: <ce096f4e-7901-4e42-a49f-749c23b2ae01@gmail.com>
Date: Mon, 27 May 2024 18:58:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/2] tests/kms_plane: Reduce CI logging
To: Pranay Samala <pranay.samala@intel.com>, igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, jeevan.b@intel.com, sameer.lattannavar@intel.com,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
References: <20240524084807.480971-1-pranay.samala@intel.com>
 <20240524084807.480971-2-pranay.samala@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240524084807.480971-2-pranay.samala@intel.com>
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

Hi Pranay,

you have indentation off here in several places. You can see those with 
checkpatch script from kernel source tree, run it with '--strict' 
parameter against this patch.

/Juha-Pekka

On 24.5.2024 11.48, Pranay Samala wrote:
> Replacing igt_info with igt_debug to reduce CI logging.
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
> index 406aecc04..9062320e1 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -275,8 +275,8 @@ test_plane_position_with_output(data_t *data,
>   	drmModeModeInfo *mode;
>   	igt_crc_t crc, crc2;
>   
> -	igt_info("Testing connector %s using pipe %s plane %d\n",
> -		 igt_output_name(output), kmstest_pipe_name(pipe), plane);
> +	igt_debug("Testing connector %s using pipe %s plane %d\n",
> +		igt_output_name(output), kmstest_pipe_name(pipe), plane);
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
> +			primary->drm_plane->plane_id, sprite->drm_plane->plane_id, plane);
>   		return;
>   	}
>   
> @@ -415,8 +415,8 @@ test_plane_panning_with_output(data_t *data,
>   	mode = igt_output_get_mode(output);
>   	primary = igt_output_get_plane(output, 0);
>   
> -	igt_info("Testing connector %s using pipe %s, mode %s\n",
> -		 igt_output_name(output), kmstest_pipe_name(pipe), mode->name);
> +	igt_debug("Testing connector %s using pipe %s, mode %s\n",
> +		igt_output_name(output), kmstest_pipe_name(pipe), mode->name);
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
> +		IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
> +		kmstest_pipe_name(pipe), plane->index);
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
> +		IGT_FORMAT_ARGS(ref.format), IGT_MODIFIER_ARGS(ref.modifier),
> +		kmstest_pipe_name(pipe), plane->index);
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

