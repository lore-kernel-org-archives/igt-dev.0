Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C77C25B74
	for <igt-dev@archiver.kernel.org>; Tue, 21 May 2024 18:21:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2175410F06F;
	Tue, 21 May 2024 18:21:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PF2w6hm8";
	dkim-atps=neutral
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F63E10F06F
 for <igt-dev@lists.freedesktop.org>; Tue, 21 May 2024 18:21:29 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-41f9ce16ed8so47429195e9.0
 for <igt-dev@lists.freedesktop.org>; Tue, 21 May 2024 11:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716315687; x=1716920487; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=z3ksLU8pzHSE6dT2xvqScqEO+w9y0rQa+a/n3xJo1Co=;
 b=PF2w6hm89llevhC63CMvuOz6PyBhSwlaW8ouRs98VepABcoKCxGMQYASTcqib1tLvE
 kpqExCcnw6yEPBiOwFHMrJzk5W50ZfLAcv6nBlbyq0aRf+Z7E6o/QeEs+w1AQ2wU6qzX
 TX68V6aQD3Zpa/SZ0yukaHJ46KN25lKECwuvcTlkr71zLHUn12rUNE7OBpUbBGE60K5Y
 b5Ipk9Ejp6Qs9/wOp2EjaHjdBRQGmwHRgu/oT+Gw/3lzYnb0v8vgux2XvmqBjzw6HtLc
 QCIppvqgFAum6TKvhCowAMBrr7prXXYUU42q3eUKJDmuyHDEv/9IJkW+lmApUjtiASsU
 aUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716315687; x=1716920487;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z3ksLU8pzHSE6dT2xvqScqEO+w9y0rQa+a/n3xJo1Co=;
 b=rEwj5hf1UAhgUI3YZAi6dmyHz/NDCNfdYB0x8uBPXgDjVj7Lr3VhYeIgi11Y9OcXiB
 dqgSm9apAZ8QkoOMPRX4NJcSDzX7tZRRZvpIkqzMOVkjM4uG7xpXgqsiMGT07/RLNdeY
 rIuRWKPC0AenLP2uIP9RbdRyqeSlKXOGc9RikCXm0sIapP1z8MsO2XkcSeTKx/IEHhIl
 2d8qp8Mx4+jNXhPtO5WAQIK1huau5gYHaydFHdSbs9sZS3yWbq8+wUYHxYrIPepL5Epo
 jfHJkwWKl/WSqTIqpwMI/RtAussZZmV+YRx9iICPecJK3bVlUg2euW99uPwtcWO8T4wk
 p9Fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW91qdlraWIdInxHCVoXGOKAH+pyLE27waIcqJxKccFiwLfngY9NNgr1dOTkIs41RIyJo/seX+5xXLEaNOGgr8amKiCVNp9kWvn7TEuRQ==
X-Gm-Message-State: AOJu0Yw9Z776O5QcNa+rZk8Cz/oLYGiYvT2OWHzPT0+TcYXdELeyT28D
 z/dif9KeLSC87LDau9ILm/+X00l8R8867LfPCR2g6/kJVpX5GJZGiFad5Wcjapo=
X-Google-Smtp-Source: AGHT+IFWaKFkkQO7mRKOtPsOEE4v1o13x9+vvTpAAk+ZugfoP+UOM5gu7JnJNmyg+AmXEfmVclgt7w==
X-Received: by 2002:adf:e788:0:b0:34c:fd73:55d with SMTP id
 ffacd0b85a97d-3504aa63499mr27333578f8f.70.1716315686771; 
 Tue, 21 May 2024 11:21:26 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.137.89])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-351d627d6c6sm15470795f8f.95.2024.05.21.11.21.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 May 2024 11:21:26 -0700 (PDT)
Message-ID: <32ed1356-ec30-499a-ac6e-ae3ce629e2d6@gmail.com>
Date: Tue, 21 May 2024 21:21:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_plane: Implement dynamic level execution
 across multiple planes
To: Pranay Samala <pranay.samala@intel.com>, igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, jeevan.b@intel.com, sameer.lattannavar@intel.com
References: <20240521032238.456801-1-pranay.samala@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240521032238.456801-1-pranay.samala@intel.com>
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

on quick look things seem ok, just small comments below.

