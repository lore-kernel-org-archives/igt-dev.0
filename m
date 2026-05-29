Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A00CD6E4A
	for <igt-dev@archiver.kernel.org>; Fri, 29 May 2026 12:15:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B573210FE2E;
	Fri, 29 May 2026 12:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ygs8BmEd";
	dkim-atps=neutral
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com
 [74.125.82.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E9410FE2E
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 12:15:16 +0000 (UTC)
Received: by mail-dy1-f181.google.com with SMTP id
 5a478bee46e88-304b8ced372so4404929eec.0
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 05:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780056915; x=1780661715; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=I2ks33SabDkvNDFye+nSUzSabR7LaV1KpGY5QejRqvk=;
 b=Ygs8BmEdzTrNDpQSmmRwn+urVURy9fGBW477phxPzbllHN5qL+7W2WE4gcaHmL+L2W
 6dG3KpqvmME9n/hDMzjg/1ynlNwYBXWnB7HL8s/BE0d7pB4numdGxTJVo2RS/jhRDI19
 FG2e1pG7ESCkxtMWn4bkAQeYjuIs7p9Id3aWRgFy0/skUQvuoCz1iuidQNu6hZoLookO
 UadHb25Ny3MaZnhf0cw3Sm/Blme3UzCLVXcoWKfgxDFeL5JmfTGRSGgNre3exLOJ2msq
 GTy28zF6M/nEOoUf2xddUZIIsm7MonOyiqox2MoW1+1ktDroyOp8NYMa0NUDXGY6s5QB
 qyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780056915; x=1780661715;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I2ks33SabDkvNDFye+nSUzSabR7LaV1KpGY5QejRqvk=;
 b=PJbmpQccOANWZmLudcRYZ0XzwRIgOeKWkR24DRN92JGG9iEcza8VyBWxndFXi1akCq
 gW2uvz90nlSbsrP8ruAZVVhYB9lYHJVUIzyLucMj/N7WW5NpdpitJeloz5WLu6k88yOb
 5CMKXPP0x8bUXptY3BHvp7dUMgTJp1nJ2DwgWrcnxxYEJQNlMOYrlbAUJ2lt94eK5Wrf
 TNte9tzKj4NahD7kZaYQDSJ4VoJddeNJ/fA/eySO9VID7WmjmJ/Y9Fldzr43vA7cJNGe
 9Q89Nmsewkn4HuAAz2UQ5/cZzZTnmeuMW45CYZqUo44AJuOZDuwWUWgqFEp/EuFY0Yor
 N6Tw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/i1BmFx6KZx8QhF1w4mYGNMEyLsuPP2vIBlTuscIBhaLoji2CY+A+iuIv8CBteugYOrOlnVBkC@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYj0l2CW2paBaJikCoge/1Rh/nmaG8VLj1nAgaqfcHx83LwgLH
 wgDMWubhKHvDds8z8+NZ/4afAfiFmdBsuv8lzxLXl4JeP1A6ToisbIJc
X-Gm-Gg: Acq92OEFEuRNjqCawtLPZSAWi3nIGNoo/C2eBlGstKTF/pM08o7ct9pIhHtdTCPfLBs
 JCGOSp9sPtTBr4MGqGUCE0LKZrS9btt9uGvOqBbyGo0WFCa8EMjSymNrf62y180ouErOKh7+1Op
 tjmc9YGf6aLmmz3of436JYtdHkmJIPRkteTCgg5bFZq+1wvK5ROMeLzbERMZM1XgZaLZO9CxSBX
 U4+YNUxU3r84lc8KkrHvKZy6o2ni8Q9qtLwiUaf5Xx/T5/QVr+MQo3FHp1RVPJ7vtttIISz0aXJ
 lL98eEWVlU2TobxmEcGDyWxVezTdpLtUnzfaPDo3q0vi9l4YqohlCIQ/fCw1DYd+L+U1YfVMDC7
 JHn35OOg3YIK+4WCdWzDnqrOKpi79GyRJXhrV/3C1WyhT92dlrh5V6GF0KHmWVeSqDsLX3FEa2T
 DQ9VtdZZNgKV67TYgJc9E+yHCsLAjPKwJ1b/xJ3UeKyqyQ455ateNE7czG2tF+keBOVoB97l/0q
 rk44cN8X/VFgVs=
X-Received: by 2002:a05:7300:ec07:b0:304:d92a:e60a with SMTP id
 5a478bee46e88-304eb241113mr1139506eec.31.1780056914269; 
 Fri, 29 May 2026 05:15:14 -0700 (PDT)
Received: from [192.55.54.47] ([192.55.54.47])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ed5a9d27sm1214154eec.25.2026.05.29.05.15.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 05:15:13 -0700 (PDT)
Message-ID: <e7fcb66b-9e7c-4097-984e-7efa49634fe3@gmail.com>
Date: Fri, 29 May 2026 15:15:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 23/25] tests/kms_async_flips: Use
 for_each_format_and_modifier() and for_each_modifier_with_format()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
 <20260512122143.11013-24-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20260512122143.11013-24-ville.syrjala@linux.intel.com>
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

On 12/05/2026 15.21, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Replace the open coded copies of for_each_format_and_modifier()
> and for_each_modifier_with_format() with the real things.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   tests/kms_async_flips.c | 21 ++++++++-------------
>   1 file changed, 8 insertions(+), 13 deletions(-)
> 
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index e8c9979bd06d..ef4b28eb5258 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -949,18 +949,16 @@ static void run_test_with_async_format_modifiers(data_t *data, void (*test)(data
>   	igt_vec_init(&tested_formats, sizeof(struct format_mod));
>   
>   	for_each_crtc_with_valid_output(&data->display, crtc, data->output) {
> +		struct format_mod f = {};
> +
>   		data->crtc = crtc;
>   		test_init(data);
>   
>   		igt_assert_f(data->plane->format_mods_async.count > 0,
>   			     "No async format/modifier supported\n");
>   
> -		for (int i = 0; i < data->plane->format_mods_async.count; i++) {
> -			struct format_mod f = {
> -				.format = data->plane->format_mods_async.formats[i],
> -				.modifier = data->plane->format_mods_async.modifiers[i],
> -			};
> -
> +		for_each_format_and_modifier(&data->plane->format_mods_async,
> +					     f.format, f.modifier) {
>   			if (skip_async_format_mod(data, f.format, f.modifier, &tested_formats)) {
>   				igt_debug("Skipping format " IGT_FORMAT_FMT " / modifier "
>   					   IGT_MODIFIER_FMT " on %s.%u\n",
> @@ -1003,19 +1001,16 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
>   		require_atomic_async_cap(data);
>   
>   	for_each_crtc_with_valid_output(&data->display, crtc, data->output) {
> +		uint64_t modifier;
> +
>   		data->crtc = crtc;
>   		test_init(data);
>   
>   		igt_require_f(data->plane->format_mods_async.count > 0,
>   			     "No async format/modifier supported\n");
>   
> -		for (int i = 0; i < data->plane->format_mods_async.count; i++) {
> -			uint64_t modifier = data->plane->format_mods_async.modifiers[i];
> -			uint32_t format = data->plane->format_mods_async.formats[i];
> -
> -			if (format != DRM_FORMAT_XRGB8888)
> -				continue;
> -
> +		for_each_modifier_with_format(&data->plane->format_mods_async,
> +					      DRM_FORMAT_XRGB8888, modifier) {
>   			if (modifier == DRM_FORMAT_MOD_LINEAR)
>   				continue;
>   

