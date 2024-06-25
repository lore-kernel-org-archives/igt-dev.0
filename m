Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E329AC2BBCA
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 10:05:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5453810E40C;
	Tue, 25 Jun 2024 10:05:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rnf5i5zM";
	dkim-atps=neutral
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C10D10E07C
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 10:05:11 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-424798859dfso44626735e9.0
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 03:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719309910; x=1719914710; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=PiHiZzOrhzLSwgQMThMAzBM8UFxQEmX8t3X3yi8y370=;
 b=Rnf5i5zMSvWOuoHinUiTBmM7Nq1+EVHC7nOpopacbFAd3Uu5UW9qEdZ5K9JgL//XKA
 MBPfGh0uW7tRvB6fSvNMkiSRMaEsgyUtBoH8Y5QrQ7XAlBlIDtYiAD66yImkrkLIr5K8
 Ven1thqi1+bC+ku29gxJ/oxNR0eUMcmwqgAcN1Vw3+mRuNcYNYfTG7OSTefWNoltOsXA
 gvRgH/ZIr5j0h+wpwLmEuWwxON/MfH5op9u3diqGLSOKbaq/3KJSsqZHKE5VSv7lgd/Z
 a9G7aHIrRaIFvHqNdD7+MKNrgnmfMsMJpa0nniTY1x5IgKtpWMoWZaiwxdQ8YbFlsnQI
 EicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719309910; x=1719914710;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PiHiZzOrhzLSwgQMThMAzBM8UFxQEmX8t3X3yi8y370=;
 b=MO/LOABbf2Sj4VwtlRiVgId3gTUtgkHP8DOtTydUIvN6yI2qvy9HKFCuKwqZOF90mD
 9CqxaNDjhpueTvm5sKeYfMn3dhHiIsUiLbxVuLSHdb6z6qCP66+pK24q1okadoBA4GqA
 pqZWU0AL+/exdToTMmHRIgqjFC61oPWkf9bGTM26TaTvJBc5g2bf1avp8xfvrTzXxAHJ
 1P1dwp4RDenFMyZmZAyHtGI3VIuu7fMt7mYYeJNMTIIiVko/brU/JewhKdZq7PN7mmHW
 2VkVIb3XrULsSW+NdkekR0S75c/IjgJ0waJAeWgwTzMJg5e82e3SCnLBj+23qAL8Sf0W
 2qpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3vsrHMNwasupFu7/TKHfcHp67z/SgBORw3u0mGhnwPR1P2534lx1XnwOYF8YgG0PW6ZWHO7I8dPvC0MoJEOmdTzfB1Ew6G5+xSgH4ZQ==
X-Gm-Message-State: AOJu0YwLDgwLKBpTfE5KxXUVB6MBgpZ+umgnhwjDDK5hs53pV22qwWCl
 X4tuj1H9Ieg1ks8sSsUt2q0JoIqgLap7eET5Ww76VbYQCoEfsM/OqHhyMFUIBws=
X-Google-Smtp-Source: AGHT+IE/Fk2N/1vfLqnLtJsfIh2EXFWW5IH2HmqHGQNgyaXy8yTPJCpR61bA+oE1p1n1N9GRXzzhOw==
X-Received: by 2002:a05:600c:993:b0:424:a5d6:6512 with SMTP id
 5b1f17b1804b1-424a5d665f9mr4500935e9.20.1719309909339; 
 Tue, 25 Jun 2024 03:05:09 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.137.76])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4248191fac8sm164992665e9.42.2024.06.25.03.05.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jun 2024 03:05:08 -0700 (PDT)
Message-ID: <5c41a11e-a4a6-48f5-8f51-a9934a537ce7@gmail.com>
Date: Tue, 25 Jun 2024 13:05:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/intel_blt: Fix printing mocs on Xe2+
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240625091847.134707-1-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240625091847.134707-1-zbigniew.kempczynski@intel.com>
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

On 25.6.2024 12.18, Zbigniew Kempczyński wrote:
> Due to different bit meanings dumping mocs indices displays incorrect
> values for Xe2+. Fix this and print those indices according to platform.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   lib/intel_blt.c | 17 +++++++++++++----
>   1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 20c42eec14..a21df1e8cf 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -847,9 +847,18 @@ static void fill_data_ext(struct gen12_block_copy_data_ext *dext,
>   	dext->dw21.src_array_index = ext->src.array_index;
>   }
>   
> -static void dump_bb_cmd(struct gen12_block_copy_data *data)
> +static void dump_bb_cmd(struct gen12_block_copy_data *data, unsigned int ip_ver)
>   {
>   	uint32_t *cmd = (uint32_t *) data;
> +	int src_mocs_idx, dst_mocs_idx;
> +
> +	if (ip_ver >= IP_VER(20, 0)) {
> +		src_mocs_idx = data->dw08_xe2.src_mocs_index;
> +		dst_mocs_idx = data->dw01_xe2.dst_mocs_index;
> +	} else {
> +		src_mocs_idx = data->dw08.src_mocs_index;
> +		dst_mocs_idx = data->dw01.dst_mocs_index;
> +	}
>   
>   	igt_info("details:\n");
>   	igt_info(" dw00: [%08x] <client: 0x%x, opcode: 0x%x, color depth: %d, "
> @@ -860,7 +869,7 @@ static void dump_bb_cmd(struct gen12_block_copy_data *data)
>   	igt_info(" dw01: [%08x] dst <pitch: %d, aux: %d, mocs_idx: %d, compr: %d, "
>   		 "tiling: %d, ctrl surf type: %d>\n",
>   		 cmd[1], data->dw01.dst_pitch, data->dw01.dst_aux_mode,
> -		 data->dw01.dst_mocs_index, data->dw01.dst_compression,
> +		 dst_mocs_idx, data->dw01.dst_compression,
>   		 data->dw01.dst_tiling, data->dw01.dst_ctrl_surface_type);
>   	igt_info(" dw02: [%08x] dst geom <x1: %d, y1: %d>\n",
>   		 cmd[2], data->dw02.dst_x1, data->dw02.dst_y1);
> @@ -878,7 +887,7 @@ static void dump_bb_cmd(struct gen12_block_copy_data *data)
>   	igt_info(" dw08: [%08x] src <pitch: %d, aux: %d, mocs_idx: %d, compr: %d, "
>   		 "tiling: %d, ctrl surf type: %d>\n",
>   		 cmd[8], data->dw08.src_pitch, data->dw08.src_aux_mode,
> -		 data->dw08.src_mocs_index, data->dw08.src_compression,
> +		 src_mocs_idx, data->dw08.src_compression,
>   		 data->dw08.src_tiling, data->dw08.src_ctrl_surface_type);
>   	igt_info(" dw09: [%08x] src offset lo (0x%x)\n",
>   		 cmd[9], data->dw09.src_address_lo);
> @@ -1034,7 +1043,7 @@ uint64_t emit_blt_block_copy(int fd,
>   			 ", bb offset: %" PRIx64 "\n",
>   			 src_offset, dst_offset, bb_offset);
>   
> -		dump_bb_cmd(&data);
> +		dump_bb_cmd(&data, ip_ver);
>   		if (ext)
>   			dump_bb_ext(&dext);
>   	}

