Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5685BC48BF6
	for <igt-dev@archiver.kernel.org>; Wed, 21 Feb 2024 11:43:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7F58926F;
	Wed, 21 Feb 2024 11:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QnWygfnA";
	dkim-atps=neutral
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86BC68926F
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2024 11:43:54 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-41276a43dc3so3011545e9.0
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2024 03:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708515832; x=1709120632; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=4pt7gXAInvEqxPSpLasuHFpV1ilgwGwG8NuzOxqmink=;
 b=QnWygfnA1AlQRp7OqXF870vbv/v4/j+paC5x59OpFsPE938NPqr+sZmOYl1USMI9Qw
 X3n018P9W2tHOuJR+LpoN6vBk2imrVDRbXzOsicv0Ar6tKQFrcB5e1FjuqXL4qytfMUN
 QqIqQzcdxKEjLaCIPU/mBX7J7fL8lrWf4py35eUcveW8jNtv2Axd1DPMQFI3DV1ypunX
 YrLHsZSGwjM0b2fkVTBadrwEyLQ0gyj6Gy+YQg1EWozEtJek0FHFKcavw22OnXW3hgS2
 bPKSoN3+Q3MKv2N+Mg84Oat4SKKpuqTQLIFzHdWyS+YTC5IgMC3/K3IgmG1atafhkbbG
 SCkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708515832; x=1709120632;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4pt7gXAInvEqxPSpLasuHFpV1ilgwGwG8NuzOxqmink=;
 b=ctUH2xvrBvPULr3GNxxyGLs+TfZFCAAOV8MChDN4y3cfMZDpgqIaWjN3zFipKhhZL8
 gMOTQXTKT0wssmZHPj2N94Br+OcVTF3u541ixuiyj792el1Dp6FKVrL063BnYB0H8jJ1
 am87uVtMjv/0xL6YYLTJWOxIrWWT8GiVvC6H5Hz9Gny6KLXwuNijVfVETgGN1nublw/b
 JqvJmL92rvpBvF7rwxMVIFJIe0vcFOSdzL2dn+W8glwRQ96k8VjpThKASrzhsP4U/i5/
 YwquXTWc2O+eI5JruJokCxjkzxHrkTFiey0BScBabqwIwRoSXvPh1cZKcLlUyw10RYod
 w1NQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKOY8AfK8CfGRo77Eq65ub6WiRBEEw8G3YJ210kOf6bKKpqA5kgdMl3Uxm04SkmEsCqQEJhewteMKWnG2P2Sn/DB9LbAiRFcptUfwXqg==
X-Gm-Message-State: AOJu0YypwN09sv1on9ejixhkW8WrDJbvlb0z3q52Gb55vva7PJQz3CBy
 8WBykvcW+fold5q9ovDaGoyOffHZBqo8G5041n9ELY4D/ofIyLaP
X-Google-Smtp-Source: AGHT+IGwOgNff0ofYX/Lc0kn4UNLG65P+jLcSL3fi9I5A5+6XBnYa+Bn0cQTU1t46WzFAUAenEBL0w==
X-Received: by 2002:a05:600c:2805:b0:411:a5f9:26f5 with SMTP id
 m5-20020a05600c280500b00411a5f926f5mr15337614wmb.38.1708515832285; 
 Wed, 21 Feb 2024 03:43:52 -0800 (PST)
Received: from [0.0.0.0] ([134.134.139.86])
 by smtp.googlemail.com with ESMTPSA id
 n3-20020a05600c4f8300b00410395dc7d1sm2307171wmq.7.2024.02.21.03.43.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 03:43:51 -0800 (PST)
Message-ID: <c901ac07-fe78-4d19-9b49-30d2ddf46fc2@gmail.com>
Date: Wed, 21 Feb 2024 13:43:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4] tests/kms_ccs: Convert subtests to dynamic
 subtests
Content-Language: en-US
To: Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org
References: <20240221030542.17634-1-karthik.b.s@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240221030542.17634-1-karthik.b.s@intel.com>
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

