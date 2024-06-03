Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D791DC25B75
	for <igt-dev@archiver.kernel.org>; Mon,  3 Jun 2024 12:40:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A326B10E0C8;
	Mon,  3 Jun 2024 12:40:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TKZpu+hw";
	dkim-atps=neutral
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1038710E0C8
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Jun 2024 12:40:07 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-42122ac2f38so24551685e9.1
 for <igt-dev@lists.freedesktop.org>; Mon, 03 Jun 2024 05:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717418406; x=1718023206; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=IP8acmBbeb27Qsxu6t7daUY80aJoR4CP33ZSPuJV4ro=;
 b=TKZpu+hwsdW9mvdH7HkzFWRUphPqz+PHHlkWLDhdUUot3hKuY5Cwv+Vhwu3Fza/Pd4
 ysUxGLinEY7+JcD538mPsx5j12Uhf1kl2iNsQBJ3gHCEqZ5Nyb37pnzBRSi8HJ013+go
 hW80Zcz+/DsR7i8RILEH5e1wG52yLLNJEgKb8Enf6bpVn1FO+kp7ZZ8W7dIcDJjlTbd6
 2ZoC/8irelOQFT2BCjlIePPne3ZTUQPs92o95oQEsMSkXB+bGtxtuOu+Nj7W6jjHg501
 tHdADfcqi7U8b60BBzJ2bopEgrlFWMTGG4a94whc/qugZ4xqqLbk9mHqhMfVEdJiXq9y
 155A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717418406; x=1718023206;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IP8acmBbeb27Qsxu6t7daUY80aJoR4CP33ZSPuJV4ro=;
 b=ZP3KGwi8gld6eCE9c7gQyruk0u4iVvwyLSUH7rlG6vmRYDCxmkYo/3Bg+NpPpWPyLM
 YVc6qsnsyLsPJkW3MwPQNXl9hmzZSTlshRpjtQgcQCl3/K04saAWHuNJzqsiMd1WEHBD
 98pOUB0mhFOni1pqRn/zotauk7mpgrSE/da2BqGE1HT48O3BdKmJKc8FZhDlPKRDEZly
 gYYoTeCl8k8oMYkKOwMhSBH24Iy6qIwFqFqk00yVE6DyIA9jGspL55giAWh5MZ88xQD5
 Wul7qs+1KhV7R6smOIBxVBSzIAwlPLDH+9oiV3iA1ZR9pfBLOVTmKJiFB9OXUdMCy/n2
 Jlrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUImeVu1ds8XgDFo3gz5NUV718Fgf9tfsbs1cw6V5wI4HZGPSXNqlHQA3jLeUnWhnmPrGtEbwZ+iZUUUvRrVZeK1qwdL8ag+AvQ3Fy/kg==
X-Gm-Message-State: AOJu0YzluHiqwNUwF6NaixKH/Xlqw2nuAqKPtL3eLiXuwBYi/wygaCWo
 n7s7DxjFVnH5G0cggYN8bL1hQz8XKc3MVTyeZu4gBhHaIRggUnwt
X-Google-Smtp-Source: AGHT+IFoP7i0iZ2FXv2jNEuxcYKn6FzFCm8dAIUvH0PwqXZGebwqzbNCHTnBpi2VVvfgWRVOEt1GRA==
X-Received: by 2002:a05:600c:3ca2:b0:418:5ef3:4a04 with SMTP id
 5b1f17b1804b1-4212ddbc898mr71261085e9.18.1717418406014; 
 Mon, 03 Jun 2024 05:40:06 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.77])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4212705692csm146738105e9.10.2024.06.03.05.40.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jun 2024 05:40:05 -0700 (PDT)
