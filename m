Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A378C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 25 Apr 2024 12:26:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3033E11A41B;
	Thu, 25 Apr 2024 12:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kF+AFtbc";
	dkim-atps=neutral
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E460B11A417
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2024 12:26:28 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-343d2b20c4bso679390f8f.2
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2024 05:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714047987; x=1714652787; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=6F8UVwPShOX2z9qRAUgdRjfmwwKLljmZL5CL/sYy1uY=;
 b=kF+AFtbcBPTXbcjkC9Bu0jp2uQKd26fPLK+5+hel0X0jDrrItWZDf1ZfAFwyGBAgJ7
 1g6ZtIxWHpv0jgPEsx7HzpdqAuP93xLFy6IS0hT2lF0iVEk/i/3WvklLTAQyB4PAWqfg
 MXeSiR4zV3G59TiDt3y2CHYEwpLVQ37pGv4eFz07qBYjemZvzQiuqdUL7l9VClCZMB5N
 3CN/DPaEdjK1UzQM12AcD7+HXvvNPSXNmGinNEDyXJwx1TdKnLvZuxBNFUE+nUwWK9Uh
 OpZvCTc9pUIR1QZ1/pJsVdEI8mHEP0jYXplaTl1DvNpKotXR2aVHs0WWotH2Arknlggb
 s4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714047987; x=1714652787;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6F8UVwPShOX2z9qRAUgdRjfmwwKLljmZL5CL/sYy1uY=;
 b=guwNNpXOhvIJKOACCkO4WIGXwRhOcOobWYjmNMtC6e4lDsBis63m3Z7/vrweNujH8+
 tU//1ySRqjU4+TBevJsk2WjAfdptJhSvoMpeQdm57Cp+Wd1qPikQzVRAH8BQxZIf62Do
 l3rZJ9MtKwGrJ5/zpzwkpWS1fibb+6WkmPRKUHEuRBqs5HrUUqOMZnlKAEh5e6XIpsB0
 hO2AqaOTWhwNLiraYV3G2crrfMdSsucyKw4iaAAWfT+JK5Or40tBQUqlPXR57T/i4hNz
 TqFgozEFvWBYe2IKWdLN5S38bKRxmp2WscCl5uMQzyOYBUzcgwyhJMlQV141LSUWcVGx
 souw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxSpiMJ1da4B9OWcE2fivObMwMQUFKGZ0dzBzLeZ/fWJvRn8oNAr4P55+LlCmHOCLNOoQskaFf+iLTz8gZx708xgIKuQPXm3Y8pM0zwA==
X-Gm-Message-State: AOJu0YzFLSIE1e+jhDXZZ61CI/QSjDIl3+rNlxfV7/peF0jIgvqVqTtw
 WUlgyTHqk/K0CeYME5d9LUxfhqTnJAph4R6j6KD6DqS2yOC1e11N
X-Google-Smtp-Source: AGHT+IERXpFgMEWwMpMX9dxnnys2Ey0m/FjgbMEZ4dR/0J9bTKS89YlGfrCfQ8EnJri16dB3D3slCA==
X-Received: by 2002:a05:6000:711:b0:34b:dc52:265f with SMTP id
 bs17-20020a056000071100b0034bdc52265fmr3507491wrb.44.1714047986804; 
 Thu, 25 Apr 2024 05:26:26 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.78])
 by smtp.googlemail.com with ESMTPSA id
 d4-20020adfe2c4000000b0034a3a0a753asm18136977wrj.100.2024.04.25.05.26.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 05:26:26 -0700 (PDT)
Message-ID: <218a0925-015d-46ba-b7f3-e0545daf7f88@gmail.com>
Date: Thu, 25 Apr 2024 15:26:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 6/7] lib/rendercopy_gen9: Allow to use all tilings
 on flatccs platforms
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240425104721.52376-1-zbigniew.kempczynski@intel.com>
 <20240425104721.52376-7-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240425104721.52376-7-zbigniew.kempczynski@intel.com>
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

On 25.4.2024 13.47, Zbigniew Kempczyński wrote:
> Instead of limiting compression to Tile4 lets enable it for any
> tiling when platform has flatccs area.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>   lib/rendercopy_gen9.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> index 7c7563d50c..67bb7cfacd 100644
> --- a/lib/rendercopy_gen9.c
> +++ b/lib/rendercopy_gen9.c
> @@ -175,6 +175,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
>   		case 64: ss->ss0.surface_format = SURFACEFORMAT_R16G16B16A16_FLOAT; break;
>   		default: igt_assert(0);
>   	}
> +
>   	ss->ss0.vertical_alignment = 1; /* align 4 */
>   	ss->ss0.horizontal_alignment = 1; /* align 4 or HALIGN_32 on display ver >= 13*/
>   
> @@ -232,7 +233,6 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
>   		ss->ss6.aux_mode = 0x5; /* AUX_CCS_E */
>   
>   		if (buf->ccs[0].stride) {
> -
>   			ss->ss6.aux_pitch = (buf->ccs[0].stride / 128) - 1;
>   
>   			address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
> @@ -268,7 +268,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
>   			ss->ss13.clear_address_hi = (address + buf->cc.offset) >> 32;
>   		}
>   
> -		if (HAS_4TILE(ibb->devid)) {
> +		if (HAS_FLATCCS(ibb->devid)) {

This I suspect will break mtl. Those few above blank line changes 
probably also here as not needed 'extra'.

/Juha-Pekka

>   			ss->ss7.dg2.memory_compression_type = 0;
>   			ss->ss7.dg2.memory_compression_enable = 0;
>   			ss->ss7.dg2.disable_support_for_multi_gpu_partial_writes = 1;

