Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5B4D339A1
	for <igt-dev@archiver.kernel.org>; Mon, 28 Oct 2024 17:08:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E603710E517;
	Mon, 28 Oct 2024 17:08:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hi4XgGXP";
	dkim-atps=neutral
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B30010E517
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Oct 2024 17:08:29 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a99cc265e0aso705887466b.3
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Oct 2024 10:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730135307; x=1730740107; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=0gLXB7OHYrai0S7SVKrJAO6NfY1LMQFZnSkknc3uSQ8=;
 b=hi4XgGXPqKrmNr4rPCOOxpBDkPbE7klpFF3UkAPq1BCkz3WnkvHqcs6xeuv6W5tfyI
 mSslw0Tq3gwUqgZ61IypB82jVd2eXgx8fGPPsecsHomB6DvnSdP0E2dN/RPQZhL8WCXX
 0C50CqX2Arzrbp0/3vbXxxjAFYxLLJ2ne/Naa78d3S7g+DWPK37xP5SD8T/Is/sNO21g
 V7MRtbIVgx61DL5tks6h/WQgqfrbD+EHmvAVzHL0gf3Z5O/qU7fpsjlG1SWOTGR/fKww
 LeSY7tmQBiFhw7V6NJhOa8FFtFpRlkoSEhckpjN5Vm87kDUiiGnMtp0X2d3LhJEimi8/
 FLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730135307; x=1730740107;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0gLXB7OHYrai0S7SVKrJAO6NfY1LMQFZnSkknc3uSQ8=;
 b=DzslC88lvxvBEQca8zi//Jhc4MqHKD5i7Fh+B9CALdiqCWKMByoCXcz5fJZevXzRez
 L6iM8yuuffL0WwgZb8teWMiL8NSkgk757y3WP4qOcqLylYRpUcviadfc3M6uC9a6Iq9G
 v/aOxoZkAv+bIsD4OLbc5XjlVsSJ+6E3il/ARO7ow+Ur/qy17YNGAhsa7l7p39ApSyJb
 2GqRBZTDG0LzcU7RhFzAwcyn1FddZSEtAgfHEgUnV/BZSra//5nb94nDA7bgbD2aRh+G
 nDfFRKczm/feK7d0UeKrVlwTOv8FU8Dgk/mRryhcVBWBjdXreoUlpK7l04gwPr2hr8pP
 tCew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhzJp4QDVwmJd1VoC0y+rAHsP4eLZuFc6AQYazC93+KdUU6AmmEoHnX5KCLWOBdlgOGoGJMFMS@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGs0yHDXarji0id9dlINoaB2uca2yB31eeG2XmrcEPqsNOFqRG
 FqfdiZ3Ch/+p2j1RhFmmrgNfmYGqzh5HnPacir2hVo9Jv/kWkDwo
X-Google-Smtp-Source: AGHT+IEfeQJv1OP4IkD75gWYBZ8YDZ+paH9wYnLRiPBA8Szhtm+1KtOxkoSsJ17LdD7hdk462wxEcA==
X-Received: by 2002:a17:907:7e8e:b0:a99:e939:d69e with SMTP id
 a640c23a62f3a-a9de61d1a8cmr661458866b.51.1730135306912; 
 Mon, 28 Oct 2024 10:08:26 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.77])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a9b1f298df1sm393570666b.135.2024.10.28.10.08.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 10:08:26 -0700 (PDT)
Message-ID: <4be4117b-ba4d-4472-bba4-b4880d93c022@gmail.com>
Date: Mon, 28 Oct 2024 19:08:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_plane_scaling: Require at least 30 Hz
 refresh rate
To: Mika Kahola <mika.kahola@intel.com>, igt-dev@lists.freedesktop.org
References: <20241025084251.14116-1-mika.kahola@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20241025084251.14116-1-mika.kahola@intel.com>
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

On 25.10.2024 11.42, Mika Kahola wrote:
> With HDMI dummies we may end up testing a mode that doesn't really
> resemble real life scenario like 4k mode with 17Hz refresh rate, which
> can lead issues when executing a test. Therefore, the patch proposes
> for intel-max-src-size to be tested with with real life refresh rate
> such as 30 Hz or higher.
> 
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>   tests/kms_plane_scaling.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index a55720ed9..c8c9aee31 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -215,6 +215,7 @@ typedef struct {
>   struct invalid_paramtests {
>   	const char *testname;
>   	uint32_t planesize[2];
> +	uint32_t vrefresh;
>   	struct {
>   		enum igt_atomic_plane_properties prop;
>   		uint32_t value;
> @@ -225,6 +226,7 @@ static const struct invalid_paramtests intel_paramtests[] = {
>   	{
>   		.testname = "intel-max-src-size",
>   		.planesize = {3840, 2160},
> +		.vrefresh = 30,
>   	},
>   };
>   
> @@ -1220,13 +1222,14 @@ static void invalid_parameter_tests(data_t *d)
>   	}
>   }
>   
> -static drmModeModeInfo *find_mode(data_t *data, igt_output_t *output, const uint32_t planesize[])
> +static drmModeModeInfo *find_mode(data_t *data, igt_output_t *output, const struct invalid_paramtests *test)
>   {
>   	drmModeModeInfo *mode = NULL;
>   
>   	for (int i = 0; i < output->config.connector->count_modes; i++) {
> -		if (output->config.connector->modes[i].hdisplay == planesize[0] &&
> -		    output->config.connector->modes[i].vdisplay == planesize[1] ) {
> +		if (output->config.connector->modes[i].hdisplay == test->planesize[0] &&
> +		    output->config.connector->modes[i].vdisplay == test->planesize[1] &&
> +		    output->config.connector->modes[i].vrefresh >= test->vrefresh) {
>   			if (mode &&
>   			    mode->vrefresh < output->config.connector->modes[i].vrefresh)
>   				continue;
> @@ -1568,7 +1571,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   						 * Need to find mode with lowest vrefresh else
>   						 * we can exceed cdclk limits.
>   						 */
> -						mode = find_mode(&data, output, intel_paramtests[index].planesize);
> +						mode = find_mode(&data, output, &intel_paramtests[index]);
>   						if (mode) {
>   							igt_dynamic_f("pipe-%s-%s",
>   								       kmstest_pipe_name(pipe), igt_output_name(output))

