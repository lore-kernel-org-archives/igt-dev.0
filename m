Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F44CD6E43
	for <igt-dev@archiver.kernel.org>; Fri, 29 May 2026 12:12:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C952910FE23;
	Fri, 29 May 2026 12:12:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PQ8G223h";
	dkim-atps=neutral
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72DF10FE20
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 12:12:21 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2b4583f0a1aso101732345ad.3
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 05:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780056741; x=1780661541; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=knKiYivQ6PMJ9HNqNlLWB3Ep4jZzCGoexWVg/j8h69s=;
 b=PQ8G223hu1t6NPqFdi08LnytQMdaxBxGPqCnrsYfGGN/65o4v2vGmNSRy+A4RbBg0T
 wXMWMV7S1NtHkvV7H5ntJgzIogNGjZWOj1CHAFm30MPeucuo/IyA7NBiUoo+A8e16b+1
 pCvG7TrGAQC9lrOwlW6+uzX7+Qme7lqndwvoC9tOs+CJSLtG+UJVL0el6xkhIHnaPXJe
 UDSGlM2R+BA+qHhLEvo6Y9Wn6gox0p7dnsHeb13cpGcBP3/Z65Ib/EsL8bO8H5gMfNva
 6Zowa5buC1MBcTQmp9+KHjPz/SM0WkMTnCrt2xa+WoIIaod1AkqUq168rvUOEtl3ss6E
 GZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780056741; x=1780661541;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=knKiYivQ6PMJ9HNqNlLWB3Ep4jZzCGoexWVg/j8h69s=;
 b=d7bB9j73W06uGYoVUHEz0S0T/dqUvApOKeJQN4MK8dMXlQrQKICVg0dwPuJRzGp1XU
 zjYiLf8tJYcRcQnzo6T3YCuBXD4juHG4IbWlVOEHP//RA0aT31N9mXc7VtF1Xx7se84O
 fZcKHdgyhZ5Gv0JSGe7shMLZgix7u22/5d5+R9AS1txXLE0yNtlifrgv1DojmVK2YgDT
 esM6X0p8736ahyxT/DQQALObF71rUEi1ONAkACehaY1E90mMN9LIb9IhLSSlk37/+2Wh
 pLBOKMFovaceJ0Kdc4m77xNeARgMx1AQQWqo4XfjgAQ5nSzvefOIBa0NjOFS85YoI1VJ
 ZmqA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9Xkso8PlLMzTr+Lxvhw8Af21UudeGzi4nRLhsW/cKjf13E2xLwWa9A+5Zi54rzcqFr/g/juv1F@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUziSnMhJtW5sTHRFY6eELhV9Ag3uxJIzKARHHacLTUbZLanPy
 tuGtA9xxtnAWcHG65t6bzrT8xPqG0AugqihB9GJy+xsVew5o5mJe7VqDywWQ0GE3
X-Gm-Gg: Acq92OFe+HqrmSwweFnS7PR4Rd/LbTPg9GFK1mmzykDLmsmdybBro7/eoQdSL6zOvkz
 /H+xnB3fXWmlwFSew49h6eEjtmH0qbXDzbfvqlbQgRYUaignXE9+7JTPkys6LcI9dTevbqAyaqa
 oq9FResr39U2TV0SzNS8kak3oRux5FoU+Ymp/U0sxchsrizP5tSkIcGfu/jBZ47Kc2yp9xFVUiz
 zKgFX8ue15S1vlkFNEZemp1Pj9gDcwIdZ1jtSmsFbAU5pMKvC7Hv1L2B5msGBywPw2yyhQ6xClQ
 nmaiIs4QCOx754brL659DUvqtNHDawjnkmFvfyvuzvJqcamD7/Hz19V+oYxGsQXSh0w5Ofh1QhA
 V4aHstlC/1nLJcJQnz7jQqUga3MoJehnooq4nj1cpD0qysXVcJA44qTI9Sbo50HMUpJh0a98kpQ
 bzHdkdPY/FCDtxNIPX/eP5g+GCCRoTKSZWpUAO0GhrYnF+RsNsVQ9ZjHUXOJ4AOMbCWgJSN3LkE
 x2/ftYs5Q==
X-Received: by 2002:a17:903:2287:b0:2b9:fb9a:1103 with SMTP id
 d9443c01a7336-2bf20be24f1mr34570785ad.38.1780056741182; 
 Fri, 29 May 2026 05:12:21 -0700 (PDT)
Received: from [134.134.137.76] ([134.134.137.76])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bf23c26b3bsm18559135ad.64.2026.05.29.05.12.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 05:12:20 -0700 (PDT)
Message-ID: <904f8f4b-d99e-4c4c-b8a8-961ae91b2f0b@gmail.com>
Date: Fri, 29 May 2026 15:12:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 20/25] tests/kms_plane: Use
 for_each_format_and_modifier()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
 <20260512122143.11013-21-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20260512122143.11013-21-ville.syrjala@linux.intel.com>
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
> with the real thing.
> 
> The AMD thing here could more properly use a for_each_modifier(),
> if we had one. But implementing one on top of igt_format_mods
> would still iterate each modifier multiple times (assuming the
> same modifier is supported with multiple formats). So we'd
> rather want a modifier counterpart to for_each_plane_format().
> drmModePlane gave us a nice shortcut to for_each_plane_format()
> but sadly it doesn't extend that service to modifiers. So we'd
> have to build the pure modifier list by hand...
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   tests/kms_plane.c | 18 ++++++------------
>   1 file changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 5923b5917579..b82346464049 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -1122,6 +1122,7 @@ static void test_format_plane(data_t *data, igt_crtc_t *crtc,
>   	igt_crc_t ref_crc[MAX_CRC_SET][ARRAY_SIZE(colors_extended)];
>   	struct igt_vec tested_formats;
>   	struct format_mod ref = {};
> +	struct format_mod f = {};
>   	igt_crc_t* crcset;
>   	bool result = true;
>   
> @@ -1182,14 +1183,7 @@ static void test_format_plane(data_t *data, igt_crtc_t *crtc,
>   	 */
>   	igt_require(num_unique_crcs(ref_crc[MULTIPLE_CRC_SET], data->num_colors) > 1);
>   
> -	for (int i = 0; i < plane->format_mods.count; i++) {
> -		uint32_t format = plane->format_mods.formats[i];
> -		uint64_t modifier = plane->format_mods.modifiers[i];
> -		struct format_mod f = {
> -			.format = format,
> -			.modifier = modifier,
> -		};
> -
> +	for_each_format_and_modifier(&plane->format_mods, f.format, f.modifier) {
>   		if (data->mod != f.modifier)
>   			continue;
>   
> @@ -1252,17 +1246,17 @@ static void test_format_plane(data_t *data, igt_crtc_t *crtc,
>   static bool skip_plane(data_t *data, igt_plane_t *plane)
>   {
>   	int index = plane->index;
> -	int i;
> -
> -	for (i = 0; i < plane->format_mods.count; i++) {
> -		uint64_t modifier = plane->format_mods.modifiers[i];
> +	uint64_t modifier;
> +	uint32_t format;
>   
> +	for_each_format_and_modifier(&plane->format_mods, format, modifier) {
>   		if (IS_AMD_FMT_MOD(modifier) &&
>   		    (AMD_FMT_MOD_GET(DCC, modifier) ||
>   		     AMD_FMT_MOD_GET(DCC_RETILE, modifier))) {
>   			igt_debug("Skipping planes with DCC or DCC_RETILE\n");
>   			return true;
>   		}
> +		(void)format;
>   	}
>   
>   	if (data->extended)