Message-ID: <cbe89ff7-16a5-4231-934d-1e654a0b64a5@gmail.com>
Date: Mon, 3 Jun 2024 15:39:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 2/2] tests/kms_plane: Convert to dynamic subtests
To: Pranay Samala <pranay.samala@intel.com>, igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, jeevan.b@intel.com, sameer.lattannavar@intel.com,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
References: <20240531060622.489881-1-pranay.samala@intel.com>
 <20240531060622.489881-3-pranay.samala@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240531060622.489881-3-pranay.samala@intel.com>
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

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 31.5.2024 9.06, Pranay Samala wrote:
> The test runs on all pipes on dynamic level to test all the supported
> pixel-formats and modifiers on current plane of that pipe.
> 
> Updating the test to execute on multiple planes on dynamic level.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> 
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/kms_plane.c | 27 +++++++++++++++++----------
>   1 file changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 7a17b700c..aac8e3ef0 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -351,10 +351,11 @@ test_plane_position(data_t *data, enum pipe pipe)
>   	test_init(data, pipe);
>   	test_grab_crc(data, output, pipe, &green, data->flags, &reference_crc);
>   
> -	for (int plane = 1; plane < n_planes; plane++)
> -		test_plane_position_with_output(data, pipe, plane,
> -						output, &reference_crc,
> -						data->flags);
> +	for (int plane = 1; plane < n_planes; plane++) {
> +		igt_dynamic_f("pipe-%s-plane-%d", kmstest_pipe_name(pipe), plane)
> +			test_plane_position_with_output(data, pipe, plane, output,
> +							&reference_crc, data->flags);
> +	}
>   
>   	test_fini(data);
>   }
> @@ -1216,7 +1217,8 @@ test_pixel_formats(data_t *data, enum pipe pipe)
>   	for_each_plane_on_pipe(&data->display, pipe, plane) {
>   		if (skip_plane(data, plane))
>   			continue;
> -		result &= test_format_plane(data, pipe, output, plane, &primary_fb);
> +		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(pipe), plane->index)
> +			result &= test_format_plane(data, pipe, output, plane, &primary_fb);
>   	}
>   
>   	test_fini(data);
> @@ -1322,14 +1324,19 @@ static void run_test(data_t *data, void (*test)(data_t *, enum pipe))
>   			continue;
>   
>   		igt_output_set_pipe(data->output, PIPE_NONE);
> -		igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
> -			test(data, pipe);
> +		test(data, pipe);
>   
>   		if (is_pipe_limit_reached(++count))
>   			break;
>   	}
>   }
>   
> +static void dynamic_test_handler(data_t *data, enum pipe pipe)
> +{
> +	igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
> +		test_plane_panning(data, pipe);
> +}
> +
>   static void
>   run_tests_for_pipe_plane(data_t *data)
>   {
> @@ -1366,20 +1373,20 @@ run_tests_for_pipe_plane(data_t *data)
>   	igt_describe("verify plane panning at top-left position using primary plane");
>   	igt_subtest_with_dynamic_f("plane-panning-top-left") {
>   		data->flags = TEST_PANNING_TOP_LEFT;
> -		run_test(data, test_plane_panning);
> +		run_test(data, dynamic_test_handler);
>   	}
>   
>   	igt_describe("verify plane panning at bottom-right position using primary plane");
>   	igt_subtest_with_dynamic_f("plane-panning-bottom-right") {
>   		data->flags = TEST_PANNING_BOTTOM_RIGHT;
> -		run_test(data, test_plane_panning);
> +		run_test(data, dynamic_test_handler);
>   	}
>   
>   	igt_describe("verify plane panning at bottom-right position using primary plane and executes system"
>   		       "suspend cycles");
>   	igt_subtest_with_dynamic_f("plane-panning-bottom-right-suspend") {
>   		data->flags = TEST_PANNING_BOTTOM_RIGHT | TEST_SUSPEND_RESUME;
> -		run_test(data, test_plane_panning);
> +		run_test(data, dynamic_test_handler);
>   	}
>   
>   	igt_describe("verify planar settings for pixel format are accepted or rejected correctly");

