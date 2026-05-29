Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2F0CD6E43
	for <igt-dev@archiver.kernel.org>; Fri, 29 May 2026 12:18:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2101610FE3A;
	Fri, 29 May 2026 12:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TdSx0KAN";
	dkim-atps=neutral
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com
 [74.125.82.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0177510FE39
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 12:17:44 +0000 (UTC)
Received: by mail-dy1-f180.google.com with SMTP id
 5a478bee46e88-304545f5206so10643139eec.0
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 05:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780057063; x=1780661863; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dum6UtpzCUQ34RkCrryGgDy/StQCfLauPWmvBqp80L4=;
 b=TdSx0KAN0OvnS7NKWGL+tWb558Upmrn68D3r6/mN4cfh0DJB4MWgK07YUj8Gn9LFhN
 vMjf9piLV1Ku2H3Bk+J5rSm2ymzCloYOMxBlbeqIwejjUx+48rYz8ivRwFEaNOAIlEAI
 8IQlDTzt+UopxELt2aODJEYWmP90FEld3AQEBQF5SXgvGHwG55G37wFgvSLB0eoPEH+7
 GfYxHPf2ApWaIQbcQf1vcovBHa3vr2FMJgeRa94Zxl+qWp477S4OJH/uModwtu9aL+aT
 7a5FyXQPzD83wxpJlKephligO8fxt/Wee0oxNu9YpEAAAP2yOWUyLrf4ZNkX84tIsBvV
 HEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780057063; x=1780661863;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dum6UtpzCUQ34RkCrryGgDy/StQCfLauPWmvBqp80L4=;
 b=G4RyMi9isKnaqr1JM8UK5hfifu2EBmPN/CQfoYUtvNR+mj2Xl1wk7SPqtt9oG749vC
 9AemipwjWLW8A1EBRbnn2ybJKJFfrT/DC75aDYLFHKIaA2OqPJ5VNgifAYAP32LMiGV2
 B3XZXiNnbygrIXQQkYE4QR53oNR+lcZQhJJH7nrBySR2KcG5TeZsX7xoucFURQkYiFte
 3DKBTzpa0RltP0lcpgJOZZGuIQDLtY/NMp20AR5s9CU3MBJo+LGJ/wEziYOQiX+8ovf+
 K7ZJFqp3Z17NfJTN+u5DuQ1mxwzjSY9qpiyKlPf04KNu/ntmPpXQQu6iXFVYwxWjYXya
 yrYw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/AQFMN8loCYaQHHDxBfbniNHfK+5CQ7d+ZzYT990i3eXEfzSVI3KnPGGkafxFuoeMCJCv6QRzB@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzO06v0KYJPqJo19hfPZ0zyIlmm7l8o+H/+VzIWZzhoch+BTUbn
 WZGsIKzlPcT8hVNeFXYFwbusbVCOo9LOZneU6lk97E6pptzocOPnM6Zg1gqFS/6Q
X-Gm-Gg: Acq92OF/j9SAUryZV/nZIfzHSXEOy7XTDnCm/P8fjPNPH2x95+bUnU0bN09FHghfHw7
 TQsaJMwpxXRvRVEfE6/m46+t4MDFBVXNYm934GLrgej1JBdJeQnDedG2rH4JrKelJuL1quW8LWh
 UGXS5BqRXzReCA2nqwuoggTA6ihrZ27Ol9WjGsiD3UFVaMMydkirSMJ34106JqlIympWBVGP2G3
 64KdR84ASkh7We9YV5ADu8c+37LX3TY+OiJDpqgS4pmF7hXetjpc489KyGj6QQ3zcQ/JDrxVuZI
 nA4c+WlFBUIkZwAFII7cDqyNcYDpWk7DBBuNeurU80aREvHqI0VzqBvY+s9MhQtG9dI/e8mu7lv
 ElwRtonRqO0EZmjNFO1BbMFjwOSgqbHuRAdV2J4sgQo0oXVxAaUj3f2aMarSPuUZtvBMNY/LAhT
 Q8GGzht5Doe6PgUWlmkmGEYBO+q1l7OCP/PwICPwGJl1x+QJiaoyiacEL51NenEVJbIKvPiVvAX
 ws9
X-Received: by 2002:a05:7300:3242:b0:2da:a813:a5fd with SMTP id
 5a478bee46e88-304eb17ec9fmr1124150eec.22.1780057063197; 
 Fri, 29 May 2026 05:17:43 -0700 (PDT)
Received: from [192.55.54.47] ([192.55.54.47])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ed2c10c1sm1261055eec.1.2026.05.29.05.17.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 05:17:42 -0700 (PDT)
Message-ID: <1ed1a2a5-beb5-4c3c-8968-2029c125029f@gmail.com>
Date: Fri, 29 May 2026 15:17:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 25/25] tests/chamelium/kms_chamelium_frames: Use
 for_each_format_with_modifier()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
 <20260512122143.11013-26-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20260512122143.11013-26-ville.syrjala@linux.intel.com>
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
> Replace the open coded copies of for_each_format_with_modifier()
> with the real thing.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   tests/chamelium/kms_chamelium_frames.c | 22 ++++++----------------
>   1 file changed, 6 insertions(+), 16 deletions(-)
> 
> diff --git a/tests/chamelium/kms_chamelium_frames.c b/tests/chamelium/kms_chamelium_frames.c
> index d1d76f26d6a0..cdce7ee6b1d7 100644
> --- a/tests/chamelium/kms_chamelium_frames.c
> +++ b/tests/chamelium/kms_chamelium_frames.c
> @@ -1032,9 +1032,9 @@ int igt_main()
>   	igt_describe(test_display_one_mode_desc);
>   	connector_dynamic_subtest("hdmi-crc-nonplanar-formats", HDMIA)
>   	{
> -			int k;
>   			igt_output_t *output;
>   			igt_plane_t *primary;
> +			uint32_t format;
>   
>   			output = chamelium_prepare_output(&data, port,
>   							  IGT_CUSTOM_EDID_BASE);
> @@ -1042,19 +1042,14 @@ int igt_main()
>   				output, DRM_PLANE_TYPE_PRIMARY);
>   			igt_assert(primary);
>   
> -			for (k = 0; k < primary->format_mods.count; k++) {
> -				uint32_t format = primary->format_mods.formats[k];
> -				uint64_t modifier = primary->format_mods.modifiers[k];
> -
> +			for_each_format_with_modifier(&primary->format_mods,
> +						      format, DRM_FORMAT_MOD_LINEAR) {
>   				if (!igt_fb_supported_format(format))
>   					continue;
>   
>   				if (igt_format_is_yuv(format))
>   					continue;
>   
> -				if (modifier != DRM_FORMAT_MOD_LINEAR)
> -					continue;
> -
>   				igt_dynamic_f(
>   					"%s",
>   					igt_format_str(format))
> @@ -1071,9 +1066,9 @@ int igt_main()
>   	igt_describe(test_display_one_mode_desc);
>   	connector_dynamic_subtest("hdmi-cmp-planar-formats", HDMIA)
>   	{
> -			int k;
>   			igt_output_t *output;
>   			igt_plane_t *primary;
> +			uint32_t format;
>   
>   			output = chamelium_prepare_output(&data, port,
>   							  IGT_CUSTOM_EDID_BASE);
> @@ -1081,19 +1076,14 @@ int igt_main()
>   				output, DRM_PLANE_TYPE_PRIMARY);
>   			igt_assert(primary);
>   
> -			for (k = 0; k < primary->format_mods.count; k++) {
> -				uint32_t format = primary->format_mods.formats[k];
> -				uint64_t modifier = primary->format_mods.modifiers[k];
> -
> +			for_each_format_with_modifier(&primary->format_mods,
> +						      format, DRM_FORMAT_MOD_LINEAR) {
>   				if (!igt_fb_supported_format(format))
>   					continue;
>   
>   				if (!igt_format_is_yuv(format))
>   					continue;
>   
> -				if (modifier != DRM_FORMAT_MOD_LINEAR)
> -					continue;
> -
>   				igt_dynamic_f(
>   					"%s",
>   					igt_format_str(format))

