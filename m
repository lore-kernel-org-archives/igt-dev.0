Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62244C27C4F
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 12:22:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1153410E662;
	Tue, 18 Jun 2024 12:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VGIpNhly";
	dkim-atps=neutral
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E3B10E662
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 12:22:02 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2eaea28868dso73630871fa.3
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 05:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718713320; x=1719318120; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=6TdXK1Jkbe63Rr2Wr//AAjJHa5m9XyXw8oCFjXRrJoI=;
 b=VGIpNhly/Vf55pDRNhQqy3/QdcZEwH6jx6kTqlyIdMuVI2rpClaHjqTbUHhxYmSdB8
 BiB+L0lFGxd1VGH78omN6ESCgcemRhoINifb/GqqZBumdJjkHKc0JK49/J6IJVO1ndaM
 /MePq5Hnw068H/29dUzy1lHrxOnA9lZX3JivXVdWDqXSHlxz4hPAnUWYYu193+YujFcx
 7P9nMuasA/Sjgyfp/nGiVapylvpuSbOeA9CwFxc/RctiJeWniyL+eoTxhBixM22L+H24
 VBdPuQb02kWpqYk1G9p/h4NGMvptZPVX4rmJ6FtiJTzaBbinbRxB0DfRPcASC3GmWJ7d
 kPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718713320; x=1719318120;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6TdXK1Jkbe63Rr2Wr//AAjJHa5m9XyXw8oCFjXRrJoI=;
 b=w7uLLf0xc+Bv892HZtavzD48APGmh85wNzv0Zlw6J21KzYnjQ5YxRBI1pqWJloYCHh
 cOoUlP8I1lj1Vu8A0jZQgkHhVQqobR5ah3eBSiLPy7WFpC46YNSj6U8Q6afwENi2weV0
 MvXKIOgqP4xG7oQ2HbDxrk1Dfy1TavDC8AD1OlWZc9oEorg8jU6QIXf/pDGwTZBT8VlR
 lRu6yHi51ciL96WX/Nzm2NTAznug0ZAwZ43f+KPirHtvN8I6ewhUn2GSmDg6NOnx9WzK
 N0kte+2Xx0XX5bvgGq4Y+/V82rErMiiHiPZFFbX0zO5fv4rOzPH30nQt8nQhuxjodIK+
 sByQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXXIfPV3jWHnx5qaSfhRJZ1HjYldBH1r+HX7IAQM8mYdwYYcULRP4Ec72RCskK+WnTfc7HgDhTGWoPzl0fIAsBXbu65dqbphieH0CIyg==
X-Gm-Message-State: AOJu0YydNZ0GLSZwQE3+//99kI6y5eWKp6TLUWHusm57arknQl2UNMZY
 0aJRBm8osKoCV6e7xohaxtRDeyCikxUJs832/nF0kLGuy6+JWaCZ
X-Google-Smtp-Source: AGHT+IGt7yA+RSWCRApW68gPpmPutNDpm/sG0eXYPc3u1c8mS8avq1j6yEXdOunsX7OIv/8P8ha5bQ==
X-Received: by 2002:a2e:96cd:0:b0:2ec:17a9:ce9c with SMTP id
 38308e7fff4ca-2ec17a9d142mr82878701fa.47.1718713319531; 
 Tue, 18 Jun 2024 05:21:59 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.77])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-422870e95eesm224851815e9.25.2024.06.18.05.21.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 05:21:59 -0700 (PDT)
Message-ID: <2103b1f9-2025-4fe6-823f-a8bcac66337d@gmail.com>
Date: Tue, 18 Jun 2024 15:21:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_pipe_crc_basic: Add tests for supported
 formats
To: "Santhosh Reddy, Guddati" <santhosh.reddy.guddati@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240618052652.411119-1-santhosh.reddy.guddati@intel.com>
 <20240618104242.205236-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240618104242.205236-1-santhosh.reddy.guddati@intel.com>
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

