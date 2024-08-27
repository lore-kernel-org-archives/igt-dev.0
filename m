Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51718C5473B
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 17:50:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE0210E3F1;
	Tue, 27 Aug 2024 17:50:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZekN6D4/";
	dkim-atps=neutral
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F03910E3F1
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 17:50:16 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4280bca3960so49821375e9.3
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 10:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724781015; x=1725385815; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=pQgIHr/HUQoY4ptfTKlUM2Ez7MMixOo+4oWBFZQXKXY=;
 b=ZekN6D4/4hRFgjGqY09AG8PGgUPVvVNx2haR8cH4IAUg5z4KcovNjoULHxNM3thtUJ
 8TsaHcqu+Ol5Mk4rMhnUoLYtLVBylo4X7Bww8g/pTwed5U3OaWGPnKhuyRebfmsLB8jh
 Dd9QcaoRP6iLY0fABzbzWdaIywzkG9HiSFt7U2mZluOaIV41Ep8w5kAWYX1gIwgY67/T
 kZgEsmfU4sVg8AMZ4zl0uObBZDkM5/lvEHf8ycYECF33BUGnqwQSEg0LZKv29sv2c+7j
 Y/3Uno7FXkqZ+DS1kTGVlg4/teqLB3ZLxOlHJOMbfoTtTLBfM7HtKo/MbAp0LonONYHJ
 hx2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724781015; x=1725385815;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pQgIHr/HUQoY4ptfTKlUM2Ez7MMixOo+4oWBFZQXKXY=;
 b=ZDdy869H2ZqcBu6EJ2fXUIXjnfOZk4qmqUfhaWWQQrA7TLte0mpz2AGx1N2NfVhqQz
 dZWBALNtp7uY0IUjWsGCZMsjYeKL3qB/Vf8Q8u4BFlvxwCna/1BnqhQD/uywgjyHwb+N
 LJ3OY4vh0qH976HBlBHMlyWdHvzpw21F/i1nAdR57m6PtxQL3Q+f6P9zxr4595DXTox1
 ZtFsCF4NzlU597oCOswScsjFWcIMHx5+5rfIIwJUx9HXGOiTDnz6FK7AGTaU8x9Ihlam
 l1x40gP5qBhiPxFqhK0NwW3cL7Ev2bOrmxLgHY+Bg2hjJ60iUv5IDNmRBhSdCPNs/tma
 K/SA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWNtbCREcJAKKRmSWff4an6qm9/A1lQ0bm8AVXrmZ6QTuMNmXLa+BnwnNOf4lBROdezIuyZ0oK@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywd+jBqu5ZkwO0Lx59bPXOHsXwnTDmbxU9xfx/zZ5L9zvrW44rD
 VY40JLXYPgLCcyXInR9xCCg/B48cyCsygTxTB8RuEIi079I192yE9fxfaP2FTmo=
X-Google-Smtp-Source: AGHT+IFXgDgySKJau90k6qLgePpHceeidmLo26shTxVwLa/+9Oohm+yiVRA+yAB8+ui8KnUu9jsHLQ==
X-Received: by 2002:adf:eb8c:0:b0:371:8f19:bff0 with SMTP id
 ffacd0b85a97d-373118587eemr8520259f8f.20.1724781014613; 
 Tue, 27 Aug 2024 10:50:14 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3730815c035sm13676519f8f.55.2024.08.27.10.50.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 10:50:14 -0700 (PDT)
Message-ID: <a9c9111e-6e24-4c55-988d-bfb92a719ba4@gmail.com>
Date: Tue, 27 Aug 2024 20:50:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 36/37] tests/kms_ccs: Skip testing on identical
 plane types
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
 <20240702232817.31147-37-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240702232817.31147-37-ville.syrjala@linux.intel.com>
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
> On icl+ each plane type (HDR,SDR UV,SDR Y) have identical
> capabilities, so only test one plane of each type. Makes the
> test quite a bit faster:
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   tests/intel/kms_ccs.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index 60d8dc132105..8d3932de093e 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -977,6 +977,24 @@ static int test_ccs(data_t *data)
>   	return valid_tests;
>   }
>   
> +static bool skip_plane(data_t *data, igt_plane_t *plane)
> +{
> +	int index = plane->index;
> +
> +	if (intel_display_ver(intel_get_drm_devid(data->drm_fd)) < 11)
> +		return false;
> +
> +	/*
> +	 * Test 1 HDR plane, 1 SDR UV plane, 1 SDR Y plane.
> +	 *
> +	 * Kernel registers planes in the hardware Z order:
> +	 * 0,1,2 HDR planes
> +	 * 3,4 SDR UV planes
> +	 * 5,6 SDR Y planes
> +	 */
> +	return index != 0 && index != 3 && index != 5;
> +}
> +
>   static void test_output(data_t *data, const int testnum)
>   {
>   	uint16_t dev_id;
> @@ -1025,6 +1043,9 @@ static void test_output(data_t *data, const int testnum)
>   						igt_display_require_output_on_pipe(&data->display, data->pipe);
>   
>   						for_each_plane_on_pipe(&data->display, data->pipe, data->plane) {
> +							if (skip_plane(data, data->plane))
> +								continue;
> +
>   							for (int j = 0; j < ARRAY_SIZE(formats); j++) {
>   								data->format = formats[j];
>   								valid_tests += test_ccs(data);

