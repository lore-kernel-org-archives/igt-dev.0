Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212C1CF9C5B
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 09:54:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5DE710E23A;
	Mon, 23 Sep 2024 09:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BPLXl3U2";
	dkim-atps=neutral
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0785210E23A
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 09:54:11 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a8d6d0fe021so665962466b.1
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 02:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727085249; x=1727690049; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=FMaTGK7Rblap8WmTcoh/X5XU4/h614JboorswyoeX8g=;
 b=BPLXl3U29zGRiiXVBuKAfoNZE7H9R9pizRq9MOL7anwJlxPYqhuXAJipLbpkvC1U5E
 XgiuOanFgYibPo/VgOAMVCJJvh4kckDLbxo/DPOpA7aQHqESPC+shtTYqssQzDWZFezT
 N/VFukkcXGx0Kj5MQJ3uvL/cbOijaYEprD91otAss6V9XbqNbjs8Bc4keUosLERdsonR
 OT/Ki/2/MCXa2j7NcjTm7ywQGUh0aMPG9uOwIrTRGe42kjlrMA2jEZo6O3tUocymKm05
 xNeMp+hMTw+jfw8wkVWNA/+2Bx0H0kw1PwKtb0IuoKayJIBQ35USsXEaUj8EE1f9BJOH
 aw/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727085249; x=1727690049;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FMaTGK7Rblap8WmTcoh/X5XU4/h614JboorswyoeX8g=;
 b=uLQel/UMvV8c6gpdCMDx5Cist1Iskm/sZl4a0Ij70iC/Q1fxP31yimAsrtmEPKWu2F
 ndUrgnDjCQ5ZfofCGdYIEpLjRutkS+e2bHBlVhhipM1mhhIvrxHd2oTBSUHdQ7y95NqE
 Hwjftvtp8Mftdu1cSYccn2qWvjnMApujwtxPjNsTJTtdEws8g1idd9Vj/TELO+tWPS9e
 nDZG4ChMO/CA2CfbCMCZTmJd+P5XCrs9o11JcbMsc/rkqXT8nSs/duwfUlASP5QNZmiY
 /ywFl6uJVg/Va+J6hGMsVR/ylXwavvUR9icfNMYcGKnnBD3wjBBVyoyv5uXQzVkeuVEX
 iStA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfyps5UJusg5amHY3P7Bckb7J+d/00w3/n3Ick+Y4cypp0+Oiah4eFMAn+NGKRT+9QbobA8+C+@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxyUQKmUEetuCFFVVkTIV0Jqwkxv93WVzIgu/Th9bdpZ1yl/SV
 lfuWT6ZLYNX1UtNumRBlVkzSsMRh4q9bChXCyu0Liw+/mbY0Yc4uYeMQsj5rtNk=
X-Google-Smtp-Source: AGHT+IHCxc4TeK5jjFLokgNmYU0mJAbfP0sFfPwxZIb0la1R0yCuhN1Cm37NEWZaThEfiugqg7FB8A==
X-Received: by 2002:a17:907:3f9f:b0:a80:f6a0:9c3c with SMTP id
 a640c23a62f3a-a90d4e31709mr1165703866b.0.1727085249313; 
 Mon, 23 Sep 2024 02:54:09 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.69])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a90612b3ba7sm1188581766b.119.2024.09.23.02.54.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 02:54:08 -0700 (PDT)
Message-ID: <9f7e36ab-f091-4abf-8e7a-cf16540c4853@gmail.com>
Date: Mon, 23 Sep 2024 12:54:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 13/18] lib/vebox: Document that 2:10:10:10 is
 unusable with VEBOX
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240918120518.30258-1-ville.syrjala@linux.intel.com>
 <20240918120518.30258-14-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240918120518.30258-14-ville.syrjala@linux.intel.com>
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

On 18.9.2024 15.05, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> VEBOX has a specific format for R10G10B10A2_UNORM, but it
> just hangs the engine if you try to use it.
> 
> For most platforms bsepc says: "Valid format only for when
> IECP is enabled and in output state only. Not supported in
> HSB mode."
> 
> Document this fact so that the next fella doesn't try to
> implement it like I did :/
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/veboxcopy_gen12.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/lib/veboxcopy_gen12.c b/lib/veboxcopy_gen12.c
> index af52a96578d9..4e3aefaf1f44 100644
> --- a/lib/veboxcopy_gen12.c
> +++ b/lib/veboxcopy_gen12.c
> @@ -29,6 +29,7 @@
>   #define YCRCB_NORMAL	0
>   #define PLANAR_420_8	4
>   #define PACKED_444A_8	5
> +#define R10G10B10A2_UNORM	7
>   #define R8G8B8A8_UNORM	8
>   #define PACKED_444_16	9
>   #define PLANAR_420_16	12
> @@ -168,6 +169,8 @@ static uint32_t compression_format(int format, struct intel_buf *buf)
>   	switch (format) {
>   	case R16G16B16A16:
>   		return 0x1;
> +	case R10G10B10A2_UNORM:
> +		return 0xe;
>   	case R8G8B8A8_UNORM:
>   		return 0xa;
>   	case PLANAR_420_8:
> @@ -343,6 +346,15 @@ void gen12_vebox_copyfunc(struct intel_bb *ibb,
>   		break;
>   	case 32:
>   		igt_assert(!src->format_is_yuv_semiplanar);
> +		/*
> +		 * R10G10B10A2_UNORM is not usable.
> +		 *
> +		 * Bspec says: "Valid format only for when IECP is enabled
> +		 * and in output state only. Not supported in  HSB mode."
> +		 *
> +		 * VEBOX hangs if you try use it.
> +		 */
> +		igt_assert(src->depth != 30);
>   		format = src->format_is_yuv ? PACKED_444A_8 :
>   					      R8G8B8A8_UNORM;
>   		break;