On 21.5.2024 6.22, Pranay Samala wrote:
> The test runs on all pipes on dynamic level to test all the supported
> pixel-formats and modifiers on current plane of that pipe.
> 
> Updating the test to execute on multiple planes on dynamic level.
> 
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/kms_plane.c | 107 +++++++++++++++++++++++-----------------------
>   1 file changed, 54 insertions(+), 53 deletions(-)
> 
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 406aecc04..f476ed52f 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -275,7 +275,7 @@ test_plane_position_with_output(data_t *data,
>   	drmModeModeInfo *mode;
>   	igt_crc_t crc, crc2;
>   
> -	igt_info("Testing connector %s using pipe %s plane %d\n",
> +	igt_debug("Testing connector %s using pipe %s plane %d\n",
>   		 igt_output_name(output), kmstest_pipe_name(pipe), plane);
>   
>   	igt_output_set_pipe(output, pipe);
> @@ -285,7 +285,7 @@ test_plane_position_with_output(data_t *data,
>   	sprite = igt_output_get_plane(output, plane);
>   
>   	if (primary->drm_plane->plane_id > sprite->drm_plane->plane_id) {
> -		igt_info("primary plane ID (%d) > sprite plane ID (%d), skipping plane %d\n",
> +		igt_debug("primary plane ID (%d) > sprite plane ID (%d), skipping plane %d\n",
>   				primary->drm_plane->plane_id, sprite->drm_plane->plane_id, plane);

While changing these you could also fix the indentation of that 
"primary->dr.." line to match parenthesis.

>   		return;
>   	}
> @@ -352,9 +352,9 @@ test_plane_position(data_t *data, enum pipe pipe)
>   	test_grab_crc(data, output, pipe, &green, data->flags, &reference_crc);
>   
>   	for (int plane = 1; plane < n_planes; plane++)
> -		test_plane_position_with_output(data, pipe, plane,
> -						output, &reference_crc,
> -						data->flags);
> +		igt_dynamic_f("pipe-%s-plane-%d", kmstest_pipe_name(pipe), plane)
> +			test_plane_position_with_output(data, pipe, plane,
> +					output, &reference_crc,data->flags);
                                                                ^
space after comma

>   
>   	test_fini(data);
>   }
> @@ -415,7 +415,7 @@ test_plane_panning_with_output(data_t *data,
>   	mode = igt_output_get_mode(output);
>   	primary = igt_output_get_plane(output, 0);
>   
> -	igt_info("Testing connector %s using pipe %s, mode %s\n",
> +	igt_debug("Testing connector %s using pipe %s, mode %s\n",
>   		 igt_output_name(output), kmstest_pipe_name(pipe), mode->name);
>   
>   	create_fb_for_mode_panning(data, mode, &primary_fb);
> @@ -449,59 +449,60 @@ test_plane_panning_with_output(data_t *data,
>   static void
>   test_plane_panning(data_t *data, enum pipe pipe)
>   {
> -	bool mode_found = false;
> -	uint64_t mem_size = 0;
> -	igt_output_t *output = data->output;
> -	igt_crc_t ref_crc;
> -
> -	igt_info("Using (pipe %s + %s) to run the subtest.\n",
> -		 kmstest_pipe_name(pipe), igt_output_name(output));
> +	igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {

You could put this into small helper which will then call 
test_plane_panning function. This way you would get away from making 
such big change which in the end seems to be about changing indentation.

> +		bool mode_found = false;
> +		uint64_t mem_size = 0;
> +		igt_output_t *output = data->output;
> +		igt_crc_t ref_crc;
>   
> -	test_init(data, pipe);
> +		igt_info("Using (pipe %s + %s) to run the subtest.\n",
> +			 kmstest_pipe_name(pipe), igt_output_name(output));
>   
> -	if (is_i915_device(data->drm_fd)) {
> -		for_each_memory_region(r, data->drm_fd)
> -			if (r->ci.memory_class == I915_MEMORY_CLASS_DEVICE)
> -				mem_size = r->cpu_size;
> +		test_init(data, pipe);
>   
> -	}
> +		if (is_i915_device(data->drm_fd)) {
> +			for_each_memory_region(r, data->drm_fd)
> +				if (r->ci.memory_class == I915_MEMORY_CLASS_DEVICE)
> +					mem_size = r->cpu_size;
> +		}
>   
> -	if (is_xe_device(data->drm_fd)) {
> -		struct drm_xe_mem_region *memregion;
> -		uint64_t memreg = all_memory_regions(data->drm_fd), region;
> +		if (is_xe_device(data->drm_fd)) {
> +			struct drm_xe_mem_region *memregion;
> +			uint64_t memreg = all_memory_regions(data->drm_fd), region;
>   
> -		xe_for_each_mem_region(data->drm_fd, memreg, region) {
> -			memregion = xe_mem_region(data->drm_fd, region);
> +			xe_for_each_mem_region(data->drm_fd, memreg, region) {
> +				memregion = xe_mem_region(data->drm_fd, region);
>   
> -			if (XE_IS_CLASS_VRAM(memregion))
> -				mem_size = memregion->total_size;
> +				if (XE_IS_CLASS_VRAM(memregion))
> +					mem_size = memregion->total_size;
> +			}
>   		}
> -	}
>   
> -	for_each_connector_mode(output) {
> -		drmModeModeInfo *m = &output->config.connector->modes[j__];
> -		uint32_t fb_size = m->hdisplay * m->vdisplay * 4;
> +		for_each_connector_mode(output) {
> +			drmModeModeInfo *m = &output->config.connector->modes[j__];
> +			uint32_t fb_size = m->hdisplay * m->vdisplay * 4;
>   
> -		/* test allocates 2 double-dim fbs, add one more, to be safe */
> -		if (mem_size && 3 * 4 * fb_size > mem_size) {
> -			igt_debug("Skipping mode %s due to low memory\n", m->name);
> -			continue;
> -		}
> +			/* test allocates 2 double-dim fbs, add one more, to be safe */
> +			if (mem_size && 3 * 4 * fb_size > mem_size) {
> +				igt_debug("Skipping mode %s due to low memory\n", m->name);
> +				continue;
> +			}
>   
> -		igt_output_override_mode(output, m);
> -		mode_found = true;
> -		break;
> -	}
> -	igt_require(mode_found);
> +			igt_output_override_mode(output, m);
> +			mode_found = true;
> +			break;
> +		}
> +		igt_require(mode_found);
>   
> -	if (data->flags & TEST_PANNING_TOP_LEFT)
> -		test_grab_crc(data, output, pipe, &red, data->flags, &ref_crc);
> -	else
> -		test_grab_crc(data, output, pipe, &blue, data->flags, &ref_crc);
> +		if (data->flags & TEST_PANNING_TOP_LEFT)
> +			test_grab_crc(data, output, pipe, &red, data->flags, &ref_crc);
> +		else
> +			test_grab_crc(data, output, pipe, &blue, data->flags, &ref_crc);
>   
> -	test_plane_panning_with_output(data, pipe, output, &ref_crc, data->flags);
> +		test_plane_panning_with_output(data, pipe, output, &ref_crc, data->flags);
>   
> -	test_fini(data);
> +		test_fini(data);
> +	}
>   }
>   
>   static const color_t colors_extended[] = {
> @@ -889,7 +890,7 @@ static bool test_format_plane_rgb(data_t *data, enum pipe pipe,
>   				  igt_crc_t ref_crc[],
>   				  struct igt_fb *fb)
>   {
> -	igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
> +	igt_debug("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
>   		 IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
>   		 kmstest_pipe_name(pipe), plane->index);
>   
> @@ -927,7 +928,7 @@ static bool test_format_plane_yuv(data_t *data, enum pipe pipe,
>   						     igt_color_range_to_str(r)))
>   				continue;
>   
> -			igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " (%s, %s) on %s.%u\n",
> +			igt_debug("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " (%s, %s) on %s.%u\n",
>   				 IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
>   				 igt_color_encoding_to_str(e),
>   				 igt_color_range_to_str(r),

Where you change igt_info to igt_debug, these following lines 
indentation also need to match to moved parenthesis.

> @@ -1043,7 +1044,7 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
>   
>   	igt_pipe_crc_start(data->pipe_crc);
>   
> -	igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
> +	igt_debug("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
>   		 IGT_FORMAT_ARGS(ref.format), IGT_MODIFIER_ARGS(ref.modifier),
>   		 kmstest_pipe_name(pipe), plane->index);
>   
> @@ -1089,7 +1090,7 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
>   			};
>   
>   			if (igt_vec_index(&tested_formats, &rf) >= 0) {
> -				igt_info("Skipping format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
> +				igt_debug("Skipping format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
>   					 IGT_FORMAT_ARGS(f.format), IGT_MODIFIER_ARGS(f.modifier),
>   					 kmstest_pipe_name(pipe), plane->index);
>   				continue;
> @@ -1211,7 +1212,8 @@ test_pixel_formats(data_t *data, enum pipe pipe)
>   	for_each_plane_on_pipe(&data->display, pipe, plane) {
>   		if (skip_plane(data, plane))
>   			continue;
> -		result &= test_format_plane(data, pipe, output, plane, &primary_fb);
> +		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(pipe), plane->index)
> +			result &= test_format_plane(data, pipe, output, plane, &primary_fb);
>   	}
>   
>   	test_fini(data);
> @@ -1317,8 +1319,7 @@ static void run_test(data_t *data, void (*test)(data_t *, enum pipe))
>   			continue;
>   
>   		igt_output_set_pipe(data->output, PIPE_NONE);
> -		igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
> -			test(data, pipe);
> +		test(data, pipe);
>   
>   		if (is_pipe_limit_reached(++count))
>   			break;

