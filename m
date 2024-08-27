Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53237C5472F
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 17:51:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14D3D10E3F5;
	Tue, 27 Aug 2024 17:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Zi17vf3J";
	dkim-atps=neutral
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC1D10E3F5
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 17:51:32 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-428fb103724so36438655e9.1
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 10:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724781090; x=1725385890; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=VUZPjPldvM51IbAuc8H4BnC1xggVliiRtm7d34pREW0=;
 b=Zi17vf3J8sY7LKuodldc0pDfug/HzebW5dCwTiFxiK+HsU7ZEWbh27y0c0WiHQlAOl
 EJ2TvW3yT6ffIBqdWD/OTpMvpdJiENiP3ZHvYF56XKuS2ET6P0Jsajls4MwqQSzB/7nI
 ierzoiau+NVvOAYvnxjY1rDKWowI8sfWuMFpp9IKyZf/iHcLpTBFcfnG5B3JstyFglIa
 M5mtLcI+94+tl2kaOmIShl7kycJ39bcxaHrRZRkFLr9ogLIbcQCyGZ0MjPELuYQZrKe6
 vdEUSBYaad87ektAqW3MoC2TbjHIls5M4mj5LTbit6mq2wiMuSj3Pn2q9WGn6TKB2eBT
 1M0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724781090; x=1725385890;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VUZPjPldvM51IbAuc8H4BnC1xggVliiRtm7d34pREW0=;
 b=ptROyElPwocJ+AHdcC4sNJ8gQ7AS1P0SGYaYCtA4mNdtlGLC496ouWYRn2tDMZ0dqI
 DhojcSgi3xHabFpKwCQSUbHjPJKpgjD3E/mtMvmPJJTOCS1WcDZvTemaBrSeWsRnXcQX
 1E9rtx4qXoKgV1y5blmqbOY0nax6RX5c1LI6qfVP1zqlIOxebJQRSXJIQJ9dFJZboIth
 zcbEto2yVygWr13aWQlPVi0sM4s96bjzUwa+tAhHVpOpjZBvIyz8zDuxwRFcLXZ1xQQS
 swGaof2qtPOJaaSwThqZyv2nW+RQTWoggOUFSIS96KUfI2mPdM+j91U7p/pVYatL5YC/
 B1Lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdWkKzWjI9HTfubVVGTmd3V8OqOgttM0ObUuzqaPtv/8EZ5NkzJiCk80xSefWTqnT8HFGrGqGE@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7V7PUatPTUJwOaHwkPVTx/cp+RU2a5ebZx8kwWY9YzKKNjkNM
 ITzEoepiGE8kB0bWgUlZ372M7ytyge77jihZ6NAjQolgxQlER8nj8BFNqGuH3Tk=
X-Google-Smtp-Source: AGHT+IEtqk0zbUPQnLBLClz1pPzbVDWOSvRljqyKXveNyZD11zeUgzMkyGTQGbU8+IbCGCpSvqlQ+g==
X-Received: by 2002:adf:ce85:0:b0:368:318a:a191 with SMTP id
 ffacd0b85a97d-3749512451cmr11347f8f.8.1724781090037; 
 Tue, 27 Aug 2024 10:51:30 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3730813c465sm13677363f8f.32.2024.08.27.10.51.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 10:51:29 -0700 (PDT)
Message-ID: <a6d2c689-7c2d-4dfb-a70c-e9ace181a9f3@gmail.com>
Date: Tue, 27 Aug 2024 20:51:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 37/37] tests/kms_ccs: Provide a hint as to what
 we're testing
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
 <20240702232817.31147-38-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240702232817.31147-38-ville.syrjala@linux.intel.com>
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
> Log the currently tested pixel format + modifier. Makes it
> a bit easier to figure out what actually failed when it did.
> 
> TODO: would be nicer to also indicate if we actually test
>        anything or just skip the whole thing, but that would
>        require a bit of restructuring of the test...
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   tests/intel/kms_ccs.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index 8d3932de093e..3ed270a84c50 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -944,6 +944,9 @@ static int test_ccs(data_t *data)
>   	igt_crc_t crc, ref_crc;
>   	enum test_fb_flags fb_flags = 0;
>   
> +	igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT "\n",
> +		 IGT_FORMAT_ARGS(data->format), IGT_MODIFIER_ARGS(data->ccs_modifier));
> +
>   	if (data->flags & TEST_CRC) {
>   		data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
>   						  IGT_PIPE_CRC_SOURCE_AUTO);