Look good!

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 21.2.2024 5.05, Karthik B S wrote:
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel/kms_ccs.c | 193 +++++++++++-------------------------------
>   1 file changed, 50 insertions(+), 143 deletions(-)
> 
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index 82714af93..4f8e30791 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -44,35 +44,16 @@
>   #include "xe/xe_query.h"
>   
>   /**
> - * SUBTEST: %s-%s-%s
> - * Description: Test %arg[2] with given %arg[3] modifier
> + * SUBTEST: %s-%s
> + * Description: Test %arg[1] with given %arg[2] modifier
>    *
>    * arg[1]:
>    *
> - * @pipe-A:                    Pipe A
> - * @pipe-B:                    Pipe B
> - * @pipe-C:                    Pipe C
> - * @pipe-D:                    Pipe D
> - * @pipe-E:                    Pipe E
> - * @pipe-F:                    Pipe F
> - * @pipe-G:                    Pipe G
> - * @pipe-H:                    Pipe H
> - * @pipe-I:                    Pipe I
> - * @pipe-J:                    Pipe J
> - * @pipe-K:                    Pipe K
> - * @pipe-L:                    Pipe L
> - * @pipe-M:                    Pipe M
> - * @pipe-N:                    Pipe N
> - * @pipe-O:                    Pipe O
> - * @pipe-P:                    Pipe P
> - *
> - * arg[2]:
> - *
>    * @bad-aux-stride:            Bad AUX stride
>    * @ccs-on-another-bo:         CCS with different BO
>    * @missing-ccs-buffer:        Missing CCS buffer
>    *
> - * arg[3]:
> + * arg[2]:
>    *
>    * @y-tiled-ccs:               Y tiled ccs
>    * @y-tiled-gen12-mc-ccs:      Y tiled gen12 mc ccs
> @@ -85,33 +66,14 @@
>    */
>   
>   /**
> - * SUBTEST: %s-%s-%s
> - * Description: Test %arg[2] with %arg[3] modifier
> + * SUBTEST: %s-%s
> + * Description: Test %arg[1] with %arg[2] modifier
>    *
>    * arg[1]:
>    *
> - * @pipe-A:                      Pipe A
> - * @pipe-B:                      Pipe B
> - * @pipe-C:                      Pipe C
> - * @pipe-D:                      Pipe D
> - * @pipe-E:                      Pipe E
> - * @pipe-F:                      Pipe F
> - * @pipe-G:                      Pipe G
> - * @pipe-H:                      Pipe H
> - * @pipe-I:                      Pipe I
> - * @pipe-J:                      Pipe J
> - * @pipe-K:                      Pipe K
> - * @pipe-L:                      Pipe L
> - * @pipe-M:                      Pipe M
> - * @pipe-N:                      Pipe N
> - * @pipe-O:                      Pipe O
> - * @pipe-P:                      Pipe P
> - *
> - * arg[2]:
> - *
>    * @bad-pixel-format:            Bad pixel format
>    *
> - * arg[3]:
> + * arg[2]:
>    *
>    * @4-tiled-dg2-mc-ccs:        4 tiled mc ccs
>    * @4-tiled-dg2-rc-ccs:        4 tiled dg2 rc ccs
> @@ -127,35 +89,16 @@
>    */
>   
>   /**
> - * SUBTEST: %s-%s-%s
> - * Description: Test %arg[2] with %arg[3] modifier
> + * SUBTEST: %s-%s
> + * Description: Test %arg[1] with %arg[2] modifier
>    *
>    * arg[1]:
>    *
> - * @pipe-A:                      Pipe A
> - * @pipe-B:                      Pipe B
> - * @pipe-C:                      Pipe C
> - * @pipe-D:                      Pipe D
> - * @pipe-E:                      Pipe E
> - * @pipe-F:                      Pipe F
> - * @pipe-G:                      Pipe G
> - * @pipe-H:                      Pipe H
> - * @pipe-I:                      Pipe I
> - * @pipe-J:                      Pipe J
> - * @pipe-K:                      Pipe K
> - * @pipe-L:                      Pipe L
> - * @pipe-M:                      Pipe M
> - * @pipe-N:                      Pipe N
> - * @pipe-O:                      Pipe O
> - * @pipe-P:                      Pipe P
> - *
> - * arg[2]:
> - *
>    * @crc-primary-basic:           Primary plane CRC compatibility
>    * @crc-sprite-planes-basic:     Sprite plane CRC compatability
>    * @random-ccs-data:             Random CCS data
>    *
> - * arg[3]:
> + * arg[2]:
>    *
>    * @4-tiled-xe2-ccs:           4 tiled xe2 pat controlled ccs
>    * @4-tiled-dg2-mc-ccs:        4 tiled mc ccs
> @@ -172,35 +115,16 @@
>    */
>   
>   /**
> - * SUBTEST: %s-%s-%s
> - * Description: Test %arg[2] with %arg[3] modifier
> + * SUBTEST: %s-%s
> + * Description: Test %arg[1] with %arg[2] modifier
>    * Functionality: ccs, rotation, tiling
>    *
>    * arg[1]:
>    *
> - * @pipe-A:                      Pipe A
> - * @pipe-B:                      Pipe B
> - * @pipe-C:                      Pipe C
> - * @pipe-D:                      Pipe D
> - * @pipe-E:                      Pipe E
> - * @pipe-F:                      Pipe F
> - * @pipe-G:                      Pipe G
> - * @pipe-H:                      Pipe H
> - * @pipe-I:                      Pipe I
> - * @pipe-J:                      Pipe J
> - * @pipe-K:                      Pipe K
> - * @pipe-L:                      Pipe L
> - * @pipe-M:                      Pipe M
> - * @pipe-N:                      Pipe N
> - * @pipe-O:                      Pipe O
> - * @pipe-P:                      Pipe P
> - *
> - * arg[2]:
> - *
>    * @bad-rotation-90:             90 degree rotation
>    * @crc-primary-rotation-180:    180 degree rotation
>    *
> - * arg[3]:
> + * arg[2]:
>    *
>    * @4-tiled-xe2-ccs:           4 tiled xe2 pat controlled ccs
>    * @4-tiled-dg2-mc-ccs:        4 tiled mc ccs
> @@ -956,24 +880,10 @@ static void test_output(data_t *data, const int testnum)
>   {
>   	uint16_t dev_id;
>   
> -	igt_fixture {
> -		bool found = false;
> +	igt_fixture
>   		dev_id = intel_get_drm_devid(data->drm_fd);
>   
> -		data->flags = tests[testnum].flags;
> -
> -		for_each_valid_output_on_pipe(&data->display, data->pipe, data->output) {
> -			igt_display_reset(&data->display);
> -
> -			igt_output_set_pipe(data->output, data->pipe);
> -			if (intel_pipe_output_combo_valid(&data->display)) {
> -				found = true;
> -				break;
> -			}
> -
> -		}
> -		igt_require_f(found, "No valid pipe/output combo found.\n");
> -	}
> +	data->flags = tests[testnum].flags;
>   
>   	for (int i = 0; i < ARRAY_SIZE(ccs_modifiers); i++) {
>   		if (((ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS ||
> @@ -987,10 +897,7 @@ static void test_output(data_t *data, const int testnum)
>   		data->ccs_modifier = ccs_modifiers[i].modifier;
>   
>   		igt_describe(tests[testnum].description);
> -		igt_subtest_f("pipe-%s-%s-%s", kmstest_pipe_name(data->pipe),
> -			      tests[testnum].testname, ccs_modifiers[i].str) {
> -			int valid_tests = 0;
> -
> +		igt_subtest_with_dynamic_f("%s-%s", tests[testnum].testname, ccs_modifiers[i].str) {
>   			if (ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED) {
>   				igt_require_f(AT_LEAST_GEN(dev_id, 20),
>   					      "Xe2 platform needed.\n");
> @@ -999,37 +906,46 @@ static void test_output(data_t *data, const int testnum)
>   					      "Older than Xe2 platform needed.\n");
>   			}
>   
> -			if (data->flags == TEST_RANDOM)
> -				igt_info("Testing with seed %d\n", data->seed);
> -
> -			if (data->flags & TEST_ALL_PLANES) {
> -				igt_display_require_output_on_pipe(&data->display, data->pipe);
> -
> -				for_each_plane_on_pipe(&data->display, data->pipe, data->plane) {
> -					for (int j = 0; j < ARRAY_SIZE(formats); j++) {
> -						data->format = formats[j];
> -						valid_tests += test_ccs(data);
> +			for_each_pipe_with_valid_output(&data->display, data->pipe, data->output) {
> +				igt_display_reset(&data->display);
> +
> +				igt_output_set_pipe(data->output, data->pipe);
> +				if (!intel_pipe_output_combo_valid(&data->display))
> +					continue;
> +
> +				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe),
> +							    data->output->name) {
> +					int valid_tests = 0;
> +
> +					if (data->flags == TEST_RANDOM)
> +						igt_info("Testing with seed %d\n", data->seed);
> +
> +					if (data->flags & TEST_ALL_PLANES) {
> +						igt_display_require_output_on_pipe(&data->display, data->pipe);
> +
> +						for_each_plane_on_pipe(&data->display, data->pipe, data->plane) {
> +							for (int j = 0; j < ARRAY_SIZE(formats); j++) {
> +								data->format = formats[j];
> +								valid_tests += test_ccs(data);
> +							}
> +						}
> +					} else {
> +						for (int j = 0; j < ARRAY_SIZE(formats); j++) {
> +							data->format = formats[j];
> +							valid_tests += test_ccs(data);
> +						}
>   					}
> -				}
> -			} else {
> -				for (int j = 0; j < ARRAY_SIZE(formats); j++) {
> -					data->format = formats[j];
> -					valid_tests += test_ccs(data);
> +					igt_require_f(valid_tests > 0,
> +						      "no valid tests for %s on pipe %s\n",
> +						      ccs_modifiers[i].str,
> +						      kmstest_pipe_name(data->pipe));
>   				}
>   			}
> -			igt_require_f(valid_tests > 0,
> -				      "no valid tests for %s on pipe %s\n",
> -				      ccs_modifiers[i].str,
> -				      kmstest_pipe_name(data->pipe));
>   		}
>   	}
>   
> -	igt_fixture {
> -		igt_output_set_pipe(data->output, PIPE_NONE);
> -		igt_display_commit2(&data->display, data->display.is_atomic ?
> -				    COMMIT_ATOMIC : COMMIT_LEGACY);
> +	igt_fixture
>   		data->plane = NULL;
> -	}
>   }
>   
>   static int opt_handler(int opt, int opt_index, void *opt_data)
> @@ -1060,8 +976,6 @@ static const char *help_str =
>   
>   igt_main_args("cs:", NULL, help_str, opt_handler, &data)
>   {
> -	enum pipe pipe;
> -
>   	igt_fixture {
>   		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>   
> @@ -1076,15 +990,8 @@ igt_main_args("cs:", NULL, help_str, opt_handler, &data)
>   			data.seed = time(NULL);
>   	}
>   
> -	for_each_pipe_static(pipe) {
> -		data.pipe = pipe;
> -
> -		igt_subtest_group {
> -			for (int c = 0; c < ARRAY_SIZE(tests); c++) {
> -				test_output(&data, c);
> -			}
> -		}
> -	}
> +	for (int c = 0; c < ARRAY_SIZE(tests); c++)
> +		test_output(&data, c);
>   
>   	igt_fixture {
>   		igt_display_fini(&data.display);