On 18.6.2024 13.42, Santhosh Reddy, Guddati wrote:
> Current kms_pipe_crc_basic supports crc check for planar formats like NV12 and
> XRGB8888, added subtest to validate crc for all the supported formats

This sound like what kms_plane pixel format tests already do. Also this 
subtest overall seems to be in wrong place, kms_pipe_crc_basic is to 
"Tests behaviour of CRC" like it says at top of the file and not to test 
pixel formats.

How does this differ from already available pixel format tests on kms_plane?

/Juha-Pekka

> ---
>   tests/kms_pipe_crc_basic.c | 61 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 61 insertions(+)
> 
> diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
> index 0c19745bc..b8a0689e4 100644
> --- a/tests/kms_pipe_crc_basic.c
> +++ b/tests/kms_pipe_crc_basic.c
> @@ -82,6 +82,11 @@
>    *              CRTC does not cause issues.
>    */
>   
> +/**
> + * SUBTEST: compare-crc-sanitycheck-supported-formats
> + * Description: Basic sanity check for CRC mismatches with supported formats.
> + */
> +
>   static bool extended;
>   static enum pipe active_pipes[IGT_MAX_PIPES];
>   static uint32_t last_pipe;
> @@ -357,6 +362,33 @@ static bool pipe_output_combo_valid(igt_display_t *display,
>   
>   data_t data = {0, };
>   
> +/**
> + * @brief Retrieves the supported formats for a given output and pipe.
> + *
> + * This function returns an array of supported formats for a specific output and pipe.
> + *
> + * @param output The output for which to retrieve the supported formats.
> + * @param count  A pointer to store the number of supported formats.
> + * @param pipe   The pipe for which to retrieve the supported formats.
> + *
> + * @return An array of supported formats for the given output and pipe.
> + */
> +static uint32_t* get_supported_formats(igt_output_t *output, uint32_t *count, enum pipe pipe)
> +{
> +	igt_plane_t *primary;
> +	uint32_t *formats = NULL;
> +
> +	igt_output_set_pipe(output, pipe);
> +	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +
> +	*count = primary->format_mod_count;
> +	formats = (uint32_t *) malloc(sizeof(uint32_t) * (*count + 1));
> +	for (uint32_t i = 0; i < *count; i++) {
> +		formats[i] = primary->formats[i];
> +	}
> +	return formats;
> +}
> +
>   static int opt_handler(int opt, int opt_index, void *_data)
>   {
>   	switch (opt) {
> @@ -377,6 +409,8 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>   {
>   	enum pipe pipe;
>   	igt_output_t *output;
> +	uint32_t *supported_formats = NULL;
> +	uint32_t count = 0;
>   	struct {
>   		const char *name;
>   		unsigned flags;
> @@ -498,6 +532,33 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>   		}
>   	}
>   
> +	igt_describe("Basic sanity check for CRC mismatches with supported formats");
> +	igt_subtest_with_dynamic("compare-crc-sanitycheck-supported-formats") {
> +		for_each_pipe_with_single_output(&data.display, pipe, output) {
> +			if (simulation_constraint(pipe))
> +				continue;
> +
> +			if(!pipe_output_combo_valid(&data.display, pipe, output))
> +				continue;
> +
> +			supported_formats = get_supported_formats(output, &count, pipe);
> +			for (i=0; i<count; i++) {
> +
> +				// Skip the formats that are not supported
> +				if (supported_formats[i] == DRM_FORMAT_NV12 || supported_formats[i] == DRM_FORMAT_XRGB8888 \
> +						|| supported_formats[i] == DRM_FORMAT_C8) {
> +					igt_info("Skipping format "IGT_FORMAT_FMT" \n", IGT_FORMAT_ARGS(supported_formats[i]));
> +					continue;
> +				}
> +
> +				igt_info("Testing format "IGT_FORMAT_FMT" \n", IGT_FORMAT_ARGS(supported_formats[i]));
> +				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
> +					test_compare_crc(&data, pipe, output, supported_formats[i]);
> +				}
> +			}
> +		}
> +	}
> +
>   	igt_fixture {
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);

